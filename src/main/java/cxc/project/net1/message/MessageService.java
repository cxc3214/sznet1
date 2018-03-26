package cxc.project.net1.message;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.channels.SocketChannel;

import com.sun.jna.Structure;
import jodd.props.Props;
import cxc.project.net1.message.kit.UtilKit;
import cxc.project.net1.message.structure.ClientStatus;
import cxc.project.net1.message.structure.Directory;
import cxc.project.net1.message.structure.Header;
import cxc.project.net1.message.structure.ServerConfig;
import cxc.project.net1.message.structure.Wchar;
import cxc.project.net1.utils.PropsKit;

public class MessageService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MessageService.class);

	private static Props props = PropsKit.loadClassPathFile("conf.spring");
	private SocketChannel socketChannel = null;
	private ByteArrayOutputStream baos; 
	private int ClientIp = 0;

	public MessageService(int client) throws UnknownHostException, IOException {
		this.ClientIp = client ;
		socketChannel = SocketChannel.open();
		SocketAddress socketAddress = new InetSocketAddress(
				props.getValue("message.host"), Integer.parseInt(props.getValue("message.port")));
		socketChannel.connect(socketAddress);
	}

	/**
	 * 发送数据方法
	 * 
	 * @param mt
	 *            发送类型
	 * @param struct
	 *            发送内容
	 * @return
	 */
	public <R> R sendMessage(Const.MessageType mt, Structure struct) {
		@SuppressWarnings("unchecked")
		R obj = null;
		try {
			/**
			 * 发送请求
			 */
			byte[] bytes; // 临时变量
			Header header; // 头文件
			if (struct == null) {
				//没有数据 则直接发送头文件 长度 0
				header = new Header(0, mt.getPrototype().getValue(), this.ClientIp,
						mt.getCommandId());
				header.write();
				bytes = header.getPointer().getByteArray(0, header.size());
			} else {
				//存在body数据
				struct.write();
				header = new Header(struct.size(),
						mt.getPrototype().getValue(), this.ClientIp, mt.getCommandId());
				header.write();
				//组合头 和 body 的byte流
				bytes = UtilKit.byteMerger(
						header.getPointer().getByteArray(0, header.size()),
						struct.getPointer().getByteArray(0, struct.size()));
			}
			logger.info("发送数据：" + UtilKit.toHex(bytes)) ;
			
			ByteBuffer buffer = ByteBuffer.wrap(bytes); //发送 的byte流
			socketChannel.write(buffer);
			socketChannel.socket().shutdownOutput();

			obj = (R) Boolean.valueOf(true);
			/**
			 *  接收返回数据
			 */
			if (mt.getReturndata() != null) {
				obj = null;
				//返回数据的容器
				baos = new ByteArrayOutputStream();
				//接收缓冲区大小
				ByteBuffer tmpbuffer = ByteBuffer.allocateDirect(1024);
				int count = 0;
				//监听读取缓存区 返回的消息
				while ((count = socketChannel.read(tmpbuffer)) >= 0) {
					tmpbuffer.flip();
					bytes = new byte[count];
					tmpbuffer.get(bytes);
					baos.write(bytes);
					tmpbuffer.clear();
				}
				bytes = baos.toByteArray();
				//关闭接收
				socketChannel.socket().shutdownInput();  
				logger.info("接收：" + UtilKit.toHex(bytes)) ;				
				Header h2 = new Header(); //返回数据的头文件
				h2.getPointer().write(0, bytes, 0, h2.size());
				//从返回头中得到数据包的长度
				int dwDataLen = Integer.parseInt(h2.readField("dwDataLen").toString());
				//分情况构建返回数据的结构体 暂时还没找到通用的方法
				if (mt.getReturndata() == Wchar.class) {
					Wchar tstruct = new Wchar(new char[dwDataLen / 2 | 1]);
					tstruct.getPointer().write(0, bytes, h2.size(), dwDataLen);
					obj = (R) tstruct;
				} else if (mt.getReturndata() == ServerConfig.class) {
					ServerConfig tstruct = new ServerConfig();
					tstruct.getPointer().write(0, bytes, h2.size(), dwDataLen);
					obj = (R) tstruct;
				} else if (mt.getReturndata() == ClientStatus.class) {
					ClientStatus tstruct = new ClientStatus();
					tstruct.getPointer().write(0, bytes, h2.size(), dwDataLen);
					obj = (R) tstruct;
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		} finally {
			close();
		}
		return obj;
	}

	/**
	 * 释放所有资源
	 */
	private void close() {
		try {
			baos.close();
			socketChannel.close();
		} catch (Exception e) {
		}
	}

}
