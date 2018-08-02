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

district=new Array(22);
// 基隆市
district[0]=["仁愛區", "信義區", "中正區", "中山區", "安樂區", "暖暖區", "七堵區"];
	

district[1]=["中正區", "大同區", "中山區", "松山區", "大安區", "萬華區", "信義區", "士林區", "北投區", "內湖區", "南港區", "文山區"];	// 台北市

district[2]=["萬里區", "金山區", "板橋區", "汐止區", "深坑區", "石碇區", "瑞芳區", "平溪區", "雙溪區", "貢寮區", "新店區", "坪林區", "烏來區", "永和區", "中和區", "土城區", "三峽區", "樹林區", "鶯歌區", "三重區", "新莊區", "泰山區", "林口區", "蘆洲區", "五股區", "八里區", "淡水區", "三芝區", "石門區"];			// 新北市

district[3]=["中壢市", "平鎮市", "龍潭鄉", "楊梅市", "新屋鄉", "觀音鄉", "桃園市", "龜山鄉", "八德市", "大溪鎮", "復興鄉", "大園鄉", "蘆竹鄉"];				// 桃園縣

district[4]=["東區", "北區", "香山區"];	//新竹市 

district[5]=["竹北市", "湖口鄉", "新豐鄉", "新埔鎮", "關西鎮", "芎林鄉", "寶山鄉", "竹東鎮", "五峰鄉", "橫山鄉", "尖石鄉", "北埔鄉", "峨眉鄉"];	//新竹縣 

district[6]=["竹南鎮", "頭份鎮", "三灣鄉", "南庄鄉", "獅潭鄉", "後龍鎮", "通宵鎮", "苑裡鎮", "苗栗市", "造橋鄉", "頭屋鄉", "公館鄉", "大湖鄉", "泰安鄉", "銅鑼鄉", "三義鄉", "西湖鄉", "卓蘭鎮"];			//苗栗縣 

district[7]=["中區", "東區", "南區", "西區", "北區", "北屯區", "西屯區", "南屯區", "太平區", "大里區", "霧峰區", "烏日區", "豐原區", "后里區", "石岡區", "東勢區", "和平區", "新社區", "潭子區", "大雅區", "神岡區", "大肚區", "沙鹿區", "龍井區", "梧棲區", "清水區", "大甲區", "外埔區", "大安區"];				//台中市 

district[8]=["南投市", "中寮鄉", "草屯鎮", "國姓鄉", "埔里鎮", "仁愛鄉", "名間鄉", "集集鎮", "水里鄉", "魚池鄉", "信義鄉", "竹山鄉", "鹿谷鄉"];	//南投縣 

district[9]=["彰化市", "芬園鄉", "花壇鄉", "秀水鄉", "鹿港鎮", "福興鄉", "線西鄉", "和美鎮", "伸港鄉", "員林鎮", "社頭鄉", "永靖鄉", "埔心鄉", "溪湖鎮", "大村鄉", "埔鹽鄉", "田中鎮", "北斗鎮", "田尾鄉", "埤頭鄉", "溪州鄉", "竹塘鄉", "二林鎮", "大城鄉", "芳苑鄉", "二水鄉"];	//彰化縣 

district[10]=["斗南鎮", "大埤鄉", "虎尾鎮", "土庫鎮", "褒忠鄉", "東勢鄉", "台西鄉", "崙背鄉", "麥寮鄉", "斗六市", "林內鄉", "古坑鄉", "莿桐鄉", "西螺鎮", "二崙鄉", "北港鎮", "水林鄉", "口湖鄉", "四湖鄉", "元長鄉"];			//雲林縣 

district[11]=["東區", "西區"];				//嘉義市

district[12]=["番路鄉", "梅山鄉", "竹崎鄉", "阿里山鄉", "中埔鄉", "大埔鄉", "水上鄉", "鹿草鄉", "太保市", "朴子市", "東石鄉", "六腳鄉", "新港鄉", "民雄鄉", "大林鎮", "溪口鄉", "義竹鄉", "布袋鎮"];	//嘉義縣 

district[13]=["中西區", "東區", "南區", "北區", "安平區", "安南區", "永康區", "歸仁區", "新化區", "左鎮區", "玉井區", "楠西區", "南化區", "仁德區", "關廟區", "龍崎區", "官田區", "麻豆區", "佳里區", "西港區", "七股區", "將軍區", "學甲區", "北門區", "新營區", "後壁區", "白河區", "東山區", "六甲區", "下營區", "柳營區", "鹽水區", "善化區", "大內區", "山上區", "新市區", "安定區"];	//台南市 

district[14]=["新興區", "前金區", "苓雅區", "鹽埕區", "鼓山區", "旗津區", "前鎮區", "三民區", "楠梓區", "小港區", "左營區", "仁武區", "大社區", "東沙群島", "南沙群島", "岡山區", "路竹區", "阿蓮區", "田寮區", "燕巢區", "橋頭區", "梓官區", "彌陀區", "永安區", "湖內區", "鳳山區", "大寮區", "林園區", "烏松區", "大樹區", "旗山區", "美濃區", "六龜區", "內門區", "杉林區", "甲仙區", "桃源區", "那瑪夏區", "茂林區", "茄萣區"];			//高雄市 

district[15]=["屏東市", "三地門鄉", "霧台鄉", "瑪家鄉", "九如鄉", "里港鄉", "高樹鄉", "鹽埔鄉", "長治鄉", "麟洛鄉", "竹田鄉", "內埔鄉", "萬丹鄉", "潮州鎮", "泰武鄉", "來義鄉", "萬巒鄉", "崁頂鄉", "新埤鄉", "南州鄉", "林邊鄉", "東港鎮", "琉球鄉", "佳冬鄉", "新園鄉", "枋寮鄉", "枋山鄉", "春日鄉", "獅子鄉", "車城鄉", "牡丹鄉", "恆春鎮", "滿州鄉"];		//屏東縣

district[16]=["宜蘭市", "頭城鎮", "礁溪鄉", "壯圍鄉", "員山鄉", "羅東鎮", "三星鄉", "大同鄉", "五結鄉", "冬山鄉", "蘇澳鎮", "南澳鄉", "釣魚台"];	//宜蘭縣 

district[17]=["花蓮市", "新城鄉", "秀林鄉", "吉安鄉", "壽豐鄉", "鳳林鎮", "光復鄉", "豐濱鄉", "瑞穗鄉", "萬榮鄉", "玉里鎮", "卓溪鄉", "富里鄉"];	//花蓮縣 

district[18]=["台東市", "綠島鄉", "蘭嶼鄉", "延平鄉", "卑南鄉", "鹿野鄉", "關山鎮", "海瑞鄉", "池上鄉", "東河鄉", "成功鎮", "長濱鄉", "太麻里鄉", "金峰鄉", "大武鄉", "達仁鄉"];			//台東縣 

district[19]= ["馬公市", "西嶼鄉", "望安鄉", "七美鄉", "白沙鄉", "湖西鄉"]; //澎湖縣

district[20]= ["金沙鎮", "金湖鎮", "金寧鄉", "金城鎮", "烈嶼鄉", "烏坵鄉"]; //金門縣

district[21]= ["南竿鄉", "北竿鄉", "莒光鄉", "東引鄉"];  //連江縣

function changeZone(selected_index){
        document.myForm.ad_district.length=district[selected_index].length;
	    
	for(var i=0;i<district[selected_index].length;i++)
    {
	   document.myForm.ad_district.options[i].value = district[selected_index][i];
	   document.myForm.ad_district.options[i].text = district[selected_index][i];	
	}        	
}


   
  function isProcess() 
  { 
    var modified = false;
    var strNotModified = "您並未修改任何資料!";
    var strQuestion = "確定修改資料?\n";
    var strAir;	
	var numOfImagesToDelete = 0;
    var answer;
    if(document.myForm.city.value != document.myForm.ad_city.value)
    {
        strQuestion += "縣市改為 " + document.myForm.ad_city.value + "\n";    
        modified = true;   
    } 
	
	if(document.myForm.district.value != document.myForm.ad_district.value)
	{
        strQuestion += "鄉鎮市區改為 " + document.myForm.ad_district.value + "\n";    
        modified = true;   
    }
	
    if(document.myForm.price.value != document.myForm.ad_price.value)
    {
        strQuestion += "售價改為 " + document.myForm.ad_price.value + "\n";    
        modified = true;   
    }
    if(document.myForm.air.value != document.myForm.ad_air_displacement.value)
    {
        if("1" == document.myForm.ad_air_displacement.value)
            strAir = "1 ~ 50 c.c.";
        else if("2" == document.myForm.ad_air_displacement.value)
            strAir = "51 ~ 100 c.c.";
        else if("3" == document.myForm.ad_air_displacement.value)
            strAir = "101 ~ 150 c.c.";
        else if("4" == document.myForm.ad_air_displacement.value)
            strAir = "151 ~ 250 c.c.";
        else if("5" == document.myForm.ad_air_displacement.value)
            strAir = "251 ~ 500 c.c.";
        else if("6" == document.myForm.ad_air_displacement.value)
            strAir = "501 ~ 750 c.c.";
        else if("7" == document.myForm.ad_air_displacement.value)
            strAir = "751 ~ 1000 c.c.";
	else if("8" == document.myForm.ad_air_displacement.value)
            strAir = "1001 ~ 1250 c.c.";
        else if("9" == document.myForm.ad_air_displacement.value)
            strAir = "1251 ~ 1500 c.c.";
        else if("10" == document.myForm.ad_air_displacement.value)
            strAir = "1501 c.c. 以上";

        strQuestion += "排氣量改為 " + strAir + "\n";    
        modified = true;   
    }
    if(document.myForm.kilometer.value != document.myForm.ad_kilometer.value)
    {
        strQuestion += "公里數改為 " + document.myForm.ad_kilometer.value + "\n";    
        modified = true;   
    }
    if(document.myForm.make.value != document.myForm.ad_make.value)
    {
        strQuestion += "車廠改為 " + document.myForm.ad_make.value + "\n";    
        modified = true;   
    }    
    if(document.myForm.model.value != document.myForm.ad_model.value)
    {
        strQuestion += "車款改為 " + document.myForm.ad_model.value + "\n";    
        modified = true;   
    }
    if(document.myForm.year.value != document.myForm.ad_year.value)
    {
        strQuestion += "年份改為 " + document.myForm.ad_year.value + "\n";    
        modified = true;   
    }
	
	if(document.myForm.image1 != null)
	{
	    if(document.myForm.image1.checked)
		{
		    numOfImagesToDelete = numOfImagesToDelete + 1;
		    modified = true;
		}
	}	
		
	if(document.myForm.image2 != null)
	{
		if(document.myForm.image2.checked)
		{
			numOfImagesToDelete = numOfImagesToDelete + 1;
			modified = true;
		}
	}	
		
	if(document.myForm.image3 != null)
	{
		if(document.myForm.image3.checked)
		{
			numOfImagesToDelete = numOfImagesToDelete + 1;
			modified = true;
		}
	}
	
	if(numOfImagesToDelete > 0)
	{
        strQuestion += "刪除 " + numOfImagesToDelete + " 張照片" + "\n";
    }
    
    if(modified)
    {
       answer = confirm (strQuestion);
       if (answer)
       { 
              document.myForm.answer.value = "true";   
              document.myForm.submit(); 
              return true; 
       }
       else 
       { 
          return false;
       } 
    }
    else
    {
       answer = confirm (strNotModified);
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



   String fromDisplayMemberAd = request.getParameter("fromDisplayMemberAd");
     
   if(fromDisplayMemberAd == null || "".equals(fromDisplayMemberAd)) 
   { 
      response.sendRedirect("login.jsp");
      return;
   }   


   String identification = "";
   String ad_number = request.getParameter("ad_number");
   String showAdInfo = request.getParameter("showAdInfo");
   String member_name = "";
   

   if(showAdInfo == null || "".equals(showAdInfo))
      showAdInfo = "0";

   String answer = request.getParameter("answer"); 
   if(answer == null || "".equals(answer))
      answer = "false";

   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8";
   Connection dbconn;
   ResultSet rs;
   Statement stmt = null;
   String sqlQuery;

   String session_id = (String) session.getAttribute("sid");
   String member_email = (String) session.getAttribute("email");
   String member_page_link = "MemberPage.jsp";   

   if(session_id == null)
   {
      response.sendRedirect("login.jsp");
      return;   
   }
   
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         stmt = dbconn.createStatement();
         
         sqlQuery = "SELECT name, id_card_number FROM members WHERE email = '" + member_email + "'";
         
         rs = stmt.executeQuery(sqlQuery);


         // iterate through the result set
         while (rs.next())
         {
            member_name = rs.getString("name");
			identification = rs.getString("id_card_number");
         }

         stmt.close();
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



<%
   if("true".equals(answer))
   {
//////////////////////////////////////////////////
   String sqlCmd = "", command = "";
   Connection dbconnection;    

   Statement sql_statement = null;


   int rowCount = 0, resultCount = 0;   
   
   String orginal_city = request.getParameter("city");
   String orginal_price = request.getParameter("price");
   String orginal_air = request.getParameter("air");
   String orginal_kilometer = request.getParameter("kilometer");
   String orginal_make = request.getParameter("make");
   String orginal_model = request.getParameter("model");
   String orginal_year = request.getParameter("year");
   String orginal_district = request.getParameter("district");
      

   String updated_city = request.getParameter("ad_city");
   String temp_price = request.getParameter("ad_price");
   String updated_air_displacement = request.getParameter("ad_air_displacement");
   String temp_kilometer = request.getParameter("ad_kilometer");
   String updated_make = request.getParameter("ad_make");
   String updated_model = request.getParameter("ad_model");	
   String temp_year = request.getParameter("ad_year");
   String updated_district = request.getParameter("ad_district");
   String checkbox_image1 = request.getParameter("image1");
   String checkbox_image2 = request.getParameter("image2");
   String checkbox_image3 = request.getParameter("image3");
   String imageDir = application.getRealPath("upload");
   File memberdir;
   File[] listFiles;
   
	
   int updated_price = 0;
   int updated_kilometer = 0;
   int updated_year = 2012;
	
   
   if(temp_year != null && !("".equals(temp_year)))
   { 
      try
      {
         updated_year = Integer.parseInt(temp_year);
      }
      catch(NumberFormatException e)
      {
	     response.sendRedirect("modify_ad_info.jsp?fromDisplayMemberAd=1&ad_number=" + ad_number);
         return;
      }
   }
   else
   {
	     response.sendRedirect("modify_ad_info.jsp?fromDisplayMemberAd=1&ad_number=" + ad_number);
         return;       
   }

   if(temp_price != null && !("".equals(temp_price)))
   { 
      try
      {
         updated_price = Integer.parseInt(temp_price);
      }
      catch(NumberFormatException e)
      {
	     response.sendRedirect("modify_ad_info.jsp?fromDisplayMemberAd=1&ad_number=" + ad_number);
         return;
      }
   }
   else
   {
	     response.sendRedirect("modify_ad_info.jsp?fromDisplayMemberAd=1&ad_number=" + ad_number);
         return;   
   }
   
   
   if(temp_kilometer != null && !("".equals(temp_kilometer)))
   { 
      try
      {
         updated_kilometer = Integer.parseInt(temp_kilometer);
      }
      catch(NumberFormatException e)
      {
	     response.sendRedirect("modify_ad_info.jsp?fromDisplayMemberAd=1&ad_number=" + ad_number);
         return;
      }
   }  
   else
   {
	     response.sendRedirect("modify_ad_info.jsp?fromDisplayMemberAd=1&ad_number=" + ad_number);
         return;   
   }
   
   
   boolean data_updated = false;   

   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {         
	 dbconnection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
                 
         sql_statement = dbconnection.createStatement();       

         sqlCmd = "UPDATE LOW_PRIORITY ad SET ";
         
         if (!(orginal_city.equals(updated_city)))
         {
            sqlCmd += "city = '" + updated_city + "'"; 
            data_updated = true;
         }
 
		 if (!(orginal_district.equals(updated_district)))
         {
            if(data_updated)
               sqlCmd += ", district = '" + updated_district + "'";
            else
               sqlCmd += "district = '" + updated_district + "'"; 

            data_updated = true;
         }
 
         if (!(orginal_price.equals(updated_price)))
         {
            if(data_updated)
               sqlCmd += ", price = '" + updated_price + "'";
            else
               sqlCmd += "price = '" + updated_price + "'"; 

            data_updated = true;
         }

         if (!(orginal_air.equals(updated_air_displacement)))
         {
            if(data_updated)
               sqlCmd += ", air_displacement = '" + updated_air_displacement + "'";
            else
               sqlCmd += "air_displacement = '" + updated_air_displacement + "'"; 

            data_updated = true;
         }

         if (!(orginal_kilometer.equals(updated_kilometer)))
         {
            if(data_updated)
               sqlCmd += ", driven_kilometer = '" + updated_kilometer + "'";
            else
               sqlCmd += "driven_kilometer = '" + updated_kilometer + "'"; 

            data_updated = true;
         }

         if (!(orginal_make.equals(updated_make)))
         {
            if(data_updated)
               sqlCmd += ", make = '" + updated_make + "'";
            else
               sqlCmd += "make = '" + updated_make + "'"; 

            data_updated = true;
         }

         if (!(orginal_model.equals(updated_model)))
         {
            if(data_updated)
               sqlCmd += ", model = '" + updated_model + "'";
            else
               sqlCmd += "model = '" + updated_model + "'"; 

            data_updated = true;
         }

         if (!(orginal_year.equals(updated_year)))
         {
            if(data_updated)
               sqlCmd += ", year = '" + updated_year + "'";
            else
               sqlCmd += "year = '" + updated_year + "'"; 

            data_updated = true;
         }         

         sqlCmd += " where id_card_number = '" + identification + "' AND ad_number = '" + ad_number + "'";
         rowCount = sql_statement.executeUpdate(sqlCmd);

         sql_statement.close();
		 
		 imageDir += "/" + identification;
		 memberdir = new File(imageDir);
			
		 listFiles = memberdir.listFiles();
			
		 if(checkbox_image1 != null)
		 {
		    command = "DELETE FROM images WHERE id_card_number = '" + identification + "' AND ad_number = '" + ad_number + "' AND fileName = '" + checkbox_image1 + "'";
			dbconnection.createStatement().executeUpdate(command);
						
			for( File targetFile : listFiles )
			{
				if( targetFile.getName().startsWith(checkbox_image1) )
				{
					targetFile.delete();  
				}
			}
		 }
		 
		 if(checkbox_image2 != null)
		 {
		    command = "DELETE FROM images WHERE id_card_number = '" + identification + "' AND ad_number = '" + ad_number + "' AND fileName = '" + checkbox_image2 + "'";
			dbconnection.createStatement().executeUpdate(command);
			
			for( File targetFile : listFiles )
			{
				if( targetFile.getName().startsWith(checkbox_image2) )
				{
					targetFile.delete();  
				}
			}			
		 }
		 
		 if(checkbox_image3 != null)
		 {
		    command = "DELETE FROM images WHERE id_card_number = '" + identification + "' AND ad_number = '" + ad_number + "' AND fileName = '" + checkbox_image3 + "'";
			dbconnection.createStatement().executeUpdate(command);
			
			for( File targetFile : listFiles )
			{
				if( targetFile.getName().startsWith(checkbox_image3) )
				{
					targetFile.delete();  
				}
			}			
		 }
		 
         dbconnection.close(); 
         
         showAdInfo = "1";  //Ad info in database updated successfully; proceed to show modified Ad info. 
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

   } //end if("true".equals(answer))
%>


<%
if ("1".equals(showAdInfo)) 
{
   String query;
   Connection connection;
   ResultSet resultSet, rowSet;
   Statement sqlStmt = null;
   String adNumber = request.getParameter("ad_number");

   String make="", model="", city="", air="", air_displacement="", district="";
   int year = 0, price=0, kilometer=0;
   String modify_link = "modify_ad_info.jsp?fromDisplayMemberAd=1&ad_number=" + adNumber;   
   int numOfImages=0, index=0;
   String imageFileName;   
   String image_path[] = {"", "", ""};   
   
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {
         
	 connection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         sqlStmt = connection.createStatement();
      
      
         query = "select * from ad where id_card_number= '" + identification + "' AND ad_number= '" + ad_number + "'";         
                  
         resultSet = sqlStmt.executeQuery(query);


         // iterate through the result set
         while (resultSet.next())
         {
             make = resultSet.getString("make");
             model = resultSet.getString("model");
             year = resultSet.getInt("year");
             price = resultSet.getInt("price");
             city = resultSet.getString("city");
             air = resultSet.getString("air_displacement");
             kilometer = resultSet.getInt("driven_kilometer");
			 district = resultSet.getString("district");	
         }         

         if("1".equals(air))
            air_displacement = "1 ~ 50 c.c.";
         else if("2".equals(air))
            air_displacement = "51 ~ 100 c.c.";
         else if("3".equals(air))
            air_displacement = "101 ~ 150 c.c.";
         else if("4".equals(air))
            air_displacement = "151 ~ 250 c.c.";
         else if("5".equals(air))
            air_displacement = "251 ~ 500 c.c.";
         else if("6".equals(air))
            air_displacement = "501 ~ 750 c.c.";
         else if("7".equals(air))
            air_displacement = "751 ~ 1000 c.c.";
	 else if("8".equals(air))
            air_displacement = "1001 ~ 1250 c.c.";
         else if("9".equals(air))
            air_displacement = "1251 ~ 1500 c.c.";
         else if("10".equals(air))
            air_displacement = "1501 c.c. 以上";	                

         sqlStmt.close();
		 
		 sqlQuery = "select fileName from images where id_card_number= '" + identification + "' AND ad_number= '" + ad_number + "'";
		 rowSet = connection.createStatement().executeQuery(sqlQuery);
		 
		 while (rowSet.next())
         {
		    numOfImages++;
			imageFileName = rowSet.getString("fileName");
			image_path[index++] = "upload/" + identification + "/" + imageFileName;
		 }
		 
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
%>

<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <%@include file="logo.jsp"%>
  </tr>
<%
   if(session_id != null) 
   {      
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
        <td height="55" colspan="3" valign="top"> 　　<img src="images/sell/banner_modify_ad.gif" width="813" height="23"></td>
      </tr>
      <tr>
        <td width="174" height="32" align="right" bgcolor="#FFFFFF"><img src="images/sell/banner2_modify_ad.jpg" width="153" height="32"></td>
        <td width="526" bgcolor="#ebe7ca" class="a3">　歡迎光臨 <%= member_name%>!</td>
        <td width="190" bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
      <tr>
        <td height="230" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" valign="bottom">&nbsp;</td>
            <td height="123" valign="bottom"><form name="form2" method="post" action="">
              <table width="610" border="0" cellspacing="0" cellpadding="0">
                <tr>
		  <td height="30"><img src="images/word_1.gif" alt="1" width="71" height="23"></td>	
                  <td><%= city%></td>
                  <td width="30" height="110" rowspan="4"><img src="images/line.gif" alt="1" width="9" height="108"></td>
                  <td><img src="images/word_5.gif" alt="1" width="71" height="23"></td>
                  <td><%= price%></td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_2.gif" alt="1" width="71" height="23"></td>
                  <td><%= air_displacement%></td>
                  <td><img src="images/word_6.gif" alt="1" width="71" height="23"></td>
                  <td><%= kilometer%></td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_3.gif" alt="1" width="71" height="23"></td>
                  <td><%= make%></td>
                  <td><img src="images/word_7.gif" alt="1" width="71" height="23"></td>
                  <td><%= model%></td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_4.gif" alt="1" width="71" height="23"></td>
                  <td><%= year%></td>
		  <td><img src="images/word_4_1.gif" alt="1" width="71" height="23"></td>
                  <td><%= district%></td>
                </tr>
				<tr>
				  <td colspan="5" align="left" valign="bottom">
				  <%
				     for(index = 0; index < numOfImages; index++)
					 {
				  %>
						<img src=<%= image_path[index]%> width="115" height="113" class="imgborder_small">
						<br>						
				  <%
				     }
				  %>
				  </td>
				</tr>
                <tr>
                  <td height="35" colspan="5" align="center" valign="bottom">                   
                   <a href=<%= modify_link%>><img src="images/sell/button_modifydata.jpg" width="80" height="21" border="0"></a>&nbsp;
                   <!--<a href=<%=member_page_link%>><img src="images/sell/button_backmember.jpg" width="95" height="21" border="0"></a>-->
                  </td>
                </tr>
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



<%
} //end if ("1".equals(showAdInfo))
else 
{
%>


<form name="myForm" method="post" onSubmit="isProcess();">
<%    
   String query;
   Connection connection;
   ResultSet resultSet, rowSet;
   Statement sqlStmt = null;
   String Ad_Number = request.getParameter("ad_number");   

   String air_displacement="", make="", model="", city="", air="", district="";
   int price = 0, kilometer = 0, year = 0;
   int numOfImages=0, index=0;
   String imageFileName, strCheckbox;
   String ad_image_filename[] = {"", "", ""};
   String image_path[] = {"", "", ""};
   
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {
         
	 connection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         sqlStmt = connection.createStatement();
      
      
         query = "select * from ad where id_card_number= '" + identification + "' AND ad_number= '" + Ad_Number + "'";         
                  
         resultSet = sqlStmt.executeQuery(query);


         // iterate through the result set
         while (resultSet.next())
         {
             city = resultSet.getString("city");
             price = resultSet.getInt("price");
             air = resultSet.getString("air_displacement");
             kilometer = resultSet.getInt("driven_kilometer");
             make = resultSet.getString("make");
             model = resultSet.getString("model");
             year = resultSet.getInt("year"); 
			 district = resultSet.getString("district");	
         }         

         if("1".equals(air))
            air_displacement = "1 ~ 50 c.c.";
         else if("2".equals(air))
            air_displacement = "51 ~ 100 c.c.";
         else if("3".equals(air))
            air_displacement = "101 ~ 150 c.c.";
         else if("4".equals(air))
            air_displacement = "151 ~ 250 c.c.";
         else if("5".equals(air))
            air_displacement = "251 ~ 500 c.c.";
         else if("6".equals(air))
            air_displacement = "501 ~ 750 c.c.";
         else if("7".equals(air))
            air_displacement = "751 ~ 1000 c.c.";
	 else if("8".equals(air))
            air_displacement = "1001 ~ 1250 c.c.";
         else if("9".equals(air))
            air_displacement = "1251 ~ 1500 c.c.";
         else if("10".equals(air))
            air_displacement = "1501 c.c. 以上";	 

         sqlStmt.close();		 
		 
		 sqlQuery = "select fileName from images where id_card_number= '" + identification + "' AND ad_number= '" + Ad_Number + "'";
		 rowSet = connection.createStatement().executeQuery(sqlQuery);
		 
		 index = 0;
		 numOfImages=0;
		 while (rowSet.next())
         {
		    numOfImages++;
			imageFileName = rowSet.getString("fileName");
			ad_image_filename[index] = imageFileName;
			image_path[index++] = "upload/" + identification + "/" + imageFileName;
			
		 }		 
		 
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
%>


<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <%@include file="logo.jsp"%>
  </tr>
<%
   if(session_id != null) 
   {      
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
        <td height="55" colspan="3" valign="top"> 　　<img src="images/sell/banner_modify_ad.gif" width="813" height="23"></td>
      </tr>
      <tr>
        <td width="174" height="32" align="right" bgcolor="#FFFFFF"><img src="images/sell/banner2_modify_ad.jpg" width="153" height="32"></td>
        <td width="526" bgcolor="#ebe7ca" class="a3">　歡迎光臨 <%= member_name%>!</td>
        <td width="190" bgcolor="#FFFFFF">&nbsp;</td>
      </tr>
      <tr>
        <td height="230" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" valign="bottom">&nbsp;</td>
            <td height="123" valign="bottom">
              <table width="610" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30"><img src="images/word_1.gif" alt="1" width="71" height="23"></td>
                  <td>
                    <select name="ad_city" style="width:156;" onChange="changeZone(this.selectedIndex);">
<%   
     if (city != null) 
     {
        if (city.equals("基隆市"))
        {
%>        
	<option value="基隆市" selected="yes">基隆市</option>	
<%	
        }
	else
	{
%>     	
	<option value="基隆市">基隆市</option>	
<%	
        }
        if (city.equals("台北市"))
        {
%>        
	<option value="台北市" selected="yes">台北市</option>
<%	
        }
	else
	{
%>     		
	<option value="台北市">台北市</option>
	

<%	
        }
        if (city.equals("新北市"))
        {
%>        
	<option value="新北市" selected="yes">新北市</option>
<%	
        }
	else
	{
%>     		
	<option value="新北市">新北市</option>
	

<%	
        }
        if (city.equals("桃園縣"))
        {
%>        
	<option value="桃園縣" selected="yes">桃園縣</option>
<%	
        }
	else
	{
%>     		
	<option value="桃園縣">桃園縣</option>
	
	
<%	
        }
        if (city.equals("新竹市"))
        {
%>        
	<option value="新竹市" selected="yes">新竹市</option>
<%	
        } 
	else
	{
%>     		
	<option value="新竹市">新竹市</option>
	
			
<%	
        } 
        if (city.equals("新竹縣"))
        {
%>        
	<option value="新竹縣" selected="yes">新竹縣</option>
<%	
        } 
	else
	{
%>     		
	<option value="新竹縣">新竹縣</option>	



<%	
        }
        if (city.equals("苗栗縣"))
        {
%>        
	<option value="苗栗縣" selected="yes">苗栗縣</option>
<%	
        }
	else
	{
%>     		
	<option value="苗栗縣">苗栗縣</option>
	
	
<%	
        }
        if (city.equals("台中市"))
        {
%>        
	<option value="台中市" selected="yes">台中市</option>
<%	
        }
	else
	{
%>     		
	<option value="台中市">台中市</option>
	
	
<%	
        } 
        if (city.equals("南投縣"))
        {
%>        
	<option value="南投縣" selected="yes">南投縣</option>
<%	
        }
	else
	{
%>     		
	<option value="南投縣">南投縣</option>
	

<%	
        }
        if (city.equals("彰化縣"))
        {
%>        
	<option value="彰化縣" selected="yes">彰化縣</option>
<%	
        }
	else
	{
%>     		
	<option value="彰化縣">彰化縣</option>
	
	
<%	
        }
        if (city.equals("雲林縣"))
        {
%>        
	<option value="雲林縣" selected="yes">雲林縣</option>
<%	
        }
	else
	{
%>     		
	<option value="雲林縣">雲林縣</option>
	
	
<%	
        } 
        if (city.equals("嘉義市"))
        {
%>        
	<option value="嘉義市" selected="yes">嘉義市</option>
<%	
        }
	else
	{
%>     		
	<option value="嘉義市">嘉義市</option>
	
<%	
        }
        if (city.equals("嘉義縣"))
        {
%>        
	<option value="嘉義縣" selected="yes">嘉義縣</option>
<%	
	}
	else
	{
%>     		
	<option value="嘉義縣">嘉義縣</option>
	
<%	
        }
        if (city.equals("台南市"))
        {
%>        
	<option value="台南市" selected="yes">台南市</option>
<%	
	}
	else
	{
%>     		
	<option value="台南市">台南市</option>
	
	
<%	
        } 
        if (city.equals("高雄市"))
        {
%>        
	<option value="高雄市" selected="yes">高雄市</option>
<%	
        }
	else
	{
%>     		
	<option value="高雄市">高雄市</option>
	
	
<%	
        }
        if (city.equals("屏東縣"))
        {
%>        
	<option value="屏東縣" selected="yes">屏東縣</option>
<%	
        }
	else
	{
%>     		
	<option value="屏東縣">屏東縣</option>
	
	
<%	
        } 
        if (city.equals("宜蘭縣"))
        {
%>        
	<option value="宜蘭縣" selected="yes">宜蘭縣</option>
<%	
	}
	else
	{
%>     		
	<option value="宜蘭縣">宜蘭縣</option>
	
	
<%	
        }
        if (city.equals("花蓮縣"))
        {
%>        
	<option value="花蓮縣" selected="yes">花蓮縣</option>
<%	
	}
	else
	{
%>     		
	<option value="花蓮縣">花蓮縣</option>			

						
<%	
        } 
        if (city.equals("台東縣"))
        {
%>        
	<option value="台東縣" selected="yes">台東縣</option>
<%	
	}
	else
	{
%>     		
	<option value="台東縣">台東縣</option>			
	

<%	
        }
        if (city.equals("澎湖縣"))
        {
%>        
	<option value="澎湖縣" selected="yes">澎湖縣</option>
<%	
	}
	else
	{
%>     		
	<option value="澎湖縣">澎湖縣</option>			
	
	
<%	
        }
        if (city.equals("金門縣"))
        {
%>        
	<option value="金門縣" selected="yes">金門縣</option>
<%	
	}
	else
	{
%>     		
	<option value="金門縣">金門縣</option>			
	
	
<%	
        }
        if (city.equals("連江縣"))
        {
%>        
	<option value="連江縣" selected="yes">連江縣</option>
<%	
	}
	else
	{
%>     		
	<option value="連江縣">連江縣</option>
<%   
        } 
     }
     else
     {
%>
    <option>基隆市</option>	
	<option selected="yes">台北市</option>
    <option>新北市</option>
	<option>桃園縣</option>
	<option>新竹市</option>
	<option>新竹縣</option>
	<option>苗栗縣</option>
	<option>台中市</option>
	<option>南投縣</option>  
	<option>彰化縣</option>  
	<option>雲林縣</option>  
	<option>嘉義市</option>  
	<option>嘉義縣</option>  
	<option>台南市</option>  
	<option>高雄市</option>  
	<option>屏東縣</option>  
	<option>宜蘭縣</option>  
	<option>花蓮縣</option>  
	<option>台東縣</option>  
	<option>澎湖縣</option>  
	<option>金門縣</option>   
	<option>連江縣</option>  
<%  
     }
%>  
     </select>
                  </td>
                  <td width="30" height="110" rowspan="4"><img src="images/line.gif" alt="1" width="9" height="108"></td>
                  <td><img src="images/word_5.gif" alt="1" width="71" height="23"></td>
                  <td><input type="text" name="ad_price" value="<%= price%>"></td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_2.gif" alt="1" width="71" height="23"></td>
                  <td>                   
                   <select name="ad_air_displacement" style="width:156;">
<%
        if (air.equals("1"))
        {
%>        
	<option value="1" selected="yes">1 ~ 50 c.c.</option>	
<%	
        }
	else
	{
%>     	
	<option value="1">1 ~ 50 c.c.</option>	
<%	
        }
        if (air.equals("2"))
        {
%>        
	<option value="2" selected="yes">51 ~ 100 c.c.</option>
<%	
        }
	else
	{
%>     		
	<option value="2">51 ~ 100 c.c.</option>
<%	
        }
        if (air.equals("3"))
        {
%>        
	<option value="3" selected="yes">101 ~ 150 c.c.</option>
<%	
        }
	else
	{
%>     		
	<option value="3">101 ~ 150 c.c.</option>
<%	
        }
        if (air.equals("4"))
        {
%>        
	<option value="4" selected="yes">151 ~ 250 c.c.</option>
<%	
        }
	else
	{
%>     		
	<option value="4">151 ~ 250 c.c.</option>
<%	
        }
        if (air.equals("5"))
        {
%>        
	<option value="5" selected="yes">251 ~ 500 c.c.</option>
<%	
        }
	else
	{
%>     		
	<option value="5">251 ~ 500 c.c.</option>
<%	
        }
	if (air.equals("6"))
        {
%>        
	<option value="6" selected="yes">501 ~ 750 c.c.</option>
<%	
        }
	else
	{
%>     		
	<option value="6">501 ~ 750 c.c.</option>
<%	
        }
	if (air.equals("7"))
        {
%>        
	<option value="7" selected="yes">751 ~ 1000 c.c.</option>
<%	
        }
	else
	{
%>     		
	<option value="7">751 ~ 1000 c.c.</option>
<%	
        }
	if (air.equals("8"))
        {
%>        
	<option value="8" selected="yes">1001 ~ 1250 c.c.</option>
<%	
        }
	else
	{
%>     		
	<option value="8">1001 ~ 1250 c.c.</option>
<%	
        } 
	if (air.equals("9"))
        {
%>        
	<option value="9" selected="yes">1251 ~ 1500 c.c.</option>
<%	
        }
	else
	{
%>     		
	<option value="9">1251 ~ 1500 c.c.</option>
<%	
        }
	if (air.equals("10"))
        {
%>        
	<option value="10" selected="yes">1501 c.c. 以上</option>
<%	
        }
	else
	{
%>     		
	<option value="10">1501 c.c. 以上</option>
<%	
        } 
%> 
                   
                   </select>
                  </td>
                  <td><img src="images/word_6.gif" alt="1" width="71" height="23"></td>
                  <td><input type="text" name="ad_kilometer" value="<%= kilometer%>"></td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_3.gif" alt="1" width="71" height="23"></td>
                  <td>
                    <select name="ad_make" style="width:156;">

<%
        if (make.equals("others"))
        {
%>        
	<option value="others" selected="yes">都可以</option>	
<%	
        }
	else
	{
%>     	
	<option value="others">都可以</option>	
<%	
        }
        if (make.equals("BMW"))
        {
%>        
	<option value="BMW" selected="yes">BMW</option>
<%	
        }
	else
	{
%>     		
	<option value="BMW">BMW</option>
<%	
        }
        if (make.equals("Harley-Davidson"))
        {
%>        
	<option value="Harley-Davidson" selected="yes">Harley-Davidson 哈雷</option>
<%	
        }
	else
	{
%>     		
	<option value="Harley-Davidson">Harley-Davidson 哈雷</option>
<%	
        }
        if (make.equals("Honda"))
        {
%>        
	<option value="Honda" selected="yes">Honda 本田</option>
<%	
        }
	else
	{
%>     		
	<option value="Honda">Honda 本田</option>
<%	
        }
        if (make.equals("Kawasaki"))
        {
%>        
	<option value="Kawasaki" selected="yes">Kawasaki 川崎</option>
<%	
        }
	else
	{
%>     		
	<option value="Kawasaki">Kawasaki 川崎</option>
<%	
        } 
        if (make.equals("Kymco"))
        {
%>        
	<option value="Kymco" selected="yes">Kymco 光陽</option>	
<%	
        }
	else
	{
%>     	
	<option value="Kymco">Kymco 光陽</option>	
<%	
        }
        if (make.equals("PGO"))
        {
%>        
	<option value="PGO" selected="yes">PGO 比雅久</option>
<%	
        }
	else
	{
%>     		
	<option value="PGO">PGO 比雅久</option>
<%	
        }
        if (make.equals("Suzuki"))
        {
%>        
	<option value="Suzuki" selected="yes">Suzuki</option>
<%	
        }
	else
	{
%>     		
	<option value="Suzuki">Suzuki</option>
<%	
        }
        if (make.equals("SYM"))
        {
%>        
	<option value="SYM" selected="yes">SYM</option>
<%	
        }
	else
	{
%>     		
	<option value="SYM">SYM</option>
<%	
        }
        if (make.equals("Yamaha"))
        {
%>        
	<option value="Yamaha" selected="yes">Yamaha 山葉</option>
<%	
        }
	else
	{
%>     		
	<option value="Yamaha">Yamaha 山葉</option>
<%	
        } 
%>
                    

                    </select>
                  </td>
                  <td><img src="images/word_7.gif" alt="1" width="71" height="23"></td>
                  <td><input type="text" name="ad_model" value="<%= model%>"></td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_4.gif" alt="1" width="71" height="23"></td>
                  <td>                    
                    <select name="ad_year" style="width:156;">
					
<%
        if (year == 2016)
        {
%>        
	<option value="2016" selected="yes">2016</option>	
<%	
        }
		else
		{
%>     	
	<option value="2016">2016</option>					
<%
        }
        if (year == 2015)
        {
%>        
	<option value="2015" selected="yes">2015</option>	
<%	
        }
		else
		{
%>     	
	<option value="2015">2015</option>	
<%	
        }
        if (year == 2014)
        {
%>        
	<option value="2014" selected="yes">2014</option>	
<%	
        }
	else
	{
%>     	
	<option value="2014">2014</option>	
<%	
        }
        if (year == 2013)
        {
%>        
	<option value="2013" selected="yes">2013</option>	
<%	
        }
		else
		{
%>     	
	<option value="2013">2013</option>					
<%
        }
        if (year == 2012)
        {
%>        
	<option value="2012" selected="yes">2012</option>	
<%	
        }
		else
		{
%>     	
	<option value="2012">2012</option>	
<%	
        }
        if (year == 2011)
        {
%>        
	<option value="2011" selected="yes">2011</option>	
<%	
        }
	else
	{
%>     	
	<option value="2011">2011</option>	
<%	
        }
        if (year == 2010)
        {
%>        
	<option value="2010" selected="yes">2010</option>
<%	
        }
	else
	{
%>     		
	<option value="2010">2010</option>
<%	
        }
        if (year == 2009)
        {
%>        
	<option value="2009" selected="yes">2009</option>
<%	
        }
	else
	{
%>     		
	<option value="2009">2009</option>
<%	
        }
        if (year == 2008)
        {
%>        
	<option value="2008" selected="yes">2008</option>
<%	
        }
	else
	{
%>     		
	<option value="2008">2008</option>
<%	
        }
        if (year == 2007)
        {
%>        
	<option value="2007" selected="yes">2007</option>
<%	
        }
	else
	{
%>     		
	<option value="2007">2007</option>
<%	
        } 
        if (year == 2006)
        {
%>        
	<option value="2006" selected="yes">2006</option>	
<%	
        }
	else
	{
%>     	
	<option value="2006">2006</option>	
<%	
        }
        if (year == 2005)
        {
%>        
	<option value="2005" selected="yes">2005</option>
<%	
        }
	else
	{
%>     		
	<option value="2005">2005</option>
<%	
        }
        if (year == 2004)
        {
%>        
	<option value="2004" selected="yes">2004</option>
<%	
        }
	else
	{
%>     		
	<option value="2004">2004</option>
<%	
        }
        if (year == 2003)
        {
%>        
	<option value="2003" selected="yes">2003</option>
<%	
        }
	else
	{
%>     		
	<option value="2003">2003</option>
<%	
        }
        if (year == 2002)
        {
%>        
	<option value="2002" selected="yes">2002</option>
<%	
        }
	else
	{
%>     		
	<option value="2002">2002</option>
<%	
        } 
        if (year == 2001)
        {
%>        
	<option value="2001" selected="yes">2001</option>	
<%	
        }
	else
	{
%>     	
	<option value="2001">2001</option>	
<%	
        }
        if (year == 2000)
        {
%>        
	<option value="2000" selected="yes">2000</option>
<%	
        }
	else
	{
%>     		
	<option value="2000">2000</option>
<%	
        }
        if (year == 1999)
        {
%>        
	<option value="1999" selected="yes">1999</option>
<%	
        }
	else
	{
%>     		
	<option value="1999">1999</option>
<%	
        }
        if (year == 1998)
        {
%>        
	<option value="1998" selected="yes">1998</option>
<%	
        }
	else
	{
%>     		
	<option value="1998">1998</option>
<%	
        }
        if (year == 1997)
        {
%>        
	<option value="1997" selected="yes">1997</option>
<%	
        }
	else
	{
%>     		
	<option value="1997">1997</option>
<%	
        } 
        if (year == 1996)
        {
%>        
	<option value="1996" selected="yes">1996</option>	
<%	
        }
	else
	{
%>     	
	<option value="1996">1996</option>	
<%	
        }
        if (year == 1995)
        {
%>        
	<option value="1995" selected="yes">1995</option>
<%	
        }
	else
	{
%>     		
	<option value="1995">1995</option>
<%	
        }
        if (year == 1994)
        {
%>        
	<option value="1994" selected="yes">1994</option>
<%	
        }
	else
	{
%>     		
	<option value="1994">1994</option>
<%	
        }
        if (year == 1993)
        {
%>        
	<option value="1993" selected="yes">1993</option>
<%	
        }
	else
	{
%>     		
	<option value="1993">1993</option>
<%	
        }
        if (year == 1992)
        {
%>        
	<option value="1992" selected="yes">1992</option>
<%	
        }
	else
	{
%>     		
	<option value="1992">1992</option>
<%	
        }
        if (year == 1991)
        {
%>        
	<option value="1991" selected="yes">1991</option>	
<%	
        }
	else
	{
%>     	
	<option value="1991">1991</option>	
<%	
        }
        if (year == 1990)
        {
%>        
	<option value="1990" selected="yes">1990</option>
<%	
        }
	else
	{
%>     		
	<option value="1990">1990</option>
<%	
        }
        if (year == 1989)
        {
%>        
	<option value="1989" selected="yes">1989</option>
<%	
        }
	else
	{
%>     		
	<option value="1989">1989</option>
<%	
        }
        if (year == 1988)
        {
%>        
	<option value="1988" selected="yes">1988</option>
<%	
        }
	else
	{
%>     		
	<option value="1988">1988</option>
<%	
        }
        if (year == 1987)
        {
%>        
	<option value="1987" selected="yes">1987</option>
<%	
        }
	else
	{
%>     		
	<option value="1987">1987</option>
<%	
        } 
        if (year == 1986)
        {
%>        
	<option value="1986" selected="yes">1986</option>	
<%	
        }
	else
	{
%>     	
	<option value="1986">1986</option>	
<%	
        }
        if (year == 1985)
        {
%>        
	<option value="1985" selected="yes">1985</option>
<%	
        }
	else
	{
%>     		
	<option value="1985">1985</option>
<%	
        }
        if (year == 1984)
        {
%>        
	<option value="1984" selected="yes">1984</option>
<%	
        }
	else
	{
%>     		
	<option value="1984">1984</option>
<%	
        }
        if (year == 1983)
        {
%>        
	<option value="1983" selected="yes">1983</option>
<%	
        }
	else
	{
%>     		
	<option value="1983">1983</option>
<%	
        }
        if (year == 1982)
        {
%>        
	<option value="1982" selected="yes">1982</option>
<%	
        }
	else
	{
%>     		
	<option value="1982">1982</option>
<%	
        } 
        if (year == 1981)
        {
%>        
	<option value="1981" selected="yes">1981 以前</option>
<%	
        }
	else
	{
%>     		
	<option value="1981">1981 以前</option>
<%	
        } 
%>

                    </select> 
                  </td>
                  <td><img src="images/word_4_1.gif" alt="1" width="71" height="23"></td>
                  <td>				  
				  <select name="ad_district" style="width:156;">
				  <option value="<%= district%>" selected="yes"><%= district%></option>				  
				  </select>
				  </td>
                </tr>
				<tr>
				  <td colspan="5" align="left" valign="center">
				  <%
				     for(index = 0; index < numOfImages; index++)
					 {
					    strCheckbox = "image" + (index+1);
				  %>
						<img src=<%= image_path[index]%> width="115" height="113" class="imgborder_small">
						<INPUT TYPE="CHECKBOX" NAME="<%= strCheckbox%>" VALUE="<%= ad_image_filename[index]%>">
                        刪除
						<br>
				  <%
				     }
				  %>
				  </td>
				</tr>				
                <tr>
                  <td height="35" colspan="5" align="center" valign="bottom">
                   <input type="image" src="images/sell/button_modify.jpg" alt="Submit" width="80" height="21"/>&nbsp;
                   <input type="hidden" name="answer"/>
                   <input type="hidden" name="city"  value="<%= city %>"/>
				   <input type="hidden" name="district"  value="<%= district %>"/>
                   <input type="hidden" name="price"  value="<%= price %>"/>
                   <input type="hidden" name="air"  value="<%= air %>"/>
                   <input type="hidden" name="kilometer"  value="<%= kilometer %>"/>
                   <input type="hidden" name="make"  value="<%= make %>"/>
                   <input type="hidden" name="model"  value="<%= model %>"/>
                   <input type="hidden" name="year"  value="<%= year %>"/>
                   <input type="hidden" name="id_card_number"  value="<%= identification %>"/>
                   <input type="hidden" name="ad_number"  value="<%= ad_number %>"/>				   
                  </td>
                </tr>
              </table>
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
</form>
<%
} //end else
%>

</body>
</html>