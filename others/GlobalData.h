#include "wtlctrls\\listtypes.h"

//message
#define WM_SM_LM_UPDATE_CLIENT_TYPE	(WM_USER+0x302)
#define WM_SM_CM_NEW_CLIENT			(WM_USER+0X303)
#define WM_SM_CM_DELETE_CLIENT		(WM_USER+0X304)
#define WM_SM_CM_UPDATE_CLIENT		(WM_USER+0X305)
#define WM_SOCKETNOTIFY				(WM_USER+0X306)
//timer
#define TIMER_REFRESH_CHANGE_LOG	600

//用户管理
 //用户类型
enum
{
	UserType_UserDefined,
	UserType_Administrator,
};
 //用户权限
enum
{
	UserPermission_IntegrityGuard	= 0x01,
	UserPermission_SafeReinforce	= 0x02,  //完整性检测
	UserPermission_LogCenter		= 0x04,  //日志中心
	UserPermission_ReportCenter		= 0x08,  //报告中心
	UserPermission_Safetools		= 0x10,
};

 //激活模块
enum
{
	ModuleActive_IntegrityAudit	= 0x001,
	ModuleActive_SafeReinforce	= 0x002,
	ModuleActive_Hips			= 0x004,
	ModuleActive_MSSqlServer	= 0x008,
	ModuleActive_MySql			= 0x010,
	ModuleActive_SendMail		= 0x020,
	ModuleActive_ExchangeServer	= 0x040,
	ModuleActive_2003ServerX32	= 0x080,
	ModuleActive_2008ServerX64	= 0x100,
	ModuleActive_WebLogicServer	= 0x200,
};

//模块管理
 //系统模块
enum
{
	Module_BaseModule = 0x0,
	Module_Hips,
	Module_HistoryCopy,
	Module_ReportCenter,
	Module_SafeReinforce,
	Module_UserDefinedNetRule,
	Module_UserDefinedApprule,
	Module_2003ServerX32,
	Module_2003ServerX64,
	Module_LinuxServerX32,
	Module_LinuxServerX64,
	Module_AIXServer,
	Module_HP_UXServer,
	Module_Solaris_Server_x86_Intel,
	Module_Solaris_Server_x64_Intel,
	Module_Solaris_Server_Sparc,
	Module_FreeBSD_Server_x86_Intel,
	Module_FreeBSD_Server_x64_Intel,
	Module_SCO_Server_x32_Intel,
	Modlue_SCO_Server_x84_Intel,
	Module_MS_SQL_Server_for_Windows,
	Module_Oracle_Server_for_Windows,
	Module_Oracle_Server_for_Linux,
	Module_Oracle_Server_for_Unix,
	Module_MySQL_Server_for_Windows,
	Module_MySQL_Server_for_Linux,
	Module_MySQL_Server_for_Unix,
	Module_DB2_Server_for_Windows,
	Module_DB2_Server_for_Linux,
	Module_DB2_Server_for_Unix,
	Module_Sybase_Server_for_Windows,
	Module_Sybase_Server_for_Linux,
	Module_Sybase_Server_for_Unix,
	Module_Informix_Server_for_Windows,
	Module_Informix_Server_for_Linux,
	Module_Informix_Server_for_Unix,
	Module_IIS_Server_for_Windows,
	Module_Weblogic_Server_for_Windows,
	Module_Weblogic_Server_for_Linux,
	Module_Weblogic_Server_for_Unix,
	Module_Websphere_Server_for_Windows,
	Module_Websphere_Server_for_Linux,
	Module_Websphere_Server_for_Unix,
	Module_Apache_Server_for_Windows,
	Module_Apache_Server_for_Linux,
	Module_Apache_Server_for_Unix,
	Module_Tomcat_Server_for_Windows,
	Module_Tomcat_Server_for_Linux,
	Module_Tomcat_Server_for_Unix,
	Module_Domino_Server_for_Windows,
	Module_Domino_Server_for_Linux,
	Module_Domino_Server_for_Unix,
	Module_Exchange_Server_for_Windows,
	Module_Webmail_Server_for_Windows,
	Module_Webmail_Server_for_Linux,
	Module_Qmail_Server_for_Linux,
	Module_Sendmail_Server_for_Linux,
	Module_Imail_Server_for_Windows,
	Module_Imail_Server_for_Linux,
	Module_MDaemon_Server_for_Windows,
	Module_Postfix_Server_for_Linux,
	Module_Vsftp_Server_for_Linux,
	Module_Pure_ftp_Server_for_Linux,
	Module_Wu_ftp_Server_for_Linux,
	Module_Proftp_Server_for_Linux,
	Module_Glftp_Server_for_Linux,
	Module_Serv_U_Server_for_Windows,
	Module_Samba_Server_for_Linux,
	Module_Cisco_Switch_Router,
	Module_Cisco_PIX_ASA,
	Module_Huawei_Switch_Router,
	Module_H3C_Switch_Router,
	Module_ruijie_Switch_Router,
	Module_shenzhoushuma_Switch_Router,
	Module_beidian_Switch_Router,
	Module_Juniper_Switch_Router,
	Module_D_Link_Switch_Router,
	Module_tianrongxin_Security_Series,
	Module_qimingxingcheng_Security_Series,
	Module_wangyuxingyu_Security_Series,
	Module_Juniper_Security_Series,
	Module_shenzhoushuma_Security_Series,
	Module_ruijie_Security_Series,
	Module_wangyushenzhou_Security_Series,
	Module_nokia_Security_Series,
	Module_Checkpiont_Security_Series,
	Module_Fortinet_Security_Series,
	Module_Sonicwall_Security_Series,
	Module_shenxinfu_Security_Series,
	Module_wangkang_Security_Series,
	Module_anqihua_Security_Series,
	Module_lvmeng_Security_Series,
	Module_Trendmicro_Security_Series,

	Module_last_not_use,			//不使用
};

//客户端管理、授权管理
 //客户端类型
enum
{
	CType_NotUse = -1,
	CType_Servers = 0,
	CType_NetDevice,
	CType_Count,
};

//完整性保护
//  //监测策略
// enum
// {
// 	STRATEGY_OPERATE_SYSTEM,
// 	STRATEGY_DATABASE_SYSTEM,
// 	STRATEGY_WEB_SERVER,
// 	STRATEGY_MAIL_SERVER,
// 	STRATEGY_FILE_SERVER,
// 	STRATEGY_INTERNET_DEVICE,
// 	STRATEGY_SELF_SERVER,
// 	STRATEGY_SELF_FILESYSTEM,
// 	STRATEGY_SELF_INTERNET,
// 
// 	STRATEGY_COUNT,
// };

// 主动监测 信任关系
// enum
// {
// 	HIPS_TRUST_FILE,
// 	HIPS_TRUST_REGISTRY,
// 	HIPS_TRUST_COUNT,
// };

//客户端管理 添加节点信息
//WM_SM_SM_NEW_CLIENT消息wParam 保存信息
typedef
struct _SMNewClient
{
	int	nType;
	int	nItemID;
	PTSTR	pszIP;
	PTSTR	pszMAC;
}SMNewClient, *PSMNewClient;

//用户管理
typedef
struct LicenseAccount
{
	CString	csUserName;
	CString	csUserSpecification;
	DWORD	dwUserType;
	DWORD	dwUserPower;
	DWORD	dwItemID;
}LICENSEACCOUNT, *PLICENSEACCOUNT;

//主动监测
typedef 
struct _POLICY_RULE_IN
{
	UCHAR      OperatorType;               // 操作类型
	UCHAR      CompareType;                // 比较类型
	UCHAR      MatchActionType;            // 匹配后动作
	UCHAR      UnicodeIndex;               // 匹配索引
	CString    UnicodeName;                // 匹配字串
	CString    FilterNameW;                // 策略名称
	DWORD      dwFilterID;                 // 策略的ID 
}POLICY_RULE_IN,*LPPOLICY_RULE_IN;

typedef 
struct _POLICY_STRUCT_IN
{
	CString    m_FilterNameW;   			//策略名称
	CString    m_IP;						//策略目标
	CString    m_RegExpW;			        //过滤规则
	UINT       m_TypeOfHipsRule;			//策略分类
	UCHAR      m_MatchType;					//匹配规则
	UCHAR      m_OperatorType;				//过滤行为
	USHORT     m_DefaultAction;				//默认规则
	BOOL       m_DefaultLogFilter;			//是否记录日志
}POLICY_STRUCT_IN,*LPPOLICY_STRUCT_IN;

//字符串常量
extern
const PCTSTR	g_szClientType[CType_Count];
extern
const PCTSTR	g_szStrategyType[STRATEGY_COUNT];
extern
const PCTSTR	g_szHipsType[RULE_TYPE_MAX];
extern
const PCTSTR	g_szHipsTrustType[HIPS_TRUST_COUNT];


//数据库连接
/*
extern
SQLiteWrapper	g_smSqlite;
extern
SQLiteWrapper	g_smcmSqlite;
extern
SQLiteWrapper	g_iggsSqlite;
extern
SQLiteWrapper	g_igscSqlite;
extern
SQLiteWrapper	g_ighipsSqlite;
extern
SQLiteWrapper	g_IGSOSqllite;
extern
SQLiteWrapper	g_RCSqlite;
extern
SQLiteWrapper	g_LCSqlite;
extern
SQLiteWrapper   sr_sql;
*/
//extern
//SQLServerLink	g_smSqlite;
//extern
//SQLServerLink	g_smcmSqlite;
//extern
//SQLServerLink	g_iggsSqlite;
//extern
//SQLServerLink	g_igscSqlite;
//extern
//SQLServerLink	g_ighipsSqlite;
//extern
//SQLServerLink	g_IGSOSqllite;
//extern
//SQLServerLink	g_RCSqlite;
//extern
//SQLServerLink	g_LCSqlite;
//extern
//SQLServerLink   sr_sql;

extern
WCHAR g_strDSN[MAX_PATH];
extern
WCHAR g_strUID[MAX_PATH];
extern
WCHAR g_strPassword[MAX_PATH];
extern
WCHAR strServerIP[MAX_PATH];
extern
WCHAR strDatabase[MAX_PATH];
extern
WCHAR strDescription[MAX_PATH];


//登录用户
extern
LICENSEACCOUNT	g_CurrentUser;
//预定义用户
extern
const
CString			g_csPredefinedUser;
extern
const
CString			g_csPredefinedPwd;

//所有模块激活情况,
extern
BOOL		g_dwActiveModule[Module_last_not_use];

//激活授权点数
extern
DWORD		g_dwLicensedPoint;

//用于保护g_hWndRegInfo
extern
CRITICAL_SECTION g_csWndRegInfo;
//窗口注册命令表
extern
CListArray<REGINFO>	g_hWndRegInfo;

//连接
extern CInterConnect	g_InterConnect;


