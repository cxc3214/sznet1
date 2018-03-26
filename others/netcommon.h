//和服务交互的数据的结构
#pragma once


//命令
enum
{
	BASE_NOT_USER = WM_USER + 500,

	// 与服务交互
	REQUEST_QUERY_SERVER_CONFIG,			//查询服务器设置
	REQUEST_CLIENT_IS_ONLINE,				//查询客户端是否在线
	OPERATION_SET_SERVER_CONFIG,			//更改服务器设置
	REQUEST_CLIENT_CONNLIST,				//客户端列表
	CLIENTIP_CONNECTED,						//客户端连接通知
	CLIENTIP_DISCONNECTED,					//客户端断开通知
	SERVER_START_RESTORE,					//开始还原
	SERVER_STRATEGYOBJECT_STATUSNOTIFY,		//策略运行状态提醒   
	HISTORY_COPYRESTORE_STATUSNOTIFY,       //历史副本还原状态提醒
	OPERATION_CONNECT_CLIENT,				//连接客户端
	OPERATION_DISCONNECT_CLIENT,			//断开客户端

	// 与客户端交互
	// 公用
	SERVER_LIST_DRIVE,						//列出盘符
	SERVER_LIST_FILEDIRECTORY,				//列出目录下所有文件和文件夹
	SERVER_LIST_DIRECTORY,					//列出目录下所有的目录

	//主动监测
	 //策略
	SERVER_HIPS_ADD_NEW_FILTER,				//新建策略
	SERVER_HIPS_MODIFY_FILTER,				//修改策略
	SERVER_HIPS_DELETE_FILTER,				//删除策略
	SERVER_HIPS_LOGINFO,
	 //信任关系
	SERVER_HIPS_ADD_TRUST,					//添加信任关系
	SERVER_HIPS_MODIFY_TRUST,				//修改信任关系 
	SERVER_HIPS_DELETE_TRUST,				//删除信任关系

	//监测策略

	SERVER_STRATEGYGUARD_START,				//运行策略
	SERVER_STRATEGYGUARD_PAUSE,				//暂停策略
	SERVER_STRATEGYGUARD_STOP,				//停止策略
	SERVER_STRATEGYGUARD_ADD,				//新增策略        （新加）	
	SERVER_STRATEGYGUARD_DELETE,			//删除策略
	SERVER_STRATEGYGUARD_MODIFY,			//修改策略
	SERVER_STRATEGYGUARD_VERIFY,			//验证登录

	//安全加固
    SERVICE_REINFORCE,  //服务加固设置
    STARTUP_REINFORCE,  //系统启动项加固设置
	WIN_SHARE_REINFORCE,  //windows共享加固设置
    PERIPHERAL_REINFORCE,  //外部设备加固设置
    NET_SECURITY_REINFORCE,  //网络安全加固设置
    SYSTEM_SECURITY_REINFORCE,  //系统安全加固配置
    USER_SECURITY_REINFORCE,  //用户安全加固配置	
};

//命令结构体

/************************************************************************/
/*                     和服务交互                                       */
/************************************************************************/

//RESQUEST_IS_CLIENT_ONLINE						判断客户端是否在线
// OPERATION_CONNECT_CLIENT						连接客户端
// OPERATION_DISCONNECT_CLIENT					断开客户端
typedef
struct _ClientIP
{
	DWORD	dwClientIP;
}ClientIP, *PClientIP;

//SERVER_START_RESTORE
typedef
struct _CopyInfo
{
	DWORD	dwClientIP;			//客户端IP
	WCHAR	szStrategyName[64];	//策略名
	WCHAR	szCopyFilePath[MAX_PATH];
}CopyInfo, *PCopyInfo;
//SERVER_STRATEGYOBJECT_STATUSNOTIFY,		策略运行状态提醒	（0 失败 1 开始 2 成功 ）
//HISTORY_COPYRESTORE_STATUSNOTIFY,			历史副本还原状态提醒 （0 还原失败  1 还完成功）
//REQUEST_CLIENT_IS_ONLINE					返回客户端在线状态  (0 断开  1连接)
//还原状态
enum
{
	RestoreStatus_none,
	RestoreStatus_processing,
	RestoreStatus_finished,
	RestoreStatus_failed,
};

//REQUEST_QUERY_SERVER_CONFIG					查询服务器设置
typedef 
struct _ServerConfigInfo
{
	DWORD	dwDataPort;
	DWORD	dwCommandPort;
}ServerConfigInfo, *PServerConfigInfo;
// OPERATION_SET_SERVER_CONFIG					更改服务器设置
typedef
struct _ServerSetConfigInfo
{
	DWORD	dwDataPort;
	DWORD	dwCommandPort;
	WCHAR	szClientPassword[21];
}ServerSetConfigInfo, *PServerSetConfigInfo;

//CLIENTIP_CONNECTED,						客户端连接通知
//CLIENTIP_DISCONNECTED,					客户端断开通知
typedef
struct _ClientConnStatus 
{
	DWORD	dwClientIP;
	DWORD	dwIPStatus;
}ClientConnStatus, *PClientConnStatus;


/************************************************************************/
/*                     和客户端交互                                     */
/************************************************************************/
//SERVER_LIST_FILEDIRECTORY						列出目录下的文件和文件夹
//SERVER_LIST_DIRECTORY							列出目录下的文件夹
typedef
struct _ListDirectory 
{
	WCHAR	szPath[MAX_PATH];		//不包含最后的'\'
}ListDirectory, *PListDirectory;

//主动监测
 //策略
//SERVER_HIPS_ADD_NEW_FILTER					添加策略
//SERVER_HIPS_MODIFY_FILTER						修改策略
//SERVER_HIPS_DELETE_FILTER						删除策略
typedef struct _POLICY_EXCEPTION_ENTRY  //新的规则结构
{
	DWORD  NextEntry;                  // 下一个偏移量
	UCHAR  OperatorType;               // 操作类型
	UCHAR  CompareType;                // 比较类型
	UCHAR  MatchActionType;            // 匹配后动作
	UCHAR  UnicodeIndex;               // 匹配索引
	USHORT UnicodeNameLen;             // 字串长度
	WCHAR  UnicodeName[ANYSIZE_ARRAY]; // 匹配字串
}POLICY_EXCEPTION_ENTRY,*LPPOLICY_EXCEPTION_ENTRY;

//SERVER_HIPS_ADD_NEW_RULE						添加规则
//SERVER_HIPS_DELTE_RULE						删除规则
typedef 
struct _POLICY_STRUCT
{
	WCHAR      m_FilterNameW[32];			//策略名称
	UINT       m_TypeOfHipsRule;			//策略分类
	UCHAR      m_MatchType;					//匹配规则
	UCHAR      m_OperatorType;				//过滤行为
	USHORT     m_DefaultAction;				//默认规则
	BOOL       m_DefaultLogFilter;			//是否记录日志
	WCHAR      m_RegExpW[MAX_PATH];			//过滤规则
	DWORD      m_RuleNum;
}POLICY_STRUCT,*LPPOLICY_STRUCT;
 //信任关系
//SERVER_HIPS_ADD_TRUST							添加信任关系
//SERVER_HIPS_MODIFY_TRUST						修改信任关系 
//SERVER_HIPS_DELETE_TRUST						删除信任关系
typedef
struct _HipsTrust
{
	DWORD	dwType;								//信任类型
	WCHAR	szContent[MAX_PATH];				//信任对象内容
}HIPSTRUST, *PHIPSTRUST;

 //信任类型
enum
{
	HIPS_TRUST_FILE,
	HIPS_TRUST_REGISTRY,
	HIPS_TRUST_COUNT,
};

//监测策略
 // SERVER_STRATEGYGUARD_START				运行策略
 //SERVER_STRATEGYGUARD_MODIFY				修改策略
typedef struct _STRATEGY_FILESTRUCT
{
	//保护对象--文件夹
	WCHAR SelectedFolder[MAX_PATH];
	//保护对象--筛选方式
	int FilterType;
	//保护对象--文件类型（*.txt;*.doc;*.xml;)
	WCHAR SelectedFileType[250];

}STRATEGY_FILESTRUCT,*PSTRATEGY_FILESTRUCT;




//任务模式	WCHAR   StrategyID[35];
typedef struct _STRATEGY_INFORMATION
{
	LIST_ENTRY ListElement;
	WCHAR   StrategyID[35];
	WCHAR   StrategyPoolID[35];

	//策略模版类型
	//例如：操作系统完整性保护策略--StrategyType
	//		windows 2000 server完整性保护--SelectedItem
	//		windows系统文件/目录完整性保护等等--ItemAttribute
	int StrategyType;
	WCHAR SelectedItem[32];
	int ItemAttribute;//按位判断

	WCHAR StrategyName[64];//策略名称
	WCHAR StrategyDescriptor[51];//策略描述

	//机器的IP地址
	WCHAR strIp[16];

	union
	{
		//网络设备
		struct 
		{
			DWORD	dwClientIP;
			int DeviceType;//设备类型
			int	LoginType;//登录方式
			WCHAR UserId[11];//用户ID
			WCHAR LoginId[21];//登录口令
			WCHAR ManageId[21];//管理口令
		}internet;
		
		//自定义网络设备
		struct  
		{
			DWORD	dwClientIP;

			int	LoginType;//登录方式
			WCHAR UserId[11];//用户ID
			WCHAR LoginId[21];//登录口令
			WCHAR ManageId[21];//管理口令
		}selfinet;

		//文件系统
		struct
		{
			DWORD	dwClientIP;

			//保护对象--文件夹
			WCHAR SelectedFolder[MAX_PATH];
			//保护对象--筛选方式
			int FilterType;
			//保护对象--文件类型（*.txt;*.doc;*.xml;)
			WCHAR SelectedFileType[250];
			//新加入字段
			WCHAR IgnoreFolder[2048];
		}selffile;
	}strategy;

	//任务模式
	int TaskMode;
	union
	{
		//每天
		struct
		{
			//开始时间
			int StartTime;
			//每*天
			int NumOfDay;
		}day;

		//每周
		struct
		{
			//开始时间
			int StartTime;
			//每*周
			int	NumOfWeek;
			//星期*（多选），按位判断
			int WhichWeek;
		}week;

		//每月
		struct
		{
			//开始时间
			int StartTime;
			//*月（多选），按位判断
			int WhichMonth;
			//二选一
			int mode;
			//这个月的*号
			int DayOfMonth;
			//这个月的***（第几个） ***（星期几）
			int WeekOfMonth;
			int	DayOfWeek;
		}month;

		//空闲时
		struct  
		{
			//当计算机空闲时间超过*分钟
			int OverTime;
		}free;
	}taskset;

	BOOL IsAutoDelete;//自动删除
	BOOL IsStopTask;//停止任务
	int NumOfHours;//超出多少个小时
	int NumOfMunites;//超出多少分钟
	
	BOOL IsStartHips;			//主动监测
	BOOL IsHistoryCopy;			//历史副本
	BOOL IsSavePlace;			//存储位置
	BOOL IsReport;				//风险报告
	BOOL IsJiXianData;			//基线数据
	
	int FilterBehavior;//过滤行为，按位判断
	int DefaultRule;//默认规则
	int NumOfHistoryCopy;//历史副本的册书
	int CurrVersionNum;
	WCHAR SavePlace[MAX_PATH];//历史副本存储的位置
	WCHAR ReportPlace[MAX_PATH];//风险报告发往的位置
}STRATEGY_INFORMATION,*PSTRATEGY_INFORMATION;

typedef struct _reinforcePolicyData
{
WCHAR policyName[11];
WCHAR policyDoc[51];
int serverGroup;
int policyTemplate;
}reinforcePolicyData,*pReinforcePolicyData;

//新增策略BUFFER
typedef struct _STRATEGY_BUFFERDATA
{
	//策略名称
	WCHAR StrategyName[64];
}STRATEGY_BUFFERDATA,*LPSTRATEGY_BUFFERDATA;

//策略运行
typedef struct _STRATEGY_CHANGESTRUCT
{	
	WCHAR   StrategyName[64];
	int     StrategyType;

}STRATEGY_CHANGESTRUCT,*LPSTRATEGY_CHANGESTRUCT;


 //SERVER_STRATEGYGUARD_PAUSE				暂停策略
typedef struct _PAUSE_STRATEGY
{
	//策略名称
	WCHAR StrategyName[64];
}PAUSE_STRATEGY,*PPAUSE_STRATEGY;
 //SERVER_STRATEGYGUARD_STOP				停止策略
typedef struct _STOP_STRATEGY
{
	//策略名称
	WCHAR StrategyName[64];
}STOP_STRATEGY,*PSTOP_STRATEGY;
//SERVER_STRATEGYGUARD_DELETE				删除策略
typedef struct _DELETE_STRATEGY
{
	//策略名称
	WCHAR StrategyName[64];
}DELETE_STRATEGY,*PDELETE_STRATEGY;


typedef struct _STRATEGY_RUNSTATUS
{
	int   Status;
	WCHAR StrategyName[64];
	WCHAR FailReason[MAX_PATH];
}STRATEGY_RUNSTATUS,*LPSTRATEGY_RUNSTATUS;


 //SERVER_STRATEGYGUARD_VERIFY			验证登录
typedef struct _LOGIN_VERIFY
{
	int LoginType;//登录方式
	WCHAR UserId[11];//用户ID
	WCHAR LoginId[21];//登录口令
	WCHAR ManageId[21];//管理口令
}LOGIN_VERIFY,*PLOGIN_VERIFY;

typedef struct _STRATEGY_ELEMENT
{
	LIST_ENTRY   ListElement;
	WCHAR		 StrategyName[64];

	int			 StrategyType;
	WCHAR		 SelectedItem[32];
	int			 ItemAttribute;
	WCHAR  		 LastTime[32];//最后一次策略运行时间，如第一次为空
	BOOL         StrategyStatus;

	int TaskMode;
	union
	{
		struct
		{
			int StartTime;
			int NumOfDay;
		}day;
		struct
		{
			int StartTime;
			int	NumOfWeek;
			int WhichWeek;
		}week;
		struct
		{
			int StartTime;
			int WhichMonth;			
			int DayOfMonth;
		}month;
	}taskset;

}STRATEGY_ELEMENT,*LPSTRATEGY_ELEMENT;


typedef struct _STRATEGYMODI_ELEMENT
{
	LIST_ENTRY   ListElement;
	WCHAR		 StrategyName[64];
	WCHAR		 StrategyName_Old[64];


	int			 StrategyType;
	WCHAR		 SelectedItem[32];
	int			 ItemAttribute;
	WCHAR  		 LastTime[32];//最后一次策略运行时间，如第一次为空
	BOOL         StrategyStatus;

	int TaskMode;
	union
	{
		struct
		{
			int StartTime;
			int NumOfDay;
		}day;
		struct
		{
			int StartTime;
			int	NumOfWeek;
			int WhichWeek;
		}week;
		struct
		{
			int StartTime;
			int WhichMonth;			
			int DayOfMonth;
		}month;
	}taskset;

}STRATEGYMODI_ELEMENT,*LPSTRATEGYMODI_ELEMENT;



//////////////////////////////////////////////////////////////////////////
//主动监测预定义数据

#define OP_READ             0x01
#define	OP_WRITE			0x02
#define	OP_EXECUTE			0x04
#define	OP_DELETE			0x08
#define OP_DIR_CREATE       0x10
#define OP_CREATE           0x20
#define OP_RENAME           0x40
#define OP_DELETE_VALUE     0x80

#define OP_CREATETHREAD     0x01
#define OP_LOADIMAGE        0x02

#define	OP_LOAD				0x01
#define	OP_ALL				0xFF

#define MATCH_SINGLE        0
#define MATCH_WILDCARD      1
#define MATCH_ALL           2

#define ACTION_NONE			0
#define ACTION_PERMIT		1
#define ACTION_DENY			2

#define MASK_ENABLE_FILEHOOK     0x1
#define MASK_ENABLE_REGISTRYHOOK 0x2
#define MASK_ENABLE_PROCESSHOOK  0x4
#define MASK_ENABLE_DRIVERHOOK   0x8

enum
{
	TypeOperationNone=0,               // 没有任何操作
	TypeOperationCreateNewFile,        // OP_CREATE
	TypeOperationCreateDirectory,      // OP_DIR_CREATE
	TypeOperationWriteFile,            // OP_WRITE
	TypeOperationDeleteFile,           // OP_DELETE
	TypeOperationRenameFile,           // OP_RENAME
	TypeOperationCreateKey,            // OP_CREATE
	TypeOperationWriteValue,           // OP_WRITE
	TypeOperationDeleteKey,            // OP_DELETE
	TypeOperationDeleteKeyValue,       // OP_DELETE_VALUE
	TypeOperationLoadImage,            // OP_LOADIMAGE
	TypeOperationLoadDriver,           // OP_LOAD
	TypeOperationCreateRemoteThread,   // OP_CREATETHREAD
};

#define TYPE_COMPARE_WILDCARD   0
#define TYPE_SHORTNAME_WILDCARD 1
#define TYPE_COMPARE_EQUAL      2
#define TYPE_SHORTNAME_EQUAL    3
#define TYPE_COMPARE_EXCUTE     4
#define TYPE_DLL_EXECUTE        5

typedef enum _RULE_TYPE_OBJECT
{
	RULE_TYPE_FILE=0,
	RULE_TYPE_REGISTRY,
	RULE_TYPE_PROCESS,
	RULE_TYPE_DRIVER,
	RULE_TYPE_MAX,
}RULE_TYPE_OBJECT;

//////////////////////////////////////////////////////////////////////////
//监测策略预定义数据

typedef enum _TASKMODE
{
	EVERYDAY,	//每天
	WEEKLY,		//每周
	PERMONTH,	//每月
	ONCE,		//一次性
	START,		//系统启动时
	LOGON,		//系统登陆时
	FREE		//空闲时
}TASKMODE;

enum
{
	STRATEGY_OPERATE_SYSTEM,		//操作系统完整性保护策略
	STRATEGY_DATABASE_SYSTEM,		//数据库系统完整性保护策略
	STRATEGY_WEB_SERVER,			//web服务器完整性保护策略
	STRATEGY_MAIL_SERVER,			//邮件服务器完整性保护策略
	STRATEGY_INTERNET_DEVICE,		//网络设备/安全设备完整性保护策略
	STRATEGY_FILE_SERVER,			//文件服务器完整性保护策略
	STRATEGY_SELF_SERVER,			//自定义服务器完整性保护策略
	STRATEGY_SELF_FILESYSTEM,		//自定义文件系统完整性保护策略
	STRATEGY_SELF_INTERNET,			//自定义网络设备完整性保护策略
	STRATEGY_SELF_REG,				//自定义注册表完整性保护策略

	STRATEGY_COUNT,
};

#define		STRATEGY_WINDOW_FILE			0x00000001			//windows系统文件/目录完整性保护
#define		STRATEGY_WINDOW_DRIVER			0x00000002			//windows系统驱动完整性保护
#define		STRATEGY_WINDOW_REGISTRY		0x00000004			//windows注册表完整性保护
#define		STRATEGY_WINDOW_START			0x00000008			//windows启动项完整性保护
#define		STRATEGY_WINDOW_PROCESS			0x00000010			//windows进程完整性保护
#define		STRATEGY_WINDOW_INTERNET		0x00000020			//windows网络环境完整性保护
#define		STRATEGY_WINDOW_SERVICE			0x00000040			//windows服务框架完整性保护
#define		STRATEGY_WINDOW_USERS			0x00000080			//windows用户/组完整性保护


//星期
#define		MONDAY		1		//星期一
#define		TUESDAY		2		//星期二
#define		WEDNESDAY	4		//星期三
#define		THURSDAY	8		//星期四
#define		FRIDAY		16		//星期五
#define		SATURDAY	32		//星期六
#define		SUNDAY		64		//星期日

//月份
#define		JANUARY		0x00000001		//一月
#define		FEBRUARY	0x00000002		//二月
#define		MARCH		0x00000004		//三月
#define		APRIL		0x00000008		//四月
#define		MAY			0x00000010		//五月
#define		JUNE		0x00000020		//六月
#define		JULY		0x00000040		//七月
#define		AUGUST		0x00000080		//八月
#define		SEPTEMBER	0x00000100		//九月
#define		OCTOBER		0x00000200		//十月
#define		NOVEMBER	0x00000400		//十一月
#define		DECEMBER	0x00000800		//十二月

//第几个
enum
{
	ONE,		//第一个
	TWO,		//第二个
	THREE,		//第三个
	FOUR,		//第四个
	LAST		//最后一个
};

//过滤行为
#define		CREATE_FILE		0x00000001		//创建文件
#define		CREATE_FOLDER	0x00000002		//创建目录
#define		ACCESS_WRITE	0x00000004		//写入
#define		ACCESS_DELETE	0x00000008		//删除
#define		ACCESS_RENAME	0x00000010		//重命名

//设备类型
enum
{
	CISCO_CLI,	//cisco cli命令集
	CISCO_SET,	//cisco set命令集
	PIX_ASA		//pix/asa防火墙
};

//登录方式
enum
{
	TELNET,	//telnet登录
	SSH		//ssh登录
};

//默认规则
enum
{
	UNDECIDED,	//未决
	REFUSE,		//拒绝
	ALLOW		//放行
};

//文件的筛选方式
enum
{
	PROTECT_ALL,		//全部保护
	PROTECT_IN_LIST,	//只保护列表中的文件类型
	PROTECT_OUT_LIST	//只保护列表以外的文件类型
};


#define	SURPRESS_LAST_LOGIN_USER_NAME  0x00000001//禁止显示上次登陆的用户名
#define	RENAME_AND_DISABLE_DEFAULT_GUEST_ACCOUNT 0x00000002//重命名&禁用默认系统来宾帐户
#define	ENABLE_INTERACTIVE_LOGIN_DISPLAY_INFORMATION_BOX 0x00000004//启用交互登陆显示信息框
#define	PROHIBIT_SHARED_RESOURCE_REMOTE_SCAN 0x00000008//禁止共享资源远程扫描
#define	RESTRICT_ANONYMOUS_ACCESS_TO_SHARED_RESOURCE_AND_REGISTRY_RESOURCE 0x00000010//限制匿名访问的共享资源和注册表资源
#define	ENABLE_SYSTEM_PASSWORD_MODIFY_TIME_REQUEST 0x00000020//启用系统密码修改时间要求
#define	ENABLE_MANDATORY_HISTORICAL_COMPARISON_OF_SYSTEM_PASSWORD_REQUEST 0x00000040//启用系统密码强制历史对比要求
#define	ENABLE_SYSTEM_PASSWORD_FAILURE_DETECTION_AND_LOCK_REQUEST 0x00000080//启用系统密码登陆失败检测与锁定要求
#define	ENABLE_BLOCKING_SYSTEM_ACCOUNT_REMOTE_SCANNING_REQUEST 0x00000100//启用阻挡系统账户远程被扫描要求
#define	CLOSE_EVERYONE_BE_MAPPED_TO_ANONYMOUS_USERS_SETTING 0x00000200//关闭everyone映射到匿名用户设置
#define	START_WINDOWS_SYSTEM_AUDIT 0x00000400//启动windows系统审核



#define	RENAME_AND_DISABLE_DEFAULT_ADMINISTRATOR_ACCOUNT  0x00000001//重命名&禁用默认系统管理员帐户
#define	RENAME_AND_DISABLE_DEFAULT_GUEST_ACCOUNT  0x00000002//重命名&禁用默认系统来宾帐户
#define	ENABLE_SYSTEM_PASSWORD_COMPLEXITY_REQUEST 0x00000004//启用系统密码复杂性要求
#define	ENABLE_SYSTEM_MINIMUM_PASSWORD_LENGTH_REQUEST 0x00000008//启用系统密码长度最小值要求
#define	ENABLE_SYSTEM_PASSWORD_MODIFY_TIME_REQUEST 0x00000010//启用系统密码修改时间要求
#define	ENABLE_MANDATORY_HISTORICAL_COMPARISON_OF_SYSTEM_PASSWORD_REQUEST 0x00000020//启用系统密码强制历史对比要求
#define	ENABLE_SYSTEM_PASSWORD_FAILURE_DETECTION_AND_LOCK_REQUEST 0x00000040//启用系统密码登陆失败检测与锁定要求
#define	ENABLE_BLOCKING_SYSTEM_ACCOUNT_REMOTE_SCANNING_REQUEST 0x00000080//启用阻挡系统账户远程被扫描要求
#define	CLOSE_EVERYONE_BE_MAPPED_TO_ANONYMOUS_USERS_SETTING 0x00000100//关闭everyone映射到匿名用户设置
#define	ENABLE_SYSTEM_ACCOUNT_FIREWALL 0x00000200 //启用系统账户防火墙
