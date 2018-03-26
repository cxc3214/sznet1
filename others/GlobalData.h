#include "wtlctrls\\listtypes.h"

//message
#define WM_SM_LM_UPDATE_CLIENT_TYPE	(WM_USER+0x302)
#define WM_SM_CM_NEW_CLIENT			(WM_USER+0X303)
#define WM_SM_CM_DELETE_CLIENT		(WM_USER+0X304)
#define WM_SM_CM_UPDATE_CLIENT		(WM_USER+0X305)
#define WM_SOCKETNOTIFY				(WM_USER+0X306)
//timer
#define TIMER_REFRESH_CHANGE_LOG	600

//�û�����
 //�û�����
enum
{
	UserType_UserDefined,
	UserType_Administrator,
};
 //�û�Ȩ��
enum
{
	UserPermission_IntegrityGuard	= 0x01,
	UserPermission_SafeReinforce	= 0x02,  //�����Լ��
	UserPermission_LogCenter		= 0x04,  //��־����
	UserPermission_ReportCenter		= 0x08,  //��������
	UserPermission_Safetools		= 0x10,
};

 //����ģ��
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

//ģ�����
 //ϵͳģ��
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

	Module_last_not_use,			//��ʹ��
};

//�ͻ��˹�����Ȩ����
 //�ͻ�������
enum
{
	CType_NotUse = -1,
	CType_Servers = 0,
	CType_NetDevice,
	CType_Count,
};

//�����Ա���
//  //������
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

// ������� ���ι�ϵ
// enum
// {
// 	HIPS_TRUST_FILE,
// 	HIPS_TRUST_REGISTRY,
// 	HIPS_TRUST_COUNT,
// };

//�ͻ��˹��� ��ӽڵ���Ϣ
//WM_SM_SM_NEW_CLIENT��ϢwParam ������Ϣ
typedef
struct _SMNewClient
{
	int	nType;
	int	nItemID;
	PTSTR	pszIP;
	PTSTR	pszMAC;
}SMNewClient, *PSMNewClient;

//�û�����
typedef
struct LicenseAccount
{
	CString	csUserName;
	CString	csUserSpecification;
	DWORD	dwUserType;
	DWORD	dwUserPower;
	DWORD	dwItemID;
}LICENSEACCOUNT, *PLICENSEACCOUNT;

//�������
typedef 
struct _POLICY_RULE_IN
{
	UCHAR      OperatorType;               // ��������
	UCHAR      CompareType;                // �Ƚ�����
	UCHAR      MatchActionType;            // ƥ�����
	UCHAR      UnicodeIndex;               // ƥ������
	CString    UnicodeName;                // ƥ���ִ�
	CString    FilterNameW;                // ��������
	DWORD      dwFilterID;                 // ���Ե�ID 
}POLICY_RULE_IN,*LPPOLICY_RULE_IN;

typedef 
struct _POLICY_STRUCT_IN
{
	CString    m_FilterNameW;   			//��������
	CString    m_IP;						//����Ŀ��
	CString    m_RegExpW;			        //���˹���
	UINT       m_TypeOfHipsRule;			//���Է���
	UCHAR      m_MatchType;					//ƥ�����
	UCHAR      m_OperatorType;				//������Ϊ
	USHORT     m_DefaultAction;				//Ĭ�Ϲ���
	BOOL       m_DefaultLogFilter;			//�Ƿ��¼��־
}POLICY_STRUCT_IN,*LPPOLICY_STRUCT_IN;

//�ַ�������
extern
const PCTSTR	g_szClientType[CType_Count];
extern
const PCTSTR	g_szStrategyType[STRATEGY_COUNT];
extern
const PCTSTR	g_szHipsType[RULE_TYPE_MAX];
extern
const PCTSTR	g_szHipsTrustType[HIPS_TRUST_COUNT];


//���ݿ�����
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


//��¼�û�
extern
LICENSEACCOUNT	g_CurrentUser;
//Ԥ�����û�
extern
const
CString			g_csPredefinedUser;
extern
const
CString			g_csPredefinedPwd;

//����ģ�鼤�����,
extern
BOOL		g_dwActiveModule[Module_last_not_use];

//������Ȩ����
extern
DWORD		g_dwLicensedPoint;

//���ڱ���g_hWndRegInfo
extern
CRITICAL_SECTION g_csWndRegInfo;
//����ע�������
extern
CListArray<REGINFO>	g_hWndRegInfo;

//����
extern CInterConnect	g_InterConnect;


