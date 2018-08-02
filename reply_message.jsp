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
	import = "java.sql.*"
  import = "java.sql.Connection"
	import = "java.sql.Statement"
	import = "java.sql.DriverManager"
	import = "java.sql.ResultSet"
	import = "java.sql.ResultSetMetaData"
	import = "java.sql.SQLException"
    
	import = "javax.servlet.http.*"
%>

<script language="javascript">

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
   
   String query, mysqlQuery = "", mysqlCmd = "";   
   Connection dbconn;
   ResultSet rs;   
   Statement statement = null;
         
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 

   int page_number = 1;

   int num_of_views = 0, num_of_replies = 0, num_of_likes=0; 	

   String name = "", subject = "", date = "", time = "", message = "";
   String str_message_id = "";
   String board_page = "";
   int i_message_id;

   board_page = request.getParameter("page");

   if( (board_page == null) || ("".equals(board_page)) )
   {
     response.sendRedirect("message_board.jsp");
     return;
   }
   else
   {
   	page_number = Integer.valueOf(board_page);
   }

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
      	
/////////////

   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();

	 query = "SELECT * FROM message_board where message_id=" + i_message_id;
	          
         rs = statement.executeQuery(query);

         // iterate through the result set
         while (rs.next())
         {  	
	    name = rs.getString("name");            
   	    subject = rs.getString("subject");
            date = rs.getString("date");
     	    time = rs.getString("time");
	    num_of_views = rs.getInt("num_of_views");	
   	    num_of_replies = rs.getInt("num_of_replies");
   	    num_of_likes = rs.getInt("num_of_likes");
	    message = rs.getString("message");
         }
	 	
         statement.close();
         dbconn.close();
      }
      catch (SQLException sqlException)
      {

%>	       
         <!--can not query message_board table data.-->
<%
      }
   }  
   catch (ClassNotFoundException err)
   {
%> 	    
     <!--Class loading error-->
<%
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
    <form name="myForm" method="post" action="save_reply.jsp">
    <td height="650" valign="top">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr>
	<td>主題:</td>
	<td><%= subject %></a></td>
        <td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
      <tr>
	<td>留言者:</td>
	<td><%= name %></td>
	<td>瀏覽次數:</td>
	<td><%= num_of_views %></td>
      </tr>            
      <tr>
	<td>刊登時間:</td>
	<td><%= date %><%= time %></td>
	<td>回覆次數:</td>
	<td><%= num_of_replies %></td>
      </tr>      
      <tr>
	<td colspan=4>內容:</td>	
      </tr>
      <tr>
	<td colspan=4><%= message %></td>
      </tr>
      <tr>
	<td colspan=4>回覆內容:</td>	
      </tr>
      <tr>
	<td colspan=4>
	  <textarea maxlength="100" name="reply" rows="6" cols="50"></textarea>
	</td>
      </tr>
      <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>	  
	  <tr>
	  <input type="hidden" name="message_id" value="<%= i_message_id %>">
      <input type="hidden" name="page" value="<%= page_number %>">	  
	<td colspan=4><input type="submit" value="送出"></td>
      </tr>	  
    </table></td>
    </form>
  </tr>

  <tr>
    <td height="60">
		<jsp:include page = "footer.jsp" />
	</td>
  </tr>
</table>
</body>
</html>