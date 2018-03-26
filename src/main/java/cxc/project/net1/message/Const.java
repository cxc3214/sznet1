package cxc.project.net1.message;

import cxc.project.net1.message.structure.ClientStatus;
import cxc.project.net1.message.structure.ServerConfig;
import cxc.project.net1.message.structure.Wchar;

public interface Const {
	 public enum ProtoType implements Const {
		ProtoTypeNotify("提醒通知", 0), 
		ProtoTypeProxy("代理模式", 1), 
		ProtoTypeRequest("请求资源", 2), 
		ProtoTypeOperation("操作请求", 3);
		// 成员变量
		private String name;
		private int value;
		public String getName() {
			return name;
		}
		public int getValue() {
			return value;
		}
		private ProtoType(String name, int value) {
			this.name = name;
			this.value = value;
		} 
	 }
	 
	 /**
	  * 配置消息类型
	  * @author cxc
	  *
	  */
	 public enum MessageType implements Const {
		 ForGetConfig("获取配置信息",1525,ProtoType.ProtoTypeRequest, ServerConfig.class),
		 ForChangeConfig("更改服务器设置",1527,ProtoType.ProtoTypeOperation,null),
		 ForSearchClient("查询客户端状态",1528,ProtoType.ProtoTypeRequest,ClientStatus.class),
		 
		 ForConnClient("连接客户端",1534,ProtoType.ProtoTypeOperation,null),
		 ForDisconClient("断开客户端",1535,ProtoType.ProtoTypeOperation,null),
		 
		 ForGetDir("点击客户端IP获取客户端盘符",1536,ProtoType.ProtoTypeProxy,Wchar.class),
		 ForListDirPath("列出目录下所有文件和文件夹",1538,ProtoType.ProtoTypeProxy,Wchar.class),
		 
		 ForStartStrategy("运行策略",1546,ProtoType.ProtoTypeOperation,null),
		 ForPauseStrategy("暂停策略",1547,ProtoType.ProtoTypeOperation,null),
		 ForStopStrategy("停止策略",1548,ProtoType.ProtoTypeOperation,null),
		 ForAddStrategy("新增策略",1549,ProtoType.ProtoTypeOperation,null),
		 ForDeleteStrategy("删除策略",1550,ProtoType.ProtoTypeOperation,null),
		 ForModifyStrategy("修改策略",1551,ProtoType.ProtoTypeOperation,null);
		 
		private String name;
		private int commandId;
		private ProtoType prototype;
		private Class<?> returndata;
		
		public String getName() {
			return name;
		}
		public int getCommandId() {
			return commandId;
		}
		public ProtoType getPrototype() {
			return prototype;
		}
		public Class<?> getReturndata() {
			return returndata;
		}
		private MessageType(String name, int commandId, ProtoType prototype, Class<?> returndata) {
			this.name = name;
			this.commandId = commandId;
			this.prototype = prototype;
			this.returndata = returndata;
		}
	 }
}
