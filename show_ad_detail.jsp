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


   String fromSearchResult = request.getParameter("fromSearchResult");
     
   if(fromSearchResult == null || "".equals(fromSearchResult)) 
   { 
      response.sendRedirect("buy.jsp");
      return;
   }   



   String fromIndex = request.getParameter("fromIndex");
   String ad_id = request.getParameter("ad_id");     
   String id_card_number = "";
   int ad_number = 0, current_page = 1, num_of_views = 0;

   String query, sqlcmd;
   Connection dbconn, database;
   ResultSet rs; 
   ResultSet rowSet;
   ResultSet queryRS; 
   Statement statement = null;
   Statement stmt = null;

      
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   String sqlCmd;
   int rowCount = 0, numOfImages = 0, iAdNumber = 0, index = 0, tmp_idx = 0;
   String imageFileName = "";
   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";

   String model = "", make = "", city = "", air="", air_displacement = "", member_district = "", autobike_district = "";
   int year = 0, price = 0,  kilometer = 0;

   String store_name = "", contact_person = "";
   String city_address = "", street_adress = "", full_adress = "";   
   String phone_number = "", cell_phone = "";
   String license_number = "";

   
   String image_path[] = {"images/img_big.jpg", 
                          "images/img_small.jpg", 
                          "images/img_small.jpg"};

   String ad_image[] = {"", "", ""};						  
						  
   String searched_city, searched_make, searched_model, searched_cc, searched_post_date;
   String searched_price, searched_km, searched_year, searched_id, searched_district;
   String go_back_link;

   if(fromIndex == null || "".equals(fromIndex)) 
   {
      current_page = Integer.valueOf(request.getParameter("page"));
   }

   searched_city = request.getParameter("searched_city");
   searched_district = request.getParameter("searched_district");
   searched_make = request.getParameter("searched_make"); 
   searched_model = request.getParameter("searched_model");
   searched_cc = request.getParameter("searched_cc");
   searched_post_date = request.getParameter("searched_post_date");
   searched_price = request.getParameter("searched_price");
   searched_km = request.getParameter("searched_km");
   searched_year = request.getParameter("searched_year");
   searched_id = request.getParameter("memberID");

   String date_posted = request.getParameter("date_posted");
   String str_price = request.getParameter("str_price");
   String km_driven = request.getParameter("km_driven");
   String str_year = request.getParameter("str_year");

   String date_posted_selected = request.getParameter("date_posted_selected");
   String str_price_selected = request.getParameter("str_price_selected");
   String km_driven_selected = request.getParameter("km_driven_selected");
   String str_year_selected = request.getParameter("str_year_selected");   
   
   
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {         
         dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
         
         statement = dbconn.createStatement();
         stmt = dbconn.createStatement();

         
         query = "SELECT * FROM ad WHERE id = '" + ad_id + "'";
         rs = statement.executeQuery(query);

         while (rs.next())
         {
            id_card_number = rs.getString("id_card_number");
            ad_number = rs.getInt("ad_number");
            year = rs.getInt("year");
            model = rs.getString("model");
            make = rs.getString("make");
            price = rs.getInt("price");
            city = rs.getString("city");
            air = rs.getString("air_displacement");
            kilometer = rs.getInt("driven_kilometer");
			autobike_district = rs.getString("district");
			num_of_views = rs.getInt("num_of_views"); 
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

         query = "SELECT * FROM members WHERE id_card_number = '" + id_card_number + "'";
         queryRS = dbconn.createStatement().executeQuery(query);
         
         queryRS.next();
         store_name = queryRS.getString("store_name");
         contact_person = queryRS.getString("name"); 
         city_address = queryRS.getString("city");
         street_adress = queryRS.getString("address");
         phone_number = queryRS.getString("phone_number");  
         cell_phone = queryRS.getString("cell_phone");
         license_number = queryRS.getString("license_number");
	 member_district = queryRS.getString("district"); 
 
         full_adress = city_address + member_district + street_adress; 

         sqlcmd = ("UPDATE LOW_PRIORITY ad SET num_of_views = '" + (num_of_views+1) + "' WHERE id='" + ad_id + "'");
		 dbconn.createStatement().executeUpdate(sqlcmd);
		 
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
    <td>    </td>
  </tr>
  <tr>
    <td height="21"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="buy.jsp"><img src="images/buttom_1a.gif" width="194" height="69" border="0"></a></td>
        <td><a href="login.jsp"><img src="images/buttom_2.gif" width="131" height="69" border="0"></a></td>
        <td><a href="under_construction.jsp"><img src="images/buttom_3.gif" width="148" height="69" border="0"></a></td>
        <td><a href="heavycycle_store.jsp"><img src="images/buttom_4.gif" width="136" height="69" border="0"></a></td>
        <td><a href="electric_cycle_store.jsp"><img src="images/buttom_5.gif" width="281" height="69" border="0"></a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="450" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="890" height="50" valign="bottom"> 　　<img src="images/other/banner_buy_cardata.gif" width="833" height="19"></td>
      </tr>
      <tr>
        <td height="20">&nbsp;</td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="50" height="0" valign="bottom">&nbsp;</td>
            <td width="382" valign="top">
			
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
			<br><br>
			<span class="a3">*圖片未依照比例顯示, 實際大小以實物為準</span>
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

            <td width="319" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30" rowspan="14" align="center" valign="top"><img src="images/other/pot_line_c.gif" width="15" height="380"></td>
                <td height="30"><img src="images/word_3.gif" width="71" height="23"></td>
                <td width="210" align="left" class="a11"><%= make%></td>
              </tr>
              <tr>
                <td height="30"><img src="images/word_7.gif" width="71" height="23"></td>
                <td align="left" class="a11"><%= model%></td>
              </tr>
              <tr>
                <td height="30"><img src="images/word_4.gif" width="71" height="23"></td>
                <td align="left" class="a11"><%= year%></td>
              </tr>
              <tr>
                <td height="30"><img src="images/word_5.gif" width="71" height="23"></td>
                <td align="left" class="a11"><%= price%></td>
              </tr>
              <tr>
                <td height="30"><img src="images/word_1.gif" width="71" height="23"></td>
                <td align="left" class="a11"><%= city%><%= autobike_district%></td>
              </tr>
              <tr>
                <td><img src="images/word_2.gif" width="71" height="23"></td>
                <td align="left" class="a11"><%= air_displacement%></td>
              </tr>
              <tr>
                <td height="30"><img src="images/word_6.gif" width="71" height="23"></td>
                <td align="left" class="a11"><%= kilometer%></td>
              </tr>
              <tr>
                <td height="30"><img src="images/sell/word_create_account2.gif" width="75" height="23"></td>
                <td align="left"><span class="a11"><%= contact_person%></span></td>
              </tr>
              <tr>
                <td height="30"><img src="images/sell/word_create_account7.gif" width="75" height="23"></td>
                <td align="left"><span class="a11"><%= cell_phone%></span></td>
              </tr>
			  <tr>
                <td height="30">瀏覽次數</td>
                <td align="left"><span class="a11"><%= num_of_views%></span></td>
              </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td align="left">&nbsp;</td>
              </tr>
              <tr>
                <td height="30">&nbsp;</td>
                <td align="left">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  
<%    
    if(fromIndex == null || "".equals(fromIndex)) 
    { 
%>
  
     <tr>
      <td>
	<form method="post" action="search_result.jsp?searchMotorcycle=1">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
            <td align="center" valign="bottom">
		<input type="image" src="images/button_prvpage.jpg" alt="Submit" width="90" height="21" />
	   	<input type="hidden" name="page" value="<%= current_page %>"/>

<%
   if( (searched_id != null) && !("".equals(searched_id)) )
   {
%>
		<input type="hidden" name="memberID" value="<%= searched_id %>"/>
<%      
   }		
%>		
		
		
		
<%
	if(searched_city == null || "".equals(searched_city))
	{
%>
	   	<input type="hidden" name="searched_city" value=""/>
<%
	}
	else
	{
%>
	   	<input type="hidden" name="searched_city" value="<%= city %>"/>
<%
	}	
%>
	   	<input type="hidden" name="searched_make" value="<%= searched_make %>"/>
	   	<input type="hidden" name="searched_model" value="<%= searched_model %>"/>
	   	<input type="hidden" name="searched_cc" value="<%= searched_cc %>"/>
	   	<input type="hidden" name="searched_post_date" value="<%= searched_post_date %>"/>
	   	<input type="hidden" name="searched_price" value="<%= searched_price %>"/>
	   	<input type="hidden" name="searched_km" value="<%= searched_km %>"/>
	   	<input type="hidden" name="searched_year" value="<%= searched_year %>"/>

<%
	if(searched_district == null || "".equals(searched_district))
	{
%>
	   	<input type="hidden" name="searched_district" value=""/>
<%
	}
	else
	{
%>
	   	<input type="hidden" name="searched_district" value="<%= autobike_district %>"/>
<%
	}

   if("1".equals(date_posted_selected))
   {   
%>
	  <input type="hidden" name="date_posted_selected" value="1"/>
	  <input type="hidden" name="date_posted" value="<%= date_posted %>"/>
<%   	     
   }
   else if("1".equals(str_price_selected))
   {
%>
	  <input type="hidden" name="str_price_selected" value="1"/>
	  <input type="hidden" name="str_price" value="<%= str_price %>"/>
<%	  
   }
   else if("1".equals(km_driven_selected))
   {   
%>
	  <input type="hidden" name="km_driven_selected" value="1"/>
	  <input type="hidden" name="km_driven" value="<%= km_driven %>"/>
<%
   }
   else if("1".equals(str_year_selected))
   {
%>
	  <input type="hidden" name="str_year_selected" value="1"/>
	  <input type="hidden" name="str_year" value="<%= str_year %>"/>
<%
   }
%>

	    </td>   
          </tr>		
	 </table>
	</form>	
      </td>
     </tr>
<%       
    }
%>
    
  
  <tr>
    <td height="60">
		<jsp:include page = "footer.jsp" />
	</td>
  </tr>
</table>
</body>
</html>