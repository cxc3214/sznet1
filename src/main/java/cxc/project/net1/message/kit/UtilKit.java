package cxc.project.net1.message.kit;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class UtilKit {
	public static byte[] byteMerger(byte[] byte_1, byte[] byte_2) {
		byte[] byte_3 = new byte[byte_1.length + byte_2.length];
		System.arraycopy(byte_1, 0, byte_3, 0, byte_1.length);
		System.arraycopy(byte_2, 0, byte_3, byte_1.length, byte_2.length);
		return byte_3;
	}

	public static String toHex(byte[] b) {
		String result = "";
		for (int i = 0; i < b.length; i++) {
			String hex = Integer.toHexString(b[i] & 0xFF);
			if (hex.length() == 1) {
				hex = '0' + hex;
			}
			result = result + " " + hex.toUpperCase();
		}
		return result;
	}

	public static byte[] getInputBuffer(InputStream is) throws IOException {
		byte[] rebuffer;
		int count = 0;
		while (count == 0) {
			count = is.available();
		}
		rebuffer = new byte[count];
		return rebuffer;
	}

	/**
	 * 去掉 char \0 还原 String
	 * 
	 * @param chars
	 */
	public static String charToString(char[] chars) {
		StringBuilder tsb = new StringBuilder();
		for (char cr : chars) {
			if (cr != '\0') {
				tsb.append(cr);
			} else {
				break;
			}
		}
		return tsb.toString();
	}

	/**
	 * 根据磁盘号 获取磁盘列表
	 * 
	 * @param dir
	 * @return
	 */
	public static List<String> getDirPathByDM(int dir) {
		List<String> dirlist = new ArrayList<String>();
		int dwDriveMap = dir;
		int dwDriveCount = 0;
		while (dwDriveMap != 0) {
			if ((dwDriveMap & 1) != 0) {
				char dirName = (char) Integer.valueOf(('A' + dwDriveCount))
						.intValue();
				dirlist.add(String.format("本地磁盘(%c:)", dirName));
			}
			dwDriveMap = dwDriveMap >> 1;
			dwDriveCount++;
		}
		return dirlist;
	}

	/**
	 * 将127.0.0.1形式的IP地址转换成十进制整数
	 * 
	 * @param strIp
	 * @return
	 */
	public static int ipToLong(String strIp) {
		int[] ip = new int[4];
		// 先找到IP地址字符串中.的位置
		int position1 = strIp.indexOf(".");
		int position2 = strIp.indexOf(".", position1 + 1);
		int position3 = strIp.indexOf(".", position2 + 1);
		// 将每个.之间的字符串转换成整型
		ip[0] = Integer.parseInt(strIp.substring(0, position1));
		ip[1] = Integer.parseInt(strIp.substring(position1 + 1, position2));
		ip[2] = Integer.parseInt(strIp.substring(position2 + 1, position3));
		ip[3] = Integer.parseInt(strIp.substring(position3 + 1));
		return (ip[3] << 24) + (ip[2] << 16) + (ip[1] << 8) + ip[0];
	}

}
