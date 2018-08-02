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
tbody {
    font-size: 14px;
    font-family: 微軟正黑體;
}
.a22_icon_ss1 {
    background: url(images/icon/for_icon-03.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss2 {
    background: url(images/icon/for_icon-04.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss3 {
    background: url(images/icon/for_icon-05.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss4 {
    background: url(images/icon/for_icon-06.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss5 {
    background: url(images/icon/for_icon-07.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss6 {
    background: url(images/icon/for_icon-08.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss7 {
    background: url(images/icon/for_icon-09.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss8 {
    background: url(images/icon/for_icon-10.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss9 {
    background: url(images/icon/for_icon-11.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss10 {
    background: url(images/icon/for_icon-12.png);
    width:  20px;
    height:  20px;
    background-size: cover;
}

.a22_icon_ss11 {
    background: url('images/icon/for_icon-13.png');
    width:  20px;
    height:  20px;
    background-size: cover;
}
.asb6025 {
	display: inline-flex;
    display: -webkit-box;
}

.asb6025 .icon_page {
    padding: 14px;
}

.icon_page div {
    cursor: pointer;
}
span.nuber_icosn {
    background: #795430;
    border-radius: 15px;
    width: 18px;
    height: 18px;
    font-size: 14px;
    color: #fff;
    font-family: sans-serif;
    z-index: 9999;
    position: absolute;
    text-align: center;
    line-height: 18px;
}

span.nuber_icosn:hover {
    background: #ff8c11;
}
.icon_page div {
    width: 45px;
    height: 50px;
}
</style>

<script language="javascript">
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

district[8]=["南投市", "中寮鄉", "草屯鎮", "國姓鄉", "埔里鎮", "仁愛鄉", "名間鄉", "集集鎮", "水里鄉", "魚池鄉", "信義鄉", "竹山鎮", "鹿谷鄉"];	//南投縣 

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
   if(selected_index > 0)
   {     
      document.search.district.length=district[selected_index-1].length+1;
       
      document.search.district.options[0].value = "";
      document.search.district.options[0].text = "全部";
	 
      for(var i=0;i<district[selected_index-1].length;i++)
      {
         document.search.district.options[i+1].value = district[selected_index-1][i];
		 document.search.district.options[i+1].text = district[selected_index-1][i];	
      }
   }
   else
   {           
      document.search.district.length=1;
      
      document.search.district.options[0].value = "";
      document.search.district.options[0].text = "全部";        	
   }	  	        	
}

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
    eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
    if (restore) selObj.selectedIndex=0;
  }
}

function locateShop(longitude, latitude)
{
	url = "location.jsp?longitude=" + longitude + "&latitude=" + latitude;
	locationWindow = window.open(url,"locationWindow","scrollbars=no,status=no,menubar=no,toolbar=no,titlebar=no,location=no,width=800,height=650,left=20,top=10");
	locationWindow.focus();
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

   Connection dbconn;
   ResultSet rs; 
   Statement statement = null;
   
   String query = "", mysqlQuery = "";  
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   
   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";
   //String location_link = "";
   
   
   String strParams = "", previous_page_link = "", next_page_link = "";
   int total = 0, total_page = 0, current_page = 1, start_record = 0;
   int RecordLimit = 10, index = 0, result_count = 0;
   int firstLoop = 1;
   
   String city[] = {"", "", "", "", "", "", "", "", "", ""};
   String address[] = {"", "", "", "", "", "", "", "", "", ""};
   String district[] = {"", "", "", "", "", "", "", "", "", ""};
   String phone[] = {"", "", "", "", "", "", "", "", "", ""};   
   String store_name[] = {"", "", "", "", "", "", "", "", "", ""};
   String longitude[] = {"", "", "", "", "", "", "", "", "", ""};
   String latitude[] = {"", "", "", "", "", "", "", "", "", ""};
   int sale[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int repair[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int inspection[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int transport[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int rental[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; 
   int insurance[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int fabricate[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int electrical[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int heavycycle[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int recharge[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int yearroundservice[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   
   
   String tmpPage = request.getParameter("page");
   
   if ("".equals(tmpPage) || tmpPage == null)
   {
      tmpPage = "1";
   }
   
   current_page = Integer.valueOf(tmpPage);
   
   start_record = (current_page - 1) * RecordLimit;
   
   
   boolean itemSearched = false;

   String searched_city = request.getParameter("city");
   String searched_district = request.getParameter("district");
   String searched_phone_number = request.getParameter("phone_number");
   String searched_address = request.getParameter("store_address");
   String searched_store_name = request.getParameter("store_name");
   String searched_service = request.getParameter("service");	
   
   if ("".equals(searched_city) || searched_city == null)
   {
      searched_city = "";
   }
   
   if ("".equals(searched_district) || searched_district == null)
   {
      searched_district = "";
   }
   
   if ("".equals(searched_phone_number) || searched_phone_number == null)
   {
      searched_phone_number = "";
   }

   if ("".equals(searched_address) || searched_address == null)
   {
      searched_address = "";
   }   

   if ("".equals(searched_store_name) || searched_store_name == null)
   {
      searched_store_name = "";
   }
   
   if ("".equals(searched_service) || searched_service == null)
   {
      searched_service = "";
   }

   if ("".equals(searched_city) && "".equals(searched_district) && "".equals(searched_phone_number) && "".equals(searched_address) && "".equals(searched_store_name) && "".equals(searched_service))
   {
      query = "SELECT * FROM motorcycle_shops limit " + start_record + ", " + RecordLimit;
	  mysqlQuery = "SELECT * FROM motorcycle_shops";
   }
   else
   { 
      query = "SELECT * FROM motorcycle_shops"; 
	  if(!("".equals(searched_city)))
	  {
         query += " where city = '" + searched_city + "'";
         itemSearched = true;
      }
      else
      { 
         query += " where ";
         itemSearched = false;
      }

	  if(!("".equals(searched_district)))
	  {      
         if(itemSearched)
            query += " AND ";
	  
         query += "district = '" + searched_district + "'";     
         itemSearched = true;
      }	
		 
	  if(!("".equals(searched_phone_number)))
	  {      
         if(itemSearched)
            query += " AND ";
	  
         query += "phone_number = '" + searched_phone_number + "'";     
         itemSearched = true;
      }
      		 
	  if(!("".equals(searched_address)))
	  {      
         if(itemSearched)
            query += " AND ";
	  
         query += "address = '" + searched_address + "'";     
         itemSearched = true;
      }	   	 

	  if(!("".equals(searched_store_name)))
	  {      
         if(itemSearched)
            query += " AND ";
	  
         query += "store_name = '" + searched_store_name + "'";     
         itemSearched = true;
      }   

	  if(!("".equals(searched_service)))
	  {
	     if(itemSearched)
            query += " AND ";
	  
	     if("rent".equals(searched_service))
		 {
		    query += " rental = 1 ";
   		 }
	     else if("transport".equals(searched_service))
		 {
		    query += " transport = 1 ";
   		 }
	     else if("inspect".equals(searched_service))
		 {
		    query += " inspection = 1 ";
   		 }
	     else if("heavy_cycle".equals(searched_service))
		 {
		    query += " heavycycle = 1 ";
   		 }		 
		 else if("electrical_cycle".equals(searched_service))
		 {
		    query += " electrical = 1 ";
   		 }
		 else if("sale".equals(searched_service))
		 {
		    query += " sale = 1 ";
   		 }
		 else if("repair".equals(searched_service))
		 {
		    query += " repair = 1 ";
   		 }
		 else if("insurance".equals(searched_service))
		 {
		    query += " insurance = 1 ";
   		 }
		 else if("fabricate".equals(searched_service))
		 {
		    query += " fabricate = 1 ";
   		 }
		 else if("recharge".equals(searched_service))
		 {
		    query += " recharge = 1 ";
   		 }
		 else if("yearroundservice".equals(searched_service))
		 {
		    query += " yearroundservice = 1 ";
   		 }
      }
	  
	  mysqlQuery = query;
	  query += " limit " + start_record + ", " + RecordLimit;   	  
   }

   try
   {
      Class.forName(JDBC_DRIVER);
      try
	    {
         
	       dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
           statement = dbconn.createStatement();
           rs = statement.executeQuery(query);
		   index = 0;

           while (rs.next())
           {
              if (index < RecordLimit)
              {
                 city[index] = rs.getString("city");
				 district[index] = rs.getString("district"); 
                 address[index] = rs.getString("address");
                 phone[index] = rs.getString("phone_number");                 
                 store_name[index] = rs.getString("store_name");
				 longitude[index] = rs.getString("longitude");
				 latitude[index] = rs.getString("latitude");
				 sale[index] = rs.getInt("sale");
				 repair[index] = rs.getInt("repair");
				 inspection[index] = rs.getInt("inspection");
				 transport[index] = rs.getInt("transport");
                 rental[index] = rs.getInt("rental");
                 insurance[index] = rs.getInt("insurance");
				 fabricate[index] = rs.getInt("fabricate");
				 electrical[index] = rs.getInt("electrical");
				 heavycycle[index] = rs.getInt("heavycycle");
				 recharge[index] = rs.getInt("recharge");
				 yearroundservice[index++] = rs.getInt("yearroundservice");
              }
           } 

         result_count = index;
         statement.close();

         rs = dbconn.createStatement().executeQuery(mysqlQuery);
		 
		 
		 //out.println("result_count: " + result_count + "<br>");

         rs.last();
 
         total = rs.getRow();
     
         total_page = (int)Math.ceil((double) total / RecordLimit); 

         if(total_page >= current_page && current_page > 1)
         {
            previous_page_link = "display_motorcycle_shops.jsp?page=" + (current_page - 1) + "&city=" + searched_city;            
         }
 
         if(total_page > current_page)
         {
            next_page_link = "display_motorcycle_shops.jsp?page=" + (current_page + 1) + "&city=" + searched_city;            
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
   //if(session.isNew())   
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
        <td><a href="heavycycle_store.jsp"><img src="images/buttom_4.gif" width="136" height="69" border="0"></a></td>
        <td><a href="electric_cycle_store.jsp"><img src="images/buttom_5.gif" width="281" height="69" border="0"></a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="21">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">	
      <tr>
        <td colspan="4">搜尋條件</td>
	  </tr>
      <tr>	  
	    <td colspan="4"><form name="search" method="post" action="display_motorcycle_shops.jsp">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td>縣市: 
                <select name="city" style="width:156;" onChange="changeZone(this.selectedIndex);">
                <option value="">全部</option>


<%					
		if ("基隆市".equals(searched_city))
		{
%>					
			  <option value="基隆市" selected="selected">基隆市</option>
<%					
		}
		else
		{
%>					
			  <option value="基隆市">基隆市</option>
<%					
		}
		
		if ("台北市".equals(searched_city))
		{
%>					
			  <option value="台北市" selected="selected">台北市</option>
<%					
		}
		else
		{
%>					
			  <option value="台北市">台北市</option>
<%					
		}
		
		if ("新北市".equals(searched_city))
		{
%>					
			  <option value="新北市" selected="selected">新北市</option>
<%					
		}
		else
		{
%>					
			  <option value="新北市">新北市</option>
<%					
		}
		
		if ("桃園縣".equals(searched_city))
		{
%>					
			  <option value="桃園縣" selected="selected">桃園縣</option>
<%					
		}
		else
		{
%>					
			  <option value="桃園縣">桃園縣</option>
<%					
		}

		if ("新竹市".equals(searched_city))
		{
%>					
			  <option value="新竹市" selected="selected">新竹市</option>
<%					
		}
		else
		{
%>					
			  <option value="新竹市">新竹市</option>
<%					
		}

		if ("新竹縣".equals(searched_city))
		{
%>					
			  <option value="新竹縣" selected="selected">新竹縣</option>
<%					
		}
		else
		{
%>					
			  <option value="新竹縣">新竹縣</option>
<%					
		}

		if ("苗栗縣".equals(searched_city))
		{
%>					
			  <option value="苗栗縣" selected="selected">苗栗縣</option>
<%					
		}
		else
		{
%>					
			  <option value="苗栗縣">苗栗縣</option>
<%					
		}

		if ("台中市".equals(searched_city))
		{
%>					
			  <option value="台中市" selected="selected">台中市</option>
<%					
		}
		else
		{
%>					
			  <option value="台中市">台中市</option>
<%					
		}

		if ("南投縣".equals(searched_city))
		{
%>					
			  <option value="南投縣" selected="selected">南投縣</option>
<%					
		}
		else
		{
%>					
			  <option value="南投縣">南投縣</option>
<%					
		}

		if ("彰化縣".equals(searched_city))
		{
%>					
			  <option value="彰化縣" selected="selected">彰化縣</option>
<%					
		}
		else
		{
%>					
			  <option value="彰化縣">彰化縣</option>
<%					
		}

		if ("雲林縣".equals(searched_city))
		{
%>					
			  <option value="雲林縣" selected="selected">雲林縣</option>
<%					
		}
		else
		{
%>					
			  <option value="雲林縣">雲林縣</option>
<%					
		}

		if ("嘉義市".equals(searched_city))
		{
%>					
			  <option value="嘉義市" selected="selected">嘉義市</option>
<%					
		}
		else
		{
%>					
			  <option value="嘉義市">嘉義市</option>
<%					
		}

		if ("嘉義縣".equals(searched_city))
		{
%>					
			  <option value="嘉義縣" selected="selected">嘉義縣</option>
<%					
		}
		else
		{
%>					
			  <option value="嘉義縣">嘉義縣</option>
<%					
		}

		if ("台南市".equals(searched_city))
		{
%>					
			  <option value="台南市" selected="selected">台南市</option>
<%					
		}
		else
		{
%>					
			  <option value="台南市">台南市</option>
<%					
		}

		if ("高雄市".equals(searched_city))
		{
%>					
			  <option value="高雄市" selected="selected">高雄市</option>
<%					
		}
		else
		{
%>					
			  <option value="高雄市">高雄市</option>
<%					
		}

		if ("屏東縣".equals(searched_city))
		{
%>					
			  <option value="屏東縣" selected="selected">屏東縣</option>
<%					
		}
		else
		{
%>					
			  <option value="屏東縣">屏東縣</option>
<%					
		}

		if ("宜蘭縣".equals(searched_city))
		{
%>					
			  <option value="宜蘭縣" selected="selected">宜蘭縣</option>
<%					
		}
		else
		{
%>					
			  <option value="宜蘭縣">宜蘭縣</option>
<%					
		}

		if ("花蓮縣".equals(searched_city))
		{
%>					
			  <option value="花蓮縣" selected="selected">花蓮縣</option>
<%					
		}
		else
		{
%>					
			  <option value="花蓮縣">花蓮縣</option>
<%					
		}

		if ("台東縣".equals(searched_city))
		{
%>					
			  <option value="台東縣" selected="selected">台東縣</option>
<%					
		}
		else
		{
%>					
			  <option value="台東縣">台東縣</option>
<%					
		}

		if ("澎湖縣".equals(searched_city))
		{
%>					
			  <option value="澎湖縣" selected="selected">澎湖縣</option>
<%					
		}
		else
		{
%>					
			  <option value="澎湖縣">澎湖縣</option>
<%					
		}

		if ("金門縣".equals(searched_city))
		{
%>					
			  <option value="金門縣" selected="selected">金門縣</option>
<%					
		}
		else
		{
%>					
			  <option value="金門縣">金門縣</option>
<%					
		}

		if ("連江縣".equals(searched_city))
		{
%>					
			  <option value="連江縣" selected="selected">連江縣</option>
<%					
		}
		else
		{
%>					
			  <option value="連江縣">連江縣</option>
<%					
		}		
%>
                
				</select>
				</td>
				<td>
				鄉鎮市區:
             	<select name="district" style="width:156;">
				
<%
		if (!("".equals(searched_district)))
		{
%>			
           <option value="">全部</option> 	
		   <option value="<%= searched_district %>" selected="selected"><%= searched_district %></option>	  
<%					
		}
		else
		{
%>					
		   <option value="">全部</option>
<%					
		}		  
%>              
				</select>			
              </td> 
              <td>電話: <input type="text" name="phone_number"><br><font color="red">例: 02-12345678</font></td>
            </tr>
			<tr>	
			  <td>地址: <input type="text" name="store_address"><br><font color="red">例: 中山路一段167號</font></td>
              <td>店名: <input type="text" name="store_name"></td>
              <td>服務: 
                <select name="service" style="width:156;">
                <option value="" selected="yes">都可以</option>
				<option value="sale">出售機車</option>
				<option value="repair">維修</option>
				<option value="inspect">定檢</option>
				<option value="transport">託運</option>
                <option value="rent">出租</option>
                <option value="insurance">辦理機車保險</option>
                <option value="fabricate">改裝機車</option>
				<option value="electrical_cycle">出售電動機車</option>				
                <option value="heavy_cycle">出售重機</option>
				<option value="recharge">電動機車充電</option>				
				<option value="yearroundservice">24小時道路救援</option>
                </select>				
			  </td>  
            </tr>
            <tr>
              <td height="40" colspan="4" align="center" valign="bottom"><input type="image" src="images/button_surf.jpg" alt="Submit" width="81" height="21"></td>
	        </tr>
          </table>
		  </form> 
        </td>
      </tr>
	  <tr>
	    <td colspan="4">
		&nbsp;&nbsp;&nbsp;
	    </td>  
	  </tr>


	<div class="asb6025">
	  <span class="nuber_icosn" title="出售機車">1</span><div class="icon_page"><div class="a22_icon_ss1" title="出售機車"></div></div>
	  <span class="nuber_icosn" title="維修">2</span><div class="icon_page"><div class="a22_icon_ss2" title="維修"></div></div>
	  <span class="nuber_icosn" title="定檢">3</span><div class="icon_page"><div class="a22_icon_ss3" title="定檢"></div></div>
	  <span class="nuber_icosn" title="託運">4</span><div class="icon_page"><div class="a22_icon_ss4" title="託運"></div></div>
	  <span class="nuber_icosn" title="出租">5</span><div class="icon_page"><div class="a22_icon_ss5" title="出租"></div></div>
	  <span class="nuber_icosn" title="辦理機車保險">6</span><div class="icon_page"><div class="a22_icon_ss6" title="辦理機車保險"></div></div>
	  <span class="nuber_icosn" title="改裝機車">7</span><div class="icon_page"><div class="a22_icon_ss7" title="改裝機車"></div></div>
	  <span class="nuber_icosn" title="出售電動機車">8</span><div class="icon_page"><div class="a22_icon_ss8" title="出售電動機車"></div></div>
	  <span class="nuber_icosn" title="出售重機">9</span><div class="icon_page"><div class="a22_icon_ss9" title="出售重機"></div></div>
	  <span class="nuber_icosn" title="電動機車充電">10</span><div class="icon_page"><div class="a22_icon_ss10" title="電動機車充電"></div></div>
	  <span class="nuber_icosn" title="24小時道路救援">11</span><div class="icon_page"><div class="a22_icon_ss11" title="24小時道路救援"></div></div>
	</div>


<%
        if(result_count > 0)
		{
%>	  
      <tr> 
        <td width="200" height="50" valign="middle"><img src="images/sell/word_create_account5.gif" alt="1" width="75" height="23"></td>
		<td width="330" height="50" valign="middle"><img src="images/sell/word_create_account9.gif" alt="1" width="75" height="23"></td>
		<td width="160" height="50" valign="middle"><img src="images/sell/word_create_account3.gif" alt="1" width="75" height="23"></td>		
		<td width="200" height="50" valign="middle">服務</td>
      </tr>
	  <form name="shopInfo" method="post" action="location.jsp">
<%	  
	    }
%>	  
	  <%
	       for (index = 0; index < result_count; index++)
		   {
		     String longitudeName = "longitude" + index;
			 String latitudeName = "latitude" + index;
			 if((index % 2) == 0)
             {			 
	  %>	  
      <tr bgcolor="#F5D0A9">    	  
      <%
	         }
             else			 
			 {
	  %>	
      <tr>
	  <%
	         }
	  %>
		
        <td valign="top">
	  <%
			//if (index == 0)
			//{
	  %>
			<!--<input type="hidden" name="longitudeValue" id="longitudeValue" value=''/>-->
			<!--<input type="hidden" name="latitudeValue" id="latitudeValue" value=''/>-->
	  <%
			//}			
	  %>	  		
			<a href="#" onclick="locateShop(<%= longitude[index] %>, <%= latitude[index] %>)"><%= store_name[index] %></a>
		</td>
		<td valign="top"><%= city[index] %><%= district[index] %><%= address[index] %></td>		
		<td valign="top">
		<%  
		   if("0".equals(phone[index]))
		   {
		%>
		      &nbsp;
		<%  
		   }
		   else
		   {
		%>
		      <%= phone[index] %>
		<%  
		   }
		%>   
		</td>		
		<td valign="top">
<%	
		if(sale[index] == 1)
		{
%>
	   <div class="a22_icon_ss1" title="出售機車"></div>
<%
		}

		if(repair[index] == 1)
		{
%>
	   <div class="a22_icon_ss2" title="維修"></div>
<%
		}
		
		if(inspection[index] == 1)
		{
%>
           <div class="a22_icon_ss3" title="定檢"></div>
<%
		}

		if(transport[index] == 1)
		{
%>
           <div class="a22_icon_ss4" title="託運"></div>
<%
		}
	
        if(rental[index] == 1)
		{
%>
           <div class="a22_icon_ss5" title="出租"></div>
<%
		}

		if(insurance[index] == 1)
		{
%>
           <div class="a22_icon_ss6" title="辦理機車保險"></div>
<%
		}

		if(fabricate[index] == 1)
		{
%>
           <div class="a22_icon_ss7" title="改裝機車"></div>
<%
		}

		if(electrical[index] == 1)
		{
%>
           <div class="a22_icon_ss8" title="出售電動機車"></div>
<%
		}

		if(heavycycle[index] == 1)
		{
%>
           <div class="a22_icon_ss9" title="出售重機"></div>
<%
		}

		if(recharge[index] == 1)
		{
%>
           <div class="a22_icon_ss10" title="電動機車充電"></div>
<%
		}		
		
		if(yearroundservice[index] == 1)
		{
%>
           <div class="a22_icon_ss11" title="24小時道路救援"></div>
<%
		}
%>		
		</td>		
      </tr>	  
	  <%
		   }
	  %>
	  
	  </form>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <%
   if(result_count > 0)
   {
  %>
      <form name="pageForm" method="post" action="display_motorcycle_shops.jsp">
      <td align="middle" class="a3">共<span class="a22"><%= total %></span> 筆資料　   第<span class="a22"> <%= total_page%></span> 之 <span class="a22"><%= current_page%> </span>頁 　  
  
      <input type="hidden" name="page"/>
  <%
      if(total_page >= current_page && current_page > 1)
      {
  %>
      <input type="hidden" name="prevpage" value="<%= current_page - 1 %>"/>
	  <input type="hidden" name="city" value="<%= searched_city %>"/>
	  <input type="hidden" name="district" value="<%= searched_district %>"/>	  
	  <input type="hidden" name="phone_number" value="<%= searched_phone_number %>"/>
	  <input type="hidden" name="store_address" value="<%= searched_address %>"/>
	  <input type="hidden" name="store_name" value="<%= searched_store_name %>"/>
	  <input type="hidden" name="service" value="<%= searched_service %>"/>
	  
      <!--<span class="a22"><a href=<%= previous_page_link %> class="a22">上一頁</a></span>-->
	  <input type="button" value="上一頁" onClick=goToPage(1)>
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
            if(iPage == current_page)
            {      
			   continue; 
            }
			else
            { 		 
%>        
		    <option value="<%=iPage%>"><%=iPage%></option>
<%       
            }
         }
%>
      </select>
	  <input type="hidden" name="city" value="<%= searched_city %>"/>
	  <input type="hidden" name="district" value="<%= searched_district %>"/>	  
	  <input type="hidden" name="phone_number" value="<%= searched_phone_number %>"/>
	  <input type="hidden" name="store_address" value="<%= searched_address %>"/>
	  <input type="hidden" name="store_name" value="<%= searched_store_name %>"/>
	  <input type="hidden" name="service" value="<%= searched_service %>"/>
      <strong><span class="a33">頁</span></strong>
<%	 
      }
	  if(total_page > current_page)
      {  
%>
		 <input type="hidden" name="nextpage" value="<%= current_page + 1 %>"/>
		 <input type="hidden" name="city" value="<%= searched_city %>"/>
		 <input type="hidden" name="district" value="<%= searched_district %>"/>	  
		 <input type="hidden" name="phone_number" value="<%= searched_phone_number %>"/>
		 <input type="hidden" name="store_address" value="<%= searched_address %>"/>
		 <input type="hidden" name="store_name" value="<%= searched_store_name %>"/>
		 <input type="hidden" name="service" value="<%= searched_service %>"/>		 
		 
         <!--<a href=<%= next_page_link %> class="a22">下一頁</a>-->
		 <input type="button" value="下一頁" onClick=goToPage(3)>
<%
      } 
%>
      </td>
	  </form>
<%  
   } //end if(result_count > 0)	  
   else 
   {
  %>
          <td align="center" valign="middle" class="a3">共<span class="a22">0</span> 筆資料</td>
  <%
   }
  %>
  </tr>
  <tr>
    <td height="60">
		<jsp:include page = "footer.jsp" />
	</td>
  </tr>
</table>
</body>
</html>
