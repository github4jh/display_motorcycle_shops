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

<%@ page language="java" pageEncoding="utf-8"
   
	import = "java.io.*"
	import = "java.lang.*"
	import = "java.io.File"
	import = "java.text.*"
	import = "java.util.Date"
        import = "java.util.Calendar"
	import = "java.sql.*"
  import = "java.sql.Connection"
	import = "java.sql.Statement"
	import = "java.sql.DriverManager"
	import = "java.sql.ResultSet"
	import = "java.sql.ResultSetMetaData"
	import = "java.sql.SQLException"
    
	import = "javax.servlet.http.*"
%>
</head>

<body>

<%
   request.setCharacterEncoding("UTF8");

   String session_id = (String) session.getAttribute("sid");
   String member_email = (String) session.getAttribute("email");
   String member_page_link = "";   
   String reason = request.getParameter("reason");
   int i_reason;
   Boolean processed = false; 
   
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
   
   if( (reason == null) || ("".equals(reason)) )
   {
     response.sendRedirect("message_board.jsp");
     return;
   }
   else
   {
	 i_reason = Integer.valueOf(reason);
   }
   
   if( i_reason < 1 || i_reason > 3 )
   {
     response.sendRedirect("message_board.jsp");
     return;   
   }

   String sqlCmd;   
   Connection dbconn;
   ResultSet rs;   
   Statement statement = null;
         
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8";

      try
      {
        Class.forName(JDBC_DRIVER);
        try
        {         
	   dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
           statement = dbconn.createStatement();       
	    
	   sqlCmd = ("UPDATE LOW_PRIORITY message_board SET violation = '" + i_reason + "' WHERE message_id='" + i_message_id + "'");	
 
	   statement.executeUpdate(sqlCmd);
	   
           statement.close();
           dbconn.close();
		   processed = true;
         }
         catch (SQLException sqlException)
         {
            processed = false;
         }
      }  
      catch (ClassNotFoundException err)
      {
	    processed = false; 
      } //end catch
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
          
          <tr>
            <td width="70" height="0" valign="bottom">&nbsp;
			<input type="hidden" name="message_id" value="<%= i_message_id %>"/>
			</td>
            <td align="center" valign="bottom">
              <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr>
<%
				  if(processed)
				  {
%>				  
                  <td height="25">謝謝您! 我們將會儘快處理此留言.</td>
<%
				  }
				  else
				  {
%>
                  <td height="25">網站發生錯誤.</td>
<%
				  }
%>				  
                </tr>
              </table>
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