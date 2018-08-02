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
   
  function isProcess() 
  { 
    var modified = false;
    var strNotModified = "您並未修改任何資料!";
    var strQuestion = "確定修改資料?\n";
    var answer;
	var member_phonenumber = document.myForm.area_code.value + "-" + document.myForm.member_phone.value;
        
    if(document.myForm.phone.value != member_phonenumber)
    {
        strQuestion += "電話改為 " + member_phonenumber + "\n";    
        modified = true;   
    }
    if(document.myForm.cell.value != document.myForm.member_cell.value)
    {
        strQuestion += "手機改為 " + document.myForm.member_cell.value + "\n";    
        modified = true;   
    }   
    if(document.myForm.city.value != document.myForm.member_city.value)
    {
        strQuestion += "城市改為 " + document.myForm.member_city.value + "\n";    
        modified = true;   
    }

    if(document.myForm.district.value != document.myForm.member_district.value)
    {
        strQuestion += "鄉鎮市區改為 " + document.myForm.member_district.value + "\n";    
        modified = true;
    }
	
    if(document.myForm.address.value != document.myForm.member_address.value)
    {
        strQuestion += "地址改為 " + document.myForm.member_address.value + "\n";    
        modified = true;   
    }
    if(document.myForm.individual.value == '0')
    {
       if(document.myForm.store_name.value != document.myForm.member_store_name.value)
       {
           strQuestion += "店名改為 " + document.myForm.member_store_name.value + "\n";    
           modified = true;   
       }
       if(document.myForm.license_number.value != document.myForm.member_license_number.value)
       {
          strQuestion += "統一編號改為 " + document.myForm.member_license_number.value + "\n";    
          modified = true;   
       }
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
        document.myForm.member_district.length=district[selected_index].length;
	    
	for(var i=0;i<district[selected_index].length;i++)
        {
	   document.myForm.member_district.options[i].value = district[selected_index][i];
	   document.myForm.member_district.options[i].text = district[selected_index][i];	
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


   String fromMemberPage = request.getParameter("fromMemberPage");
   
   if(fromMemberPage == null || "".equals(fromMemberPage)) 
   { 
      response.sendRedirect("login.jsp");
      return;
   }

   String showMemberInfo = request.getParameter("showMemberInfo");
   
   if(showMemberInfo == null || "".equals(showMemberInfo))
      showMemberInfo = "0";
   
///////////////
   String answer = request.getParameter("answer"); 
   if(answer == null || "".equals(answer))
      answer = "false"; 

   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "MemberPage.jsp";	
   String original_email = (String) session.getAttribute("email");
   
   if(session_id == null)
   { 
      response.sendRedirect("login.jsp");
      return;
   }
   
   if("true".equals(answer))
   {
//////////////////////////////////////////////////
   String sqlQuery = "";
   Connection dbconnection;
   ResultSet resultSet; 
   Statement sql_statement = null;
      
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   int rowCount = 0, resultCount = 0;   
   String member_name = "";   
   
   String original_contact_person = request.getParameter("contact_person");
   String original_phone = request.getParameter("phone");
   String original_cell = request.getParameter("cell");
   String original_city = request.getParameter("city");
   String original_address = request.getParameter("address");
   String individual = request.getParameter("individual");

   String original_store_name = request.getParameter("store_name");
   String original_license_number = request.getParameter("license_number");
   String original_district = request.getParameter("district");    
   
   String updated_cell = request.getParameter("member_cell");
   String updated_phone = request.getParameter("area_code") + "-" + request.getParameter("member_phone");   
   String updated_city = request.getParameter("member_city");
   String updated_address = request.getParameter("member_address");
   
   String updated_store_name = request.getParameter("member_store_name");
   String updated_license_number = request.getParameter("member_license_number");
   String updated_district = request.getParameter("member_district");

   if(updated_cell != null && !("".equals(updated_cell)))
   { 
      try
      {
         int updated_cell_number = Integer.parseInt(updated_cell);
      }
      catch(NumberFormatException e)
      {
	     response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
         return;
      }
	  
	  if(updated_cell.length() < 10)
	  {
	     response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
         return;
      }
   }
   else
   {
   	   response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
       return;       
   }


   if(request.getParameter("member_phone") != null && !("".equals(request.getParameter("member_phone"))))
   { 
      try
      {
         int updated_phone_number = Integer.parseInt(request.getParameter("member_phone"));
      }
      catch(NumberFormatException e)
      {
	     response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
         return;
      }
	  
	  if(request.getParameter("member_phone").length() < 6)
	  {
	     response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
         return;
      }
   }
   else
   {
	 response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
         return;       
   }

   if(updated_city == null || ("".equals(updated_city)))
   {
       response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
       return;   
   }

   if(updated_district == null || ("".equals(updated_district)))
   {
       response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
       return;   
   }
		
   if(updated_address == null || ("".equals(updated_address)))
   {
       response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
       return;   
   }   

   if("0".equals(individual))
   {
	   if(updated_store_name == null || ("".equals(updated_store_name)))
       { 
	       response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
           return;
       }

       if(updated_license_number != null && !("".equals(updated_license_number)))
       { 
           try
           {
               Integer.parseInt(updated_license_number);
           }
           catch(NumberFormatException e)
           {
	           response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
               return;
           }
		   
		   if(updated_license_number.length() < 8)
		   {
	           response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
               return;
           }
       }
       else
       {
	       response.sendRedirect("modify_member_info.jsp?fromMemberPage=1");
           return;       
       }
   }   
   
   boolean data_updated = false;   

   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {         
	 dbconnection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
                 
         sql_statement = dbconnection.createStatement();  
         
         sqlQuery = "UPDATE LOW_PRIORITY members SET ";
         
         if (!(original_phone.equals(updated_phone)))
         {
            if(data_updated)
               sqlQuery += ", phone_number = '" + updated_phone + "'";
            else
               sqlQuery += "phone_number = '" + updated_phone + "'"; 

            data_updated = true;
         }

         if (!(original_cell.equals(updated_cell)))
         {
            if(data_updated)
               sqlQuery += ", cell_phone = '" + updated_cell + "'";
            else
               sqlQuery += "cell_phone = '" + updated_cell + "'"; 

            data_updated = true;
         }

         if (!(original_city.equals(updated_city)))
         {
            if(data_updated)
               sqlQuery += ", city = '" + updated_city + "'";
            else
               sqlQuery += "city = '" + updated_city + "'"; 

            data_updated = true;
         }

	 if (!(original_district.equals(updated_district)))
	 {
            if(data_updated)
               sqlQuery += ", district = '" + updated_district + "'";
            else
               sqlQuery += "district = '" + updated_district + "'"; 

            data_updated = true;
         }	

         if (!(original_address.equals(updated_address)))
         {
            if(data_updated)
               sqlQuery += ", address = '" + updated_address + "'";
            else
               sqlQuery += "address = '" + updated_address + "'"; 

            data_updated = true;
         }

         if("0".equals(individual))
         {
            if (!(original_store_name.equals(updated_store_name)))
            {
               if(data_updated)
                  sqlQuery += ", store_name = '" + updated_store_name + "'";
               else
                  sqlQuery += "store_name = '" + updated_store_name + "'"; 

               data_updated = true;
            }
  
            if (!(original_license_number.equals(updated_license_number)))
            {
               if(data_updated)
                  sqlQuery += ", license_number = '" + updated_license_number + "'";
               else
                  sqlQuery += "license_number = '" + updated_license_number + "'"; 
 
               data_updated = true;
            }
         }

         sqlQuery += " where email = '" + original_email + "'";
         rowCount = sql_statement.executeUpdate(sqlQuery);
         sql_statement.close();          
         
         dbconnection.close(); 
         
         showMemberInfo = "1";  //Member info in database updated successfully; proceed to show modified member info. 
      }
      catch (SQLException sqlException)
      {         
%>	       
         Failed to modify record! <br><br>
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
if("1".equals(showMemberInfo))
{
%>

<form name="showInfo">
<%
   request.setCharacterEncoding("UTF8");
   
   String str_email = (String) session.getAttribute("email");

   String query;
   Connection connection;
   ResultSet resultSet;
   Statement sqlStmt = null;
   
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   
   String contact_person="", phone="", cell="", city="", address="", store_name="", license_number="";
   
   String district = "";
   
   String modify_link = "modify_member_info.jsp?fromMemberPage=1";	
	
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {
         
	 connection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         sqlStmt = connection.createStatement();
            
		 query = "select * from members where email= '" + str_email + "'";
                  
         resultSet = sqlStmt.executeQuery(query);

         // iterate through the result set
         while (resultSet.next())
         {
             contact_person = resultSet.getString("name");
             phone = resultSet.getString("phone_number");			 
             cell = resultSet.getString("cell_phone");
             city = resultSet.getString("city");
             address = resultSet.getString("address");
             store_name = resultSet.getString("store_name");
             license_number = resultSet.getString("license_number");
	     district = resultSet.getString("district");	
         }
		 
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
        <td width="890" height="55" valign="top"> 　　<img src="images/sell/banner_modify_memberdata.gif" width="835" height="27"></td>
      </tr>

      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" height="200" valign="bottom">&nbsp;</td>
            <td valign="bottom"><form name="form2" method="post" action="">
              <table width="610" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="80" height="30"><img src="images/sell/word_create_account3.gif" alt="1" width="75" height="23"></td>
                  <td><%= phone%></td>
<%
          if("na".equals(license_number))
          {
%> 
                  <td width="30" height="0" rowspan="3"><img src="images/sell/long_line.gif" alt="1" width="5" height="78"></td>
<%
          }
          else
          {
%>
                  <td width="30" height="0" rowspan="4"><img src="images/sell/long_line.gif" alt="1" width="5" height="108"></td>
<%
          }
%>
                  <td width="80"><img src="images/sell/word_create_account7.gif" alt="1" width="75" height="23"></td>
                  <td><%= cell%></td>
                </tr>
                <tr>
                  <td height="30"><img src="images/sell/word_create_account4.gif" alt="1" width="75" height="23"></td>
                  <td><%= city%></td>
                  <td><img src="images/sell/word_create_account9.gif" alt="11" width="75" height="23"></td>
                  <td><%= address%></td>
                </tr>
<%
            if(!("na".equals(license_number)))
            {
%>
                <tr>
                  <td height="30"><img src="images/sell/word_create_account5.gif" alt="1" width="75" height="23"></td>
                  <td><%= store_name%></td>
                  <td><img src="images/sell/gui_number.jpg" alt="1" width="75" height="23"></td>
                  <td><%= license_number%></td>
                </tr>                
<%
            }
%>

		<tr>
                  <td height="30" valign="middle">鄉鎮縣市</td>
                  <td><%= district%></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>

                <tr>
                  <td height="60" colspan="5" align="center" valign="bottom">                  　
                  <a href=<%= modify_link%>><img src="images/sell/button_modifydata.jpg" width="80" height="21" border="0"></a>&nbsp;
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
</form>

<%
}// end if("1".equals(showMemberInfo))
else 
{
%>

<form name="myForm" method="post" onSubmit="isProcess();">
<%
   request.setCharacterEncoding("UTF8");
   
   String param_email = (String) session.getAttribute("email");
   String query;
   Connection connection;
   ResultSet resultSet;
   Statement sqlStmt = null;
   
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   
   String contact_person="", phone="", cell="", city="", address="", store_name="", license_number="", individual="";
   int selected_city = 1;
   String district = "";	
   String area_code="";
   String telephone_number="";
   int dash_index = 0;
   
   try
   {
      Class.forName(JDBC_DRIVER);
      try
      {
         
	 connection = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         sqlStmt = connection.createStatement();
      
      
         query = "select * from members where email= '" + param_email + "'";         
                  
         resultSet = sqlStmt.executeQuery(query);


         // iterate through the result set
         while (resultSet.next())
         {
             contact_person = resultSet.getString("name");
             phone = resultSet.getString("phone_number");
             cell = resultSet.getString("cell_phone");
             city = resultSet.getString("city");
             address = resultSet.getString("address");
             store_name = resultSet.getString("store_name");
             license_number = resultSet.getString("license_number");
	     district = resultSet.getString("district");
         }         
		 
         if("na".equals(license_number))
         {
            individual = "1";
         }
         else
         {
            individual = "0";
         }   

		 dash_index = phone.indexOf('-');
		 
		 if(-1 != dash_index)
		 {
		    area_code = phone.substring(0, dash_index);
			
			if(phone.length() > (dash_index+1))
		    {
		       telephone_number = phone.substring(dash_index+1, phone.length());
		    }
			
			//phone = area_code + telephone_number;
		 }		 
		 
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
        <td width="890" height="55" valign="top"> 　　<img src="images/sell/banner_modify_memberdata.gif" width="835" height="27"></td>
      </tr>

      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" height="200" valign="bottom">&nbsp;</td>
            <td valign="bottom">
              <table width="610" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="80" height="30"><img src="images/sell/word_create_account3.gif" alt="1" width="75" height="23"></td>
                  <td>
				  <select name="area_code" style="width:70px;">
<%
                    if(area_code.equals("02"))
                    {
%>
                     <option selected="yes">02</option>
<%
                    }
                    else
                    {
%>
                     <option>02</option>
<%
                    }
                    if(area_code.equals("03"))
                    {
%>
                     <option selected="yes">03</option>
<%
                    }
                    else
                    {
%>
                     <option>03</option>
<%
                    }
                    if(area_code.equals("037"))
                    {
%>
                     <option selected="yes">037</option>
<%
                    }
                    else
                    {
%>
                     <option>037</option>
<%
                    }
                    if(area_code.equals("04"))
                    {
%> 
                     <option selected="yes">04</option>
<%
                    }
                    else
                    {
%>
                     <option>04</option>
<%
                    }
                    if(area_code.equals("049"))
                    {
%>
                     <option selected="yes">049</option>
<%
                    }
                    else
                    {
%>
                     <option>049</option>
<%
                    }
                    if(area_code.equals("05"))
                    {
%>
                     <option selected="yes">05</option>
<%
                    }
                    else
                    {
%>
                     <option>05</option>
<%
                    }
                    if(area_code.equals("06"))
                    {
%>
                     <option selected="yes">06</option>
<%
                    }
                    else
                    {
%>
                     <option>06</option>
<%
                    }
                    if(area_code.equals("07"))
                    {
%>
                     <option selected="yes">07</option>
<%
                    }
                    else
                    {
%>
                     <option>07</option>
<%
                    }
                    if(area_code.equals("08"))
                    {
%>
                     <option selected="yes">08</option>
<%
                    }
                    else
                    {
%>
                     <option>08</option>
<%
                    }
                    if(area_code.equals("082"))
                    {
%>
                     <option selected="yes">082</option>
<%
                    }
                    else
                    {
%>
                     <option>082</option>
<%
                    }
                    if(area_code.equals("0826"))
                    {
%>
                     <option selected="yes">0826</option>
<%
                    }
                    else
                    {
%>
                     <option>0826</option>
<%
                    }
                    if(area_code.equals("0836"))
                    {
%>
                     <option selected="yes">0836</option>
<%
                    }
                    else
                    {
%>
                     <option>0836</option>
<%
                    }
                    if(area_code.equals("089"))
                    {
%>
                     <option selected="yes">089</option>
<%
                    }
                    else
                    {
%>
                     <option>089</option>
<%
                    }                    
%>                     
                   </select>
				  
				  <input type="text" name="member_phone" style="width:80px" maxlength="8" value="<%= telephone_number%>">				  
				  </td>
<%
          if("na".equals(license_number))
          {
%>
                  <td width="30" height="0" rowspan="3"><img src="images/sell/long_line.gif" alt="1" width="5" height="78"></td>
<%
          }
          else
          {
%>
                  <td width="30" height="0" rowspan="4"><img src="images/sell/long_line.gif" alt="1" width="5" height="108"></td>
<%
          }
%>
                  <td width="80"><img src="images/sell/word_create_account7.gif" alt="1" width="75" height="23"></td>
                  <td><input type="text" name="member_cell" value="<%= cell%>"></td>
                </tr>
                <tr>                  
                  <td height="30"><img src="images/sell/word_create_account4.gif" alt="1" width="75" height="23"></td>
                  <td>
                   <select name="member_city" style="width:156;" onChange="changeZone(this.selectedIndex);">
<%   
     if (city != null) 
     {
        if (city.equals("基隆市"))
        {
	selected_city = 0;
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
	selected_city = 1;
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
	selected_city = 2;
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
	selected_city = 3;
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
	selected_city = 4;
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
	selected_city = 5;
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
	selected_city = 6;
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
	selected_city = 7;
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
	selected_city = 8;
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
	selected_city = 9;
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
	selected_city = 10;
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
	selected_city = 11;
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
	selected_city = 12;
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
	selected_city = 13;
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
	selected_city = 14;
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
	selected_city = 15;
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
	selected_city = 16;
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
	selected_city = 17;
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
	selected_city = 18;
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
	selected_city = 19;
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
	selected_city = 20;
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
	selected_city = 21;
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
                <td><img src="images/sell/word_create_account9.gif" alt="11" width="75" height="23"></td>
                <td><input type="text" name="member_address" value="<%= address%>"></td>
                </tr>
<%
        if("0".equals(individual))
        {
%>
                <tr>
                  <td height="30"><img src="images/sell/word_create_account5.gif" alt="1" width="75" height="23"></td>
                  <td><input type="text" name="member_store_name" value="<%= store_name%>"></td>
                  <td><img src="images/sell/gui_number.jpg" alt="1" width="75" height="23"></td>
                  <td><input type="text" name="member_license_number" maxlength="8" value="<%= license_number%>"></td>
                </tr>                
<%
        } 
%>
 
		<tr>
                  <td height="30" valign="middle">鄉鎮縣市</td>
                  <td>
		    <select name="member_district" style="width:156;">

<%
		if(district != null)
		{
		   switch(selected_city)
		   {
		      case 0:  //基隆市
		      {
			 if(district.equals("仁愛區"))
                         {
%>
		         <option value="仁愛區" selected="yes">仁愛區</option>
<%
			 }
			 else
			 {
%>
		         <option value="仁愛區">仁愛區</option>
<%
			 }	
			 if(district.equals("信義區"))
                         {
%>
		         <option value="信義區" selected="yes">信義區</option>
<%
			 }
			 else
			 {
%>
		         <option value="信義區">信義區</option>
<%
			 }
			 if(district.equals("中正區"))
                         {
%>
		         <option value="中正區" selected="yes">中正區</option>
<%
			 }
			 else
			 {
%>
		         <option value="中正區">中正區</option>
<%
			 }
			 if(district.equals("中山區"))
                         {
%>
		         <option value="中山區" selected="yes">中山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="中山區">中山區</option>
<%
			 }
			 if(district.equals("安樂區"))
                         {
%>
		         <option value="安樂區" selected="yes">安樂區</option>
<%
			 }
			 else
			 {
%>
		         <option value="安樂區">安樂區</option>
<%
			 }
			 if(district.equals("暖暖區"))
                         {
%>
		         <option value="暖暖區" selected="yes">暖暖區</option>
<%
			 }
			 else
			 {
%>
		         <option value="暖暖區">暖暖區</option>
<%
			 }
			 if(district.equals("七堵區"))
                         {
%>
		         <option value="七堵區" selected="yes">七堵區</option>
<%
			 }
			 else
			 {
%>
		         <option value="七堵區">七堵區</option>
<%
			 }
		      }
		      break;
		      case 1: //台北市
		      {
			 if(district.equals("中正區"))
                         {
%>
		         <option value="中正區" selected="yes">中正區</option>
<%
			 }
			 else
			 {
%>
		         <option value="中正區">中正區</option>
<%
			 }	
			 if(district.equals("大同區"))
                         {
%>
		         <option value="大同區" selected="yes">大同區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大同區">大同區</option>
<%
			 }
			 if(district.equals("中山區"))
                         {
%>
		         <option value="中山區" selected="yes">中山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="中山區">中山區</option>
<%
			 }
			 if(district.equals("松山區"))
                         {
%>
		         <option value="松山區" selected="yes">松山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="松山區">松山區</option>
<%
			 }
			 if(district.equals("大安區"))
                         {
%>
		         <option value="大安區" selected="yes">大安區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大安區">大安區</option>
<%
			 }
			 if(district.equals("萬華區"))
                         {
%>
		         <option value="萬華區" selected="yes">萬華區</option>
<%
			 }
			 else
			 {
%>
		         <option value="萬華區">萬華區</option>
<%
			 }
			 if(district.equals("信義區"))
                         {
%>
		         <option value="信義區" selected="yes">信義區</option>
<%
			 }
			 else
			 {
%>
		         <option value="信義區">信義區</option>
<%
			 }
			 if(district.equals("士林區"))
                         {
%>
		         <option value="士林區" selected="yes">士林區</option>
<%
			 }
			 else
			 {
%>
		         <option value="士林區">士林區</option>
<%
			 }	
			 if(district.equals("北投區"))
                         {
%>
		         <option value="北投區" selected="yes">北投區</option>
<%
			 }
			 else
			 {
%>
		         <option value="北投區">北投區</option>
<%
			 }
			 if(district.equals("內湖區"))
                         {
%>
		         <option value="內湖區" selected="yes">內湖區</option>
<%
			 }
			 else
			 {
%>
		         <option value="內湖區">內湖區</option>
<%
			 }
			 if(district.equals("南港區"))
                         {
%>
		         <option value="南港區" selected="yes">南港區</option>
<%
			 }
			 else
			 {
%>
		         <option value="南港區">南港區</option>
<%
			 }
			 if(district.equals("文山區"))
                         {
%>
		         <option value="文山區" selected="yes">文山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="文山區">文山區</option>
<%
			 }
		      }
		      break;
		      case 2: //新北市
		      {
			 if(district.equals("萬里區"))
                         {
%>
		         <option value="萬里區" selected="yes">萬里區</option>
<%
			 }
			 else
			 {
%>
		         <option value="萬里區">萬里區</option>
<%
			 }	
			 if(district.equals("金山區"))
                         {
%>
		         <option value="金山區" selected="yes">金山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="金山區">金山區</option>
<%
			 }
			 if(district.equals("板橋區"))
                         {
%>
		         <option value="板橋區" selected="yes">板橋區</option>
<%
			 }
			 else
			 {
%>
		         <option value="板橋區">板橋區</option>
<%
			 }
			 if(district.equals("汐止區"))
                         {
%>
		         <option value="汐止區" selected="yes">汐止區</option>
<%
			 }
			 else
			 {
%>
		         <option value="汐止區">汐止區</option>
<%
			 }
			 if(district.equals("深坑區"))
                         {
%>
		         <option value="深坑區" selected="yes">深坑區</option>
<%
			 }
			 else
			 {
%>
		         <option value="深坑區">深坑區</option>
<%
			 }
			 if(district.equals("石碇區"))
                         {
%>
		         <option value="石碇區" selected="yes">石碇區</option>
<%
			 }
			 else
			 {
%>
		         <option value="石碇區">石碇區</option>
<%
			 }
			 if(district.equals("瑞芳區"))
                         {
%>
		         <option value="瑞芳區" selected="yes">瑞芳區</option>
<%
			 }
			 else
			 {
%>
		         <option value="瑞芳區">瑞芳區</option>
<%
			 }
			 if(district.equals("平溪區"))
                         {
%>
		         <option value="平溪區" selected="yes">平溪區</option>
<%
			 }
			 else
			 {
%>
		         <option value="平溪區">平溪區</option>
<%
			 }	
			 if(district.equals("雙溪區"))
                         {
%>
		         <option value="雙溪區" selected="yes">雙溪區</option>
<%
			 }
			 else
			 {
%>
		         <option value="雙溪區">雙溪區</option>
<%
			 }
			 if(district.equals("貢寮區"))
                         {
%>
		         <option value="貢寮區" selected="yes">貢寮區</option>
<%
			 }
			 else
			 {
%>
		         <option value="貢寮區">貢寮區</option>
<%
			 }
			 if(district.equals("新店區"))
                         {
%>
		         <option value="新店區" selected="yes">新店區</option>
<%
			 }
			 else
			 {
%>
		         <option value="新店區">新店區</option>
<%
			 }
			 if(district.equals("坪林區"))
                         {
%>
		         <option value="坪林區" selected="yes">坪林區</option>
<%
			 }
			 else
			 {
%>
		         <option value="坪林區">坪林區</option>
<%
			 }
			 if(district.equals("烏來區"))
                         {
%>
		         <option value="烏來區" selected="yes">烏來區</option>
<%
			 }
			 else
			 {
%>
		         <option value="烏來區">烏來區</option>
<%
			 }
			 if(district.equals("永和區"))
                         {
%>
		         <option value="永和區" selected="yes">永和區</option>
<%
			 }
			 else
			 {
%>
		         <option value="永和區">永和區</option>
<%
			 }
			 if(district.equals("中和區"))
                         {
%>
		         <option value="中和區" selected="yes">中和區</option>
<%
			 }
			 else
			 {
%>
		         <option value="中和區">中和區</option>
<%
			 }
			 if(district.equals("土城區"))
                         {
%>
		         <option value="土城區" selected="yes">土城區</option>
<%
			 }
			 else
			 {
%>
		         <option value="土城區">土城區</option>
<%
			 }
			 if(district.equals("三峽區"))
                         {
%>
		         <option value="三峽區" selected="yes">三峽區</option>
<%
			 }
			 else
			 {
%>
		         <option value="三峽區">三峽區</option>
<%
			 }
			 if(district.equals("樹林區"))
                         {
%>
		         <option value="樹林區" selected="yes">樹林區</option>
<%
			 }
			 else
			 {
%>
		         <option value="樹林區">樹林區</option>
<%
			 }
			 if(district.equals("鶯歌區"))
                         {
%>
		         <option value="鶯歌區" selected="yes">鶯歌區</option>
<%
			 }
			 else
			 {
%>
		         <option value="鶯歌區">鶯歌區</option>
<%
			 }
			 if(district.equals("三重區"))
                         {
%>
		         <option value="三重區" selected="yes">三重區</option>
<%
			 }
			 else
			 {
%>
		         <option value="三重區">三重區</option>
<%
			 }
			 if(district.equals("新莊區"))
                         {
%>
		         <option value="新莊區" selected="yes">新莊區</option>
<%
			 }
			 else
			 {
%>
		         <option value="新莊區">新莊區</option>
<%
			 }	
			 if(district.equals("泰山區"))
                         {
%>
		         <option value="泰山區" selected="yes">泰山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="泰山區">泰山區</option>
<%
			 }
			 if(district.equals("林口區"))
                         {
%>
		         <option value="林口區" selected="yes">林口區</option>
<%
			 }
			 else
			 {
%>
		         <option value="林口區">林口區</option>
<%
			 }
			 if(district.equals("蘆洲區"))
                         {
%>
		         <option value="蘆洲區" selected="yes">蘆洲區</option>
<%
			 }
			 else
			 {
%>
		         <option value="蘆洲區">蘆洲區</option>
<%
			 }
			 if(district.equals("五股區"))
                         {
%>
		         <option value="五股區" selected="yes">五股區</option>
<%
			 }
			 else
			 {
%>
		         <option value="五股區">五股區</option>
<%
			 }
			 if(district.equals("八里區"))
                         {
%>
		         <option value="八里區" selected="yes">八里區</option>
<%
			 }
			 else
			 {
%>
		         <option value="八里區">八里區</option>
<%
			 }
			 if(district.equals("淡水區"))
                         {
%>
		         <option value="淡水區" selected="yes">淡水區</option>
<%
			 }
			 else
			 {
%>
		         <option value="淡水區">淡水區</option>
<%
			 }
			 if(district.equals("三芝區"))
                         {
%>
		         <option value="三芝區" selected="yes">三芝區</option>
<%
			 }
			 else
			 {
%>
		         <option value="三芝區">三芝區</option>
<%
			 }
			 if(district.equals("石門區"))
                         {
%>
		         <option value="石門區" selected="yes">石門區</option>
<%
			 }
			 else
			 {
%>
		         <option value="石門區"></option>
<%
			 }
		      }
		      break;
		      case 3:  //桃園縣
		      {
			 if(district.equals("中壢市"))
                         {
%>
		         <option value="中壢市" selected="yes">中壢市</option>
<%
			 }
			 else
			 {
%>
		         <option value="中壢市">中壢市</option>
<%
			 }	
			 if(district.equals("平鎮市"))
                         {
%>
		         <option value="平鎮市" selected="yes">平鎮市</option>
<%
			 }
			 else
			 {
%>
		         <option value="平鎮市">平鎮市</option>
<%
			 }
			 if(district.equals("龍潭鄉"))
                         {
%>
		         <option value="龍潭鄉" selected="yes">龍潭鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="龍潭鄉">龍潭鄉</option>
<%
			 }
			 if(district.equals("楊梅市"))
                         {
%>
		         <option value="楊梅市" selected="yes">楊梅市</option>
<%
			 }
			 else
			 {
%>
		         <option value="楊梅市">楊梅市</option>
<%
			 }
			 if(district.equals("新屋鄉"))
                         {
%>
		         <option value="新屋鄉" selected="yes">新屋鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="新屋鄉">新屋鄉</option>
<%
			 }
			 if(district.equals("觀音鄉"))
                         {
%>
		         <option value="觀音鄉" selected="yes">觀音鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="觀音鄉">觀音鄉</option>
<%
			 }
			 if(district.equals("桃園市"))
                         {
%>
		         <option value="桃園市" selected="yes">桃園市</option>
<%
			 }
			 else
			 {
%>
		         <option value="桃園市">桃園市</option>
<%
			 }
			 if(district.equals("龜山鄉"))
                         {
%>
		         <option value="龜山鄉" selected="yes">龜山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="龜山鄉">龜山鄉</option>
<%
			 }	
			 if(district.equals("八德市"))
                         {
%>
		         <option value="八德市" selected="yes">八德市</option>
<%
			 }
			 else
			 {
%>
		         <option value="八德市">八德市</option>
<%
			 }
			 if(district.equals("大溪鎮"))
                         {
%>
		         <option value="大溪鎮" selected="yes">大溪鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="大溪鎮">大溪鎮</option>
<%
			 }
			 if(district.equals("復興鄉"))
                         {
%>
		         <option value="復興鄉" selected="yes">復興鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="復興鄉">復興鄉</option>
<%
			 }
			 if(district.equals("大園鄉"))
                         {
%>
		         <option value="大園鄉" selected="yes">大園鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="大園鄉">大園鄉</option>
<%
			 }
			 if(district.equals("蘆竹鄉"))
                         {
%>
		         <option value="蘆竹鄉" selected="yes">蘆竹鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="蘆竹鄉">蘆竹鄉</option>
<%
			 }
		      }
		      break;
		      case 4:  //新竹市
		      {
			 if(district.equals("東區"))
                         {
%>
		         <option value="東區" selected="yes">東區</option>
<%
			 }
			 else
			 {
%>
		         <option value="東區">東區</option>
<%
			 }
			 if(district.equals("北區"))
                         {
%>
		         <option value="北區" selected="yes">北區</option>
<%
			 }
			 else
			 {
%>
		         <option value="北區">北區</option>
<%
			 }
			 if(district.equals("香山區"))
                         {
%>
		         <option value="香山區" selected="yes">香山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="香山區">香山區</option>
<%
			 }
		      }
		      break;
		      case 5:  //新竹縣
		      {
			 if(district.equals("竹北市"))
                         {
%>
		         <option value="竹北市" selected="yes">竹北市</option>
<%
			 }
			 else
			 {
%>
		         <option value="竹北市">竹北市</option>
<%
			 }	
			 if(district.equals("湖口鄉"))
                         {
%>
		         <option value="湖口鄉" selected="yes">湖口鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="湖口鄉">湖口鄉</option>
<%
			 }
			 if(district.equals("新豐鄉"))
                         {
%>
		         <option value="新豐鄉" selected="yes">新豐鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="新豐鄉">新豐鄉</option>
<%
			 }
			 if(district.equals("新埔鎮"))
                         {
%>
		         <option value="新埔鎮" selected="yes">新埔鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="新埔鎮">新埔鎮</option>
<%
			 }
			 if(district.equals("關西鎮"))
                         {
%>
		         <option value="關西鎮" selected="yes">關西鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="關西鎮">關西鎮</option>
<%
			 }
			 if(district.equals("芎林鄉"))
                         {
%>
		         <option value="芎林鄉" selected="yes">芎林鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="芎林鄉">芎林鄉</option>
<%
			 }
			 if(district.equals("寶山鄉"))
                         {
%>
		         <option value="寶山鄉" selected="yes">寶山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="寶山鄉">寶山鄉</option>
<%
			 }
			 if(district.equals("竹東鎮"))
                         {
%>
		         <option value="竹東鎮" selected="yes">竹東鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="竹東鎮">竹東鎮</option>
<%
			 }	
			 if(district.equals("五峰鄉"))
                         {
%>
		         <option value="五峰鄉" selected="yes">五峰鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="五峰鄉">五峰鄉</option>
<%
			 }
			 if(district.equals("橫山鄉"))
                         {
%>
		         <option value="橫山鄉" selected="yes">橫山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="橫山鄉">橫山鄉</option>
<%
			 }
			 if(district.equals("尖石鄉"))
                         {
%>
		         <option value="尖石鄉" selected="yes">尖石鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="尖石鄉">尖石鄉</option>
<%
			 }
			 if(district.equals("北埔鄉"))
                         {
%>
		         <option value="北埔鄉" selected="yes">北埔鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="北埔鄉">北埔鄉</option>
<%
			 }
			 if(district.equals("峨眉鄉"))
                         {
%>
		         <option value="峨眉鄉" selected="yes">峨眉鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="峨眉鄉">峨眉鄉</option>
<%
			 }
		      }
		      break;
		      case 6:  //苗栗縣
		      {
			 if(district.equals("竹南鎮"))
                         {
%>
		         <option value="竹南鎮" selected="yes">竹南鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="竹南鎮">竹南鎮</option>
<%
			 }	
			 if(district.equals("頭份鎮"))
                         {
%>
		         <option value="頭份鎮" selected="yes">頭份鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="頭份鎮">頭份鎮</option>
<%
			 }
			 if(district.equals("三灣鄉"))
                         {
%>
		         <option value="三灣鄉" selected="yes">三灣鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="三灣鄉">三灣鄉</option>
<%
			 }
			 if(district.equals("南庄鄉"))
                         {
%>
		         <option value="南庄鄉" selected="yes">南庄鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="南庄鄉">南庄鄉</option>
<%
			 }
			 if(district.equals("獅潭鄉"))
                         {
%>
		         <option value="獅潭鄉" selected="yes">獅潭鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="獅潭鄉">獅潭鄉</option>
<%
			 }
			 if(district.equals("後龍鎮"))
                         {
%>
		         <option value="後龍鎮" selected="yes">後龍鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="後龍鎮">後龍鎮</option>
<%
			 }
			 if(district.equals("通宵鎮"))
                         {
%>
		         <option value="通宵鎮" selected="yes">通宵鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="通宵鎮">通宵鎮</option>
<%
			 }
			 if(district.equals("苑裡鎮"))
                         {
%>
		         <option value="苑裡鎮" selected="yes">苑裡鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="苑裡鎮">苑裡鎮</option>
<%
			 }	
			 if(district.equals("苗栗市"))
                         {
%>
		         <option value="苗栗市" selected="yes">苗栗市</option>
<%
			 }
			 else
			 {
%>
		         <option value="苗栗市">苗栗市</option>
<%
			 }
			 if(district.equals("造橋鄉"))
                         {
%>
		         <option value="造橋鄉" selected="yes">造橋鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="造橋鄉">造橋鄉</option>
<%
			 }
			 if(district.equals("頭屋鄉"))
                         {
%>
		         <option value="頭屋鄉" selected="yes">頭屋鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="頭屋鄉">頭屋鄉</option>
<%
			 }
			 if(district.equals("公館鄉"))
                         {
%>
		         <option value="公館鄉" selected="yes">公館鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="公館鄉">公館鄉</option>
<%
			 }
			 if(district.equals("大湖鄉"))
                         {
%>
		         <option value="大湖鄉" selected="yes">大湖鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="大湖鄉">大湖鄉</option>
<%
			 }
			 if(district.equals("泰安鄉"))
                         {
%>
		         <option value="泰安鄉" selected="yes">泰安鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="泰安鄉">泰安鄉</option>
<%
			 }
			 if(district.equals("銅鑼鄉"))
                         {
%>
		         <option value="銅鑼鄉" selected="yes">銅鑼鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="銅鑼鄉">銅鑼鄉</option>
<%
			 }
			 if(district.equals("三義鄉"))
                         {
%>
		         <option value="三義鄉" selected="yes">三義鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="三義鄉">三義鄉</option>
<%
			 }
			 if(district.equals("西湖鄉"))
                         {
%>
		         <option value="西湖鄉" selected="yes">西湖鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="西湖鄉">西湖鄉</option>
<%
			 }	
			 if(district.equals("卓蘭鎮"))
                         {
%>
		         <option value="卓蘭鎮" selected="yes">卓蘭鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="卓蘭鎮">卓蘭鎮</option>
<%
			 }
		      }
		      break;
		      case 7: //台中市
		      {
			 if(district.equals("中區"))
                         {
%>
		         <option value="中區" selected="yes">中區</option>
<%
			 }
			 else
			 {
%>
		         <option value="中區">中區</option>
<%
			 }	
			 if(district.equals("東區"))
                         {
%>
		         <option value="東區" selected="yes">東區</option>
<%
			 }
			 else
			 {
%>
		         <option value="東區">東區</option>
<%
			 }
			 if(district.equals("南區"))
                         {
%>
		         <option value="南區" selected="yes">南區</option>
<%
			 }
			 else
			 {
%>
		         <option value="南區">南區</option>
<%
			 }
			 if(district.equals("西區"))
                         {
%>
		         <option value="西區" selected="yes">西區</option>
<%
			 }
			 else
			 {
%>
		         <option value="西區">西區</option>
<%
			 }
			 if(district.equals("北區"))
                         {
%>
		         <option value="北區" selected="yes">北區</option>
<%
			 }
			 else
			 {
%>
		         <option value="北區">北區</option>
<%
			 }
			 if(district.equals("北屯區"))
                         {
%>
		         <option value="北屯區" selected="yes">北屯區</option>
<%
			 }
			 else
			 {
%>
		         <option value="北屯區">北屯區</option>
<%
			 }
			 if(district.equals("西屯區"))
                         {
%>
		         <option value="西屯區" selected="yes">西屯區</option>
<%
			 }
			 else
			 {
%>
		         <option value="西屯區">西屯區</option>
<%
			 }
			 if(district.equals("南屯區"))
                         {
%>
		         <option value="南屯區" selected="yes">南屯區</option>
<%
			 }
			 else
			 {
%>
		         <option value="南屯區">南屯區</option>
<%
			 }	
			 if(district.equals("太平區"))
                         {
%>
		         <option value="太平區" selected="yes">太平區</option>
<%
			 }
			 else
			 {
%>
		         <option value="太平區">太平區</option>
<%
			 }
			 if(district.equals("大里區"))
                         {
%>
		         <option value="大里區" selected="yes">大里區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大里區">大里區</option>
<%
			 }
			 if(district.equals("霧峰區"))
                         {
%>
		         <option value="霧峰區" selected="yes">霧峰區</option>
<%
			 }
			 else
			 {
%>
		         <option value="霧峰區">霧峰區</option>
<%
			 }
			 if(district.equals("烏日區"))
                         {
%>
		         <option value="烏日區" selected="yes">烏日區</option>
<%
			 }
			 else
			 {
%>
		         <option value="烏日區">烏日區</option>
<%
			 }
			 if(district.equals("豐原區"))
                         {
%>
		         <option value="豐原區" selected="yes">豐原區</option>
<%
			 }
			 else
			 {
%>
		         <option value="豐原區">豐原區</option>
<%
			 }
			 if(district.equals("后里區"))
                         {
%>
		         <option value="后里區" selected="yes">后里區</option>
<%
			 }
			 else
			 {
%>
		         <option value="后里區">后里區</option>
<%
			 }
			 if(district.equals("石岡區"))
                         {
%>
		         <option value="石岡區" selected="yes">石岡區</option>
<%
			 }
			 else
			 {
%>
		         <option value="石岡區">石岡區</option>
<%
			 }
			 if(district.equals("東勢區"))
                         {
%>
		         <option value="東勢區" selected="yes">東勢區</option>
<%
			 }
			 else
			 {
%>
		         <option value="東勢區">東勢區</option>
<%
			 }
			 if(district.equals("和平區"))
                         {
%>
		         <option value="和平區" selected="yes">和平區</option>
<%
			 }
			 else
			 {
%>
		         <option value="和平區">和平區</option>
<%
			 }
			 if(district.equals("新社區"))
                         {
%>
		         <option value="新社區" selected="yes">新社區</option>
<%
			 }
			 else
			 {
%>
		         <option value="新社區">新社區</option>
<%
			 }
			 if(district.equals("潭子區"))
                         {
%>
		         <option value="潭子區" selected="yes">潭子區</option>
<%
			 }
			 else
			 {
%>
		         <option value="潭子區">潭子區</option>
<%
			 }
			 if(district.equals("大雅區"))
                         {
%>
		         <option value="大雅區" selected="yes">大雅區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大雅區">大雅區</option>
<%
			 }
			 if(district.equals("神岡區"))
                         {
%>
		         <option value="神岡區" selected="yes">神岡區</option>
<%
			 }
			 else
			 {
%>
		         <option value="神岡區">神岡區</option>
<%
			 }
			 if(district.equals("大肚區"))
                         {
%>
		         <option value="大肚區" selected="yes">大肚區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大肚區">大肚區</option>
<%
			 }
			 if(district.equals("沙鹿區"))
                         {
%>
		         <option value="沙鹿區" selected="yes">沙鹿區</option>
<%
			 }
			 else
			 {
%>
		         <option value="沙鹿區">沙鹿區</option>
<%
			 }
			 if(district.equals("龍井區"))
                         {
%>
		         <option value="龍井區" selected="yes">龍井區</option>
<%
			 }
			 else
			 {
%>
		         <option value="龍井區">龍井區</option>
<%
			 }
			 if(district.equals("梧棲區"))
                         {
%>
		         <option value="梧棲區" selected="yes">梧棲區</option>
<%
			 }
			 else
			 {
%>
		         <option value="梧棲區">梧棲區</option>
<%
			 }
			 if(district.equals("清水區"))
                         {
%>
		         <option value="清水區" selected="yes">清水區</option>
<%
			 }
			 else
			 {
%>
		         <option value="清水區">清水區</option>
<%
			 }
			 if(district.equals("大甲區"))
                         {
%>
		         <option value="大甲區" selected="yes">大甲區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大甲區">大甲區</option>
<%
			 }
			 if(district.equals("外埔區"))
                         {
%>
		         <option value="外埔區" selected="yes">外埔區</option>
<%
			 }
			 else
			 {
%>
		         <option value="外埔區">外埔區</option>
<%
			 }
			 if(district.equals("大安區"))
                         {
%>
		         <option value="大安區" selected="yes">大安區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大安區">大安區</option>
<%
			 }
		      }
		      break;
		      case 8: //南投縣
		      {
			 if(district.equals("南投市"))
                         {
%>
		         <option value="南投市" selected="yes">南投市</option>
<%
			 }
			 else
			 {
%>
		         <option value="南投市">南投市</option>
<%
			 }	
			 if(district.equals("中寮鄉"))
                         {
%>
		         <option value="中寮鄉" selected="yes">中寮鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="中寮鄉">中寮鄉</option>
<%
			 }
			 if(district.equals("草屯鎮"))
                         {
%>
		         <option value="草屯鎮" selected="yes">草屯鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="草屯鎮">草屯鎮</option>
<%
			 }
			 if(district.equals("國姓鄉"))
                         {
%>
		         <option value="國姓鄉" selected="yes">國姓鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="國姓鄉">國姓鄉</option>
<%
			 }
			 if(district.equals("埔里鎮"))
                         {
%>
		         <option value="埔里鎮" selected="yes">埔里鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="埔里鎮">埔里鎮</option>
<%
			 }
			 if(district.equals("仁愛鄉"))
                         {
%>
		         <option value="仁愛鄉" selected="yes">仁愛鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="仁愛鄉">仁愛鄉</option>
<%
			 }
			 if(district.equals("名間鄉"))
                         {
%>
		         <option value="名間鄉" selected="yes">名間鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="名間鄉">名間鄉</option>
<%
			 }
			 if(district.equals("集集鎮"))
                         {
%>
		         <option value="集集鎮" selected="yes">集集鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="集集鎮">集集鎮</option>
<%
			 }	
			 if(district.equals("水里鄉"))
                         {
%>
		         <option value="水里鄉" selected="yes">水里鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="水里鄉">水里鄉</option>
<%
			 }
			 if(district.equals("魚池鄉"))
                         {
%>
		         <option value="魚池鄉" selected="yes">魚池鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="魚池鄉">魚池鄉</option>
<%
			 }
			 if(district.equals("信義鄉"))
                         {
%>
		         <option value="信義鄉" selected="yes">信義鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="信義鄉">信義鄉</option>
<%
			 }
			 if(district.equals("竹山鄉"))
                         {
%>
		         <option value="竹山鄉" selected="yes">竹山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="竹山鄉">竹山鄉</option>
<%
			 }
			 if(district.equals("鹿谷鄉"))
                         {
%>
		         <option value="鹿谷鄉" selected="yes">鹿谷鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="鹿谷鄉">鹿谷鄉</option>
<%
			 }
		      }
		      break;
		      case 9: //彰化縣
		      {
			 if(district.equals("彰化市"))
                         {
%>
		         <option value="彰化市" selected="yes">彰化市</option>
<%
			 }
			 else
			 {
%>
		         <option value="彰化市">彰化市</option>
<%
			 }	
			 if(district.equals("芬園鄉"))
                         {
%>
		         <option value="芬園鄉" selected="yes">芬園鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="芬園鄉">芬園鄉</option>
<%
			 }
			 if(district.equals("花壇鄉"))
                         {
%>
		         <option value="花壇鄉" selected="yes">花壇鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="花壇鄉">花壇鄉</option>
<%
			 }
			 if(district.equals("秀水鄉"))
                         {
%>
		         <option value="秀水鄉" selected="yes">秀水鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="秀水鄉">秀水鄉</option>
<%
			 }
			 if(district.equals("鹿港鎮"))
                         {
%>
		         <option value="鹿港鎮" selected="yes">鹿港鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="鹿港鎮">鹿港鎮</option>
<%
			 }
			 if(district.equals("福興鄉"))
                         {
%>
		         <option value="福興鄉" selected="yes">福興鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="福興鄉">福興鄉</option>
<%
			 }
			 if(district.equals("線西鄉"))
                         {
%>
		         <option value="線西鄉" selected="yes">線西鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="線西鄉">線西鄉</option>
<%
			 }
			 if(district.equals("和美鎮"))
                         {
%>
		         <option value="和美鎮" selected="yes">和美鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="和美鎮">和美鎮</option>
<%
			 }	
			 if(district.equals("伸港鄉"))
                         {
%>
		         <option value="伸港鄉" selected="yes">伸港鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="伸港鄉">伸港鄉</option>
<%
			 }
			 if(district.equals("員林鎮"))
                         {
%>
		         <option value="員林鎮" selected="yes">員林鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="員林鎮">員林鎮</option>
<%
			 }
			 if(district.equals("社頭鄉"))
                         {
%>
		         <option value="社頭鄉" selected="yes">社頭鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="社頭鄉">社頭鄉</option>
<%
			 }
			 if(district.equals("永靖鄉"))
                         {
%>
		         <option value="永靖鄉" selected="yes">永靖鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="永靖鄉">永靖鄉</option>
<%
			 }
			 if(district.equals("埔心鄉"))
                         {
%>
		         <option value="埔心鄉" selected="yes">埔心鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="埔心鄉">埔心鄉</option>
<%
			 }
			 if(district.equals("溪湖鎮"))
                         {
%>
		         <option value="溪湖鎮" selected="yes">溪湖鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="溪湖鎮">溪湖鎮</option>
<%
			 }
			 if(district.equals("大村鄉"))
                         {
%>
		         <option value="大村鄉" selected="yes">大村鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="大村鄉">大村鄉</option>
<%
			 }	
			 if(district.equals("埔鹽鄉"))
                         {
%>
		         <option value="埔鹽鄉" selected="yes">埔鹽鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="埔鹽鄉">埔鹽鄉</option>
<%
			 }
			 if(district.equals("田中鎮"))
                         {
%>
		         <option value="田中鎮" selected="yes">田中鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="田中鎮">田中鎮</option>
<%
			 }
			 if(district.equals("北斗鎮"))
                         {
%>
		         <option value="北斗鎮" selected="yes">北斗鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="北斗鎮">北斗鎮</option>
<%
			 }
			 if(district.equals("田尾鄉"))
                         {
%>
		         <option value="田尾鄉" selected="yes">田尾鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="田尾鄉">田尾鄉</option>
<%
			 }
			 if(district.equals("埤頭鄉"))
                         {
%>
		         <option value="埤頭鄉" selected="yes">埤頭鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="埤頭鄉">埤頭鄉</option>
<%
			 }
			 if(district.equals("溪州鄉"))
                         {
%>
		         <option value="溪州鄉" selected="yes">溪州鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="溪州鄉">溪州鄉</option>
<%
			 }
			 if(district.equals("竹塘鄉"))
                         {
%>
		         <option value="竹塘鄉" selected="yes">竹塘鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="竹塘鄉">竹塘鄉</option>
<%
			 }
			 if(district.equals("二林鎮"))
                         {
%>
		         <option value="二林鎮" selected="yes">二林鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="二林鎮">二林鎮</option>
<%
			 }
			 if(district.equals("大城鄉"))
                         {
%>
		         <option value="大城鄉" selected="yes">大城鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="大城鄉">大城鄉</option>
<%
			 }
			 if(district.equals("芳苑鄉"))
                         {
%>
		         <option value="芳苑鄉" selected="yes">芳苑鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="芳苑鄉">芳苑鄉</option>
<%
			 }
			 if(district.equals("二水鄉"))
                         {
%>
		         <option value="二水鄉" selected="yes">二水鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="二水鄉">二水鄉</option>
<%
			 }
		      }
		      break;
		      case 10: //雲林縣
		      {
			 if(district.equals("斗南鎮"))
                         {
%>
		         <option value="斗南鎮" selected="yes">斗南鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="斗南鎮">斗南鎮</option>
<%
			 }	
			 if(district.equals("大埤鄉"))
                         {
%>
		         <option value="大埤鄉" selected="yes">大埤鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="大埤鄉">大埤鄉</option>
<%
			 }
			 if(district.equals("虎尾鎮"))
                         {
%>
		         <option value="虎尾鎮" selected="yes">虎尾鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="虎尾鎮">虎尾鎮</option>
<%
			 }
			 if(district.equals("土庫鎮"))
                         {
%>
		         <option value="土庫鎮" selected="yes">土庫鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="土庫鎮">土庫鎮</option>
<%
			 }
			 if(district.equals("褒忠鄉"))
                         {
%>
		         <option value="褒忠鄉" selected="yes">褒忠鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="褒忠鄉">褒忠鄉</option>
<%
			 }
			 if(district.equals("東勢鄉"))
                         {
%>
		         <option value="東勢鄉" selected="yes">東勢鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="東勢鄉">東勢鄉</option>
<%
			 }
			 if(district.equals("台西鄉"))
                         {
%>
		         <option value="台西鄉" selected="yes">台西鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="台西鄉">台西鄉</option>
<%
			 }
			 if(district.equals("崙背鄉"))
                         {
%>
		         <option value="崙背鄉" selected="yes">崙背鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="崙背鄉">崙背鄉</option>
<%
			 }	
			 if(district.equals("麥寮鄉"))
                         {
%>
		         <option value="麥寮鄉" selected="yes">麥寮鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="麥寮鄉">麥寮鄉</option>
<%
			 }
			 if(district.equals("斗六市"))
                         {
%>
		         <option value="斗六市" selected="yes">斗六市</option>
<%
			 }
			 else
			 {
%>
		         <option value="斗六市">斗六市</option>
<%
			 }
			 if(district.equals("林內鄉"))
                         {
%>
		         <option value="林內鄉" selected="yes">林內鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="林內鄉">林內鄉</option>
<%
			 }
			 if(district.equals("古坑鄉"))
                         {
%>
		         <option value="古坑鄉" selected="yes">古坑鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="古坑鄉">古坑鄉</option>
<%
			 }
			 if(district.equals("莿桐鄉"))
                         {
%>
		         <option value="莿桐鄉" selected="yes">莿桐鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="莿桐鄉">莿桐鄉</option>
<%
			 }
			 if(district.equals("西螺鎮"))
                         {
%>
		         <option value="西螺鎮" selected="yes">西螺鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="西螺鎮">西螺鎮</option>
<%
			 }
			 if(district.equals("二崙鄉"))
                         {
%>
		         <option value="二崙鄉" selected="yes">二崙鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="二崙鄉">二崙鄉</option>
<%
			 }	
			 if(district.equals("北港鎮"))
                         {
%>
		         <option value="北港鎮" selected="yes">北港鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="北港鎮">北港鎮</option>
<%
			 }
			 if(district.equals("水林鄉"))
                         {
%>
		         <option value="水林鄉" selected="yes">水林鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="水林鄉">水林鄉</option>
<%
			 }
			 if(district.equals("口湖鄉"))
                         {
%>
		         <option value="口湖鄉" selected="yes">口湖鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="口湖鄉">口湖鄉</option>
<%
			 }
			 if(district.equals("四湖鄉"))
                         {
%>
		         <option value="四湖鄉" selected="yes">四湖鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="四湖鄉">四湖鄉</option>
<%
			 }
			 if(district.equals("元長鄉"))
                         {
%>
		         <option value="元長鄉" selected="yes">元長鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="元長鄉">元長鄉</option>
<%
			 }
		      }
		      break;
		      case 11: //嘉義市
		      {
			 if(district.equals("東區"))
                         {
%>
		         <option value="東區" selected="yes">東區</option>
<%
			 }
			 else
			 {
%>
		         <option value="東區">東區</option>
<%
			 }
			 if(district.equals("西區"))
                         {
%>
		         <option value="西區" selected="yes">西區</option>
<%
			 }
			 else
			 {
%>
		         <option value="西區">西區</option>
<%
			 }
		      }
		      break;
		      case 12: //嘉義縣
		      {
			 if(district.equals("番路鄉"))
                         {
%>
		         <option value="番路鄉" selected="yes">番路鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="番路鄉">番路鄉</option>
<%
			 }	
			 if(district.equals("梅山鄉"))
                         {
%>
		         <option value="梅山鄉" selected="yes">梅山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="梅山鄉">梅山鄉</option>
<%
			 }
			 if(district.equals("竹崎鄉"))
                         {
%>
		         <option value="竹崎鄉" selected="yes">竹崎鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="竹崎鄉">竹崎鄉</option>
<%
			 }
			 if(district.equals("阿里山鄉"))
                         {
%>
		         <option value="阿里山鄉" selected="yes">阿里山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="阿里山鄉">阿里山鄉</option>
<%
			 }
			 if(district.equals("中埔鄉"))
                         {
%>
		         <option value="中埔鄉" selected="yes">中埔鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="中埔鄉">中埔鄉</option>
<%
			 }
			 if(district.equals("大埔鄉"))
                         {
%>
		         <option value="大埔鄉" selected="yes">大埔鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="大埔鄉">大埔鄉</option>
<%
			 }
			 if(district.equals("水上鄉"))
                         {
%>
		         <option value="水上鄉" selected="yes">水上鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="水上鄉">水上鄉</option>
<%
			 }
			 if(district.equals("鹿草鄉"))
                         {
%>
		         <option value="鹿草鄉" selected="yes">鹿草鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="鹿草鄉">鹿草鄉</option>
<%
			 }	
			 if(district.equals("太保市"))
                         {
%>
		         <option value="太保市" selected="yes">太保市</option>
<%
			 }
			 else
			 {
%>
		         <option value="太保市">太保市</option>
<%
			 }
			 if(district.equals("朴子市"))
                         {
%>
		         <option value="朴子市" selected="yes">朴子市</option>
<%
			 }
			 else
			 {
%>
		         <option value="朴子市">朴子市</option>
<%
			 }
			 if(district.equals("東石鄉"))
                         {
%>
		         <option value="東石鄉" selected="yes">東石鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="東石鄉">東石鄉</option>
<%
			 }
			 if(district.equals("六腳鄉"))
                         {
%>
		         <option value="六腳鄉" selected="yes">六腳鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="六腳鄉">六腳鄉</option>
<%
			 }
			 if(district.equals("新港鄉"))
                         {
%>
		         <option value="新港鄉" selected="yes">新港鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="新港鄉">新港鄉</option>
<%
			 }
			 if(district.equals("民雄鄉"))
                         {
%>
		         <option value="民雄鄉" selected="yes">民雄鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="民雄鄉">民雄鄉</option>
<%
			 }
			 if(district.equals("大林鎮"))
                         {
%>
		         <option value="大林鎮" selected="yes">大林鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="大林鎮">大林鎮</option>
<%
			 }	
			 if(district.equals("溪口鄉"))
                         {
%>
		         <option value="溪口鄉" selected="yes">溪口鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="溪口鄉">溪口鄉</option>
<%
			 }
			 if(district.equals("義竹鄉"))
                         {
%>
		         <option value="義竹鄉" selected="yes">義竹鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="義竹鄉">義竹鄉</option>
<%
			 }
			 if(district.equals("布袋鎮"))
                         {
%>
		         <option value="布袋鎮" selected="yes">布袋鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="布袋鎮">布袋鎮</option>
<%
			 }
		      }
		      break;
		      case 13: //台南市
		      {
			 if(district.equals("中西區"))
                         {
%>
		         <option value="中西區" selected="yes">中西區</option>
<%
			 }
			 else
			 {
%>
		         <option value="中西區">中西區</option>
<%
			 }	
			 if(district.equals("東區"))
                         {
%>
		         <option value="東區" selected="yes">東區</option>
<%
			 }
			 else
			 {
%>
		         <option value="東區">東區</option>
<%
			 }
			 if(district.equals("南區"))
                         {
%>
		         <option value="南區" selected="yes">南區</option>
<%
			 }
			 else
			 {
%>
		         <option value="南區">南區</option>
<%
			 }
			 if(district.equals("北區"))
                         {
%>
		         <option value="北區" selected="yes">北區</option>
<%
			 }
			 else
			 {
%>
		         <option value="北區">北區</option>
<%
			 }
			 if(district.equals("安平區"))
                         {
%>
		         <option value="安平區" selected="yes">安平區</option>
<%
			 }
			 else
			 {
%>
		         <option value="安平區">安平區</option>
<%
			 }
			 if(district.equals("安南區"))
                         {
%>
		         <option value="安南區" selected="yes">安南區</option>
<%
			 }
			 else
			 {
%>
		         <option value="安南區">安南區</option>
<%
			 }
			 if(district.equals("永康區"))
                         {
%>
		         <option value="永康區" selected="yes">永康區</option>
<%
			 }
			 else
			 {
%>
		         <option value="永康區">永康區</option>
<%
			 }
			 if(district.equals("歸仁區"))
                         {
%>
		         <option value="歸仁區" selected="yes">歸仁區</option>
<%
			 }
			 else
			 {
%>
		         <option value="歸仁區">歸仁區</option>
<%
			 }	
			 if(district.equals("新化區"))
                         {
%>
		         <option value="新化區" selected="yes">新化區</option>
<%
			 }
			 else
			 {
%>
		         <option value="新化區">新化區</option>
<%
			 }
			 if(district.equals("左鎮區"))
                         {
%>
		         <option value="左鎮區" selected="yes">左鎮區</option>
<%
			 }
			 else
			 {
%>
		         <option value="左鎮區">左鎮區</option>
<%
			 }
			 if(district.equals("玉井區"))
                         {
%>
		         <option value="玉井區" selected="yes">玉井區</option>
<%
			 }
			 else
			 {
%>
		         <option value="玉井區">玉井區</option>
<%
			 }
			 if(district.equals("楠西區"))
                         {
%>
		         <option value="楠西區" selected="yes">楠西區</option>
<%
			 }
			 else
			 {
%>
		         <option value="楠西區">楠西區</option>
<%
			 }
			 if(district.equals("南化區"))
                         {
%>
		         <option value="南化區" selected="yes">南化區</option>
<%
			 }
			 else
			 {
%>
		         <option value="南化區">南化區</option>
<%
			 }
			 if(district.equals("仁德區"))
                         {
%>
		         <option value="仁德區" selected="yes">仁德區</option>
<%
			 }
			 else
			 {
%>
		         <option value="仁德區">仁德區</option>
<%
			 }
			 if(district.equals("關廟區"))
                         {
%>
		         <option value="關廟區" selected="yes">關廟區</option>
<%
			 }
			 else
			 {
%>
		         <option value="關廟區">關廟區</option>
<%
			 }
			 if(district.equals("龍崎區"))
                         {
%>
		         <option value="龍崎區" selected="yes">龍崎區</option>
<%
			 }
			 else
			 {
%>
		         <option value="龍崎區">龍崎區</option>
<%
			 }
			 if(district.equals("官田區"))
                         {
%>
		         <option value="官田區" selected="yes">官田區</option>
<%
			 }
			 else
			 {
%>
		         <option value="官田區">官田區</option>
<%
			 }
			 if(district.equals("麻豆區"))
                         {
%>
		         <option value="麻豆區" selected="yes">麻豆區</option>
<%
			 }
			 else
			 {
%>
		         <option value="麻豆區">麻豆區</option>
<%
			 }
			 if(district.equals("佳里區"))
                         {
%>
		         <option value="佳里區" selected="yes">佳里區</option>
<%
			 }
			 else
			 {
%>
		         <option value="佳里區">佳里區</option>
<%
			 }
			 if(district.equals("西港區"))
                         {
%>
		         <option value="西港區" selected="yes">西港區</option>
<%
			 }
			 else
			 {
%>
		         <option value="西港區">西港區</option>
<%
			 }
			 if(district.equals("七股區"))
                         {
%>
		         <option value="七股區" selected="yes">七股區</option>
<%
			 }
			 else
			 {
%>
		         <option value="七股區">七股區</option>
<%
			 }
			 if(district.equals("將軍區"))
                         {
%>
		         <option value="將軍區" selected="yes">將軍區</option>
<%
			 }
			 else
			 {
%>
		         <option value="將軍區">將軍區</option>
<%
			 }

			 if(district.equals("學甲區"))
                         {
%>
		         <option value="學甲區" selected="yes">學甲區</option>
<%
			 }
			 else
			 {
%>
		         <option value="學甲區">學甲區</option>
<%
			 }
			 if(district.equals("北門區"))
                         {
%>
		         <option value="北門區" selected="yes">北門區</option>
<%
			 }
			 else
			 {
%>
		         <option value="北門區">北門區</option>
<%
			 }
			 if(district.equals("新營區"))
                         {
%>
		         <option value="新營區" selected="yes">新營區</option>
<%
			 }
			 else
			 {
%>
		         <option value="新營區">新營區</option>
<%
			 }
			 if(district.equals("後壁區"))
                         {
%>
		         <option value="後壁區" selected="yes">後壁區</option>
<%
			 }
			 else
			 {
%>
		         <option value="後壁區">後壁區</option>
<%
			 }
			 if(district.equals("白河區"))
                         {
%>
		         <option value="白河區" selected="yes">白河區</option>
<%
			 }
			 else
			 {
%>
		         <option value="白河區">白河區</option>
<%
			 }
			 if(district.equals("東山區"))
                         {
%>
		         <option value="東山區" selected="yes">東山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="東山區">東山區</option>
<%
			 }
			 if(district.equals("六甲區"))
                         {
%>
		         <option value="六甲區" selected="yes">六甲區</option>
<%
			 }
			 else
			 {
%>
		         <option value="六甲區">六甲區</option>
<%
			 }
			 if(district.equals("下營區"))
                         {
%>
		         <option value="下營區" selected="yes">下營區</option>
<%
			 }
			 else
			 {
%>
		         <option value="下營區">下營區</option>
<%
			 }
			 if(district.equals("柳營區"))
                         {
%>
		         <option value="柳營區" selected="yes">柳營區</option>
<%
			 }
			 else
			 {
%>
		         <option value="柳營區">柳營區</option>
<%
			 }
			 if(district.equals("鹽水區"))
                         {
%>
		         <option value="鹽水區" selected="yes">鹽水區</option>
<%
			 }
			 else
			 {
%>
		         <option value="鹽水區">鹽水區</option>
<%
			 }
			 if(district.equals("善化區"))
                         {
%>
		         <option value="善化區" selected="yes">善化區</option>
<%
			 }
			 else
			 {
%>
		         <option value="善化區">善化區</option>
<%
			 }
			 if(district.equals("大內區"))
                         {
%>
		         <option value="大內區" selected="yes">大內區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大內區">大內區</option>
<%
			 }
			 if(district.equals("山上區"))
                         {
%>
		         <option value="山上區" selected="yes">山上區</option>
<%
			 }
			 else
			 {
%>
		         <option value="山上區">山上區</option>
<%
			 }
			 if(district.equals("新市區"))
                         {
%>
		         <option value="新市區" selected="yes">新市區</option>
<%
			 }
			 else
			 {
%>
		         <option value="新市區">新市區</option>
<%
			 }
			 if(district.equals("安定區"))
                         {
%>
		         <option value="安定區" selected="yes">安定區</option>
<%
			 }
			 else
			 {
%>
		         <option value="安定區">安定區</option>
<%
			 }
		      }
		      break;
		      case 14: //高雄市
		      {
			 if(district.equals("新興區"))
                         {
%>
		         <option value="新興區" selected="yes">新興區</option>
<%
			 }
			 else
			 {
%>
		         <option value="新興區" >新興區</option>
<%
			 }	
			 if(district.equals("前金區"))
                         {
%>
		         <option value="前金區" selected="yes">前金區</option>
<%
			 }
			 else
			 {
%>
		         <option value="前金區">前金區</option>
<%
			 }
			 if(district.equals("苓雅區"))
                         {
%>
		         <option value="苓雅區" selected="yes">苓雅區</option>
<%
			 }
			 else
			 {
%>
		         <option value="苓雅區">苓雅區</option>
<%
			 }
			 if(district.equals("鹽埕區"))
                         {
%>
		         <option value="鹽埕區" selected="yes">鹽埕區</option>
<%
			 }
			 else
			 {
%>
		         <option value="鹽埕區">鹽埕區</option>
<%
			 }
			 if(district.equals("鼓山區"))
                         {
%>
		         <option value="鼓山區" selected="yes">鼓山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="鼓山區">鼓山區</option>
<%
			 }
			 if(district.equals("旗津區"))
                         {
%>
		         <option value="旗津區" selected="yes">旗津區</option>
<%
			 }
			 else
			 {
%>
		         <option value="旗津區">旗津區</option>
<%
			 }
			 if(district.equals("前鎮區"))
                         {
%>
		         <option value="前鎮區" selected="yes">前鎮區</option>
<%
			 }
			 else
			 {
%>
		         <option value="前鎮區">前鎮區</option>
<%
			 }
			 if(district.equals("三民區"))
                         {
%>
		         <option value="三民區" selected="yes">三民區</option>
<%
			 }
			 else
			 {
%>
		         <option value="三民區">三民區</option>
<%
			 }	
			 if(district.equals("楠梓區"))
                         {
%>
		         <option value="楠梓區" selected="yes">楠梓區</option>
<%
			 }
			 else
			 {
%>
		         <option value="楠梓區">楠梓區</option>
<%
			 }
			 if(district.equals("小港區"))
                         {
%>
		         <option value="小港區" selected="yes">小港區</option>
<%
			 }
			 else
			 {
%>
		         <option value="小港區">小港區</option>
<%
			 }
			 if(district.equals("左營區"))
                         {
%>
		         <option value="左營區" selected="yes">左營區</option>
<%
			 }
			 else
			 {
%>
		         <option value="左營區">左營區</option>
<%
			 }
			 if(district.equals("仁武區"))
                         {
%>
		         <option value="仁武區" selected="yes">仁武區</option>
<%
			 }
			 else
			 {
%>
		         <option value="仁武區">仁武區</option>
<%
			 }
			 if(district.equals("大社區"))
                         {
%>
		         <option value="大社區" selected="yes">大社區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大社區">大社區</option>
<%
			 }
			 if(district.equals("東沙群島"))
                         {
%>
		         <option value="東沙群島" selected="yes">東沙群島</option>
<%
			 }
			 else
			 {
%>
		         <option value="東沙群島">東沙群島</option>
<%
			 }
			 if(district.equals("南沙群島"))
                         {
%>
		         <option value="南沙群島" selected="yes">南沙群島</option>
<%
			 }
			 else
			 {
%>
		         <option value="南沙群島">南沙群島</option>
<%
			 }	
			 if(district.equals("岡山區"))
                         {
%>
		         <option value="岡山區" selected="yes">岡山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="岡山區">岡山區</option>
<%
			 }
			 if(district.equals("路竹區"))
                         {
%>
		         <option value="路竹區" selected="yes">路竹區</option>
<%
			 }
			 else
			 {
%>
		         <option value="路竹區">路竹區</option>
<%
			 }
			 if(district.equals("阿蓮區"))
                         {
%>
		         <option value="阿蓮區" selected="yes">阿蓮區</option>
<%
			 }
			 else
			 {
%>
		         <option value="阿蓮區">阿蓮區</option>
<%
			 }
			 if(district.equals("田寮區"))
                         {
%>
		         <option value="田寮區" selected="yes">田寮區</option>
<%
			 }
			 else
			 {
%>
		         <option value="田寮區">田寮區</option>
<%
			 }
			 if(district.equals("燕巢區"))
                         {
%>
		         <option value="燕巢區" selected="yes">燕巢區</option>
<%
			 }
			 else
			 {
%>
		         <option value="燕巢區">燕巢區</option>
<%
			 }
			 if(district.equals("橋頭區"))
                         {
%>
		         <option value="橋頭區" selected="yes">橋頭區</option>
<%
			 }
			 else
			 {
%>
		         <option value="橋頭區">橋頭區</option>
<%
			 }
			 if(district.equals("梓官區"))
                         {
%>
		         <option value="梓官區" selected="yes">梓官區</option>
<%
			 }
			 else
			 {
%>
		         <option value="梓官區">梓官區</option>
<%
			 }

			 if(district.equals("彌陀區"))
                         {
%>
		         <option value="彌陀區" selected="yes">彌陀區</option>
<%
			 }
			 else
			 {
%>
		         <option value="彌陀區">彌陀區</option>
<%
			 }
			 if(district.equals("永安區"))
                         {
%>
		         <option value="永安區" selected="yes">永安區</option>
<%
			 }
			 else
			 {
%>
		         <option value="永安區">永安區</option>
<%
			 }
			 if(district.equals("湖內區"))
                         {
%>
		         <option value="湖內區" selected="yes">湖內區</option>
<%
			 }
			 else
			 {
%>
		         <option value="湖內區">湖內區</option>
<%
			 }
			 if(district.equals("鳳山區"))
                         {
%>
		         <option value="鳳山區" selected="yes">鳳山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="鳳山區">鳳山區</option>
<%
			 }
			 if(district.equals("大寮區"))
                         {
%>
		         <option value="大寮區" selected="yes">大寮區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大寮區">大寮區</option>
<%
			 }
			 if(district.equals("林園區"))
                         {
%>
		         <option value="林園區" selected="yes">林園區</option>
<%
			 }
			 else
			 {
%>
		         <option value="林園區">林園區</option>
<%
			 }
			 if(district.equals("烏松區"))
                         {
%>
		         <option value="烏松區" selected="yes">烏松區</option>
<%
			 }
			 else
			 {
%>
		         <option value="烏松區">烏松區</option>
<%
			 }
			 if(district.equals("大樹區"))
                         {
%>
		         <option value="大樹區" selected="yes">大樹區</option>
<%
			 }
			 else
			 {
%>
		         <option value="大樹區">大樹區</option>
<%
			 }
			 if(district.equals("旗山區"))
                         {
%>
		         <option value="旗山區" selected="yes">旗山區</option>
<%
			 }
			 else
			 {
%>
		         <option value="旗山區">旗山區</option>
<%
			 }
			 if(district.equals("美濃區"))
                         {
%>
		         <option value="美濃區" selected="yes">美濃區</option>
<%
			 }
			 else
			 {
%>
		         <option value="美濃區">美濃區</option>
<%
			 }
			 if(district.equals("六龜區"))
                         {
%>
		         <option value="六龜區" selected="yes">六龜區</option>
<%
			 }
			 else
			 {
%>
		         <option value="六龜區">六龜區</option>
<%
			 }
			 if(district.equals("內門區"))
                         {
%>
		         <option value="內門區" selected="yes">內門區</option>
<%
			 }
			 else
			 {
%>
		         <option value="內門區">內門區</option>
<%
			 }
			 if(district.equals("杉林區"))
                         {
%>
		         <option value="杉林區" selected="yes">杉林區</option>
<%
			 }
			 else
			 {
%>
		         <option value="杉林區">杉林區</option>
<%
			 }
			 if(district.equals("甲仙區"))
                         {
%>
		         <option value="甲仙區" selected="yes">甲仙區</option>
<%
			 }
			 else
			 {
%>
		         <option value="甲仙區">甲仙區</option>
<%
			 }
			 if(district.equals("桃源區"))
                         {
%>
		         <option value="桃源區" selected="yes">桃源區</option>
<%
			 }
			 else
			 {
%>
		         <option value="桃源區">桃源區</option>
<%
			 }
			 if(district.equals("那瑪夏區"))
                         {
%>
		         <option value="那瑪夏區" selected="yes">那瑪夏區</option>
<%
			 }
			 else
			 {
%>
		         <option value="那瑪夏區">那瑪夏區</option>
<%
			 }
			 if(district.equals("茂林區"))
                         {
%>
		         <option value="茂林區" selected="yes">茂林區</option>
<%
			 }
			 else
			 {
%>
		         <option value="茂林區">茂林區</option>
<%
			 }
			 if(district.equals("茄萣區"))
                         {
%>
		         <option value="茄萣區" selected="yes">茄萣區</option>
<%
			 }
			 else
			 {
%>
		         <option value="茄萣區">茄萣區</option>
<%
			 }
		      }
		      break;
		      case 15: //屏東縣
		      {
			 if(district.equals("屏東市"))
                         {
%>
		         <option value="屏東市" selected="yes">屏東市</option>
<%
			 }
			 else
			 {
%>
		         <option value="屏東市">屏東市</option>
<%
			 }	
			 if(district.equals("三地門鄉"))
                         {
%>
		         <option value="三地門鄉" selected="yes">三地門鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="三地門鄉">三地門鄉</option>
<%
			 }
			 if(district.equals("霧台鄉"))
                         {
%>
		         <option value="霧台鄉" selected="yes">霧台鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="霧台鄉">霧台鄉</option>
<%
			 }
			 if(district.equals("瑪家鄉"))
                         {
%>
		         <option value="瑪家鄉" selected="yes">瑪家鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="瑪家鄉">瑪家鄉</option>
<%
			 }
			 if(district.equals("九如鄉"))
                         {
%>
		         <option value="九如鄉" selected="yes">九如鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="九如鄉">九如鄉</option>
<%
			 }
			 if(district.equals("里港鄉"))
                         {
%>
		         <option value="里港鄉" selected="yes">里港鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="里港鄉">里港鄉</option>
<%
			 }
			 if(district.equals("高樹鄉"))
                         {
%>
		         <option value="高樹鄉" selected="yes">高樹鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="高樹鄉">高樹鄉</option>
<%
			 }
			 if(district.equals("鹽埔鄉"))
                         {
%>
		         <option value="鹽埔鄉" selected="yes">鹽埔鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="鹽埔鄉">鹽埔鄉</option>
<%
			 }	
			 if(district.equals("長治鄉"))
                         {
%>
		         <option value="長治鄉" selected="yes">長治鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="長治鄉">長治鄉</option>
<%
			 }
			 if(district.equals("麟洛鄉"))
                         {
%>
		         <option value="麟洛鄉" selected="yes">麟洛鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="麟洛鄉">麟洛鄉</option>
<%
			 }
			 if(district.equals("竹田鄉"))
                         {
%>
		         <option value="竹田鄉" selected="yes">竹田鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="竹田鄉">竹田鄉</option>
<%
			 }
			 if(district.equals("內埔鄉"))
                         {
%>
		         <option value="內埔鄉" selected="yes">內埔鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="內埔鄉">內埔鄉</option>
<%
			 }
			 if(district.equals("萬丹鄉"))
                         {
%>
		         <option value="萬丹鄉" selected="yes">萬丹鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="萬丹鄉">萬丹鄉</option>
<%
			 }
			 if(district.equals("潮州鎮"))
                         {
%>
		         <option value="潮州鎮" selected="yes">潮州鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="潮州鎮">潮州鎮</option>
<%
			 }
			 if(district.equals("泰武鄉"))
                         {
%>
		         <option value="泰武鄉" selected="yes">泰武鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="泰武鄉">泰武鄉</option>
<%
			 }	
			 if(district.equals("來義鄉"))
                         {
%>
		         <option value="來義鄉" selected="yes">來義鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="來義鄉">來義鄉</option>
<%
			 }
			 if(district.equals("萬巒鄉"))
                         {
%>
		         <option value="萬巒鄉" selected="yes">萬巒鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="萬巒鄉">萬巒鄉</option>
<%
			 }
			 if(district.equals("崁頂鄉"))
                         {
%>
		         <option value="崁頂鄉" selected="yes">崁頂鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="崁頂鄉">崁頂鄉</option>
<%
			 }
			 if(district.equals("新埤鄉"))
                         {
%>
		         <option value="新埤鄉" selected="yes">新埤鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="新埤鄉">新埤鄉</option>
<%
			 }
			 if(district.equals("南州鄉"))
                         {
%>
		         <option value="南州鄉" selected="yes">南州鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="南州鄉">南州鄉</option>
<%
			 }
			 if(district.equals("林邊鄉"))
                         {
%>
		         <option value="林邊鄉" selected="yes">林邊鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="林邊鄉">林邊鄉</option>
<%
			 }
			 if(district.equals("東港鎮"))
                         {
%>
		         <option value="東港鎮" selected="yes">東港鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="東港鎮">東港鎮</option>
<%
			 }
			 if(district.equals("琉球鄉"))
                         {
%>
		         <option value="琉球鄉" selected="yes">琉球鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="琉球鄉">琉球鄉</option>
<%
			 }
			 if(district.equals("佳冬鄉"))
                         {
%>
		         <option value="佳冬鄉" selected="yes">佳冬鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="佳冬鄉">佳冬鄉</option>
<%
			 }
			 if(district.equals("新園鄉"))
                         {
%>
		         <option value="新園鄉" selected="yes">新園鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="新園鄉">新園鄉</option>
<%
			 }
			 if(district.equals("枋寮鄉"))
                         {
%>
		         <option value="枋寮鄉" selected="yes">枋寮鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="枋寮鄉">枋寮鄉</option>
<%
			 }
			 if(district.equals("枋山鄉"))
                         {
%>
		         <option value="枋山鄉" selected="yes">枋山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="枋山鄉">枋山鄉</option>
<%
			 }
			 if(district.equals("春日鄉"))
                         {
%>
		         <option value="春日鄉" selected="yes">春日鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="春日鄉">春日鄉</option>
<%
			 }
			 if(district.equals("獅子鄉"))
                         {
%>
		         <option value="獅子鄉" selected="yes">獅子鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="獅子鄉">獅子鄉</option>
<%
			 }
			 if(district.equals("車城鄉"))
                         {
%>
		         <option value="車城鄉" selected="yes">車城鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="車城鄉">車城鄉</option>
<%
			 }
			 if(district.equals("牡丹鄉"))
                         {
%>
		         <option value="牡丹鄉" selected="yes">牡丹鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="牡丹鄉">牡丹鄉</option>
<%
			 }
			 if(district.equals("恆春鎮"))
                         {
%>
		         <option value="恆春鎮" selected="yes">恆春鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="恆春鎮">恆春鎮</option>
<%
			 }
			 if(district.equals("滿州鄉"))
                         {
%>
		         <option value="滿州鄉" selected="yes">滿州鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="滿州鄉">滿州鄉</option>
<%
			 }
		      }
		      break;
		      case 16: //宜蘭縣
		      {
			 if(district.equals("宜蘭市"))
                         {
%>
		         <option value="宜蘭市" selected="yes">宜蘭市</option>
<%
			 }
			 else
			 {
%>
		         <option value="宜蘭市">宜蘭市</option>
<%
			 }	
			 if(district.equals("頭城鎮"))
                         {
%>
		         <option value="頭城鎮" selected="yes">頭城鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="頭城鎮">頭城鎮</option>
<%
			 }
			 if(district.equals("礁溪鄉"))
                         {
%>
		         <option value="礁溪鄉" selected="yes">礁溪鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="礁溪鄉">礁溪鄉</option>
<%
			 }
			 if(district.equals("壯圍鄉"))
                         {
%>
		         <option value="壯圍鄉" selected="yes">壯圍鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="壯圍鄉">壯圍鄉</option>
<%
			 }
			 if(district.equals("員山鄉"))
                         {
%>
		         <option value="員山鄉" selected="yes">員山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="員山鄉">員山鄉</option>
<%
			 }
			 if(district.equals("羅東鎮"))
                         {
%>
		         <option value="羅東鎮" selected="yes">羅東鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="羅東鎮">羅東鎮</option>
<%
			 }
			 if(district.equals("三星鄉"))
                         {
%>
		         <option value="三星鄉" selected="yes">三星鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="三星鄉">三星鄉</option>
<%
			 }
			 if(district.equals("大同鄉"))
                         {
%>
		         <option value="大同鄉" selected="yes">大同鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="大同鄉">大同鄉</option>
<%
			 }	
			 if(district.equals("五結鄉"))
                         {
%>
		         <option value="五結鄉" selected="yes">五結鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="五結鄉">五結鄉</option>
<%
			 }
			 if(district.equals("冬山鄉"))
                         {
%>
		         <option value="冬山鄉" selected="yes">冬山鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="冬山鄉">冬山鄉</option>
<%
			 }
			 if(district.equals("蘇澳鎮"))
                         {
%>
		         <option value="蘇澳鎮" selected="yes">蘇澳鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="蘇澳鎮">蘇澳鎮</option>
<%
			 }
			 if(district.equals("南澳鄉"))
                         {
%>
		         <option value="南澳鄉" selected="yes">南澳鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="南澳鄉">南澳鄉</option>
<%
			 }
			 if(district.equals("釣魚台"))
                         {
%>
		         <option value="釣魚台" selected="yes">釣魚台</option>
<%
			 }
			 else
			 {
%>
		         <option value="釣魚台">釣魚台</option>
<%
			 }
		      }
		      break;
		      case 17: //花蓮縣
		      {
			 if(district.equals("花蓮市"))
                         {
%>
		         <option value="花蓮市" selected="yes">花蓮市</option>
<%
			 }
			 else
			 {
%>
		         <option value="花蓮市">花蓮市</option>
<%
			 }	
			 if(district.equals("新城鄉"))
                         {
%>
		         <option value="新城鄉" selected="yes">新城鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="新城鄉">新城鄉</option>
<%
			 }
			 if(district.equals("秀林鄉"))
                         {
%>
		         <option value="秀林鄉" selected="yes">秀林鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="秀林鄉">秀林鄉</option>
<%
			 }
			 if(district.equals("吉安鄉"))
                         {
%>
		         <option value="吉安鄉" selected="yes">吉安鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="吉安鄉">吉安鄉</option>
<%
			 }
			 if(district.equals("壽豐鄉"))
                         {
%>
		         <option value="壽豐鄉" selected="yes">壽豐鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="壽豐鄉">壽豐鄉</option>
<%
			 }
			 if(district.equals("鳳林鎮"))
                         {
%>
		         <option value="鳳林鎮" selected="yes">鳳林鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="鳳林鎮">鳳林鎮</option>
<%
			 }
			 if(district.equals("光復鄉"))
                         {
%>
		         <option value="光復鄉" selected="yes">光復鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="光復鄉">光復鄉</option>
<%
			 }
			 if(district.equals("豐濱鄉"))
                         {
%>
		         <option value="豐濱鄉" value="" selected="yes">豐濱鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="豐濱鄉">豐濱鄉</option>
<%
			 }	
			 if(district.equals("瑞穗鄉"))
                         {
%>
		         <option value="瑞穗鄉" selected="yes">瑞穗鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="瑞穗鄉">瑞穗鄉</option>
<%
			 }
			 if(district.equals("萬榮鄉"))
                         {
%>
		         <option value="萬榮鄉" selected="yes">萬榮鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="萬榮鄉">萬榮鄉</option>
<%
			 }
			 if(district.equals("玉里鎮"))
                         {
%>
		         <option value="玉里鎮" selected="yes">玉里鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="玉里鎮">玉里鎮</option>
<%
			 }
			 if(district.equals("卓溪鄉"))
                         {
%>
		         <option value="卓溪鄉" selected="yes">卓溪鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="卓溪鄉">卓溪鄉</option>
<%
			 }
			 if(district.equals("富里鄉"))
                         {
%>
		         <option value="富里鄉" selected="yes">富里鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="富里鄉">富里鄉</option>
<%
			 }
		      }
		      break;
		      case 18: //台東縣
		      {
			 if(district.equals("台東市"))
                         {
%>
		         <option value="台東市" selected="yes">台東市</option>
<%
			 }
			 else
			 {
%>
		         <option value="台東市">台東市</option>
<%
			 }	
			 if(district.equals("綠島鄉"))
                         {
%>
		         <option value="綠島鄉" selected="yes">綠島鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="綠島鄉">綠島鄉</option>
<%
			 }
			 if(district.equals("蘭嶼鄉"))
                         {
%>
		         <option value="蘭嶼鄉" selected="yes">蘭嶼鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="蘭嶼鄉">蘭嶼鄉</option>
<%
			 }
			 if(district.equals("延平鄉"))
                         {
%>
		         <option value="延平鄉" selected="yes">延平鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="延平鄉">延平鄉</option>
<%
			 }
			 if(district.equals("卑南鄉"))
                         {
%>
		         <option value="卑南鄉" selected="yes">卑南鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="卑南鄉">卑南鄉</option>
<%
			 }
			 if(district.equals("鹿野鄉"))
                         {
%>
		         <option value="鹿野鄉" selected="yes">鹿野鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="鹿野鄉">鹿野鄉</option>
<%
			 }
			 if(district.equals("關山鎮"))
                         {
%>
		         <option value="關山鎮" selected="yes">關山鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="關山鎮">關山鎮</option>
<%
			 }
			 if(district.equals("海瑞鄉"))
                         {
%>
		         <option value="海瑞鄉" selected="yes">海瑞鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="海瑞鄉">海瑞鄉</option>
<%
			 }	
			 if(district.equals("池上鄉"))
                         {
%>
		         <option value="池上鄉" selected="yes">池上鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="池上鄉">池上鄉</option>
<%
			 }
			 if(district.equals("東河鄉"))
                         {
%>
		         <option value="東河鄉" selected="yes">東河鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="東河鄉">東河鄉</option>
<%
			 }
			 if(district.equals("成功鎮"))
                         {
%>
		         <option value="成功鎮" selected="yes">成功鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="成功鎮">成功鎮</option>
<%
			 }
			 if(district.equals("長濱鄉"))
                         {
%>
		         <option value="長濱鄉" selected="yes">長濱鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="長濱鄉">長濱鄉</option>
<%
			 }
			 if(district.equals("太麻里鄉"))
                         {
%>
		         <option value="太麻里鄉" selected="yes">太麻里鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="太麻里鄉">太麻里鄉</option>
<%
			 }
			 if(district.equals("金峰鄉"))
                         {
%>
		         <option value="金峰鄉" selected="yes">金峰鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="金峰鄉">金峰鄉</option>
<%
			 }
			 if(district.equals("大武鄉"))
                         {
%>
		         <option value="大武鄉" selected="yes">大武鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="大武鄉">大武鄉</option>
<%
			 }
			 if(district.equals("達仁鄉"))
                         {
%>
		         <option value="達仁鄉" selected="yes">達仁鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="達仁鄉">達仁鄉</option>
<%
			 }
		      }
		      break;
		      case 19: //澎湖縣
		      {
			 if(district.equals("馬公市"))
                         {
%>
		         <option value="馬公市" selected="yes">馬公市</option>
<%
			 }
			 else
			 {
%>
		         <option value="馬公市">馬公市</option>
<%
			 }	
			 if(district.equals("西嶼鄉"))
                         {
%>
		         <option value="西嶼鄉" selected="yes">西嶼鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="西嶼鄉">西嶼鄉</option>
<%
			 }
			 if(district.equals("望安鄉"))
                         {
%>
		         <option value="望安鄉" selected="yes">望安鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="望安鄉">望安鄉</option>
<%
			 }
			 if(district.equals("七美鄉"))
                         {
%>
		         <option value="七美鄉" selected="yes">七美鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="七美鄉">七美鄉</option>
<%
			 }
			 if(district.equals("白沙鄉"))
                         {
%>
		         <option value="白沙鄉" selected="yes">白沙鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="白沙鄉">白沙鄉</option>
<%
			 }
			 if(district.equals("湖西鄉"))
                         {
%>
		         <option value="湖西鄉" selected="yes">湖西鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="湖西鄉">湖西鄉</option>
<%
			 }
		      }
		      break;
		      case 20: //金門縣
		      {
			 if(district.equals("金沙鎮"))
                         {
%>
		         <option value="金沙鎮" selected="yes">金沙鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="金沙鎮">金沙鎮</option>
<%
			 }	
			 if(district.equals("金湖鎮"))
                         {
%>
		         <option value="金湖鎮" selected="yes">金湖鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="金湖鎮">金湖鎮</option>
<%
			 }
			 if(district.equals("金寧鄉"))
                         {
%>
		         <option value="金寧鄉" selected="yes">金寧鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="金寧鄉">金寧鄉</option>
<%
			 }
			 if(district.equals("金城鎮"))
                         {
%>
		         <option value="金城鎮" selected="yes">金城鎮</option>
<%
			 }
			 else
			 {
%>
		         <option value="金城鎮">金城鎮</option>
<%
			 }
			 if(district.equals("烈嶼鄉"))
                         {
%>
		         <option value="烈嶼鄉" selected="yes">烈嶼鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="烈嶼鄉">烈嶼鄉</option>
<%
			 }
			 if(district.equals("烏坵鄉"))
                         {
%>
		         <option value="烏坵鄉" selected="yes">烏坵鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="烏坵鄉">烏坵鄉</option>
<%
			 }
		      }
		      break;
		      case 21: //連江縣
		      {
			 if(district.equals("南竿鄉"))
                         {
%>
		         <option value="南竿鄉" selected="yes">南竿鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="南竿鄉">南竿鄉</option>
<%
			 }	
			 if(district.equals("北竿鄉"))
                         {
%>
		         <option value="北竿鄉" selected="yes">北竿鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="北竿鄉">北竿鄉</option>
<%
			 }
			 if(district.equals("莒光鄉"))
                         {
%>
		         <option value="莒光鄉" selected="yes">莒光鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="莒光鄉">莒光鄉</option>
<%
			 }
			 if(district.equals("東引鄉"))
                         {
%>
		         <option value="東引鄉" selected="yes">東引鄉</option>
<%
			 }
			 else
			 {
%>
		         <option value="東引鄉">東引鄉</option>
<%
			 }
		      }
		      break;
		   } //end switch 	
		} //end if(district != null)
 		else
		{	
%>
		<option>中正區</option>
		<option>大同區</option>
		<option>中山區</option>
		<option>松山區</option>
		<option>大安區</option>
		<option>萬華區</option>
		<option>信義區</option>
		<option>士林區</option>
		<option>北投區</option>
		<option>內湖區</option>
		<option>南港區</option>
		<option>文山區</option>
<%  
     		}
%>
 
                    </select>
		  </td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
				
                <tr>
                  <td height="60" colspan="5" align="center" valign="bottom">                  　
                  <input type="image" src="images/sell/button_modify.jpg" alt="Submit" width="80" height="21"/> 
                  <input type="hidden" name="answer"/>                  
                  <input type="hidden" name="contact_person"  value="<%= contact_person %>"/>
                  <input type="hidden" name="phone"  value="<%= phone %>"/>
                  <input type="hidden" name="cell"  value="<%= cell %>"/>
                  <input type="hidden" name="city"  value="<%= city %>"/>
                  <input type="hidden" name="address"  value="<%= address %>"/>
		  <input type="hidden" name="district"  value="<%= district %>"/>
<%
        if("0".equals(individual))
        {
%>
                  <input type="hidden" name="store_name"  value="<%= store_name %>"/>
                  <input type="hidden" name="license_number"  value="<%= license_number %>"/>                  
<%
        } 
%>
                  <input type="hidden" name="individual"  value="<%= individual %>"/>   
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