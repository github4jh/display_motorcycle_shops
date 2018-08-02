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
</head>

<body>

<%
request.setCharacterEncoding("UTF8");

String fromMemberPage = request.getParameter("fromMemberPage");
String fromMemberImageUpload = request.getParameter("fromMemberImageUpload");     

if( (fromMemberPage == null || "".equals(fromMemberPage)) && (fromMemberImageUpload == null || "".equals(fromMemberImageUpload)) ) 
{ 
   response.sendRedirect("login.jsp");
   return;
}
   
String id_card_number = "";
String str_num_of_member_images_uploaded = request.getParameter("num_of_member_images_uploaded");
String numOfImagesNotUploaded = request.getParameter("numOfImagesNotUploaded");
String member_name = "";
//String wrongFileType = request.getParameter("wrongFileType");
//String fileType = request.getParameter("fileType");
//int i_num_of_images = 0;
int i_num_of_images_not_uploaded = 0;
int max_num_of_images = 3;
int loop_index = 0;
int total_uploaded_images = 0;
String image_path = "";
String image_1_fileName = "";
String image_2_fileName = "";
String image_3_fileName = "";
String directory_path = application.getRealPath("upload");

int num_of_member_images_uploaded = 0;

if( !("na".equals(str_num_of_member_images_uploaded)) && (str_num_of_member_images_uploaded != null) )
	num_of_member_images_uploaded = Integer.parseInt(str_num_of_member_images_uploaded);

if( !("".equals(numOfImagesNotUploaded)) && (numOfImagesNotUploaded != null) )
{
	i_num_of_images_not_uploaded = Integer.parseInt(numOfImagesNotUploaded);
}

   String query;   
   Connection dbconn;
   ResultSet rs;   
   Statement statement = null;
         
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 

   String session_id = (String) session.getAttribute("sid");
   String email = (String) session.getAttribute("email");
   String member_page_link = "";

/////////////
   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
            
         query = "select name, id_card_number from members where email= '" + email + "'";         
         
         rs = statement.executeQuery(query);

         // iterate through the result set
         while (rs.next())
         {
            member_name = rs.getString("name");
			id_card_number = rs.getString("id_card_number");
         }

         statement.close();
         dbconn.close();
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
        <td height="55" colspan="3" valign="top"> 　　<img src="images/sell/banner_post_ad.gif" width="808" height="20"></td>
      </tr>
      <tr>
        <td width="174" height="32" align="right" bgcolor="#FFFFFF"><img src="images/sell/banner2_upload_page.jpg" width="155" height="31"></td>
        <td width="526" bgcolor="#ebe7ca" class="a3">　歡迎光臨, <%= member_name%>!</td>
        <td width="190" bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" height="130" valign="bottom">&nbsp;</td>
            <td height="0" valign="bottom">
            <form action="member_image_upload.jsp?numOfImages=<%= num_of_member_images_uploaded %>&fromMemberImageUploadPage=1" method="post" enctype="multipart/form-data">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="18" valign="top"><img src="images/sell/littlepot.gif" width="10" height="20"></td>
                <td width="580" height="30" valign="top" class="a2">請上傳機車行相關照片。例如營業執照，車行照片。</td>
                <td height="20" valign="top">&nbsp;</td>
              </tr>
              <tr>                
                <td><img src="images/sell/littlepot.gif" alt="" width="10" height="20"></td>
                <td colspan="2"><img src="images/sell/word_upload_page.gif" width="68" height="16">&nbsp;&nbsp;&nbsp;</td>
			  </tr>
<%
            for(loop_index = 0; loop_index < (max_num_of_images - num_of_member_images_uploaded); loop_index++)
			{
%>			  
			  <tr>
			    <td width="18">&nbsp;</td>
				<td colspan="2">照片&nbsp;&nbsp;<input type="file" name="fileField" id="fileField">
				&nbsp;&nbsp;圖檔必須小於 4 MB
				</td>
			  </tr>
			  <tr>
			    <td colspan="3">&nbsp;</td>
			  </tr>
<%
            }
			
			if( (i_num_of_images_not_uploaded > 0) )
			{
%>		  
			  <tr>
			    <td colspan="3">
				　<font color=red><%= numOfImagesNotUploaded %> 個檔案上傳失敗. 請確認檔案是否為圖檔，且小於 4MB。</font>
                </td>
              </tr>
			  <tr>
			    <td colspan="3">&nbsp;</td>
              </tr>
			  <tr>
			    <td colspan="3">
				　上傳成功圖檔：
                </td>
              </tr>			  
			  <tr>
			  　<td colspan="3">
<%		
			
   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
      
      
         query = "select * from members where email= '" + email + "'";         
                  
         rs = statement.executeQuery(query);

         // iterate through the result set
         while (rs.next())
         {
		    image_1_fileName = rs.getString("image_1_fileName");
			image_2_fileName = rs.getString("image_2_fileName");
			image_3_fileName = rs.getString("image_3_fileName");
			
			if(!("na".equals(image_1_fileName)))
		    {	
				image_path = directory_path + "/" + id_card_number + "/" + image_1_fileName;
				total_uploaded_images++;
%>			
			<img src=<%= image_path%> width="115" height="113" class="imgborder_small">&nbsp;&nbsp;
<%			
			}
			if(!("na".equals(image_2_fileName)))
		    {	
				image_path = directory_path + "/" + id_card_number + "/" + image_2_fileName;
				total_uploaded_images++;
%>			
			<img src=<%= image_path%> width="115" height="113" class="imgborder_small">&nbsp;&nbsp;
<%			
			}
			if(!("na".equals(image_3_fileName)))
		    {	
				image_path = directory_path + "/" + id_card_number + "/" + image_3_fileName;
				total_uploaded_images++;
%>			
			<img src=<%= image_path%> width="115" height="113" class="imgborder_small">&nbsp;&nbsp;
<%			
			}
         }

         statement.close();
         dbconn.close();
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
%>   
		</td>
      </tr>
	  <tr>
		<td colspan="3">
		   共　<%= total_uploaded_images %>　個
        </td>
      </tr>
	  
<%			  
   } //end if( (i_num_of_images_not_uploaded > 0) )
%>			

              <tr>
                <td colspan="2" align="center">
                 <!--<img src="images/sell/button_send.jpg" width="80" height="21">-->
                 <input type="image" src="images/sell/button_send.jpg" alt="Submit" width="80" height="21" />
                </td>
				<td>&nbsp;</td>                
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