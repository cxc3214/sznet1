package cxc.test.jna.structure;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;
import java.util.Iterator;

import cxc.project.net1.message.structure.Directory;
import cxc.project.net1.message.structure.Header;

/**
 * NIO客户端
 * 
 * @author 小路
 */
public class NIOClientTest {
	private static void sendData(SocketChannel socketChannel) throws IOException {  
		
		Directory d1 = new Directory("本地磁盘(c:)\20130725".toCharArray());
		d1.write() ;
		byte[]  bt2  =  d1.getPointer().getByteArray(0, d1.size());
		Header h = new Header();
		h.writeField("dwDataLen", d1.size());
		h.writeField("dwCommandId", 1538);
		h.writeField("dwProtoType", 1);
		h.writeField("dwClientAddr",127001);
		byte[] bt1 = h.getPointer().getByteArray(0, h.size());
		byte[] bytes = ByteUtils.byteMerger(bt1, bt2);
        ByteBuffer buffer = ByteBuffer.wrap(bytes);  
        System.out.println(ByteUtils.toHex(bytes));
        socketChannel.write(buffer);  
        socketChannel.socket().shutdownOutput();  
    }	
	public static void main(String[] args) {
		SocketChannel socketChannel = null;  
        try {  
            socketChannel = SocketChannel.open();
            SocketAddress socketAddress = new InetSocketAddress("localhost", 4667);  
            socketChannel.connect(socketAddress);  
            sendData(socketChannel);  
            ByteArrayOutputStream baos = new ByteArrayOutputStream();  
            try {  
                ByteBuffer buffer = ByteBuffer.allocateDirect(10);  
                byte[] bytes;  
                int count = 0;  
                while ((count = socketChannel.read(buffer)) >= 0) {  
                    buffer.flip();  
                    bytes = new byte[count];  
                    buffer.get(bytes);  
                    baos.write(bytes); 
                    buffer.clear();  
                }  
                bytes = baos.toByteArray();  
                System.out.println( ByteUtils.toHex(bytes) );
                socketChannel.socket().shutdownInput();  
            } finally {  
                try {  
                    baos.close();  
                } catch(Exception ex) {
                	ex.printStackTrace();
                }  
            }  

        } catch (Exception ex) {  
        	ex.printStackTrace();
        } finally {  
            try {  
                socketChannel.close();  
            } catch(Exception ex) {
            	ex.printStackTrace();            	
            }  
        }  
	}

		
}