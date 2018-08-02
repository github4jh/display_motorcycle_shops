<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>coolbee機車族</title>
<style type="text/css">
<!--

-->
</style>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {
	font-size: 10pt;
	color: #5f534b;
}
.style6 {
	color: #fe6a10;
	font-size: 8pt;
}
.style8 {font-size: 8pt}
-->
</style>
</head>

<body>

<%
   String fromVerifyMemberID = request.getParameter("fromVerifyMemberID");
   String errorType = request.getParameter("errorType");
   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";
%>


<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
       <%@include file="logo.jsp"%> 
      </tr>
     </table>
    </td>
  </tr>      
<%
   if(session_id != null) 
   { 
     member_page_link = "MemberPage.jsp";   
%>
  <tr>
    <td><table width="95%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right">
       <a href=<%= member_page_link%>><img src="images/sell/link_back_to_member_page.gif" width="81" height="18" border="0"></a>
       <a href="logout.jsp?userLogout=1"><img src="images/sell/link_logout.gif" width="36" height="18" border="0"></a>
        </td>        
      </tr>
    </table></td>
  </tr>      
<%
   }
%>



  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="buy.jsp"><img src="images/buttom_1.gif" width="194" height="69" border="0"></a></td>
        <td><a href="login.jsp"><img src="images/buttom_2a.gif" width="131" height="69" border="0"></a></td>
        <td><a href="under_construction.jsp"><img src="images/buttom_3.gif" width="148" height="69" border="0"></a></td>
        <td><a href="heavycycle_store.jsp"><img src="images/buttom_4.gif" width="136" height="69" border="0"></a></td>
        <td><a href="electric_cycle_store.jsp"><img src="images/buttom_5.gif" width="281" height="69" border="0"></a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="21">&nbsp;</td>
  </tr>
  <tr>
    <td height="450" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="890" height="55" valign="top"> 　　<img src="images/sell/banner_login.gif" width="816" height="24"></td>
      </tr>
      <tr>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" height="0" valign="bottom">&nbsp;</td>
            <td align="center" valign="bottom"><form name="form1" method="post" action="verify_member_id.jsp?memberLogin=1">
              <table width="200" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="20">email</td>
                </tr>
                <tr>
                  <td height="0">
                    <input type="text" name="email" id="textfield">
                  </td>
                </tr>	
                <tr>
                  <td height="20"><img src="images/sell/word_pass.gif" width="28" height="13"></td>
                </tr>
                <tr>
                  <td height="0">
                    <input type="password" name="password" id="textfield2">
                  </td>
                </tr>
                <tr>
                  <td height="20"><a href="forget_password.jsp" class="style6">忘記密碼</a></td>
                </tr>
                <tr>
                  <td height="36" valign="bottom"><input type="image" src="images/sell/button_login.jpg" alt="Submit" width="45" height="21" /> <a href="create_account_individual.jsp"><img src="images/sell/button_free.jpg" width="104" height="21" border="0"></a></td>
                </tr>
                <tr>
                  <td>
                  <font color=red>
<%
                  if(fromVerifyMemberID != null)
                  {
                     if(errorType.equals("1"))
                     { 
%>
                        您目前不是正式會員.                      
<% 
                     } 
                     else if(errorType.equals("2"))
                     {
%>
                        您輸入的密碼不正確.<br> 
                        請重新登入.   
                   
<%                
                     }      
                     else if(errorType.equals("3"))
                     {
%>
                        您輸入的email不正確.<br>
                        請重新登入.                    
<%                
                     }
                     else if(errorType.equals("4"))
                     {
%>
                        您已連續錯誤三次以上.<br>
                        請重開新的網頁, 再登入.                    
<%                
                     }
                  }
%>
                 </font> 
                 </td>
                </tr>
              </table>
                        </form>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="60">
		<jsp:include page = "footer.jsp" />
	</td>
  </tr>
</table>
</body>
</html>