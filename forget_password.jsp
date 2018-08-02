<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

   <%@ page language="java" pageEncoding="utf-8"
   
	import = "java.io.*"
	import = "java.lang.*"
	import = "java.sql.*"
  import = "java.sql.Connection"
	import = "java.sql.Statement"
	import = "java.sql.DriverManager"
	import = "java.sql.ResultSet"
	import = "java.sql.ResultSetMetaData"
	import = "java.sql.SQLException"
	
	import="java.util.*"
	import="javax.mail.*"
	import="javax.mail.internet.*"
	import="javax.activation.*"

	import = "javax.servlet.http.*"
   %>

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

<script type="text/javascript">
function email_to_use(choice)
{
   if(choice == 'other') 
   {
      document.getElementById('show_other_email_field').style.display = '';
      document.getElementById('show_other_email_description').style.display = '';
      document.send_to_email_address[1].checked=true;
   }

   if(choice == 'same') 
   {
      document.getElementById('show_other_email_field').style.display = 'none';
	  document.getElementById('show_other_email_description').style.display = 'none';
      document.send_to_email_address[0].checked=true;
   }
}
</script>
</head>
<body>

<%
   
   String form_email_field = request.getParameter("email_field");
   String other_form_email_field = request.getParameter("other_email_field");
   String send_to_email_address_radio_value = request.getParameter("send_to_email_address");
   String reset_link = "forget_password.jsp";   
   Boolean correct_email = false;
   Boolean valid_input = false;
   int form_email_field_not_filled = 0;
   int send_to_email_address_radio_not_filled = 0;
   int other_form_email_field_not_filled = 0;
   int form_email_field_incorrect = 0;
   int other_form_email_field_incorrect = 0;
   
   Character at = new Character('@'); 
   Character dot = new Character('.');  
   String str_dot = ".";
   
   int pos_at = 0;
   int pos_dot = 0;    
   int email_length = 0;
   
   int pos_at_other_email = 0;
   int pos_dot_other_email = 0;    
   int email_length_other_email = 0;
   
   int error_num = 0;
   
   if( !("".equals(form_email_field)) && (form_email_field != null) )
   {
      pos_at= form_email_field.indexOf(at);
      pos_dot= form_email_field.indexOf(dot);    
      email_length = form_email_field.length();
   }
   
   if( !("".equals(other_form_email_field)) && (other_form_email_field != null) )
   {
      pos_at_other_email= other_form_email_field.indexOf(at);
      pos_dot_other_email= other_form_email_field.indexOf(dot);    
      email_length_other_email = other_form_email_field.length();
   }
   
   Connection dbconn;
   ResultSet results;
   Statement statement = null;
   String sqlCmd;   
   String query;      
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   
   String email_address = "";
   String password = "";
   
   if ("".equals(form_email_field) || form_email_field == null)
   {
      form_email_field_not_filled = 1;
	  valid_input = false;
	  error_num = 1;
   }
   else
   {
       do
	   {
	      if (form_email_field.indexOf(at)==-1 || form_email_field.indexOf(at)==0 || form_email_field.indexOf(at)==email_length)
	      {  
	         valid_input = false;
			 form_email_field_incorrect = 1;
			 error_num = 2;
			 break;
	      }
	      else if(form_email_field.indexOf(dot)==-1 || form_email_field.indexOf(dot)==0 || form_email_field.indexOf(dot)==email_length) 
	      {	         
	         valid_input = false;
			 error_num = 3;
			 form_email_field_incorrect = 1;
			 break;
	      }
	      else if (form_email_field.indexOf(at,(pos_at+1))!=-1)                    
	      {
	         valid_input = false;
			 error_num = 4;
			 form_email_field_incorrect = 1;
			 break;
	      } 
	      else if (form_email_field.substring(pos_at-1,pos_at)==str_dot || form_email_field.substring(pos_at+1,pos_at+2)==str_dot)                    
	      {
	         valid_input = false;
			 error_num = 5;
			 form_email_field_incorrect = 1;
			 break;
	      }
	      else if (form_email_field.indexOf(dot,(pos_at+2))==-1)
	      {
	         valid_input = false;
			 error_num = 6;
			 form_email_field_incorrect = 1;
			 break;
	      }           
	      else if (form_email_field.indexOf(" ")!=-1)
	      {
	         valid_input = false;
			 error_num = 7;
			 form_email_field_incorrect = 1;
			 break;
	      }                             
	      else if(!(form_email_field.matches("^[_a-z0-9]+@[_a-z0-9]+(.[a-z0-9]{2,3})(.[a-z0-9]{2})?$")))  // ^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$ 
	      {
	         valid_input = false;
			 error_num = 8;
			 form_email_field_incorrect = 1;
			 break;
	      }
	   
		   if ("".equals(send_to_email_address_radio_value) || send_to_email_address_radio_value == null)
		   {
		      valid_input = false;
			  error_num = 9;
		      send_to_email_address_radio_not_filled = 1;            
		   }
		   else
           {
			  if("same".equals(send_to_email_address_radio_value))
			  {
				 valid_input = true;
			  }
			  else if("other".equals(send_to_email_address_radio_value))
			  {
			     if ("".equals(other_form_email_field) || other_form_email_field == null)
			     {
			        other_form_email_field_not_filled = 1;
					valid_input = false;
					error_num = 10;
			     }
				 else
				 {
			        do
					{
					  if (other_form_email_field.indexOf(at)==-1 || other_form_email_field.indexOf(at)==0 || other_form_email_field.indexOf(at)==email_length_other_email)
				      {  
				         valid_input = false;
						 error_num = 11;
						 other_form_email_field_incorrect = 1;
						 break;
				      }
				      else if(other_form_email_field.indexOf(dot)==-1 || other_form_email_field.indexOf(dot)==0 || other_form_email_field.indexOf(dot)==email_length_other_email) 
				      {	         
				         valid_input = false;
						 error_num = 12;
						 other_form_email_field_incorrect = 1;
						 break;
				      }
				      else if (other_form_email_field.indexOf(at,(pos_at_other_email+1))!=-1)                    
				      {
				         valid_input = false;
						 error_num = 13;
						 other_form_email_field_incorrect = 1;
						 break;
				      } 
				      else if (other_form_email_field.substring(pos_at_other_email-1,pos_at_other_email)==str_dot || other_form_email_field.substring(pos_at_other_email+1,pos_at_other_email+2)==str_dot)                    
				      {
				         valid_input = false;
						 error_num = 14;
						 other_form_email_field_incorrect = 1;
						 break;
				      }
				      else if (other_form_email_field.indexOf(dot,(pos_at_other_email+2))==-1)
				      {
				         valid_input = false;
						 error_num = 15;
						 other_form_email_field_incorrect = 1;
						 break;
				      }           
				      else if (other_form_email_field.indexOf(" ")!=-1)
				      {
				         valid_input = false;
						 error_num = 16;
						 other_form_email_field_incorrect = 1;
						 break;
				      }                             
				      else if(!(other_form_email_field.matches("^[_a-z0-9]+@[_a-z0-9]+(.[a-z0-9]{2,3})(.[a-z0-9]{2})?$")))  // ^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$ 
				      {
				         valid_input = false;
						 error_num = 17;
						 other_form_email_field_incorrect = 1;
						 break;
				      }
					  valid_input = true;
					}while(false);
			     }		
			  }
		   }
		   
		   	   
	   }while(false);
   }
   
   if(valid_input)
   {


   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
         
         query = "SELECT email, password FROM members";
         
         results = statement.executeQuery(query);
		 
         // iterate through the result set
         while (results.next())
         {            
            email_address = results.getString("email");
            			
            if ( form_email_field.equals(email_address) )
            {  
			    password = results.getString("password");
                correct_email = true;                
                break;
            }
            else
            {
               correct_email = false;               
            }
         }
 
         statement.close();
           
         if (correct_email)
         {
			Properties theProperties = System.getProperties();
			theProperties.put("mail.host", "127.0.0.1");
		    theProperties.put("mail.smtp.port","25");	 
			theProperties.put("mail.transport.protocol", "smtp");
			
			Session theSession = Session.getDefaultInstance(theProperties,null);			
			theSession.setDebug(true);
			
			MimeMessage theMessage = new MimeMessage(theSession);
			theMessage.setFrom(new InternetAddress("mgr@ohy.cc"));
			            
			if ( ("".equals(other_form_email_field) || other_form_email_field == null) && 
			    ("same".equals(send_to_email_address_radio_value)) )
			{
			theMessage.setRecipients(Message.RecipientType.TO,form_email_field);			
			}
			else
			{
			theMessage.setRecipients(Message.RecipientType.TO,other_form_email_field);			
			}
			
			theMessage.setSubject("會員密碼通知");
			String email_content = "您好,<br><br>您的密碼是: " + password + "<br><br>www.ohy.cc 團隊敬上";  
			theMessage.setContent(email_content, "text/html;charset=UTF-8" );
			
			try
  		    {
				Transport.send(theMessage);
			}
			catch(SendFailedException e)
			{
				out.println("SendFailedException occured!<br>");				
			}
			catch(MessagingException ex)
			{
				out.println("mail sending failed!<br>");
				out.println(ex.getNextException() + "<br>");
			}
         }
         else  //do nothing for now
         {
         }
         dbconn.close();
      }
      catch (SQLException sqlException)
      {
%>	       
         can not insert data into table members.
<%
      }
   }  
   catch (ClassNotFoundException err)
   {
%>
 	    
     Class loading error
<%
   } //end catch       
      
   } //end if 
%>




<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <%@include file="logo.jsp"%>
  </tr>
<%
   request.setCharacterEncoding("UTF8");
   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";
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
    <td height="250" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="890" height="55" valign="top"> 　　<img src="images/sell/banner_forget.gif" width="839" height="24"></td>
      </tr>
      <tr>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" height="0" valign="bottom">&nbsp;</td>
            <td valign="top"><form name="form2" method="post" action="">
              <table width="610" border="0" cellspacing="0" cellpadding="0">
                <tr>
				  <%
				  if(!correct_email)
				  {
				  %>
				  <td width="260" height="30">請輸入註冊時填寫的 email 信箱</td>
                  <%
                      if(form_email_field != null)
                      {  
                  %>
                  <td width="186"><input type="text" name="email_field" value="<%= form_email_field %>"></td>
				  <%      
                      }
                      else
                      { 
                  %>
                  <td width="186"><input type="text" name="email_field"></td>
                  <%
                      }                    
                  %>
				  <td>&nbsp;</td>
				  <%
				  }
				  %>
                </tr>
                <tr>
				  <%
				  if (!correct_email)
                  {
				  %>
                  <td height="50">				  
				   您希望將密碼寄到哪個email信箱?   
				  </td> 
				  <td height="50" colspan=2>  
				   <input type="radio" name="send_to_email_address" value="same" onClick="javascript:email_to_use('same');return false;">同上
				   <input type="radio" name="send_to_email_address" value="other" onClick="javascript:email_to_use('other');return false;">其它信箱
				  </td>
				  <%
				  }
				  %>
                </tr>
				
				<tr>
				  <td width="260" height="30">
				    <div id="show_other_email_description" style="display: none">
				     其它 email 信箱
				    </div>  
				  </td>				  
                  <td width="186" colspan=2>
				    <div id="show_other_email_field" style="display: none">
				     <input type="text" name="other_email_field">
				    </div>
				  </td>
                </tr>
<%
if (correct_email)
{ 
%>
                <tr>                  
                  <td height="60" colspan="5" align="center" valign="bottom">密碼已寄到您提供的 email 信箱!</td>
                </tr>
<%
} 
else
{
%>
                <tr>
                  <td height="50" colspan="5" align="center" valign="bottom">
                         <input type="image" src="images/sell/button_senddata.jpg" alt="Submit" width="80" height="21">　
                         <a href=<%=reset_link%> onclick="document.forms["form2"].reset();return false;">
                             <img src="images/sell/button_rewrite.jpg" width="80" height="21" border="0"></a>
                  </td>
                </tr>
<%
}
%>
              </table>
            </form></td>
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
