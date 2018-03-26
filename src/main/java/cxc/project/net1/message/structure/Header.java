package cxc.project.net1.message.structure;


import java.util.Arrays;
import java.util.List;
import com.sun.jna.Structure;

public class Header extends Structure{   	
	
	public Header(){		
	}
	public Header(int dwDataLen, int dwProtoType, int dwClientAddr,
			int dwCommandId) {
		super();
		this.dwDataLen = dwDataLen;
		this.dwProtoType = dwProtoType;
		this.dwClientAddr = dwClientAddr;
		this.dwCommandId = dwCommandId;
	}
	public   int dwDataLen; // 数据长度
	public   int dwProtoType; // 数据类型 请求资源 代理模式
															// 操作请求
	public   int dwClientAddr; // 客户端地址
	public   int dwCommandId; // 转发的COMMANDID/Notify的通知类型123x
	@Override
	protected List getFieldOrder() {
		// TODO Auto-generated method stub
		return Arrays.asList(new String[] { "dwDataLen", "dwProtoType", "dwClientAddr", "dwCommandId" });
	}
}
