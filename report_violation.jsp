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

<script language="javascript">
function checkSeletction()
{	 
	document.myForm.submit();
}
</script>
</head>

<body>

<%
   request.setCharacterEncoding("UTF8");

   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";   

   if(session_id == null || "".equals(session_id)) 
   {
     response.sendRedirect("need_to_login.jsp");
     return;
   }

   String str_message_id = "";
   int i_message_id;

   str_message_id = request.getParameter("message_id");

   if( (str_message_id == null) || ("".equals(str_message_id)) )
   {
     response.sendRedirect("message_board.jsp");
     return;
   }
   else
   {
   	i_message_id = Integer.valueOf(str_message_id);
   }   
%>



<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <%@include file="logo.jsp"%>
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
        <form name="myForm" method="post" action="process_viloation.jsp">  
          <tr>
            <td width="70" height="0" valign="bottom">&nbsp;
			<input type="hidden" name="message_id" value="<%= i_message_id %>"/>
			</td>
            <td align="center" valign="bottom">
              <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="25"><input type="radio" name="reason" value="1">文字或圖片涉及暴力</td>  
                </tr>
                <tr>
                  <td height="25"><input type="radio" name="reason" value="2">文字或圖片涉及色情</td>  
                </tr>
                <tr>                  
                  <td height="25"><input type="radio" name="reason" value="3">文字或圖片涉及毀謗或人身攻擊</td>
                </tr>
				<tr>                  
                  <td height="10"></td>
                </tr>
				<tr>                  
                  <td height="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="送出" onclick="checkSeletction()"></td>
                </tr>
              </table>
            </td>
          </tr>
		</form>  
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