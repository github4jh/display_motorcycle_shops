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
   
   Connection dbconn, connection;
   ResultSet rs; 
   ResultSet rowSet;
   ResultSet resultSet;
   ResultSet result_set;
   Statement statement = null;
   Statement stmt = null;   
   Statement sqlStmt = null;
   Statement sql_statement = null;

   String query = "", sql_query = "", sqlQuery = "", university_name = "";   
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   String id_card_number = "";   
   boolean first_loop = true;

   String member_contact_person = "";   
   String member_city = "";
   String member_address = "";
   String member_phone = "";
   String member_cell_phone = "";
   String member_store_name = "";
   String store_name[] = {"", "", "", "", "", "", "", "", "", ""};
   String contact_person[] = {"", "", "", "", "", "", "", "", "", ""};
   String city[] = {"", "", "", "", "", "", "", "", "", ""};
   String district[] = {"", "", "", "", "", "", "", "", "", ""};
   String address[] = {"", "", "", "", "", "", "", "", "", ""};
   String phone[] = {"", "", "", "", "", "", "", "", "", ""};
   String cell_phone[] = {"", "", "", "", "", "", "", "", "", ""};
   int id_number[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int member_id = 0;
   String link = "";
   int current_page = 1;
   int start_record = 0;
   int total = 0, total_page = 0, index = 0, result_count = 0;
   int NUMBER_OF_RECORDS_PER_PAGE = 10;
   String previous_page_link = "", next_page_link = "";
      
   String strPage = request.getParameter("page");
   
   if("".equals(strPage) || strPage == null)
      strPage = "1";
   
   current_page = Integer.valueOf(strPage);
   start_record = (current_page - 1) * NUMBER_OF_RECORDS_PER_PAGE;

   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";


   try
   {
      Class.forName(JDBC_DRIVER);
      try
	  {
         
	     dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
         stmt = dbconn.createStatement();
		   
         query = "SELECT * FROM heavycycle_store";
         sql_query = query;
   
         query += " limit " + start_record + ", " + NUMBER_OF_RECORDS_PER_PAGE;
   
         rs = statement.executeQuery(query);

         index = 0; 
         result_count = 0;   
         while (rs.next())
         {
            id_card_number = rs.getString("id_card_number");
            sqlQuery = "SELECT * FROM members where id_card_number='" + id_card_number + "'";
            resultSet = stmt.executeQuery(sqlQuery);
	   
            while (resultSet.next())
            {	  
               store_name[index] = resultSet.getString("store_name");
               contact_person[index] = resultSet.getString("name");
               city[index] = resultSet.getString("city");
			   district[index] = resultSet.getString("district");
               address[index] = resultSet.getString("address");
               phone[index] = resultSet.getString("phone_number");
               cell_phone[index] = resultSet.getString("cell_phone");
			   id_number[index++] = resultSet.getInt("memberID");
            }
	        result_count++;
         }	
		 
         statement.close(); 
         stmt.close();
		 
		 
		 rowSet = dbconn.createStatement().executeQuery(sql_query);
		 rowSet.last();
		 total = rowSet.getRow();
		 total_page = (int)Math.ceil((double) total / NUMBER_OF_RECORDS_PER_PAGE);

         if(total_page >= current_page && current_page > 1)
         {
            previous_page_link = "heavycycle_store.jsp?page=" + (current_page - 1);
         }
		 
         if(total_page > current_page)
         {
            next_page_link = "heavycycle_store.jsp?page=" + (current_page + 1);
         }		 
		 
         dbconn.close();
      }
      catch (SQLException sqlException)
      {
         out.println("sql exception");
      }
   }  
   catch (ClassNotFoundException err)
   {
      out.println("class not found exception");
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
        <td><a href="login.jsp"><img src="images/buttom_2.gif" width="131" height="69" border="0"></a></td>
        <td><a href="under_construction.jsp"><img src="images/buttom_3.gif" width="148" height="69" border="0"></a></td>
        <td><a href="heavycycle_store.jsp"><img src="images/buttom_4a.gif" width="136" height="69" border="0"></a></td>
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
        <td height="45" valign="top"> 　　<img src="images/other/banner_motorcycle_shop.gif" width="834" height="21"><br></td>
      </tr>
<%     
      if(result_count > 0)
	  { 
%>
      <tr>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="55" height="0" valign="bottom">&nbsp;</td>
			<td width="835" valign="bottom"><table width="0" border="0" cellpadding="0" cellspacing="0"> 
<%	  
	     for (index = 0; index < result_count; index++)
		 {
		    link = "search_result.jsp?searchMotorcycle=1&page=1&memberID=" + id_number[index];
		    if(first_loop)
			{
               first_loop = false; 		 
%>
              <tr>
                <td width="125" align="center"><img src="images/other/school_1.gif" width="125" height="25"></td>
                <td width="10" align="center">&nbsp;</td>
                <td width="104" align="center"><img src="images/other/school_2.gif" width="104" height="25"></td>
                <td width="10" align="center">&nbsp;</td>
                <td width="240" align="center"><img src="images/other/school_3.gif" width="240" height="25"></td>
                <td width="10" align="center">&nbsp;</td>
                <td width="116" align="center"><img src="images/other/school_4.gif" width="116" height="25"></td>
                <td width="10" align="center">&nbsp;</td>
                <td width="115" align="center"><img src="images/other/school_5.gif" width="115" height="25"></td>
              </tr>
<%     
            } //end if(first_loop)
			else
			{			
%>			
              <tr>
                <td height="20" colspan="9" align="center"><img src="images/other/pot_line_long.gif" width="715" height="7"></td>
              </tr>
<%
            }
%>
              <tr>
                <td width="124" height="30" align="center" valign="bottom" class="a33"><a href="<%= link%>" class="a22"><%= store_name[index] %></a></td>
                <td height="25" align="center" valign="bottom">&nbsp;</td>
                <td height="25" align="center" valign="bottom" class="a3"><%= contact_person[index] %></td>
                <td height="25" align="center" valign="bottom">&nbsp;</td>
                <td height="25" align="center" valign="bottom"> <span class="a3"><%= city[index] %><%= district[index] %><%=  address[index] %></span></td>
                <td height="25" align="center" valign="bottom">&nbsp;</td>
                <td height="25" align="center" valign="bottom"><span class="a3"><%= phone[index] %></span></td>
                <td align="center" valign="bottom">&nbsp;</td>
                <td align="center" valign="bottom"><span class="a3"><%= cell_phone[index] %></span></td>
              </tr>			
<%			
         } //end for
%>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="50" align="center" valign="bottom"><span class="a3">共<span class="a22"><%= total %></span> 筆資料　   第<span class="a22"><%= total_page %></span> 之 <span class="a22"><%= current_page %></span>頁 　
      	  
<%
         if(total_page >= current_page && current_page > 1)
         {  
%>
         <span class="a22"><a href=<%= previous_page_link %> class="a22">上一頁</a></span>
<%
         } 
%>

<%
         if(total_page > 1)
         {
            String searched_criteria = "";
%>
            <strong><span class="a33">跳至第</span></strong>
            <select onChange="MM_jumpMenu('self', this, 0)">
            <option selected="selected"><%= current_page %></option>
<%
      
            for(int iPage = 1; iPage <= total_page; iPage++)
            {    
               searched_criteria = "heavycycle_store.jsp?page=" + iPage;

               if(iPage != current_page)
               {
%>
               <option value="<%=searched_criteria%>"><%=iPage%></option>
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
<%		 
      } //end if(result_count > 0)
	  else 
	  { 
%>	
      <tr>
          <td align="center" valign="middle" class="a3">共<span class="a22">0</span> 筆資料 
      </tr>
<%
      }
%>  
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