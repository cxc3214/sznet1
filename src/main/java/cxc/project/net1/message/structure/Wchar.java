package cxc.project.net1.message.structure;

import java.util.Arrays;
import java.util.List;

import com.sun.jna.Structure;
import com.sun.jna.WString;

public class Wchar extends Structure {
	public char[] bufferstr  = new char[1];

	@Override
	protected List getFieldOrder() {
		// TODO Auto-generated method stub
		return Arrays.asList(new String[] { "bufferstr"});
	}

	public Wchar(char[] bufferstr) {
		this.bufferstr =bufferstr;
	}
	public Wchar(){
	}	
}
