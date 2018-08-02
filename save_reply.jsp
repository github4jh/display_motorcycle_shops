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
   
   String reply = request.getParameter("reply");
   String str_message_id = request.getParameter("message_id");
   int i_message_id;   
   int page_number = 1;
   String board_page = "";
   String member_email = (String) session.getAttribute("email");
   String member_name;
   
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
   
   
   if( (str_message_id == null) || ("".equals(str_message_id)) )
   {
     response.sendRedirect("message_board.jsp");
     return;
   }
   else
   {
   	i_message_id = Integer.valueOf(str_message_id);
   }
   
   Boolean reply_saved = true;   
   int reply_not_filled = 0;

   String sqlCmd, query;   
   Connection dbconn;
   ResultSet rs;   
   Statement statement = null;
         
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 

   if(reply.length()==0)
   {
      reply_saved = false;	  
      reply_not_filled = 1;
   }
   else
   {
      int count=0, post_hour, post_minute, post_second;      	
      int post_day = 0;
      int post_month = 0; 
      int post_year = 0;
	  int num_of_replies = 0;
      String post_date, post_time;	

      Calendar today = Calendar.getInstance();
     
      post_day = today.get(Calendar.DAY_OF_MONTH);
      post_month = today.get(Calendar.MONTH) + 1;
      post_year = today.get(Calendar.YEAR);
      
      post_date = post_year + "-" + post_month + "-" + post_day; 
 
      post_hour = today.get(Calendar.HOUR_OF_DAY);
      post_minute = today.get(Calendar.MINUTE);
      post_second = today.get(Calendar.SECOND);

      post_time = post_hour + ":" + post_minute + ":" + post_second;
      
      try
      {
        Class.forName(JDBC_DRIVER);
        try
        {         
	   dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
           statement = dbconn.createStatement();       
	   
       query = ("select name from members where email='" + member_email + "'");
					
	   rs = statement.executeQuery(query);
	   rs.last();
	   member_name = rs.getString("name");		
		
	   sqlCmd = ("insert into reply_board (name, email, date, time, content, message_id)" + "values ('" + member_name + "', '" + member_email + "', '" + post_date + "', '" + post_time + "', '" + reply + "', '" + i_message_id + "')");
 
           statement.executeUpdate(sqlCmd);
 
	   query = "SELECT num_of_replies FROM message_board where message_id=" + i_message_id;
	   
	   rs = statement.executeQuery(query);
	   
	   while (rs.next())
       {
   	    num_of_replies = rs.getInt("num_of_replies");
       }
		 
	   sqlCmd = ("UPDATE LOW_PRIORITY message_board SET num_of_replies = '" + (num_of_replies+1) + "' WHERE message_id='" + i_message_id + "'");	
 
	   statement.executeUpdate(sqlCmd);
	   
           statement.close();
           dbconn.close();
         }
         catch (SQLException sqlException)
         {
            reply_saved = false;
%>	       
         can not insert data into table message.
<%
         }
      }  
      catch (ClassNotFoundException err)
      {
	    reply_saved = false; 
%> 	    
     Class loading error
<%
      } //end catch    
   }  //end else
%>



<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <%@include file="logo.jsp"%>
  </tr>

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
    <td height="650" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
<%
	if(reply_saved)
    { 
		  response.sendRedirect("display_message.jsp?page=" + page_number + "&message_id=" + i_message_id);
	}
	else
      {
%>		
	  <jsp:forward page="reply_message.jsp">
	  <jsp:param name="reply_not_filled" value="<%= reply_not_filled  %>" />
	  <jsp:param name="message_id" value="<%= i_message_id %>" />
	  </jsp:forward>
<%
	}
%>
      </tr>
      <tr>
	<td>&nbsp;</td>	
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