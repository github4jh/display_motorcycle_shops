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
function MM_jumpMenu(targ, selObj, restore)
{
  if(selObj.selectedIndex !=0)
  {
    eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
    if (restore) selObj.selectedIndex=0;
  }
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

   String fromBuy = request.getParameter("fromBuy");
   String fromNearSchoolShop = request.getParameter("fromNearSchoolShop");     

   if( (fromBuy == null || "".equals(fromBuy)) && (fromNearSchoolShop == null || "".equals(fromNearSchoolShop)) ) 
   { 
      response.sendRedirect("buy.jsp");
      return;
   }
  
   int school_id = Integer.valueOf(request.getParameter("school_id"));

   Connection dbconn, connection;
   ResultSet rs; 
   ResultSet rowSet;
   ResultSet resultSet;
   ResultSet result_set;
   ResultSet query_result;
   Statement statement = null;
   Statement stmt = null;   
   Statement sqlStmt = null;
   Statement sql_statement = null;

   String query = "", sql_query = "", sqlCmd = "", mysqlQuery = "", university_name = "";   
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   int shop_id = 0;   
   boolean first_loop = true;
   boolean member_id_found = false;
   
   
   String store_city = "";
   String store_district = "";
   String store_address = "";
   String store_phone = "";   
   String store_name = "";
   String store_id_card_number = "";
   int member_id = 0;
   String link = "";
   int current_page = 1;
   int start_record = 0;
   int total = 0, total_page = 0;
   String previous_page_link = "", next_page_link = "";
   int id_number = 0;
   current_page = Integer.valueOf(request.getParameter("page"));
   start_record = (current_page - 1) * 4;

   String session_id = (String) session.getAttribute("sid");
   String member_page_link = ""; 
  
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
          

         query = "SELECT id, name FROM university";
         
         rs = statement.executeQuery(query);

         while(rs.next())
         {
            university_name = rs.getString("name");
            id_number = rs.getInt("id");
            if(id_number == school_id)
               break;
         }
         // iterate through the result set
         
 
         statement.close();
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
        <td><a href="buy.jsp"><img src="images/buttom_1a.gif" width="194" height="69" border="0"></a></td>
        <td><a href="login.jsp"><img src="images/buttom_2.gif" width="131" height="69" border="0"></a></td>
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
        <td height="15" colspan="2" valign="top"> 　　<img src="images/other/banner_school.gif" width="841" height="26"><br></td>
      </tr>
      <tr>
        <td width="58" height="40" align="right" valign="middle"><span class="a2"><img src="images/other/star.gif" width="26" height="23"></span></td>
        <td width="855" align="left" valign="middle"><span class="a2"><%= university_name%></span></td>
      </tr>
      <tr>
        <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="55" height="0" valign="bottom">&nbsp;</td>
            <td width="835" valign="bottom"><table width="0" border="0" cellpadding="0" cellspacing="0">
              
<%
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {
         
	 connection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         stmt = connection.createStatement();
         sqlStmt = connection.createStatement();
         sql_statement = connection.createStatement();           

         query = "SELECT shopID FROM college_nearby_shop where college='" + university_name + "' limit " + start_record + ", 4";
         sqlCmd = "SELECT shopID FROM college_nearby_shop where college='" + university_name + "'";
         
         rowSet = stmt.executeQuery(query);
         
         
         while(rowSet.next())
         { 
            shop_id = rowSet.getInt("shopID");       
             
            sql_query = "select id_card_number, store_name, city, district, address, phone_number FROM motorcycle_shops where shopID = '" + shop_id + "'";

            resultSet = sqlStmt.executeQuery(sql_query);
            
            while(resultSet.next()) 
            {
               if(first_loop)
               {
%>
              <tr>
                <td width="185" align="center"><img src="images/other/school_1.gif" width="125" height="25"></td>
                <td width="10" align="center">&nbsp;</td>
                <td width="340" align="center"><img src="images/other/school_3.gif" width="240" height="25"></td>
                <td width="10" align="center">&nbsp;</td>
                <td width="176" align="center"><img src="images/other/school_4.gif" width="116" height="25"></td>
                <td width="10" align="center">&nbsp;</td>
              </tr>  
<%
                first_loop = false;
               }
               else
               {
%>
              <tr>                
                <td height="20" colspan="9" align="center"><img src="images/other/pot_line_long.gif" width="715" height="7"></td>
              </tr>
<%  
               } 

               
               store_city = resultSet.getString("city");
			   store_district = resultSet.getString("district");
               store_address = resultSet.getString("address");
               store_phone = resultSet.getString("phone_number");               
               store_name = resultSet.getString("store_name");
			   store_id_card_number = resultSet.getString("id_card_number"); 
               
 
               if( !("none".equals(store_id_card_number)) && store_id_card_number.length() == 10)
			   {
			       mysqlQuery = "select memberID from members where id_card_number = '" + store_id_card_number + "'";
			       query_result = connection.createStatement().executeQuery(mysqlQuery);
				   
				   while(query_result.next()) 
                   {
				      member_id = query_result.getInt("memberID");
					  link = "search_result.jsp?searchMotorcycle=1&page=1&memberID=" + member_id;
					  member_id_found = true;
				   }	  
			   }
           
               

%>
             <tr>
<%
        if(member_id_found)
		{
%>
			  <td height="30" align="center" valign="bottom" class="a33"><a href="<%= link%>" class="a22"><%=store_name%></a></td>
<%
        }
		else
		{
%>			 
			  <td height="30" align="center" valign="bottom" class="a33"><%=store_name%></td>
<%
        }
%>			  
              <td height="25" align="center" valign="bottom">&nbsp;</td>
              <td height="25" align="center" valign="bottom"> <span class="a3"><%= store_city%><%= store_district%><%= store_address%> </span></td>
              <td height="25" align="center" valign="bottom">&nbsp;</td>
              <td height="25" align="center" valign="bottom"><span class="a3"><%= store_phone%></span></td>
              <td align="center" valign="bottom">&nbsp;</td>              
             </tr>
<%               

            }
         }
         
         result_set = sql_statement.executeQuery(sqlCmd);
         result_set.last();
         total = result_set.getRow();
         total_page = (int)Math.ceil((double) total / 4.0);

         if(total_page >= current_page && current_page > 1)
            previous_page_link = "near_school_shop.jsp?fromNearSchoolShop=1&page=" + (current_page - 1) + "&school_id=" + school_id;

         if(total_page > current_page)
            next_page_link = "near_school_shop.jsp?fromNearSchoolShop=1&page=" + (current_page + 1) + "&school_id=" + school_id;


         stmt.close();
         sqlStmt.close();
         sql_statement.close();
         connection.close();  
          
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
%>              
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="50" colspan="2" align="center" valign="bottom"><span class="a3">共<span class="a22"> <%= total %></span> 筆資料　   

<%
   if(total_page > 0)
   {  
%>
      第<span class="a22"><%= total_page%></span> 之 <span class="a22"><%= current_page%> </span>頁
<%
   } 
%>
 　

<%
   if(total_page >= current_page && current_page > 1)
   {  
%>
      <span class="a22"><a href=<%= previous_page_link %> class="a22">上一頁</a></span>
<%
   } 
%>

<span class="a33"><a href="#" class="a33">　</a></span>

<%
   if(total_page > 1)
   {
      String near_school_shop_link = "";
%>
      <strong><span class="a33">跳至第</span></strong>
      <select onChange="MM_jumpMenu('self', this, 0)">
      <option selected="selected"></option>
<%
      
      for(int iPage = 1; iPage <= total_page; iPage++)
      {
         near_school_shop_link = "near_school_shop.jsp?fromNearSchoolShop=1&page=" + iPage + "&school_id=" + school_id;
         if(iPage != current_page)
         {
      
%>
          <option value="<%=near_school_shop_link%>"><%=iPage%></option>
<%
         } 
      }
%>
      </select>
      <strong><span class="a33">頁</span></strong>
<%
   } 
%>


<span class="a33"><a href="#" class="a33">　</a></span>

<%
   if(total_page > current_page)
   {  
%>
      <a href=<%= next_page_link %> class="a22">下一頁</a>
<%
   } 
%>

       </td>
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