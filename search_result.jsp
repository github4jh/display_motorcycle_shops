<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>coolbee機車族</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
form {
 margin-bottom: 0px;
}
.style2 {
	font-size: 10pt;
	color: #5f534b;
}
.style8 {font-size: 8pt}
-->
</style>

<!-- 
This page processes search request from the following pages:
(1) index.jsp - search ads according to user's search criteria
(2) buy.jsp - search ads according to user's search criteria (same as index.jsp)
(3) near_school_shop.jsp - search ads posted by shops near a university
-->

<script language="javascript">
function goToPage(pnum)
{  
   if(pnum == "1")
   {
      document.pageForm.page.value = document.pageForm.prevpage.value;
   }	 
   else if(pnum == "2")
   { 
   	  document.pageForm.page.value = document.pageForm.jumppage.value;
   }
   else if(pnum == "3")
   {
      document.pageForm.page.value = document.pageForm.nextpage.value;
   }
   
   document.pageForm.submit();
}

function MM_jumpMenu(targ, selObj, restore)
{
  if(selObj.selectedIndex !=0)
  { 
	alert(selObj.options[selObj.selectedIndex].value);
	document.jumpPageForm.page.value = "2";
	document.jumpPageForm.submit(); 
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


   String searchMotorcycle = request.getParameter("searchMotorcycle");
     
   if(searchMotorcycle == null || "".equals(searchMotorcycle)) 
   { 
      response.sendRedirect("buy.jsp");
      return;
   }   
   
   String date_posted = request.getParameter("date_posted");
   String str_price = request.getParameter("str_price");
   String km_driven = request.getParameter("km_driven");
   String str_year = request.getParameter("str_year");

   String date_posted_selected = request.getParameter("date_posted_selected");
   String str_price_selected = request.getParameter("str_price_selected");
   String km_driven_selected = request.getParameter("km_driven_selected");
   String str_year_selected = request.getParameter("str_year_selected");

   
   if("1".equals(date_posted_selected))
   {
	   if( ("".equals(date_posted)) || (date_posted == null) )
	      date_posted = "desc";
	   else
	   {
	      if( "desc".equals(date_posted) )
		  {
		     date_posted = "asc";			
		  }
		  else
		  {
			 date_posted = "desc";	
		  }
	   }   
   }
   else if("1".equals(str_price_selected))
   {
	   if( ("".equals(str_price)) || (str_price == null) )
	      str_price = "desc";
	   else
	   {
	      if( "desc".equals(str_price) )
		  {
		     str_price = "asc"; 	 		
		  }
		  else
		  {
			 str_price = "desc";	
		  }
	   }	  
   }
   else if("1".equals(km_driven_selected))
   {   
	   if( ("".equals(km_driven)) || (km_driven == null) )
	      km_driven = "desc";
	   else
	   {
	      if( "desc".equals(km_driven) )
		  {
		     km_driven = "asc";   			
		  }
		  else
		  {
		     km_driven = "desc";		
		  }
	   }
   }
   else if("1".equals(str_year_selected))
   {
	   if( ("".equals(str_year)) || (str_year == null) )
	      str_year = "desc";
	   else
	   {
	      if( "desc".equals(str_year) )
		  {
		     str_year = "asc";
		  }
		  else
		  {
			 str_year = "desc";	
		  }
	   }
   }
   
   Connection dbconn;
   ResultSet rs; 
   ResultSet rowSet; 
   ResultSet resultSet; 
   Statement statement = null;
   Statement stmt = null;
   Statement sqlStmt = null;
   
   String query = "", mysqlQuery = "", sql_query = "";   
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   String sqlCmd;
   int k = 0, iAdNumber = 0, index = 0, /*numOfImages = 0,*/ result_count = 0, iPrice = 0, iMake = 0, iCC = 0, iKm = 0, iDate = 0;
   int iYear = 0;
   boolean first_loop = true, itemSearched = false;
   
   int post_year, post_month, post_day;

   String previous_page_link = "", next_page_link = ""; 
   String ad_link = ""; 
   String image_path[] = {"", "", "", ""};
   int num_of_images[] = {0, 0, 0, 0};
   
   String id_card_number[] = {"", "", "", ""};
   int ad_number[] = {0, 0, 0, 0};
   long ad_id[] = {0, 0, 0, 0};  
   String model[] = {"", "", "", ""};
   String make[] = {"", "", "", ""};
   int year[] = {0, 0, 0, 0};
   String city[] = {"", "", "", ""};
   String district[] = {"", "", "", ""};
   String address[] = {"", "", "", ""}; 
   int price[] = {0, 0, 0, 0};
   int total = 0, total_page = 0, current_page, start_record = 0;
   
   String searched_city, searched_make, searched_model, searched_cc, searched_post_date;
   String searched_price, searched_km, searched_year, searched_id, searched_district;
   String strParams = "";
   String member_id = "";

   current_page = Integer.valueOf(request.getParameter("page"));
   start_record = (current_page - 1) * 4;
   
   searched_city = request.getParameter("searched_city");
   searched_make = request.getParameter("searched_make"); 
   searched_model = request.getParameter("searched_model");
   searched_cc = request.getParameter("searched_cc");
   searched_post_date = request.getParameter("searched_post_date");
   searched_price = request.getParameter("searched_price");
   searched_km = request.getParameter("searched_km");
   searched_year = request.getParameter("searched_year");
   searched_id = request.getParameter("memberID"); 
   searched_district = request.getParameter("searched_district");
   
   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";
   String imageFileName = "";

   if ( ("".equals(searched_id)) || (searched_id == null) )
      searched_id = "";   	
   
   strParams = "&page=" + current_page + "&searched_city=" + searched_city + "&searched_make=" + searched_make + "&searched_model=" + searched_model + "&searched_cc=" + searched_cc + "&searched_post_date=" + searched_post_date + "&searched_price=" + searched_price  + "&searched_km=" + searched_km  + "&searched_year=" + searched_year + "&searched_district=" + searched_district;

   if("1".equals(date_posted_selected) || ((date_posted_selected==null) && 
		(str_price_selected==null) && (km_driven_selected==null) && (str_year_selected==null)) )
   {   
   	  if( "desc".equals(date_posted) )
	  {
		 strParams += "&date_posted_selected=1&date_posted=asc";
	  }
	  else
	  {
	     strParams += "&date_posted_selected=1&date_posted=desc";
	  }   
   }
   else if("1".equals(str_price_selected))
   {
	  if( "desc".equals(str_price) )
	  {
		 strParams += "&str_price_selected=1&str_price=asc";
	  }
	  else
	  {
	     strParams += "&str_price_selected=1&str_price=desc";
	  }	  
   }
   else if("1".equals(km_driven_selected))
   {   
	  if( "desc".equals(km_driven) )
	  {
		 strParams += "&km_driven_selected=1&km_driven=asc";
	  }
	  else
	  {
	     strParams += "&km_driven_selected=1&km_driven=desc";
	  }
   }
   else if("1".equals(str_year_selected))
   {
	  if( "desc".equals(str_year) )
	  {
		 strParams += "&str_year_selected=1&str_year=asc";
	  }
	  else
	  {
	     strParams += "&str_year_selected=1&str_year=desc";
	  }
   }
 
   try
   {
      Class.forName(JDBC_DRIVER);
      try
	    {
         
	       dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
         stmt = dbconn.createStatement();
         sqlStmt = dbconn.createStatement();   
         

         
         if( (searched_id != null) && !("".equals(searched_id)) )  //for searching all ads posted by a particular member
         {
             sql_query = "select id_card_number from members where memberID='" + searched_id + "'";
             resultSet = sqlStmt.executeQuery(sql_query);
 
             while(resultSet.next())
             { 
                member_id = resultSet.getString("id_card_number");
                break;
             }     
             sqlStmt.close();
			 
			 if( "1".equals(date_posted_selected) ) 
			 {
				if( "desc".equals(date_posted) )
				{
				    query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY post_date DESC limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY post_date DESC";
				}
				else // date_posted == "asc"
				{
				    query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY post_date limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY post_date";
				}
			 }
			 else if( "1".equals(str_price_selected) )
			 {
				if( "desc".equals(str_price) )
				{
				    query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY price DESC limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY price DESC";
				}
				else //str_price == "asc"
				{
					query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY price limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY price";
				}
			 }
			 else if( "1".equals(km_driven_selected) )
			 {
				if( "desc".equals(km_driven) )
				{
				    query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY driven_kilometer DESC limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY driven_kilometer DESC";
				}
				else //km_driven == "asc"
				{
					query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY driven_kilometer limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY driven_kilometer";
				}
			 }
			 else if( "1".equals(str_year_selected) )
			 {
				if( "desc".equals(str_year) )
				{
					query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY year DESC limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY year DESC";
				}
				else //str_year == "asc"
				{
					query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY year limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY year";
				}
			 }
			 else
			 {				
				query = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY post_date DESC limit " + start_record + ", 4";
				mysqlQuery = "SELECT * FROM ad where id_card_number='" + member_id + "' ORDER BY post_date DESC";
			 }
         }
         else if ("".equals(searched_city) && "0".equals(searched_make) && "".equals(searched_model) && "0".equals(searched_cc) 
             && "0".equals(searched_post_date) && "0".equals(searched_price) && "0".equals(searched_km) && "0".equals(searched_year) && "".equals(searched_district))
         {   
			 if( "1".equals(date_posted_selected) ) 
			 {
				if( "desc".equals(date_posted) )
				{
				    query = "SELECT * FROM ad ORDER BY post_date DESC limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad ORDER BY post_date DESC";
				}
				else // date_posted == "asc"
				{
				    query = "SELECT * FROM ad ORDER BY post_date limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad ORDER BY post_date";				
				}
			 }
			 else if( "1".equals(str_price_selected) )
			 {
				if( "desc".equals(str_price) )
				{
					query = "SELECT * FROM ad ORDER BY price DESC limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad ORDER BY price DESC";
				}
				else //str_price == "asc"
				{
				    query = "SELECT * FROM ad ORDER BY price limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad ORDER BY price";
				}
			 }
			 else if( "1".equals(km_driven_selected) )
			 {
				if( "desc".equals(km_driven) )
				{
				    query = "SELECT * FROM ad ORDER BY driven_kilometer DESC limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad ORDER BY driven_kilometer DESC";
				}
				else //km_driven == "asc"
				{
				    query = "SELECT * FROM ad ORDER BY driven_kilometer limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad ORDER BY driven_kilometer";
				}
			 }
			 else if( "1".equals(str_year_selected) )
			 {
				if( "desc".equals(str_year) )
				{
				    query = "SELECT * FROM ad ORDER BY year DESC limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad ORDER BY year DESC";
				}
				else //str_year == "asc"
				{
					query = "SELECT * FROM ad ORDER BY year limit " + start_record + ", 4";
					mysqlQuery = "SELECT * FROM ad ORDER BY year";
				}
			 }
			 else
			 {
				query = "SELECT * FROM ad ORDER BY post_date DESC limit " + start_record + ", 4";
				mysqlQuery = "SELECT * FROM ad ORDER BY post_date DESC";
			 }
         }
         else
         {	     
             query = "SELECT * FROM ad"; 
             if (!("".equals(searched_city)))
             {
                  query += " where city = '" + searched_city + "'";
                  itemSearched = true;
             }
             else
             { 
                  query += " where ";
                  itemSearched = false;
             }

             iPrice = Integer.valueOf(searched_price);
             if(iPrice > 0)
             {
                if(itemSearched)
                   query += " AND ";                   
             }

             switch(iPrice)
             { 
                case 0:                    
                   break;
                case 1:
                   query += "price BETWEEN 0 AND 10000 "; 
                   itemSearched = true;  
                   break;
                case 2:
                   query += "price BETWEEN 10001 AND 30000 ";
                   itemSearched = true;
                   break;
                case 3:
                   query += "price BETWEEN 30001 AND 50000 ";   
                   itemSearched = true;
                   break;
                case 4:
                   query += "price BETWEEN 50001 AND 100000 ";   
                   itemSearched = true;
                   break;
                case 5:
                   query += "price BETWEEN 100001 AND 150000 ";
                   itemSearched = true; 
                   break;
                case 6:
                   query += "price > 150000 ";
                   itemSearched = true; 
                   break;                 
                default:
                   break;
             }  

             iCC = Integer.valueOf(searched_cc);

             if(iCC > 0)
             {
                if(itemSearched)
                   query += " AND ";                   
             }

             switch(iCC)
             { 
                case 0:                    
                   break;
                case 1:
                   query += " air_displacement = '1' ";
                   itemSearched = true;   
                   break;
                case 2:
                   query += " air_displacement = '2' "; 
                   itemSearched = true;
                   break;
                case 3:
                   query += " air_displacement = '3' ";   
                   itemSearched = true;
                   break;
                case 4:
                   query += " air_displacement = '4' ";    
                   itemSearched = true; 
                   break;
                case 5:
                   query += " air_displacement = '5' "; 
                   itemSearched = true; 
                   break;
		case 6:
                   query += " air_displacement = '6' "; 
                   itemSearched = true; 
                   break;
		case 7:
                   query += " air_displacement = '7' "; 
                   itemSearched = true; 
                   break;
		case 8:
                   query += " air_displacement = '8' "; 
                   itemSearched = true; 
                   break;
		case 9:
                   query += " air_displacement = '9' "; 
                   itemSearched = true; 
                   break;
		case 10:
                   query += " air_displacement = '10' "; 
                   itemSearched = true; 
                   break;			
                default:
                   break;
             } 

             iKm = Integer.valueOf(searched_km);

             if(iKm > 0) 
             {
                if(itemSearched)
                   query += " AND ";                   
             }

             switch(iKm)
             { 
                case 0:                    
                   break;
                case 1:
                   query += "driven_kilometer BETWEEN 0 AND 1000";
                   itemSearched = true;   
                   break;
                case 2:
                   query += "driven_kilometer BETWEEN 1001 AND 5000"; 
                   itemSearched = true;
                   break;
                case 3:
                   query += "driven_kilometer BETWEEN 5001 AND 10000 ";   
                   itemSearched = true;
                   break;
                case 4:
                   query += "driven_kilometer BETWEEN 10001 AND 20000 ";    
                   itemSearched = true; 
                   break;
                case 5:
                   query += "driven_kilometer BETWEEN 20001 AND 50000 "; 
                   itemSearched = true; 
                   break;
                case 6:
                   query += "driven_kilometer BETWEEN 50001 AND 100000 ";    
                   itemSearched = true; 
                   break;
                case 7:
                   query += "driven_kilometer > 100000 "; 
                   itemSearched = true; 
                   break;
                default:
                   break;
             }

             iMake = Integer.valueOf(searched_make);

             if(iMake > 0) 
             {
                if(itemSearched)
                   query += " AND ";                   
             }

             switch(iMake)
             { 
                case 0:                    
                   break;
                case 1:
                   query += " make = 'BMW' ";
                   itemSearched = true;   
                   break;
                case 2:
                   query += " make = 'Harley-Davidson' ";
                   itemSearched = true;
                   break;
                case 3:
                   query += " make = 'Honda' ";   
                   itemSearched = true;
                   break;
                case 4:
                   query += " make = 'Kawasaki' ";   
                   itemSearched = true;
                   break;
                case 5:
                   query += " make = 'Kymco' ";
                   itemSearched = true;
                   break;
                case 6:
                   query += " make = 'PGO' ";
                   itemSearched = true;
                   break;
                case 7:
                   query += " make = 'Suzuki' ";
                   itemSearched = true;
                   break;
                case 8:
                   query += " make = 'SYM' ";
                   itemSearched = true;
                   break;
                case 9:
                   query += " make = 'Yamaha' ";  //limit " + start_record + ", 4";
                   itemSearched = true; 
                   break;  
                default:
                   break;
             } 
              
             iYear = Integer.valueOf(searched_year);

             if(iYear > 0) 
             {
                if(itemSearched)
                   query += " AND ";                   
             }

             switch(iYear)
             { 
                case 0:                    
                   break;
				case 10:
                   query += " year = 2013 ";
                   itemSearched = true;   
                   break;   
                case 9:
                   query += " year = 2012 ";
                   itemSearched = true;   
                   break;
                case 8:
                   query += " year = 2011 ";
                   itemSearched = true;
                   break;
                case 7:
                   query += " year BETWEEN 2006 AND 2010 ";   
                   itemSearched = true;
                   break;
                case 6:
                   query += " year BETWEEN 2001 AND 2005 ";
                   itemSearched = true;
                   break;
                case 5:
                   query += " year BETWEEN 1996 AND 2000 ";
                   itemSearched = true;
                   break;
                case 4:
                   query += " year BETWEEN 1991 AND 1995 ";
                   itemSearched = true;
                   break;
                case 3:
                   query += " year BETWEEN 1986 AND 1990 ";
                   itemSearched = true;
                   break;
                case 2:
                   query += " year BETWEEN 1982 AND 1985 ";
                   itemSearched = true;
                   break; 
                case 1:
                   query += " year <= 1981 ";
                   itemSearched = true;
                   break; 
                default:
                   break;
             }

             iDate = Integer.valueOf(searched_post_date); 

             if(iDate > 0) 
             {
                if(itemSearched)
                   query += " AND ";                   
             }

             switch(iDate)
             { 
                case 0:                    
                   break;
                case 1:
                   query += " DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= post_date ";
                   itemSearched = true;   
                   break;
                case 2:
                   query += " DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= post_date ";
                   itemSearched = true;
                   break;
                case 3:
                   query += " DATE_SUB(CURDATE(), INTERVAL 90 DAY) <= post_date ";   
                   itemSearched = true;
                   break;
                case 4:
                   query += " DATE_SUB(CURDATE(), INTERVAL 180 DAY) <= post_date ";
                   itemSearched = true;
                   break;
                case 5:
                   query += " DATE_SUB(CURDATE(), INTERVAL 180 DAY) > post_date ";
                   itemSearched = true;
                   break;                  
                default:
                   break;
             }

	     if (!("".equals(searched_district)))
             {		
		if(itemSearched)
                   query += " AND ";
	      
	        query += " district = '" + searched_district + "'";	
	     }


			 if( "1".equals(date_posted_selected) ) 
			 {
				if( "desc".equals(date_posted) )
				{
				    mysqlQuery = query;
					mysqlQuery += " ORDER BY post_date DESC";
				    query += " ORDER BY post_date DESC limit " + start_record + ", 4";
				}
				else // date_posted == "asc"
				{
					mysqlQuery = query;
					mysqlQuery += " ORDER BY post_date";
				    query += " ORDER BY post_date limit " + start_record + ", 4";
				}
			 }
			 else if( "1".equals(str_price_selected) )
			 {
				if( "desc".equals(str_price) )
				{
				    mysqlQuery = query;
					mysqlQuery += " ORDER BY price DESC";
				    query += " ORDER BY price DESC limit " + start_record + ", 4";
				}
				else //str_price == "asc"
				{
				    mysqlQuery = query;
					mysqlQuery += " ORDER BY price";
				    query += " ORDER BY price limit " + start_record + ", 4";
				}
			 }
			 else if( "1".equals(km_driven_selected) )
			 {
				if( "desc".equals(km_driven) )
				{
				    mysqlQuery = query;
					mysqlQuery += " ORDER BY driven_kilometer DESC";
				    query += " ORDER BY driven_kilometer DESC limit " + start_record + ", 4";
				}
				else //km_driven == "asc"
				{
				    mysqlQuery = query;
					mysqlQuery += " ORDER BY driven_kilometer";
				    query += " ORDER BY driven_kilometer limit " + start_record + ", 4";
				}
			 }
			 else if( "1".equals(str_year_selected) )
			 {
				if( "desc".equals(str_year) )
				{
				    mysqlQuery = query;
					mysqlQuery += " ORDER BY year DESC";
				    query += " ORDER BY year DESC limit " + start_record + ", 4";
				}
				else //str_year == "asc"
				{
				    mysqlQuery = query;
					mysqlQuery += " ORDER BY year";
				    query += " ORDER BY year limit " + start_record + ", 4";					
				}
			 }
			 else
			 {
				mysqlQuery = query;
				mysqlQuery += " ORDER BY post_date DESC";
				query += " ORDER BY post_date DESC limit " + start_record + ", 4";
			 }
         }  //end else
         
         rs = statement.executeQuery(query);
         index = 0;
         while (rs.next())
         {
            if (index < 4)
            {
               id_card_number[index] = rs.getString("id_card_number");
               ad_number[index] = rs.getInt("ad_number");
               model[index] = rs.getString("model");
               make[index] = rs.getString("make");
               year[index] = rs.getInt("year");
               price[index] = rs.getInt("price");
               city[index] = rs.getString("city");
	       district[index] = rs.getString("district");	
               ad_id[index++] = rs.getInt("id");	       	
            }
         } 

         result_count = index;
         statement.close();

         for (k = 0; k < index; k++)
         {   
             query = "SELECT * FROM images WHERE id_card_number = '" + id_card_number[k] + "' AND fileName like '" + ad_number[k] + "_%'" ;  
             rowSet = stmt.executeQuery(query);
             
             num_of_images[k] = 0; 
             while (rowSet.next())
             {
			    if(num_of_images[k] == 0)
					imageFileName = rowSet.getString("fileName");
					
                num_of_images[k] += 1; 
             }
    
             if(num_of_images[k] > 0)
             {  
		image_path[k] = "upload/" + id_card_number[k] + "/" + imageFileName;                
             }  
             else
             {  
		image_path[k] = "images/img_big.jpg";
             }
         }         

         stmt.close(); 
     
         rs = dbconn.createStatement().executeQuery(mysqlQuery);
 
         rs.last();
 
         total = rs.getRow();
     
         total_page = (int)Math.ceil((double) total / 4.0); 
		 
         if(total_page >= current_page && current_page > 1)
         {
            if( (searched_id != null) && !("".equals(searched_id)) )  //case: search ads posted by shops near university
            {
            previous_page_link = "search_result.jsp?searchMotorcycle=1&page=" + (current_page - 1) + "&memberID=" + searched_id;
            }
            else   //case: search ads according to user's search criteria
            {
            previous_page_link = "search_result.jsp?searchMotorcycle=1&page=" + (current_page - 1) + "&searched_city=" + searched_city + "&searched_make=" + searched_make +
                               "&searched_model=" + searched_model + "&searched_cc=" + searched_cc + "&searched_post_date=" + searched_post_date + 
                               "&searched_price=" + searched_price + "&searched_km=" + searched_km + "&searched_year=" + searched_year + "&searched_district=" + searched_district;
            }
         }
 
         if(total_page > current_page)
         {
            if( (searched_id != null) && !("".equals(searched_id)) ) //case: search ads posted by shops near university
            {
            next_page_link = "search_result.jsp?searchMotorcycle=1&page=" + (current_page + 1) + "&memberID=" + searched_id;
            }
            else  //case: search ads according to user's search criteria
            {
            next_page_link = "search_result.jsp?searchMotorcycle=1&page=" + (current_page + 1) + "&searched_city=" + searched_city + "&searched_make=" + searched_make +
                               "&searched_model=" + searched_model + "&searched_cc=" + searched_cc + "&searched_post_date=" + searched_post_date + 
                               "&searched_price=" + searched_price + "&searched_km=" + searched_km + "&searched_year=" + searched_year + "&searched_district=" + searched_district;
            }
         }
 
         dbconn.close();
      }
      catch (SQLException sqlException)
      {

      }
   }  
   catch (ClassNotFoundException err)
   {

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
    
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
		<form name="sortSearchResult" method="post" action="search_result.jsp">
<%		
        if( ("1".equals(date_posted_selected)) || ((date_posted_selected==null) && 
		(str_price_selected==null) && (km_driven_selected==null) && (str_year_selected==null)) ) 
		{
		    if( "desc".equals(date_posted) )
			{
%>	    
			<td><input type="submit" value="刊登日期">
			    <img src="images/down_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
			else
			{
%>	    
			<td><input type="submit" value="刊登日期">
			    <img src="images/up_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
        }
		else
		{
%>	    
			<td><input type="submit" value="刊登日期"></td>
<%		
        }
%>			
			
			<input type="hidden" name="date_posted" value="<%= date_posted %>"/>
			<input type="hidden" name="date_posted_selected" value="1"/>
			<input type="hidden" name="searchMotorcycle" value="1"/>
			<input type="hidden" name="page" value="1"/>
			<input type="hidden" name="memberID" value="<%= searched_id %>"/>
			<input type="hidden" name="searched_city" value="<%= searched_city %>"/>
			<input type="hidden" name="searched_make" value="<%= searched_make %>"/>
			<input type="hidden" name="searched_model" value="<%= searched_model %>"/>
			<input type="hidden" name="searched_cc" value="<%= searched_cc %>"/>
			<input type="hidden" name="searched_post_date" value="<%= searched_post_date %>"/>
			<input type="hidden" name="searched_price" value="<%= searched_price %>"/>
			<input type="hidden" name="searched_km" value="<%= searched_km %>"/>
			<input type="hidden" name="searched_year" value="<%= searched_year %>"/>
			<input type="hidden" name="searched_district" value="<%= searched_district %>"/>
	    </form>
		<form name="sortSearchResult" method="post" action="search_result.jsp">
		
<%		
        if( ("1".equals(str_price_selected)) ) 
		{
		    if( "desc".equals(str_price) )
			{
%>	    
			<td><input type="submit" value="價錢">
			    <img src="images/down_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
			else
			{
%>	    
			<td><input type="submit" value="價錢">
			    <img src="images/up_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
        }
		else
		{
%>	    
			<td><input type="submit" value="價錢"></td>
<%		
        }
%>			
			<input type="hidden" name="str_price" value="<%= str_price %>"/>
			<input type="hidden" name="str_price_selected" value="1"/>
			<input type="hidden" name="searchMotorcycle" value="1"/>
			<input type="hidden" name="page" value="1"/>
			<input type="hidden" name="memberID" value="<%= searched_id %>"/>
			<input type="hidden" name="searched_city" value="<%= searched_city %>"/>
			<input type="hidden" name="searched_make" value="<%= searched_make %>"/>
			<input type="hidden" name="searched_model" value="<%= searched_model %>"/>
			<input type="hidden" name="searched_cc" value="<%= searched_cc %>"/>
			<input type="hidden" name="searched_post_date" value="<%= searched_post_date %>"/>
			<input type="hidden" name="searched_price" value="<%= searched_price %>"/>
			<input type="hidden" name="searched_km" value="<%= searched_km %>"/>
			<input type="hidden" name="searched_year" value="<%= searched_year %>"/>
			<input type="hidden" name="searched_district" value="<%= searched_district %>"/>
		</form>
		<form name="sortSearchResult" method="post" action="search_result.jsp">
		
<%		
        if( ("1".equals(km_driven_selected)) ) 
		{
		    if( "desc".equals(km_driven) )
			{
%>	    
			<td><input type="submit" value="公里數">
			    <img src="images/down_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
			else
			{
%>	    
			<td><input type="submit" value="公里數">
			    <img src="images/up_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
        }
		else
		{
%>	    
			<td><input type="submit" value="公里數"></td>
<%		
        }
%>			
			<input type="hidden" name="km_driven" value="<%= km_driven %>"/>
			<input type="hidden" name="km_driven_selected" value="1"/>
			<input type="hidden" name="searchMotorcycle" value="1"/>
			<input type="hidden" name="page" value="1"/>
			<input type="hidden" name="memberID" value="<%= searched_id %>"/>
			<input type="hidden" name="searched_city" value="<%= searched_city %>"/>
			<input type="hidden" name="searched_make" value="<%= searched_make %>"/>
			<input type="hidden" name="searched_model" value="<%= searched_model %>"/>
			<input type="hidden" name="searched_cc" value="<%= searched_cc %>"/>
			<input type="hidden" name="searched_post_date" value="<%= searched_post_date %>"/>
			<input type="hidden" name="searched_price" value="<%= searched_price %>"/>
			<input type="hidden" name="searched_km" value="<%= searched_km %>"/>
			<input type="hidden" name="searched_year" value="<%= searched_year %>"/>
			<input type="hidden" name="searched_district" value="<%= searched_district %>"/>
		</form>
		<form name="sortSearchResult" method="post" action="search_result.jsp">
		
<%		
        if( ("1".equals(str_year_selected)) ) 
		{
		    if( "desc".equals(str_year) )
			{
%>	    
			<td><input type="submit" value="年份">
			    <img src="images/down_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
			else
			{
%>	    
			<td><input type="submit" value="年份">
			    <img src="images/up_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
        }
		else
		{
%>	    
			<td><input type="submit" value="年份"></td>
<%		
        }
%>			
			<input type="hidden" name="str_year" value="<%= str_year %>"/>
			<input type="hidden" name="str_year_selected" value="1"/>
			<input type="hidden" name="searchMotorcycle" value="1"/>
			<input type="hidden" name="page" value="1"/>
			<input type="hidden" name="memberID" value="<%= searched_id %>"/>
			<input type="hidden" name="searched_city" value="<%= searched_city %>"/>
			<input type="hidden" name="searched_make" value="<%= searched_make %>"/>
			<input type="hidden" name="searched_model" value="<%= searched_model %>"/>
			<input type="hidden" name="searched_cc" value="<%= searched_cc %>"/>
			<input type="hidden" name="searched_post_date" value="<%= searched_post_date %>"/>
			<input type="hidden" name="searched_price" value="<%= searched_price %>"/>
			<input type="hidden" name="searched_km" value="<%= searched_km %>"/>
			<input type="hidden" name="searched_year" value="<%= searched_year %>"/>
			<input type="hidden" name="searched_district" value="<%= searched_district %>"/>
		</form>
      </tr>
    </table></td>
	
  </tr>
  <tr>
    <td height="21">&nbsp;</td>
  </tr>
  <tr>
    <td height="450" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="15" valign="top"> 　　<img src="images/other/banner_surfend.png" width="816" height="25"><br></td>
      </tr>
      <tr>
        <td height="30" align="right" valign="middle">&nbsp;</td>
        </tr>
<%
      if(result_count > 0)
      {
         ad_link = "show_ad_detail.jsp?fromSearchResult=1&ad_id=" + ad_id[0] + strParams;

         if( (searched_id != null) && !("".equals(searched_id)) )
         {
            ad_link += "&memberID=" + searched_id;
         }
%>
      <tr>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="55" height="0" valign="bottom">&nbsp;</td>
            <td width="835" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
<%
              if(result_count > 1) 
              { 
%>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
              }
              else
              {
%>
                <td><table width="360" border="0" cellspacing="0" cellpadding="0">
<%
              }
%>
                  <tr>
                    <td width="28">&nbsp;</td>
                    <td width="146" height="200" valign="top"><a href=<%= ad_link %>><img src=<%= image_path[0]%> width="145" height="145" border="0" class="imgborder_small"></a></td>
                    <td width="146" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="10">&nbsp;</td>
                          <td><img src="images/word_detial.gif" alt="1" width="76" height="18"></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><img src="images/word_pot.gif" alt="1" width="137" height="8"></td>
                        </tr>
                        <tr>
                          <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50" align="center" class="a1">城市</td>
                                <td class="a1"><%= city[0]%><%= district[0]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">年份</td>
                                <td class="a1"><%= year[0]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">車廠</td>
                                <td class="a1"><%= make[0]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">車款</td>
                                <td class="a1"><%= model[0]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a2">售價</td>
                                <td class="a2"><%= price[0]%></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                    <td width="30">&nbsp;</td>
<%
       if(result_count > 1)
       {
          ad_link = "show_ad_detail.jsp?fromSearchResult=1&ad_id=" + ad_id[1] + strParams; 

          if( (searched_id != null) && !("".equals(searched_id)) )
          {
             ad_link += "&memberID=" + searched_id;
          }        
%>
                    <td width="146" valign="top"><a href=<%= ad_link %>><img src=<%= image_path[1]%> alt="" width="145" height="145" border="0" class="imgborder_small"></a></td>
                    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="10">&nbsp;</td>
                          <td><img src="images/word_detial.gif" alt="1" width="76" height="18"></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><img src="images/word_pot.gif" alt="1" width="137" height="8"></td>
                        </tr>
                        <tr>
                          <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50" align="center" class="a1">城市</td>
                                <td class="a1"><%= city[1]%><%= district[1]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">年份</td>
                                <td class="a1"><%= year[1]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">車廠</td>
                                <td class="a1"><%= make[1]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">車款</td>
                                <td class="a1"><%= model[1]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a2">售價</td>
                                <td class="a2"><%= price[1]%></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>

              <tr>
<%
           if (result_count > 2)
           {
               ad_link = "show_ad_detail.jsp?fromSearchResult=1&ad_id=" + ad_id[2] + strParams;

               if( (searched_id != null) && !("".equals(searched_id)) )
               {
                  ad_link += "&memberID=" + searched_id;
               }
 
               if(result_count > 3) 
               {
%>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
               }
               else
               {
%>
                <td><table width="360" border="0" cellspacing="0" cellpadding="0">
<%
               }  
%>
                  <tr>
                    <td width="28">&nbsp;</td>
                    <td width="146" height="200" valign="top" align="left"><a href=<%= ad_link %>><img src=<%= image_path[2]%> alt="" width="145" height="145" border="0" class="imgborder_small"></a></td>
                    <td width="146" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="10">&nbsp;</td>
                          <td><img src="images/word_detial.gif" alt="1" width="76" height="18"></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><img src="images/word_pot.gif" alt="1" width="137" height="8"></td>
                        </tr>
                        <tr>
                          <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50" align="center" class="a1">城市</td>
                                <td class="a1"><%= city[2]%><%= district[2]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">年份</td>
                                <td class="a1"><%= year[2]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">車廠</td>
                                <td class="a1"><%= make[2]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">車款</td>
                                <td class="a1"><%= model[2]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a2">售價</td>
                                <td class="a2"><%= price[2]%></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
                    <td width="30">&nbsp;</td>
<%
           if (result_count > 3)
           {
              ad_link = "show_ad_detail.jsp?fromSearchResult=1&ad_id=" + ad_id[3] + strParams;

              if( (searched_id != null) && !("".equals(searched_id)) )
              {
                 ad_link += "&memberID=" + searched_id;
              }

%>
                    <td width="146" valign="top"><a href=<%= ad_link %>><img src=<%= image_path[3]%> alt="" width="145" height="145" border="0" class="imgborder_small"></a></td>
                    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="10">&nbsp;</td>
                          <td><img src="images/word_detial.gif" alt="1" width="76" height="18"></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td><img src="images/word_pot.gif" alt="1" width="137" height="8"></td>
                        </tr>
                        <tr>
                          <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="50" align="center" class="a1">城市</td>
                                <td class="a1"><%= city[3]%><%= district[3]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">年份</td>
                                <td class="a1"><%= year[3]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">車廠</td>
                                <td class="a1"><%= make[3]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a1">車款</td>
                                <td class="a1"><%= model[3]%></td>
                              </tr>
                              <tr>
                                <td width="50" align="center" class="a2">售價</td>
                                <td class="a2"><%= price[3]%></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table></td>
<%
           } //end if (result_count > 3)     
       } //end if (result_count > 2) 
    } //end if (result_count > 1)

           if (result_count == 1 || result_count == 3 || result_count == 4)  //need to close the table when number of matches found are 1, 3, and 4
           {
%>   
                  </tr>
                </table></td>
<%
           }
%>


              </tr>
              <tr>
			    <form name="pageForm" method="post" action="search_result.jsp">
                <td align="left" class="a3">共<span class="a22"> <%= total %></span> 筆資料　   第<span class="a22"> <%= total_page%></span> 之 <span class="a22"><%= current_page%> </span>頁&nbsp;&nbsp;
<%
   if(total_page >= current_page && current_page > 1)
   {
%>
      <input type="hidden" name="prevpage" value="<%= current_page - 1 %>"/>
	  <input type="button" value="上一頁" onClick=goToPage(1)>
<%
   } 
%>

 　<input type="hidden" name="page"/>

<%
      if( (searched_id != null) && !("".equals(searched_id)) )  //case: search ads posted by shops near university
      {
%>
            <input type="hidden" name="searchMotorcycle" value="1"/>
			<input type="hidden" name="memberID" value="<%= searched_id %>"/>
<%	  
      }
      else   //case: search ads according to user's search criteria
      {
%>
            <input type="hidden" name="searchMotorcycle" value="1"/>
			<input type="hidden" name="searched_city" value="<%= searched_city %>"/>
			<input type="hidden" name="searched_make" value="<%= searched_make %>"/>
			<input type="hidden" name="searched_model" value="<%= searched_model %>"/>
			<input type="hidden" name="searched_cc" value="<%= searched_cc %>"/>
			<input type="hidden" name="searched_post_date" value="<%= searched_post_date %>"/>
			<input type="hidden" name="searched_price" value="<%= searched_price %>"/>
			<input type="hidden" name="searched_km" value="<%= searched_km %>"/>
			<input type="hidden" name="searched_year" value="<%= searched_year %>"/>
			<input type="hidden" name="searched_district" value="<%= searched_district %>"/>
<%	  
      }
	  
	  if( "1".equals(date_posted_selected) ) 
	  {
	     if( "desc".equals(date_posted) )
		 {
%>
			<input type="hidden" name="date_posted" value="asc"/>
<%
		 }
		 else
		 {
%>
			<input type="hidden" name="date_posted" value="desc"/>
<%
		 }		
%>
		 <input type="hidden" name="date_posted_selected" value="1"/>
<%
	  }
	  else if( "1".equals(str_price_selected) )
	  {
	     if( "desc".equals(str_price) )
		 {
%>
			<input type="hidden" name="str_price" value="asc"/>
<%
		 }
		 else
		 {
%>
			<input type="hidden" name="str_price" value="desc"/>
<%
		 }		
%>	
		 <input type="hidden" name="str_price_selected" value="1"/>				
<%
	  }
	  else if( "1".equals(km_driven_selected) )
	  {
	     if( "desc".equals(km_driven) )
		 {
%>
			<input type="hidden" name="km_driven" value="asc"/>
<%
		 }
		 else
		 {
%>
			<input type="hidden" name="km_driven" value="desc"/>
<%
		 }
%>
		 <input type="hidden" name="km_driven_selected" value="1"/>
<%			
	  }
	  else if( "1".equals(str_year_selected) )
	  {
         if( "desc".equals(str_year) )
		 {
%>
			<input type="hidden" name="str_year" value="asc"/>
<%
		 }
		 else
		 {
%>
			<input type="hidden" name="str_year" value="desc"/>
<%
		 }
%>
		 <input type="hidden" name="str_year_selected" value="1"/>
<%		
	  }
	  else
	  {
%>
			<input type="hidden" name="date_posted" value="asc"/>
			<input type="hidden" name="date_posted_selected" value="1"/>
<%
	  }

   if(total_page > 1)
   {
%>  
      <strong><span class="a33">跳至第</span></strong>
      <select name="jumppage" onChange=goToPage(2)>	  
      <option selected="selected"></option>
<%    
      for(int iPage = 1; iPage <= total_page; iPage++)
      {
         if(iPage != current_page)
         {      
%>
			<option value="<%=iPage%>"><%=iPage%></option>
<%			
		 }
      }
%>
      </select>
      <strong><span class="a33">頁</span></strong>&nbsp;&nbsp;
<%
   }

   if(total_page > current_page)
   {
%>   
      <input type="hidden" name="nextpage" value="<%= current_page + 1 %>"/>
	  <input type="button" value="下一頁" onClick=goToPage(3)>
<%
   } 
%> 
               </td>
			   </form>
              </tr>
              <tr>
                <td height="40" valign="bottom"><a href="buy.jsp"><img src="images/other/button_resurf.jpg" width="80" height="21" border="0"></a></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
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