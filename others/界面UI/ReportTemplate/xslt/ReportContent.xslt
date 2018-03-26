<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/10/xpath-functions" xmlns:xdt="http://www.w3.org/2004/10/xpath-datatypes">
	<xsl:output version="1.0"  indent="no" omit-xml-declaration="no" media-type="text/html"/>
	<xsl:param name="HostName">1</xsl:param>
	<xsl:param name="IP">1</xsl:param>
	<xsl:param name="LogStyle">1</xsl:param>
	<xsl:param name="LogContent">1</xsl:param>
    <xsl:param name="LogTime">1</xsl:param>
    
      <xsl:variable name="showFlag">
    <xsl:for-each select="StrategyReportInfo">
      <xsl:for-each select="Logentry">
          <xsl:value-of select="count(*)"/>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:variable>

	<xsl:template match="/">
		<html>
			<head>
				<title/>
				<!-- css styles -->
				<style type="text/css">
          td,p,li {font-size:12px;font-family: 宋体;color:#070707;}
          span {color: #4589C0;}
          A:link {text-decoration:underline;color:#070707;}
          A:visited {text-decoration:underline;color:#070707;}
          A:active {text-decoration:underline;color:#4589C0;}
          A:hover {text-decoration:underline;color:#4589C0;}
          .tdtopblue {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 0px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-top-color: FFFFFF;
          border-bottom-color: FFFFFF;
          border-right-color: #4589C0;
          border-left-color: #4589C0;
          height:25px;
          background-color:#4589C0;
          }

          .tdcolorone {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 1px;
          border-left-width: 1px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-top-color: A6CBE7;
          border-right-color: A6CBE7;
          border-left-color: A6CBE7;
          border-bottom-color: A6CBE7;
          height:24px;
          }
          .tdcolortwo {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 1px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-top-color: A6CBE7;
          border-right-color: A6CBE7;
          border-left-color: A6CBE7;
          border-bottom-color: A6CBE7;
          height:24px;
          }
          .tdcolorthree {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 1px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: none;
          border-bottom-style: solid;
          border-left-style: solid;
          border-top-color: A6CBE7;
          border-right-color: A6CBE7;
          border-left-color: A6CBE7;
          border-bottom-color: A6CBE7;
          height:24px;
          }
          .tdcolorfour {
          border-top-width: 1px;
          border-right-width: 1px;
          border-bottom-width: 1px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-top-color: A6CBE7;
          border-right-color: A6CBE7;
          border-left-color: A6CBE7;
          border-bottom-color: A6CBE7;
          height:24px;
          }
          .tdtitle2 {
          border-top-width: 1px;
          border-right-width: 1px;
          border-bottom-width: 1px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
          .tdtitleleft2 {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 1px;
          border-left-width: 1px;
          border-top-style: solid;
          border-right-style: none;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
          .tdchartleft {
          border-top-width: 0px;
          border-right-width: 0px;
          border-bottom-width: 0px;
          border-left-width: 1px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
          .tdchartright {
          border-top-width: 0px;
          border-right-width: 1px;
          border-bottom-width: 0px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
          .tdchartlefttop {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 0px;
          border-left-width: 1px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
          .tdchartrighttop {
          border-top-width: 1px;
          border-right-width: 1px;
          border-bottom-width: 0px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
          .tdchartleftbottom {
          border-top-width: 0px;
          border-right-width: 0px;
          border-bottom-width: 1px;
          border-left-width: 1px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
          .tdchartrightbottom {
          border-top-width: 0px;
          border-right-width: 1px;
          border-bottom-width: 1px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
          .tdchartcentertop {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 0px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }

          .tdchartcenter2 {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 0px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:480px;
          }

          .tdflexcentertop {
          border-top-width: 1px;
          border-right-width: 0px;
          border-bottom-width: 0px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:300px;
          }
          .tdchartcenterbottom {
          border-top-width: 0px;
          border-right-width: 0px;
          border-bottom-width: 1px;
          border-left-width: 0px;
          border-top-style: solid;
          border-right-style: solid;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-right-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          }
        </style>
				<!-- End of css styles -->
			</head>
			<body topmargin="0" oncontextmenu="return false">
			
				<table width="84%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="1%" class="tdtitleleft2" bgcolor="#F4F7FA">
							<font color="white">&#160;</font>
						</td>
						<td valign="bottom" class="tdtitle2" bgcolor="#F4F7FA">
							<b>
								<font color="#3076AB" face="宋体_GB2312" style="font-size: 15px"> 报告内容</font>
							</b>
						</td>
					</tr>
				</table>
				<br/>
				<table border="0" width="84%" align="center" cellpadding="0" cellspacing="0">
					<tr>
            <td class="tdtopblue" align="center">
              <font color="white">数据路径</font>
            </td>
						<td class="tdtopblue" align="center">
							<font color="white">完整性状态</font>
						</td>
						<td class="tdtopblue" align="center">
							<font color="white">主机名称</font>
						</td>
						<td class="tdtopblue" align="center">
							<font color="white">主机IP</font>
						</td>
                        						<td class="tdtopblue" align="center">
							<font color="white">报告时间</font>
						</td>
            		</tr>
            <xsl:choose>
            <xsl:when test="$showFlag = 0">
              <tr>
                <td colspan="4" align="center"  height="30px">无报告数据。</td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="StrategyReportInfo"/>
            </xsl:otherwise>
          </xsl:choose>
		</table>

        <br/>
        <br/>
				
				
			
				<table width="84%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr><td align="right" style="border:0; font-family:Verdana; font-size:9px">Guancheng Security Inc.</td></tr>
				</table>
			</body>
		</html>
	</xsl:template>
      <xsl:template match="StrategyReportInfo">
    <xsl:for-each select="Logentry">
		<tr>
                    
              <td align="center" bgcolor="#FFE4D3" class="tdcolorone">
             <xsl:value-of select ="LogContent"/>
                <font color="white">&#160;</font>
              </td>
              
						<td align="center" bgcolor="#FFFEE4" class="tdcolortwo">
 					<xsl:value-of select ="LogStyle"/>
                <font color="white">&#160;</font>
						</td>
						<td align="center" class="tdcolorthree" bgcolor="#F2F8FD">
 					<xsl:value-of select ="HostName"/>
                <font color="white">&#160;</font>
						</td>
                <td align="center" class="tdcolorthree" bgcolor="#F2F8FD">
 					<xsl:value-of select ="IP"/>
                <font color="white">&#160;</font>
						</td>
						<td align="center" class="tdcolorone" bgcolor="#FFE4D3">
                <xsl:value-of select="LogTime"/>
                <font color="white">&#160;</font>
						</td>
 					</tr>
    	
    </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

