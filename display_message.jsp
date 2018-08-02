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
function mylike()
{
  document.myForm.like.value = "true";
  document.myForm.submit();
}

function reply_page()
{ 
  location.href="reply_message.jsp?message_id=" + document.myForm.message_id.value + "&page=" + document.myForm.page.value;
  return true;
}

function report_page()
{ 
  location.href="report_violation.jsp?message_id=" + document.myForm.message_id.value;
  return true;
}

function message_page()
{ 
  location.href="message.jsp"
  return true;
}
</script>

</head>

<body>

<%
   request.setCharacterEncoding("UTF8");

   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";

   String query, mysqlQuery = "", mysqlCmd = "";   
   Connection dbconn;
   ResultSet rs;   
   Statement statement = null;
         
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   
   int page_number = 1;
   

   int num_of_views = 0, num_of_replies = 0, num_of_likes = 0; 	

   String name = "", subject = "", date = "", time = "", message = "", reply_content = "";
   String str_message_id = "", str_num_of_likes = "";
   String board_page = "", fromMessageBoard = "", fromSaveMessage = "";
   int i_message_id, reply_count = 0;
   String image_path = "";
   String file_name = "";
   //String imageDirectory = application.getRealPath("message_images");   
   String mylike = request.getParameter("like");
   
   if(mylike == null || "".equals(mylike))
      mylike = "false";

   board_page = request.getParameter("page");   

   if( (board_page == null) || ("".equals(board_page)) )
   {
	page_number = 1;
   }
   else
   {
   	page_number = Integer.valueOf(board_page);
   }

   str_num_of_likes = request.getParameter("num_of_likes");

   if( (str_num_of_likes == null) || ("".equals(str_num_of_likes)) )
   {
	num_of_likes = 0;
   }
   else
   {
   	num_of_likes = Integer.valueOf(str_num_of_likes);
   }

   str_message_id = request.getParameter("message_id");

   if( (str_message_id == null) || ("".equals(str_message_id)) )
   {
	i_message_id = 1;
   }
   else
   {
   	i_message_id = Integer.valueOf(str_message_id);
   }
   
   fromMessageBoard = request.getParameter("fromMessageBoard");
   fromSaveMessage = request.getParameter("fromSaveMessage"); 
/////////////

   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
	 
         if("true".equals(mylike))
         {
            mysqlCmd = ("UPDATE LOW_PRIORITY message_board SET num_of_likes = '" + (num_of_likes+1) + "' WHERE message_id='" + i_message_id + "'");

	    statement.executeUpdate(mysqlCmd);
	 }   
		 
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
		file_name = rs.getString("image"); 	
         }
	 
		if ("1".equals(fromMessageBoard))
		 {
	        mysqlCmd = ("UPDATE LOW_PRIORITY message_board SET num_of_views = '" + (num_of_views+1) + "' WHERE message_id='" + i_message_id + "'");		
			statement.executeUpdate(mysqlCmd);	
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
   
   if("na".equals(file_name))
      image_path = "na";
   else	  
      image_path = "message_images/" + file_name;
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
    <td valign="top">
	<form name="myForm">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
	 
      <tr>
	<td>留言編號:</td>
	<td><%= i_message_id %></a></td>
        <td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>	
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
	<td><%= date %> &nbsp; <%= time %></td>
	<td>回覆次數:</td>
	<td><%= num_of_replies %></td>
      </tr>      
      <tr>
	<td colspan=4>內容:</td>	
      </tr>
      <tr>
	<td colspan=4><%= message %></td>
      </tr>
<%  
    if( !("na".equals(image_path)) )
    {	
%>	  
	  <tr>
	<td colspan=4>圖片:</td>	
      </tr>
      <tr>
	<td colspan=4><img src=<%= image_path%> width="115" height="113" class="imgborder_small"></td>
      </tr>
<%    
    }	
%>  
      <tr>
	<input type="hidden" name="like"/>
	<input type="hidden" name="page" value="<%= page_number %>"/>
	<input type="hidden" name="message_id" value="<%= i_message_id %>"/>
    <input type="hidden" name="num_of_likes" value="<%= num_of_likes %>"/>
<%
	if(!("1".equals(fromSaveMessage)))
	{
%>	
	<td colspan=4>
	<input type="button" value="推" onClick="mylike()">x<%= num_of_likes %>&nbsp;&nbsp;&nbsp;	
	<input type="button" value="回覆" onClick="reply_page()">&nbsp;&nbsp;&nbsp;
	<input type="button" value="舉報" onClick="report_page()">
    </td>
<%
	}
%>	
      </tr>
      <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
<%
   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
	 
         query = "SELECT * FROM reply_board where message_id=" + i_message_id;

         rs = statement.executeQuery(query);

         // iterate through the result set
         while (rs.next())
         {  	
	    name = rs.getString("name");   	    
            date = rs.getString("date");
     	    time = rs.getString("time");
	    reply_content = rs.getString("content");
		reply_count++;
%>
	  <tr>
	<td colspan=4>回覆 <%= reply_count %>:</td>	
      </tr>
      <tr>
	<td colspan=4><%= reply_content %></td>
      </tr>	  
	  
	  <tr>
	<td>回覆者:</td>
	<td><%= name %></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
	  
	  <tr>
	<td>回覆時間:</td>
	<td><%= date %> &nbsp; <%= time %></td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
	  <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
<%	
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
    <!--<tr>-->
	 <!--<input type="submit" value="留言">-->
	 <!--<td><input type="button" value="留言" onClick="message_page()"></td>-->
    <!--</tr>-->
    </table></form></td>
  </tr>  
  <tr>
    <td height="60">
		<jsp:include page = "footer.jsp" />
	</td>
  </tr>
</table>
</body>
</html>
