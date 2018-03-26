package cxc.project.net1.message.structure;

import java.util.Arrays;
import java.util.List;

import com.sun.jna.Structure;

public class ClientStatus extends Structure {
	public   int dwClientIP; // 数据长度
	public   int dwIPStatus; // 数据类型 请求资源 代理模式
	
	public ClientStatus(){
		
	}
	public ClientStatus(int dwClientIP, int dwIPStatus) {
		super();
		this.dwClientIP = dwClientIP;
		this.dwIPStatus = dwIPStatus;
	}
	@Override
	protected List getFieldOrder() {
		// TODO Auto-generated method stub
		return Arrays.asList(new String[] { "dwClientIP","dwIPStatus"});
	}

}
