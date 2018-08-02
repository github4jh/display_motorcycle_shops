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
function changeImage(img)
{  
   document.getElementById("bigPic").src=img;
}
</script>

<script type="text/javascript"> 
  function deleteAd() 
  { 
    var answer = confirm ("確定刪除廣告?"); 
    if (answer){ 
              document.myForm.answer.value = "true";   
              document.myForm.submit(); 
              return true; 
    }else 
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


   String fromMemberPage = request.getParameter("fromMemberPage");
     
   if(fromMemberPage == null || "".equals(fromMemberPage)) 
   { 
      response.sendRedirect("login.jsp");
      return;
   }   
   
   String ad_number = request.getParameter("ad_number");
   String session_id = (String) session.getAttribute("sid");
   String email = (String) session.getAttribute("email");
   String member_page_link = "";
   String id_card_number = "";
   
   String answer = request.getParameter("answer"); 
   if(answer == null || "".equals(answer))
      answer = "false"; 

   if("true".equals(answer))
   {
      
   String sqlQuery = "";
   String sql_query = "";
   Connection dbconnection;
   ResultSet resultSet; 
   ResultSet row_set;
   Statement sql_stmt = null;
   Statement sql_statement = null;
   
      
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   int rowCount = 0, resultCount = 0;   
   Runtime runtime = Runtime.getRuntime();
   Process proc;
   String strCmd = "";
   
   
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {         
	 dbconnection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         sql_stmt = dbconnection.createStatement();
         sql_statement = dbconnection.createStatement();  

		 sql_query = "SELECT id_card_number FROM members WHERE email = '" + email + "'";
		 row_set = dbconnection.createStatement().executeQuery(sql_query);

		 while (row_set.next())
         {
            id_card_number = row_set.getString("id_card_number");              
         }
		 
		 
         sqlQuery = "DELETE FROM ad WHERE id_card_number = '" + id_card_number + "' AND ad_number = '" + ad_number + "'";       
         rowCount = sql_statement.executeUpdate(sqlQuery);         
         sql_statement.close();          

         sqlQuery = "DELETE FROM images WHERE id_card_number = '" + id_card_number + "' AND ad_number = '" + ad_number + "'";
         resultCount = sql_stmt.executeUpdate(sqlQuery);                  
         sql_stmt.close();
         dbconnection.close(); 

 String targetFileNames = ad_number + "_0";
 finalDirectory += "/" + id_card_number;
 File member_dir = new File(finalDirectory);
 if(member_dir.exists())
 {    
    File[] listFiles = member_dir.listFiles();
    for( File targetFile : listFiles )
    {
       if( targetFile.getName().startsWith(targetFileNames ) )
       {
          targetFile.delete();  
       }
    }
 }

		 //proc = runtime.exec(strCmd,null,filePath);
		 //out.println(strCmd + "<br>");
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
 
//////////////////////////////////////////////////

	  response.sendRedirect("MemberPage.jsp");
      return; 

   }  
    

   String query;
   Connection dbconn;
   ResultSet rs; 
   ResultSet rowSet;  
   Statement statement = null;
   Statement stmt = null;
         
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   String sqlCmd;
   int rowCount = 0, numOfImages = 0, iAdNumber = 0, index = 0, tmp_idx = 0;
   String imageFileName = "";

   String model = "", make = "", city = "", air="", air_displacement = "", district = "";
   int year = 0, price = 0,  kilometer = 0;
   
   String link = ""; 
   String image_path[] = {"images/img_big.jpg", 
                          "images/img_small.jpg", 
                          "images/img_small.jpg"};
						  
   String ad_image[] = {"", "", ""};
   String modify_link = "";
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
        <td height="55" colspan="3" valign="top"> 　　<img src="images/sell/banner_deletead.gif" width="851" height="25"></td>
      </tr>
      <tr>
        <td width="174" height="32" align="right" bgcolor="#FFFFFF"><img src="images/sell/banner2_deletea.jpg" width="158" height="31"></td>
        <td width="699" bgcolor="#ebe7ca" class="a3">　</td>
        <td width="17" bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
      <tr>
        <td height="30" colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="50" height="0" valign="bottom">&nbsp;</td>

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
		 
		 query = "SELECT id_card_number FROM members WHERE email = '" + email + "'";
		 rowSet = stmt.executeQuery(query);

		 while (rowSet.next())
         {
            id_card_number = rowSet.getString("id_card_number");              
         }
		 
		 modify_link = "modify_ad_info.jsp?showAdInfo=1&fromDisplayMemberAd=1&ad_number=" + ad_number;	
		 
         query = "SELECT * FROM images WHERE id_card_number = '" + id_card_number + "' AND fileName like '" + ad_number + "_%'";
         rowSet = stmt.executeQuery(query);
   
         index = 0;
         while (rowSet.next())
         {
            numOfImages++;
		    imageFileName = rowSet.getString("fileName");
            image_path[index++] = "upload/" + id_card_number + "/" + imageFileName; 
         }

         stmt.close(); 

//query ad table for ad details
         query = "SELECT * FROM ad WHERE id_card_number = '" + id_card_number + "' AND ad_number = '" + ad_number + "'";
         
         rs = statement.executeQuery(query);

         while (rs.next())
         {
            year = rs.getInt("year");
            model = rs.getString("model");
            make = rs.getString("make");
            price = rs.getInt("price");
            city = rs.getString("city");
            air = rs.getString("air_displacement");
            kilometer = rs.getInt("driven_kilometer");
	    district = rs.getString("district");
         }

         if(air.equals("1"))
         {
            air_displacement = "1 ~ 50 c.c.";
         }
         else if(air.equals("2"))
         {
            air_displacement = "51 ~ 100 c.c.";
         }
         else if(air.equals("3"))
         {
            air_displacement = "101 ~ 150 c.c.";
         }
         else if(air.equals("4"))
         {
            air_displacement = "151 ~ 250 c.c."; 
         }
         else if(air.equals("5"))
         {
            air_displacement = "251 ~ 500 c.c.";
         }
	 else if(air.equals("6"))
         {
            air_displacement = "501 ~ 750 c.c.";
         }
         else if(air.equals("7"))
         {
            air_displacement = "751 ~ 1000 c.c.";
         }
         else if(air.equals("8"))
         {
            air_displacement = "1001 ~ 1250 c.c."; 
         }
         else if(air.equals("9"))
         {
            air_displacement = "1251 ~ 1500 c.c.";
         }
	 else if(air.equals("10"))
         {
            air_displacement = "1501 c.c. 以上";
         }

         statement.close();
         dbconn.close();
      }
      catch (SQLException sqlException)
      {
         out.println("Database query error.<br>");
      }
   }  
   catch (ClassNotFoundException err)
   {
      out.println("Class loading error.<br>");
   } //end catch
   
   if(numOfImages == 1)
   {
      for (index = 0; index < 3; index++)
      {
	    if(image_path[index].startsWith("upload/"))
		{
		   ad_image[0] = image_path[index]; 	
		}
	  }
   }
   else if(numOfImages == 2)
   {
      for (index = 0; index < 3; index++)
      {
	    if(image_path[index].startsWith("upload/"))
		{
		   ad_image[tmp_idx++] = image_path[index]; 	
		}	  
	  }
   }
   else if(numOfImages == 3)
   {
      ad_image[0] = image_path[0];
	  ad_image[1] = image_path[1];
	  ad_image[2] = image_path[2];
   }
               
%>
            <td width="382" valign="bottom">
<%
   if(numOfImages > 0)
   {
%>
	        <img id="bigPic" src=<%= ad_image[0]%> width="368" height="367" class="imgborder_big">
<%
   }
   else
   {
%>		
            <img id="bigPic" src=<%= image_path[0]%> width="368" height="367" class="imgborder_big">
<%
   }
%>			
	    <br><br><span class="a3">*圖片未依照比例顯示, 實際大小以實物為準</span>
            </td>
            
<%
     if(numOfImages == 2)      
     {
%>    
               <td width="139" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                <tr>
                  <td width="150" height="125" align="right" valign="top">
                   <a href="javascript:changeImage('<%=ad_image[0]%>');">                    
                   <img src=<%= ad_image[0]%> width="115" height="113" class="imgborder_small">
                   </a>
                  </td>
                </tr>
                <tr>
                  <td width="150" height="125" align="right" valign="bottom">       
                   <a href="javascript:changeImage('<%=ad_image[1]%>');">
                   <img src=<%= ad_image[1]%> width="115" height="113" class="imgborder_small">
                   </a>
                  </td>
                </tr>
               </table></td>
<%
     }  	
     else if(numOfImages == 3)      
     {
%>
               <td width="139" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0"> 
                <tr>
                  <td width="150" height="125" align="right" valign="top">                   
                   <a href="javascript:changeImage('<%=ad_image[0]%>');">
                   <img src=<%= ad_image[0]%> width="115" height="113" class="imgborder_small">
                   </a>
                  </td>
                </tr>
                <tr>
                  <td width="150" height="125" align="right">                   
                   <a href="javascript:changeImage('<%=ad_image[1]%>');">
                   <img src=<%= ad_image[1]%> width="115" height="113" class="imgborder_small">
                   </a>
                  </td>
                </tr>
                <tr>
                  <td width="150" height="125" align="right" valign="bottom">                   
                   <a href="javascript:changeImage('<%=ad_image[2]%>');">  
                   <img src=<%= ad_image[2]%> width="115" height="113" class="imgborder_small"> 
                   </a>
                  </td>
                </tr>
               </table></td>
<%
     }
%>
            <form name="myForm" onSubmit="deleteAd();">
            <td width="319" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="8%">&nbsp;</td>
                <td width="22%" height="30"><img src="images/word_3.gif" width="71" height="23"></td>
                <td width="70%" class="a11"><%= make%></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="30"><img src="images/word_7.gif" width="71" height="23"></td>
                <td class="a11"><%= model%></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="30"><img src="images/word_4.gif" width="71" height="23"></td>
                <td class="a11"><%= year%></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="30"><img src="images/word_5.gif" width="71" height="23"></td>
                <td class="a11"><%= price%></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="30"><img src="images/word_1.gif" width="71" height="23"></td>
                <td class="a11"><%= city%><%= district%></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><img src="images/word_2.gif" width="71" height="23"></td>
                <td class="a11"><%= air_displacement%></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="30"><img src="images/word_6.gif" width="71" height="23"></td>
                <td class="a11"><%= kilometer%></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td height="150" colspan="2">&nbsp;</td>
                </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="2">
<% 
   if(numOfImages < 3)
   { 
                link = "upload_page.jsp?fromDisplayMemberAd=1&ad_number=" + ad_number + "&numOfImages=" + numOfImages + "&year=" + year + "&make=" + make + "&model=" + model;
%>
                  
                  <a href="<%= link %>"><img src="images/sell/button_uploadpage.jpg" width="80" height="21" border="0"></a>
                   
<% 
   }
%>
                  <a href=<%= modify_link%>><img src="images/sell/button_modify.jpg" width="80" height="21" border="0"></a>                   
                  <input type="image" src="images/sell/button_delete.jpg" alt="Submit" width="80" height="21"/> 
                  <input type="hidden" name="answer"/> 
                  <input type="hidden" name="ad_number" value="<%= ad_number %>"/> 
                  <input type="hidden" name="fromMemberPage"  value="1"/>                  
                </td>
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