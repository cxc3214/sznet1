package cxc.project.net1.message.structure;

import java.util.Arrays;
import java.util.List;

import com.sun.jna.Structure;

public class Directory extends Structure{
	public char[] szPath = new char[1];

	@Override
	protected List getFieldOrder() {
		// TODO Auto-generated method stub
		return Arrays.asList(new String[] { "szPath"});
	}

	public Directory(char[] szPath) {
		this.szPath =szPath;
	}
	public Directory(){
	}
}
