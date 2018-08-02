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


<script type="text/javascript"> 
  function cancelMemberShip()
  {     
     var answer = confirm ("確定退出會員資格? 您的所有個人資料，包括刊登之廣告、上傳的圖片將被刪除。\n若要退會，請按確定。否則按取消。"); 
     if (answer)
     { 
        document.myForm.answer.value = "true";   
        document.myForm.submit(); 
        return true; 
     }
     else 
        return false;
  }
</script>

</head>

<body>

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

<%
   request.setCharacterEncoding("UTF8");
   String finalDirectory = application.getRealPath("upload");
   String answer = request.getParameter("answer");
   if(answer == null || "".equals(answer))
      answer = "false";

   
   String id_card_number = "";
   String session_id = (String) session.getAttribute("sid");
   String email = (String) session.getAttribute("email");
   
   if("true".equals(answer))
   {
/////////////////////////////////////////////
   String sqlCmd = "";
   String sqlCmd2 = "";
   String sqlCmd3 = "";
   String sqlCmd4 = "";
   String sqlQuery = "";
   Connection dbconnection;   
   ResultSet rowSet;
   Statement sql_stmt = null;
   Statement sql_statement = null;
   Statement sqlStatement = null;
   Statement statement = null;
      
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   int rowCount = 0;   
   Runtime runtime = Runtime.getRuntime();	
   Process proc;
   String strCmd = "";
   
   
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      { 

	     dbconnection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");

         sql_statement = dbconnection.createStatement(); 
         
	     sqlQuery = "SELECT id_card_number FROM members WHERE email = '" + email + "'";
		 
		 rowSet = sql_statement.executeQuery(sqlQuery);	
		 
		 while (rowSet.next())
         {
            id_card_number = rowSet.getString("id_card_number");			
         }	     

         //----  The sql cmd below is for matching rows only; if the specified rows can not be found ----//
         //----  from any of the four tables listed, no rows will be deleted. ----//
		 
         sqlCmd = "DELETE FROM ad WHERE ad.id_card_number= '" + id_card_number + "'";
	 rowCount = sql_statement.executeUpdate(sqlCmd);

         sqlCmd2 = "DELETE FROM images WHERE images.id_card_number= '" + id_card_number + "'";
	 rowCount = sql_statement.executeUpdate(sqlCmd2);

         sqlCmd3 = "DELETE FROM members WHERE members.email= '" + email + "'";
	 rowCount = sql_statement.executeUpdate(sqlCmd3);

         sqlCmd4 = "DELETE FROM college_nearby_shop WHERE college_nearby_shop.id_card_number= '" + id_card_number + "'";
	 rowCount = sql_statement.executeUpdate(sqlCmd4);
		 
	 sql_statement.close();
         dbconnection.close(); 

	 strCmd = "rm -rf " + finalDirectory + "/" + id_card_number;
	 proc = runtime.exec(strCmd);
      }
      catch (SQLException sqlException)
      {         
%>	       
         Failed to delete record! <br><br>
<%
      }
   }  
   catch (ClassNotFoundException err)
   {
%> 	    
     Class loading error.  <br><br>
<%
   } //end catch

   session.invalidate(); 	
   response.sendRedirect("index.jsp");
   return;

/////////////////////////////////////////////
   } //end if("true".equals(answer))    


   String member_name = "";     
   String license_number = "";
   int paid_membership_fee = 0;
   
   
   String query;
   Connection dbconn, connection;
   ResultSet resultSet;
   ResultSet rs;
   Statement statement = null;
   Statement stmt = null;
   Statement sqlStmt = null;
   
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   
   int rowCount = 0, numOfImages = 0, iAdNumber = 0, index = 0;
   boolean first_loop = true;

   String year = "", model = "", make = "", kilometer = "";
   int price = 0, post_year = 0, post_month = 0, post_day = 0, ad_number = 0;
   String imageFileName = "";
   
   String link = ""; 
   String ad_link = "";
   String modify_link = "modify_member_info.jsp?showMemberInfo=1&fromMemberPage=1"; 
   
   String image_path[] = {"", "", "", "", "", ""};
   int num_of_images[] = {0, 0, 0, 0, 0, 0};
   String image_1_fileName = "";
   String image_2_fileName = "";
   String image_3_fileName = "";   
   int num_of_member_images_uploaded = 0;
   
   if(session_id == null || "".equals(session_id)) 
   {
     response.sendRedirect("need_to_login.jsp");
     return;
   }
 
//////////
/////////////
   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {
         
	 connection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         sqlStmt = connection.createStatement();
      
         query = "select name, license_number, id_card_number, paid_membership_fee, image_1_fileName, image_2_fileName, image_3_fileName from members where email = '" + email + "'";         
         
         resultSet = sqlStmt.executeQuery(query);

         // iterate through the result set
         while (resultSet.next())
         {
            member_name = resultSet.getString("name");
            license_number = resultSet.getString("license_number");
			id_card_number = resultSet.getString("id_card_number");
			paid_membership_fee = resultSet.getInt("paid_membership_fee");
			image_1_fileName = resultSet.getString("image_1_fileName");
			image_2_fileName = resultSet.getString("image_2_fileName");
			image_3_fileName = resultSet.getString("image_3_fileName");
         }		 
		 
		 if(!("na".equals(image_1_fileName)))
			num_of_member_images_uploaded++;
		 
		 if(!("na".equals(image_2_fileName)))
			num_of_member_images_uploaded++;
			
		 if(!("na".equals(image_3_fileName)))
			num_of_member_images_uploaded++;
			
         link = "post_ad.jsp?fromMemberPage=1"; 

         sqlStmt.close();
         connection.close();
      }
      catch (SQLException sqlException)
      {
%>	       
         can not insert data into table ad.
<%
      }
   }  
   catch (ClassNotFoundException err)
   {
%> 	    
     Class loading error	
<%
   } //end catch

//////////


%>

<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <%@include file="logo.jsp"%>
  </tr>
  <tr>
    <td><table width="95%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="right">
       <a href="logout.jsp?userLogout=1"><img src="images/sell/link_logout.gif" width="36" height="18" border="0"></a>
        </td>        
      </tr>
    </table></td>
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
    <td height="21">&nbsp;</td>
  </tr>
  <tr>
    <td height="450" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="55" colspan="3" valign="top"> 　　<img src="images/sell/banner_member.gif" width="808" height="24"></td>
      </tr>
      <tr>
        <td height="32" align="right" bgcolor="#FFFFFF"><img src="images/sell/banner2_member.jpg" width="153" height="31"></td>
        <td width="515" bgcolor="#ebe7ca" class="a3">　歡迎光臨 <%= member_name %>!</td>
        <td width="200" bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="45">&nbsp;</td>
            <form name="myForm" onSubmit="cancelMemberShip();"> 
            <td valign="top"><table width="640" border="0" cellspacing="0" cellpadding="0">


<%   
///////////////////////////////////////////////////////
   try
   {
      Class.forName(JDBC_DRIVER);
      try
	    {
         
	       dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
         stmt = dbconn.createStatement();
   
         for (index = 0; index < 5; index++)
         {
            query = "SELECT * FROM images WHERE fileName like '" + (index+1) + "_%' AND id_card_number = '" + id_card_number + "'";
            resultSet = stmt.executeQuery(query);
            
            numOfImages = 0;
            while (resultSet.next())
            {              
			   if(numOfImages == 0)  
			      imageFileName = resultSet.getString("fileName");
					
			   numOfImages++;
            }
            
            num_of_images[index+1] = numOfImages;
     
            if(numOfImages > 0)
            {
               image_path[index+1] = "upload/" + id_card_number + "/" + imageFileName;
            }        
         } //end for


         query = "SELECT * FROM ad WHERE id_card_number = '" + id_card_number + "'";
         
         rs = statement.executeQuery(query);

         index = 0;
         

         // iterate through the result set
         while (rs.next())
         {
              if (first_loop)
              {
///////////////////////////////////////////////////////
%>
              <tr>
                <td height="40" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="135"><img src="images/sell/member_img1.gif" alt="1" width="124" height="25"></td>
                    <td width="135"><img src="images/sell/member_img2.gif" alt="1" width="124" height="25"></td>
                    <td width="92"><img src="images/sell/member_img3.gif" alt="1" width="80" height="25"></td>
                    <td width="128"><img src="images/sell/member_img4.gif" alt="1" width="116" height="25"></td>
                    <td width="87"><img src="images/sell/member_img5.gif" alt="1" width="77" height="25"></td>
                    <td align="left"><img src="images/sell/member_img6.gif" alt="1" width="62" height="25"></td>
                  </tr>
                </table></td>
              </tr>
<%
                   first_loop = false;                  
               } //end if
               else
               {
%>
              <tr>
                <td class="a1"><img src="images/sell/line.gif" width="615" height="8"></td>
              </tr>
<%
               }

              year = rs.getString("year");
              model = rs.getString("model");
              make = rs.getString("make");

              price = rs.getInt("price");
              post_year = rs.getInt("post_year");
              post_month = rs.getInt("post_month");
              post_day = rs.getInt("post_day");
              kilometer = rs.getString("driven_kilometer");
              ad_number = rs.getInt("ad_number");   

              ad_link = "display_member_ad.jsp?fromMemberPage=1&ad_number=" + ad_number;                 
%> 


              <tr>
                <td height="0"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>

<%
                if(num_of_images[ad_number] > 0)
                {
%> 
                <td height="140" align="left"><!--nbsp;-->
                    <img src=<%= image_path[ad_number]%> width="122" height="113" class="imgborder_small">                     
                </td>
<%
                }
                else
                {
%>   
                <td height="140" align="left">
                   <img src="images/img_small.jpg"  width="122" height="113" class="imgborder_small">
                </td>                
<%
                }
%>                
                    <td width="135" align="center" class="a11"><%= year%> <%= make%> <%= model%>  </td>
                    <td width="92" align="center" class="a11"><%= price%> </td>
                    <td width="128" align="center" class="a11"><%= post_year%>-<%= post_month%>-<%= post_day%></td>
                    <td width="87" align="center" class="a11"><%= kilometer%></td>
                    <td align="center"><a href="<%= ad_link %>" ><img src="images/sell/button_look.jpg" width="53" height="21" border="0"></a></td>
                  </tr>
                </table></td>
              </tr>
              
<%
            iAdNumber++; 

         } //end while (rs.next())

         statement.close();
         stmt.close(); 

         dbconn.close();
      }
      catch (SQLException sqlException)
      {
%>
	       
         can not insert data into table members. <br><br>
<%
      }
   }  
   catch (ClassNotFoundException err)
   {
%>
 	    
     Class loading error.  <br><br>
<%
   } //end catch

   
%>
              <tr>
                <td height="60" align="center" valign="bottom">
<%
             if( !("na".equals(license_number)) )
             {
			    if ( (paid_membership_fee == 1) && (num_of_member_images_uploaded < 3) )
			    {	
%>
                  <a href="member_image_upload_page.jsp?fromMemberPage=1&num_of_member_images_uploaded=<%= num_of_member_images_uploaded %>">上傳圖片</a>
<%				
			    }
				
                if (iAdNumber < 5)
                {
%>
                  <a href="<%= link %>"><img src="images/sell/button_postad.jpg" width="128" height="32" border="0"></a>
<%
                }
             }             
%>

<%
             if( !("na".equals(license_number)) )
             {
%>
                <a href="<%= modify_link%>"><img src="images/sell/button_modifymemberdata.jpg" width="130" height="32" border="0"></a> 
<%
             }             
%>
				   <a href="message.jsp">留言</a>	
                   <input type="image" src="images/sell/button_cancel_membership.jpg" alt="Submit" width="128" height="32"/>    
                   <input type="hidden" name="answer"/> 
                   <input type="hidden" name="id_card_number" value="<%= id_card_number %>"/>                       
                </td>
              </tr>

              <tr>
                <td height="100" align="center" valign="bottom">&nbsp;</td>
              </tr>
            </table></td>
            </form> 
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