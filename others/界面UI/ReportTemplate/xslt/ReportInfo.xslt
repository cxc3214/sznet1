<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/10/xpath-functions" xmlns:xdt="http://www.w3.org/2004/10/xpath-datatypes">
	<xsl:output version="1.0"  indent="no" omit-xml-declaration="no" media-type="text/html"/>
	<xsl:param name="ReportName">1</xsl:param>
	<xsl:param name="Author">1</xsl:param>
	<xsl:param name="CreateTime">1</xsl:param>
	<xsl:param name="StrategyName">1</xsl:param>

	<xsl:template match="/">
		<html>
			<head>
				<title/>
				
				<!-- css styles -->
				<style type="text/css">
          td,p,li {font-size:12px;font-family: 宋体;color:#070707;}
          A:link {text-decoration:none;color:#818282;}
          A:visited {text-decoration:none;color:#818282;}
          A:active {text-decoration:none;color:#4589C0;}
          A:hover {text-decoration:none;color:#4589C0;}
          TD {border: solid 1px #a6cbe7;}
          .tdtopblue {background-color:#4589C0;}

          .tdtitleleftone {
          border-top-width: 0px;
          border-right-width: 0px;
          border-bottom-width: 0px;
          border-left-width: 1px;
          border-top-style: none;
          border-right-style: none;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          word-wrap:break-word;
          }

          :tdtworightC{
          border-top-width: 0px;
          border-right-width: 0px;
          border-bottom-width: 0px;
          border-left-width: 1px;
          border-top-style: none;
          border-right-style: none;
          border-bottom-style: solid;
          border-left-style: solid;
          border-left-color: #A6CBE7;
          border-bottom-color: #A6CBE7;
          border-top-color: A6CBE7;
          height:30px;
          word-wrap:break-word;

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
        </style>
				<!-- End of css styles -->
			</head>
			<body topmargin="0" oncontextmenu="return false">
			
			<table width="84%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td width="1%" class="tdtitleleft2" bgcolor="#F4F7FA">
						<font color="white">&#160;</font>
					</td>
					<td valign="bottom" class="tdtitle2" bgcolor="#F4F7FA" >
						<b>
						<font color="#3076AB" face="宋体_GB2312" style="font-size: 15px">报告信息</font></b>
					</td>
				</tr>
			</table>
			
			<br/>
				<table width="84%" border="0" align="center" cellpadding="3" cellspacing="0">
					<tr>
						<td bgcolor="F7FBFE" class="tdtworight2" width="20%">报告名称</td>
						<td class="tdoneright"  width="45%"  >
							<xsl:for-each select="StrategyReportInfo">
										<xsl:for-each select="ReportName">
											<xsl:apply-templates/>
										</xsl:for-each>
							</xsl:for-each>
							<font color="white">&#160;</font>　
						</td>
					</tr>
          <tr>
            <td bgcolor="F7FBFE" class="tdtworight2" width="20%"  >作者</td>
            <td class="tdoneright"  >
              <xsl:for-each select="StrategyReportInfo">
                  	<xsl:for-each select="Author">
                    	<xsl:apply-templates/>
                    </xsl:for-each>
              </xsl:for-each>
              <font color="white">&#160;</font>
            </td>
          </tr>
					<tr>
						<td bgcolor="F7FBFE" class="tdtworight2"  width="10%" >生成时间</td>
            <td class="tdoneright"   >
              <xsl:for-each select="StrategyReportInfo">
                    <xsl:value-of select="CreateTime"/>                    
              </xsl:for-each>
              <font color="white">&#160;</font>
            </td>
 			</tr>
          <tr>
            <td  bgcolor="F7FBFE" class="tdtworight2" width="10%">策略名称            
            </td>
            <td class="tdoneright" width="90%" >
              <xsl:for-each select="StrategyReportInfo">
                    <xsl:for-each select="StrategyName">
                      <xsl:apply-templates/>
                    </xsl:for-each>
              </xsl:for-each>
              <font color="white">&#160;</font>
            </td>
          </tr>
		</table>

        <br/>
        <br/>
				
				
			
				<table width="84%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr><td align="right" style="border:0; font-family:Verdana; font-size:9px">Guancheng Security Inc.</td></tr>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
