package cxc.project.net1.utils;

import java.io.File;
import java.net.UnknownHostException;

import jodd.props.Props;

import com.jfinal.kit.PathKit;

public class PropsKit {	
	public static Props loadClassPathFile(String path){
		Props returnProp = new Props();
		try {
			returnProp.load(new File(PathKit.getRootClassPath()+ File.separator + path));
		} catch (Exception e) {
		}
		return returnProp;
	}
	
	public static Props loadWebInfFile(String path){
		Props returnProp =  new Props();
		try {
			returnProp.load(new File(PathKit.getRootClassPath()+ File.separator + path));
		} catch (Exception e) {
		}
		return returnProp;
	}
	public static void main(String[] args) throws UnknownHostException {
		System.out.println(java.net.InetAddress.getByAddress("192.168.1.1".getBytes()));
	}
}
