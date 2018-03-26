//�ͷ��񽻻������ݵĽṹ
#pragma once


//����
enum
{
	BASE_NOT_USER = WM_USER + 500,

	// ����񽻻�
	REQUEST_QUERY_SERVER_CONFIG,			//��ѯ����������
	REQUEST_CLIENT_IS_ONLINE,				//��ѯ�ͻ����Ƿ�����
	OPERATION_SET_SERVER_CONFIG,			//���ķ���������
	REQUEST_CLIENT_CONNLIST,				//�ͻ����б�
	CLIENTIP_CONNECTED,						//�ͻ�������֪ͨ
	CLIENTIP_DISCONNECTED,					//�ͻ��˶Ͽ�֪ͨ
	SERVER_START_RESTORE,					//��ʼ��ԭ
	SERVER_STRATEGYOBJECT_STATUSNOTIFY,		//��������״̬����   
	HISTORY_COPYRESTORE_STATUSNOTIFY,       //��ʷ������ԭ״̬����
	OPERATION_CONNECT_CLIENT,				//���ӿͻ���
	OPERATION_DISCONNECT_CLIENT,			//�Ͽ��ͻ���

	// ��ͻ��˽���
	// ����
	SERVER_LIST_DRIVE,						//�г��̷�
	SERVER_LIST_FILEDIRECTORY,				//�г�Ŀ¼�������ļ����ļ���
	SERVER_LIST_DIRECTORY,					//�г�Ŀ¼�����е�Ŀ¼

	//�������
	 //����
	SERVER_HIPS_ADD_NEW_FILTER,				//�½�����
	SERVER_HIPS_MODIFY_FILTER,				//�޸Ĳ���
	SERVER_HIPS_DELETE_FILTER,				//ɾ������
	SERVER_HIPS_LOGINFO,
	 //���ι�ϵ
	SERVER_HIPS_ADD_TRUST,					//������ι�ϵ
	SERVER_HIPS_MODIFY_TRUST,				//�޸����ι�ϵ 
	SERVER_HIPS_DELETE_TRUST,				//ɾ�����ι�ϵ

	//������

	SERVER_STRATEGYGUARD_START,				//���в���
	SERVER_STRATEGYGUARD_PAUSE,				//��ͣ����
	SERVER_STRATEGYGUARD_STOP,				//ֹͣ����
	SERVER_STRATEGYGUARD_ADD,				//��������        ���¼ӣ�	
	SERVER_STRATEGYGUARD_DELETE,			//ɾ������
	SERVER_STRATEGYGUARD_MODIFY,			//�޸Ĳ���
	SERVER_STRATEGYGUARD_VERIFY,			//��֤��¼

	//��ȫ�ӹ�
    SERVICE_REINFORCE,  //����ӹ�����
    STARTUP_REINFORCE,  //ϵͳ������ӹ�����
	WIN_SHARE_REINFORCE,  //windows����ӹ�����
    PERIPHERAL_REINFORCE,  //�ⲿ�豸�ӹ�����
    NET_SECURITY_REINFORCE,  //���簲ȫ�ӹ�����
    SYSTEM_SECURITY_REINFORCE,  //ϵͳ��ȫ�ӹ�����
    USER_SECURITY_REINFORCE,  //�û���ȫ�ӹ�����	
};

//����ṹ��

/************************************************************************/
/*                     �ͷ��񽻻�                                       */
/************************************************************************/

//RESQUEST_IS_CLIENT_ONLINE						�жϿͻ����Ƿ�����
// OPERATION_CONNECT_CLIENT						���ӿͻ���
// OPERATION_DISCONNECT_CLIENT					�Ͽ��ͻ���
typedef
struct _ClientIP
{
	DWORD	dwClientIP;
}ClientIP, *PClientIP;

//SERVER_START_RESTORE
typedef
struct _CopyInfo
{
	DWORD	dwClientIP;			//�ͻ���IP
	WCHAR	szStrategyName[64];	//������
	WCHAR	szCopyFilePath[MAX_PATH];
}CopyInfo, *PCopyInfo;
//SERVER_STRATEGYOBJECT_STATUSNOTIFY,		��������״̬����	��0 ʧ�� 1 ��ʼ 2 �ɹ� ��
//HISTORY_COPYRESTORE_STATUSNOTIFY,			��ʷ������ԭ״̬���� ��0 ��ԭʧ��  1 ����ɹ���
//REQUEST_CLIENT_IS_ONLINE					���ؿͻ�������״̬  (0 �Ͽ�  1����)
//��ԭ״̬
enum
{
	RestoreStatus_none,
	RestoreStatus_processing,
	RestoreStatus_finished,
	RestoreStatus_failed,
};

//REQUEST_QUERY_SERVER_CONFIG					��ѯ����������
typedef 
struct _ServerConfigInfo
{
	DWORD	dwDataPort;
	DWORD	dwCommandPort;
}ServerConfigInfo, *PServerConfigInfo;
// OPERATION_SET_SERVER_CONFIG					���ķ���������
typedef
struct _ServerSetConfigInfo
{
	DWORD	dwDataPort;
	DWORD	dwCommandPort;
	WCHAR	szClientPassword[21];
}ServerSetConfigInfo, *PServerSetConfigInfo;

//CLIENTIP_CONNECTED,						�ͻ�������֪ͨ
//CLIENTIP_DISCONNECTED,					�ͻ��˶Ͽ�֪ͨ
typedef
struct _ClientConnStatus 
{
	DWORD	dwClientIP;
	DWORD	dwIPStatus;
}ClientConnStatus, *PClientConnStatus;


/************************************************************************/
/*                     �Ϳͻ��˽���                                     */
/************************************************************************/
//SERVER_LIST_FILEDIRECTORY						�г�Ŀ¼�µ��ļ����ļ���
//SERVER_LIST_DIRECTORY							�г�Ŀ¼�µ��ļ���
typedef
struct _ListDirectory 
{
	WCHAR	szPath[MAX_PATH];		//����������'\'
}ListDirectory, *PListDirectory;

//�������
 //����
//SERVER_HIPS_ADD_NEW_FILTER					��Ӳ���
//SERVER_HIPS_MODIFY_FILTER						�޸Ĳ���
//SERVER_HIPS_DELETE_FILTER						ɾ������
typedef struct _POLICY_EXCEPTION_ENTRY  //�µĹ���ṹ
{
	DWORD  NextEntry;                  // ��һ��ƫ����
	UCHAR  OperatorType;               // ��������
	UCHAR  CompareType;                // �Ƚ�����
	UCHAR  MatchActionType;            // ƥ�����
	UCHAR  UnicodeIndex;               // ƥ������
	USHORT UnicodeNameLen;             // �ִ�����
	WCHAR  UnicodeName[ANYSIZE_ARRAY]; // ƥ���ִ�
}POLICY_EXCEPTION_ENTRY,*LPPOLICY_EXCEPTION_ENTRY;

//SERVER_HIPS_ADD_NEW_RULE						��ӹ���
//SERVER_HIPS_DELTE_RULE						ɾ������
typedef 
struct _POLICY_STRUCT
{
	WCHAR      m_FilterNameW[32];			//��������
	UINT       m_TypeOfHipsRule;			//���Է���
	UCHAR      m_MatchType;					//ƥ�����
	UCHAR      m_OperatorType;				//������Ϊ
	USHORT     m_DefaultAction;				//Ĭ�Ϲ���
	BOOL       m_DefaultLogFilter;			//�Ƿ��¼��־
	WCHAR      m_RegExpW[MAX_PATH];			//���˹���
	DWORD      m_RuleNum;
}POLICY_STRUCT,*LPPOLICY_STRUCT;
 //���ι�ϵ
//SERVER_HIPS_ADD_TRUST							������ι�ϵ
//SERVER_HIPS_MODIFY_TRUST						�޸����ι�ϵ 
//SERVER_HIPS_DELETE_TRUST						ɾ�����ι�ϵ
typedef
struct _HipsTrust
{
	DWORD	dwType;								//��������
	WCHAR	szContent[MAX_PATH];				//���ζ�������
}HIPSTRUST, *PHIPSTRUST;

 //��������
enum
{
	HIPS_TRUST_FILE,
	HIPS_TRUST_REGISTRY,
	HIPS_TRUST_COUNT,
};

//������
 // SERVER_STRATEGYGUARD_START				���в���
 //SERVER_STRATEGYGUARD_MODIFY				�޸Ĳ���
typedef struct _STRATEGY_FILESTRUCT
{
	//��������--�ļ���
	WCHAR SelectedFolder[MAX_PATH];
	//��������--ɸѡ��ʽ
	int FilterType;
	//��������--�ļ����ͣ�*.txt;*.doc;*.xml;)
	WCHAR SelectedFileType[250];

}STRATEGY_FILESTRUCT,*PSTRATEGY_FILESTRUCT;




//����ģʽ	WCHAR   StrategyID[35];
typedef struct _STRATEGY_INFORMATION
{
	LIST_ENTRY ListElement;
	WCHAR   StrategyID[35];
	WCHAR   StrategyPoolID[35];

	//����ģ������
	//���磺����ϵͳ�����Ա�������--StrategyType
	//		windows 2000 server�����Ա���--SelectedItem
	//		windowsϵͳ�ļ�/Ŀ¼�����Ա����ȵ�--ItemAttribute
	int StrategyType;
	WCHAR SelectedItem[32];
	int ItemAttribute;//��λ�ж�

	WCHAR StrategyName[64];//��������
	WCHAR StrategyDescriptor[51];//��������

	//������IP��ַ
	WCHAR strIp[16];

	union
	{
		//�����豸
		struct 
		{
			DWORD	dwClientIP;
			int DeviceType;//�豸����
			int	LoginType;//��¼��ʽ
			WCHAR UserId[11];//�û�ID
			WCHAR LoginId[21];//��¼����
			WCHAR ManageId[21];//�������
		}internet;
		
		//�Զ��������豸
		struct  
		{
			DWORD	dwClientIP;

			int	LoginType;//��¼��ʽ
			WCHAR UserId[11];//�û�ID
			WCHAR LoginId[21];//��¼����
			WCHAR ManageId[21];//�������
		}selfinet;

		//�ļ�ϵͳ
		struct
		{
			DWORD	dwClientIP;

			//��������--�ļ���
			WCHAR SelectedFolder[MAX_PATH];
			//��������--ɸѡ��ʽ
			int FilterType;
			//��������--�ļ����ͣ�*.txt;*.doc;*.xml;)
			WCHAR SelectedFileType[250];
			//�¼����ֶ�
			WCHAR IgnoreFolder[2048];
		}selffile;
	}strategy;

	//����ģʽ
	int TaskMode;
	union
	{
		//ÿ��
		struct
		{
			//��ʼʱ��
			int StartTime;
			//ÿ*��
			int NumOfDay;
		}day;

		//ÿ��
		struct
		{
			//��ʼʱ��
			int StartTime;
			//ÿ*��
			int	NumOfWeek;
			//����*����ѡ������λ�ж�
			int WhichWeek;
		}week;

		//ÿ��
		struct
		{
			//��ʼʱ��
			int StartTime;
			//*�£���ѡ������λ�ж�
			int WhichMonth;
			//��ѡһ
			int mode;
			//����µ�*��
			int DayOfMonth;
			//����µ�***���ڼ����� ***�����ڼ���
			int WeekOfMonth;
			int	DayOfWeek;
		}month;

		//����ʱ
		struct  
		{
			//�����������ʱ�䳬��*����
			int OverTime;
		}free;
	}taskset;

	BOOL IsAutoDelete;//�Զ�ɾ��
	BOOL IsStopTask;//ֹͣ����
	int NumOfHours;//�������ٸ�Сʱ
	int NumOfMunites;//�������ٷ���
	
	BOOL IsStartHips;			//�������
	BOOL IsHistoryCopy;			//��ʷ����
	BOOL IsSavePlace;			//�洢λ��
	BOOL IsReport;				//���ձ���
	BOOL IsJiXianData;			//��������
	
	int FilterBehavior;//������Ϊ����λ�ж�
	int DefaultRule;//Ĭ�Ϲ���
	int NumOfHistoryCopy;//��ʷ�����Ĳ���
	int CurrVersionNum;
	WCHAR SavePlace[MAX_PATH];//��ʷ�����洢��λ��
	WCHAR ReportPlace[MAX_PATH];//���ձ��淢����λ��
}STRATEGY_INFORMATION,*PSTRATEGY_INFORMATION;

typedef struct _reinforcePolicyData
{
WCHAR policyName[11];
WCHAR policyDoc[51];
int serverGroup;
int policyTemplate;
}reinforcePolicyData,*pReinforcePolicyData;

//��������BUFFER
typedef struct _STRATEGY_BUFFERDATA
{
	//��������
	WCHAR StrategyName[64];
}STRATEGY_BUFFERDATA,*LPSTRATEGY_BUFFERDATA;

//��������
typedef struct _STRATEGY_CHANGESTRUCT
{	
	WCHAR   StrategyName[64];
	int     StrategyType;

}STRATEGY_CHANGESTRUCT,*LPSTRATEGY_CHANGESTRUCT;


 //SERVER_STRATEGYGUARD_PAUSE				��ͣ����
typedef struct _PAUSE_STRATEGY
{
	//��������
	WCHAR StrategyName[64];
}PAUSE_STRATEGY,*PPAUSE_STRATEGY;
 //SERVER_STRATEGYGUARD_STOP				ֹͣ����
typedef struct _STOP_STRATEGY
{
	//��������
	WCHAR StrategyName[64];
}STOP_STRATEGY,*PSTOP_STRATEGY;
//SERVER_STRATEGYGUARD_DELETE				ɾ������
typedef struct _DELETE_STRATEGY
{
	//��������
	WCHAR StrategyName[64];
}DELETE_STRATEGY,*PDELETE_STRATEGY;


typedef struct _STRATEGY_RUNSTATUS
{
	int   Status;
	WCHAR StrategyName[64];
	WCHAR FailReason[MAX_PATH];
}STRATEGY_RUNSTATUS,*LPSTRATEGY_RUNSTATUS;


 //SERVER_STRATEGYGUARD_VERIFY			��֤��¼
typedef struct _LOGIN_VERIFY
{
	int LoginType;//��¼��ʽ
	WCHAR UserId[11];//�û�ID
	WCHAR LoginId[21];//��¼����
	WCHAR ManageId[21];//�������
}LOGIN_VERIFY,*PLOGIN_VERIFY;

typedef struct _STRATEGY_ELEMENT
{
	LIST_ENTRY   ListElement;
	WCHAR		 StrategyName[64];

	int			 StrategyType;
	WCHAR		 SelectedItem[32];
	int			 ItemAttribute;
	WCHAR  		 LastTime[32];//���һ�β�������ʱ�䣬���һ��Ϊ��
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
	WCHAR  		 LastTime[32];//���һ�β�������ʱ�䣬���һ��Ϊ��
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
//�������Ԥ��������

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
	TypeOperationNone=0,               // û���κβ���
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
//������Ԥ��������

typedef enum _TASKMODE
{
	EVERYDAY,	//ÿ��
	WEEKLY,		//ÿ��
	PERMONTH,	//ÿ��
	ONCE,		//һ����
	START,		//ϵͳ����ʱ
	LOGON,		//ϵͳ��½ʱ
	FREE		//����ʱ
}TASKMODE;

enum
{
	STRATEGY_OPERATE_SYSTEM,		//����ϵͳ�����Ա�������
	STRATEGY_DATABASE_SYSTEM,		//���ݿ�ϵͳ�����Ա�������
	STRATEGY_WEB_SERVER,			//web�����������Ա�������
	STRATEGY_MAIL_SERVER,			//�ʼ������������Ա�������
	STRATEGY_INTERNET_DEVICE,		//�����豸/��ȫ�豸�����Ա�������
	STRATEGY_FILE_SERVER,			//�ļ������������Ա�������
	STRATEGY_SELF_SERVER,			//�Զ�������������Ա�������
	STRATEGY_SELF_FILESYSTEM,		//�Զ����ļ�ϵͳ�����Ա�������
	STRATEGY_SELF_INTERNET,			//�Զ��������豸�����Ա�������
	STRATEGY_SELF_REG,				//�Զ���ע��������Ա�������

	STRATEGY_COUNT,
};

#define		STRATEGY_WINDOW_FILE			0x00000001			//windowsϵͳ�ļ�/Ŀ¼�����Ա���
#define		STRATEGY_WINDOW_DRIVER			0x00000002			//windowsϵͳ���������Ա���
#define		STRATEGY_WINDOW_REGISTRY		0x00000004			//windowsע��������Ա���
#define		STRATEGY_WINDOW_START			0x00000008			//windows�����������Ա���
#define		STRATEGY_WINDOW_PROCESS			0x00000010			//windows���������Ա���
#define		STRATEGY_WINDOW_INTERNET		0x00000020			//windows���绷�������Ա���
#define		STRATEGY_WINDOW_SERVICE			0x00000040			//windows�����������Ա���
#define		STRATEGY_WINDOW_USERS			0x00000080			//windows�û�/�������Ա���


//����
#define		MONDAY		1		//����һ
#define		TUESDAY		2		//���ڶ�
#define		WEDNESDAY	4		//������
#define		THURSDAY	8		//������
#define		FRIDAY		16		//������
#define		SATURDAY	32		//������
#define		SUNDAY		64		//������

//�·�
#define		JANUARY		0x00000001		//һ��
#define		FEBRUARY	0x00000002		//����
#define		MARCH		0x00000004		//����
#define		APRIL		0x00000008		//����
#define		MAY			0x00000010		//����
#define		JUNE		0x00000020		//����
#define		JULY		0x00000040		//����
#define		AUGUST		0x00000080		//����
#define		SEPTEMBER	0x00000100		//����
#define		OCTOBER		0x00000200		//ʮ��
#define		NOVEMBER	0x00000400		//ʮһ��
#define		DECEMBER	0x00000800		//ʮ����

//�ڼ���
enum
{
	ONE,		//��һ��
	TWO,		//�ڶ���
	THREE,		//������
	FOUR,		//���ĸ�
	LAST		//���һ��
};

//������Ϊ
#define		CREATE_FILE		0x00000001		//�����ļ�
#define		CREATE_FOLDER	0x00000002		//����Ŀ¼
#define		ACCESS_WRITE	0x00000004		//д��
#define		ACCESS_DELETE	0x00000008		//ɾ��
#define		ACCESS_RENAME	0x00000010		//������

//�豸����
enum
{
	CISCO_CLI,	//cisco cli���
	CISCO_SET,	//cisco set���
	PIX_ASA		//pix/asa����ǽ
};

//��¼��ʽ
enum
{
	TELNET,	//telnet��¼
	SSH		//ssh��¼
};

//Ĭ�Ϲ���
enum
{
	UNDECIDED,	//δ��
	REFUSE,		//�ܾ�
	ALLOW		//����
};

//�ļ���ɸѡ��ʽ
enum
{
	PROTECT_ALL,		//ȫ������
	PROTECT_IN_LIST,	//ֻ�����б��е��ļ�����
	PROTECT_OUT_LIST	//ֻ�����б�������ļ�����
};


#define	SURPRESS_LAST_LOGIN_USER_NAME  0x00000001//��ֹ��ʾ�ϴε�½���û���
#define	RENAME_AND_DISABLE_DEFAULT_GUEST_ACCOUNT 0x00000002//������&����Ĭ��ϵͳ�����ʻ�
#define	ENABLE_INTERACTIVE_LOGIN_DISPLAY_INFORMATION_BOX 0x00000004//���ý�����½��ʾ��Ϣ��
#define	PROHIBIT_SHARED_RESOURCE_REMOTE_SCAN 0x00000008//��ֹ������ԴԶ��ɨ��
#define	RESTRICT_ANONYMOUS_ACCESS_TO_SHARED_RESOURCE_AND_REGISTRY_RESOURCE 0x00000010//�����������ʵĹ�����Դ��ע�����Դ
#define	ENABLE_SYSTEM_PASSWORD_MODIFY_TIME_REQUEST 0x00000020//����ϵͳ�����޸�ʱ��Ҫ��
#define	ENABLE_MANDATORY_HISTORICAL_COMPARISON_OF_SYSTEM_PASSWORD_REQUEST 0x00000040//����ϵͳ����ǿ����ʷ�Ա�Ҫ��
#define	ENABLE_SYSTEM_PASSWORD_FAILURE_DETECTION_AND_LOCK_REQUEST 0x00000080//����ϵͳ�����½ʧ�ܼ��������Ҫ��
#define	ENABLE_BLOCKING_SYSTEM_ACCOUNT_REMOTE_SCANNING_REQUEST 0x00000100//�����赲ϵͳ�˻�Զ�̱�ɨ��Ҫ��
#define	CLOSE_EVERYONE_BE_MAPPED_TO_ANONYMOUS_USERS_SETTING 0x00000200//�ر�everyoneӳ�䵽�����û�����
#define	START_WINDOWS_SYSTEM_AUDIT 0x00000400//����windowsϵͳ���



#define	RENAME_AND_DISABLE_DEFAULT_ADMINISTRATOR_ACCOUNT  0x00000001//������&����Ĭ��ϵͳ����Ա�ʻ�
#define	RENAME_AND_DISABLE_DEFAULT_GUEST_ACCOUNT  0x00000002//������&����Ĭ��ϵͳ�����ʻ�
#define	ENABLE_SYSTEM_PASSWORD_COMPLEXITY_REQUEST 0x00000004//����ϵͳ���븴����Ҫ��
#define	ENABLE_SYSTEM_MINIMUM_PASSWORD_LENGTH_REQUEST 0x00000008//����ϵͳ���볤����СֵҪ��
#define	ENABLE_SYSTEM_PASSWORD_MODIFY_TIME_REQUEST 0x00000010//����ϵͳ�����޸�ʱ��Ҫ��
#define	ENABLE_MANDATORY_HISTORICAL_COMPARISON_OF_SYSTEM_PASSWORD_REQUEST 0x00000020//����ϵͳ����ǿ����ʷ�Ա�Ҫ��
#define	ENABLE_SYSTEM_PASSWORD_FAILURE_DETECTION_AND_LOCK_REQUEST 0x00000040//����ϵͳ�����½ʧ�ܼ��������Ҫ��
#define	ENABLE_BLOCKING_SYSTEM_ACCOUNT_REMOTE_SCANNING_REQUEST 0x00000080//�����赲ϵͳ�˻�Զ�̱�ɨ��Ҫ��
#define	CLOSE_EVERYONE_BE_MAPPED_TO_ANONYMOUS_USERS_SETTING 0x00000100//�ر�everyoneӳ�䵽�����û�����
#define	ENABLE_SYSTEM_ACCOUNT_FIREWALL 0x00000200 //����ϵͳ�˻�����ǽ
