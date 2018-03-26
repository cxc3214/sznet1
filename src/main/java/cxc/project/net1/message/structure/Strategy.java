package cxc.project.net1.message.structure;

import java.util.Arrays;
import java.util.List;

import com.sun.jna.Structure;

public class Strategy extends Structure {
	public char[] szStrategyName =new char[64];
	
	public Strategy(char[] szStrategyName) {
		super();
		this.szStrategyName = szStrategyName;
	}
	
	
	public Strategy() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected List getFieldOrder() {
		return Arrays.asList(new String[] {"szStrategyName"});
	}

}
