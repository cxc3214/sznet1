#include "stdafx.h"

//字符串常量
const
PCTSTR	g_szClientType[] = 
{
	TEXT("服务器组"),
	TEXT("网络设备组")
};

//策略
const 
PCTSTR	g_szStrategyType[]=
{
	TEXT("操作系统完整性监测策略"),
	TEXT("数据库系统完整性监测策略"),
	TEXT("Web服务器完整性监测策略"),
	TEXT("邮件服务器完整性监测策略"),
	TEXT("文件服务器完整性监测策略"),
	TEXT("网络设备/安全设备完整性监测策略"),
	TEXT("自定义服务器完整性监测策略"),
	TEXT("自定义文件系统完整性监测策略"),
	TEXT("自定义网络设备完整性监测策略")
};

//主动监测
const
PCTSTR	g_szHipsType[] =
{
	TEXT("文件策略"),
	TEXT("注册表策略"),
	TEXT("驱动装载策略"),
	TEXT("驱动装载策略")
};

const
PCTSTR g_szHipsTrustType[] = 
{
	TEXT("文件/程序"),
	TEXT("注册表"),
};

//数据库连接
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

//登录用户信息
LICENSEACCOUNT	g_CurrentUser;
//预定义用户
const
CString			g_csPredefinedUser = TEXT("admin");
const
CString			g_csPredefinedPwd = TEXT("admin");

//所有模块激活情况
BOOL		g_dwActiveModule[Module_last_not_use] = {FALSE};

//激活授权点数
DWORD		g_dwLicensedPoint=0;

//通讯
CInterConnect	g_InterConnect;

//用于保护g_hWndRegInfo
CRITICAL_SECTION g_csWndRegInfo;
//窗口注册命令表
CListArray<REGINFO>	g_hWndRegInfo;
