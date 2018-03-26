package cxc.project.net1.message.structure;

import java.util.Arrays;
import java.util.List;

import com.sun.jna.Structure;
import com.sun.jna.WString;

import cxc.project.net1.message.Const.MessageType;

public class ServerConfig extends Structure {
	public ServerConfig(){
	}
	public ServerConfig(int dwDataPort, int dwCommandPort, char[] szClientPassword) {
		super();
		this.dwDataPort = dwDataPort;
		this.dwCommandPort = dwCommandPort;
		this.szClientPassword = szClientPassword;
	}
	public int dwDataPort;
	public int dwCommandPort ;
	public char[] szClientPassword = new char[21] ;
	@Override
	protected List getFieldOrder() {
		// TODO Auto-generated method stub
		return Arrays.asList(new String[] {"dwDataPort","dwCommandPort","szClientPassword"});
	}
}
