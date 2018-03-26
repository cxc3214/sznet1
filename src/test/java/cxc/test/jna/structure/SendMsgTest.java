package cxc.test.jna.structure;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.net.Socket;

import com.sun.jna.WString;

import cxc.project.net1.message.Const;
import cxc.project.net1.message.structure.Directory;
import cxc.project.net1.message.structure.Header;
import cxc.project.net1.message.structure.Wchar;
import cxc.test.jna.structure.ByteUtils;

public class SendMsgTest {
	public static Socket socket;
	public static DataOutputStream dos;
	public static DataInputStream dis;
	public static void main(String[] args) {
		try {
			socket = new Socket("127.0.0.1", 4667);
			socket.setSoTimeout(10 * 1000);
			dos = new DataOutputStream(socket.getOutputStream());
			Directory d1 = new Directory("本地磁盘(c:)\20130725".toCharArray());
			d1.write() ;
			byte[]  bt2  =  d1.getPointer().getByteArray(0, d1.size());
			Header h = new Header();
			h.writeField("dwDataLen", d1.size());
			h.writeField("dwCommandId", 1538);
			h.writeField("dwProtoType", 1);
			h.writeField("dwClientAddr",127001);
			byte[] bt1 = h.getPointer().getByteArray(0, h.size());
			byte[] buffer = ByteUtils.byteMerger(bt1, bt2);
			dos.write(buffer, 0, buffer.length);
			dos.flush();
			
			
			InputStream is = socket.getInputStream();
			int count = 0;    
		    while (count == 0) {    
		        count = is.available();    
		    }
//		    System.out.println(count);
		    byte[] inbuffer = new byte[count];
		    
			dis = new DataInputStream(is);
			dis.read(inbuffer);
			System.out.println(ByteUtils.toHex(inbuffer));
			Header h2 =  new Header();
			h2.getPointer().write(0, inbuffer, 0, h2.size() );
			System.out.println(h2.readField("dwCommandId"));
			Wchar wstr =  new Wchar(new char[(count - h2.size())/2]);
			System.out.println(wstr.size());
			wstr.getPointer().write(0, inbuffer, h2.size(), wstr.size() );
//			new String(new char[500]);
			StringBuilder sb = new StringBuilder();
			for(char cr :  (char[])wstr.readField("bufferstr") ){
				if(cr!='\0') sb.append(cr);
			}			
			System.out.println(sb.toString()) ;
			dos.close();
			dis.close();
			socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
