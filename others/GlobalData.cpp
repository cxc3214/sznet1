#include "stdafx.h"

//�ַ�������
const
PCTSTR	g_szClientType[] = 
{
	TEXT("��������"),
	TEXT("�����豸��")
};

//����
const 
PCTSTR	g_szStrategyType[]=
{
	TEXT("����ϵͳ�����Լ�����"),
	TEXT("���ݿ�ϵͳ�����Լ�����"),
	TEXT("Web�����������Լ�����"),
	TEXT("�ʼ������������Լ�����"),
	TEXT("�ļ������������Լ�����"),
	TEXT("�����豸/��ȫ�豸�����Լ�����"),
	TEXT("�Զ�������������Լ�����"),
	TEXT("�Զ����ļ�ϵͳ�����Լ�����"),
	TEXT("�Զ��������豸�����Լ�����")
};

//�������
const
PCTSTR	g_szHipsType[] =
{
	TEXT("�ļ�����"),
	TEXT("ע������"),
	TEXT("����װ�ز���"),
	TEXT("����װ�ز���")
};

const
PCTSTR g_szHipsTrustType[] = 
{
	TEXT("�ļ�/����"),
	TEXT("ע���"),
};

//���ݿ�����
/*
SQLiteWrapper	g_smSqlite;
SQLiteWrapper	g_smcmSqlite;
SQLiteWrapper	g_iggsSqlite;
SQLiteWrapper	g_igscSqlite;
SQLiteWrapper	g_ighipsSqlite;
SQLiteWrapper	g_IGSOSqllite;
SQLiteWrapper	g_RCSqlite;
SQLiteWrapper	g_LCSqlite;
SQLiteWrapper   sr_sql;
*/

//SQLServerLink	g_smSqlite;
//SQLServerLink	g_smcmSqlite;
//SQLServerLink	g_iggsSqlite;
//SQLServerLink	g_igscSqlite;
//SQLServerLink	g_ighipsSqlite;
//SQLServerLink	g_IGSOSqllite;
//SQLServerLink	g_RCSqlite;
//SQLServerLink	g_LCSqlite;
//SQLServerLink   sr_sql;


WCHAR g_strDSN[MAX_PATH];
WCHAR g_strUID[MAX_PATH];
WCHAR g_strPassword[MAX_PATH];

WCHAR strServerIP[MAX_PATH];
WCHAR strDatabase[MAX_PATH];
WCHAR strDescription[MAX_PATH];

//��¼�û���Ϣ
LICENSEACCOUNT	g_CurrentUser;
//Ԥ�����û�
const
CString			g_csPredefinedUser = TEXT("admin");
const
CString			g_csPredefinedPwd = TEXT("admin");

//����ģ�鼤�����
BOOL		g_dwActiveModule[Module_last_not_use] = {FALSE};

//������Ȩ����
DWORD		g_dwLicensedPoint=0;

//ͨѶ
CInterConnect	g_InterConnect;

//���ڱ���g_hWndRegInfo
CRITICAL_SECTION g_csWndRegInfo;
//����ע�������
CListArray<REGINFO>	g_hWndRegInfo;
