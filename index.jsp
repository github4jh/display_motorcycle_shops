﻿<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="description" content="買賣機車找coolbee">
<meta name="keywords" content="機車買賣,買賣機車,買機車,賣機車,機車,機車行,全台機車行,機車修理,修理機車,買賣摩托車,摩托車,全台摩托車行,修理摩托車,motorcycle,motorbike,scooter,autobike,motobike,motorbicycle,motocycle,autocycle">
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
      document.search.searched_district.length=district[selected_index-1].length+1;
       
      document.search.searched_district.options[0].value = "";
      document.search.searched_district.options[0].text = "都可以";
	 
      for(var i=0;i<district[selected_index-1].length;i++)
      {
         document.search.searched_district.options[i+1].value = district[selected_index-1][i];
	 document.search.searched_district.options[i+1].text = district[selected_index-1][i];	
      }
   }
   else
   {           
      document.search.searched_district.length=1;
      
      document.search.searched_district.options[0].value = "";
      document.search.searched_district.options[0].text = "都可以";        	
   }	  	        	
}

</script>

<%
   request.setCharacterEncoding("UTF8");
  
   String query;
   Connection dbconn;
   ResultSet rs; 
   ResultSet rowSet; 
   Statement statement = null;
   Statement stmt = null;
      
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   
   String sqlCmd;
   int k = 0, numOfImages = 0, iAdNumber = 0, index = 0;
   boolean first_loop = true;
   
   int post_year, post_month, post_day;
   String ad_link = ""; 
   String image_path[] = {"", ""};
   int num_of_images[] = {0, 0};
   
   String id_card_number[] = {"", ""};
   int ad_number[] = {0, 0};

   String model[] = {"", ""};
   String make[]= {"", ""};
   int year[] = {0, 0};
   String city[] = {"", ""};
   String address[] = {"", ""}; 
   int price[] = {0, 0};
   int ad_id[] = {0, 0}; 

   String session_id = (String) session.getAttribute("sid");
   
   String member_page_link = "";
   String imageFileName = "";

   try
   {
         Class.forName(JDBC_DRIVER);
         try
	 {
            dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");


         statement = dbconn.createStatement();
         stmt = dbconn.createStatement();
         
         query = "SELECT * FROM ad";
         
         rs = statement.executeQuery(query);

         rs.last();

         if(rs.getRow() >= 1)
         {
               ad_id[index] = rs.getInt("id");
               id_card_number[index] = rs.getString("id_card_number");
               ad_number[index] = rs.getInt("ad_number");
               model[index] = rs.getString("model");
               make[index] = rs.getString("make");
               year[index] = rs.getInt("year");
               price[index] = rs.getInt("price");
               city[index++] = rs.getString("city"); 
               iAdNumber++;         
         }

         rs.previous(); 
         
         if(rs.getRow() >= 1)
         {            
               ad_id[index] = rs.getInt("id");
               id_card_number[index] = rs.getString("id_card_number");
               ad_number[index] = rs.getInt("ad_number");
               model[index] = rs.getString("model");
               make[index] = rs.getString("make");
               year[index] = rs.getInt("year");
               price[index] = rs.getInt("price");
               city[index++] = rs.getString("city"); 
               iAdNumber++;
         } 
  
         statement.close();

         //possible values of iAdNumber: 0, 1, 2
                  

         for (k = 0; k < iAdNumber; k++)
         {
             query = "SELECT * FROM images WHERE id_card_number = '" + id_card_number[k] + "' AND fileName like '" + ad_number[k] + "_%'" ;
             rowSet = stmt.executeQuery(query);

             numOfImages = 0;
             while (rowSet.next())
             {
			    if(numOfImages == 0)  
			      imageFileName = rowSet.getString("fileName");
				  
                numOfImages++; 
             }

             if(numOfImages > 0)
             {
                image_path[k] = "upload/" + id_card_number[k] + "/" + imageFileName; 
             }
             else
             {
                image_path[k] = "images/img_small.jpg"; 
             }             
         }          

         stmt.close(); 

            dbconn.close(); 

      }
      catch (SQLException sqlException)
      {
         out.println("can not insert data into table members.<br>Not again!<br>");
      }
   }  
   catch (ClassNotFoundException err)
   {
      out.println("Class loading error.<br>");
   } //end catch   
%>

<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="left"><img src="images/logo.jpg" width="372" height="82" border="0">&nbsp;&nbsp;&nbsp;</td>
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
       <a href=<%=member_page_link%>><img src="images/sell/link_back_to_member_page.gif" width="81" height="18" border="0"></a>
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
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="228"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/left_middle.gif">
          <tr>
            <td><img src="images/left_head.jpg" width="228" height="67"></td>
          </tr>
          <tr>
            <td height="343" valign="top"><form name="form1" method="post" action="verify_member_id.jsp?memberLogin=1">
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>                  
				  <td height="50"><img src="images/sell/word_create_account8.gif" alt="1" width="75" height="23"></td>
                </tr>
                <tr>
                  <td height="0"> 　　　
                    <input name="email" type="text" id="textfield" size="18"></td>
                </tr>
                <tr>
                  <td height="30" valign="bottom">　　 <img src="images/word_pass.gif" width="43" height="15"></td>
                </tr>
                <tr>
                  <td height="0">　　　
                    <input name="password" type="password" id="textfield2" size="18"></td>
                </tr>
                <tr>
                  <td> 　　　<a href="forget_password.jsp" class="style6">忘記密碼</a></td>
                </tr>
                <tr>
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr valign="bottom">
                      <td width="45" height="30">&nbsp;</td>                      
                      <td height="30"><input type="image" src="images/button_loginin.jpg" alt="Submit" width="45" height="21" /></td>
                      <td height="30"><a href="create_account_individual.jsp"><img src="images/button_free.jpg" width="103" height="21" border="0"></a></td>
                    </tr>
                  </table></td>
                </tr>
              </table>
                          </form>
              </td>
          </tr>
          <tr>
            <td><img src="images/left_foot.jpg" width="228" height="31"></td>
          </tr>
        </table></td>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="50"><img src="images/banner_surf.gif" width="662" height="23"></td>
          </tr>
          <tr>
            <td align="right"><form name="search" method="post" action="search_result.jsp?searchMotorcycle=1&page=1&date_posted=desc">
              <table width="610" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="30"><img src="images/word_1.gif" width="71" height="23"></td>
                  <td>
                    <select name="searched_city" style="width:156;" onChange="changeZone(this.selectedIndex);">           
                    <option value="">都可以</option>
			  <option value="基隆市">基隆市</option>	
	                  <option value="台北市">台北市</option>
	                  <option value="新北市">新北市</option>
			  <option value="桃園縣">桃園縣</option>
	                  <option value="新竹市">新竹市</option>	
			  <option value="新竹縣">新竹縣</option>	                   
	                  <option value="苗栗縣">苗栗縣</option>
	                  <option value="台中市">台中市</option>
	                  <option value="南投縣">南投縣</option>
	                  <option value="彰化縣">彰化縣</option>
	                  <option value="雲林縣">雲林縣</option>
	                  <option value="嘉義市">嘉義市</option>
	                  <option value="嘉義縣">嘉義縣</option>
	                  <option value="台南市">台南市</option>
	                  <option value="高雄市">高雄市</option>
	                  <option value="屏東縣">屏東縣</option>
	                  <option value="宜蘭縣">宜蘭縣</option>
	                  <option value="花蓮縣">花蓮縣</option>
	                  <option value="台東縣">台東縣</option>
	                  <option value="澎湖縣">澎湖縣</option>
	                  <option value="金門縣">金門縣</option>
	                  <option value="連江縣">連江縣</option>
                    </select>
                  </td>
                  <td width="30" height="110" rowspan="4"><img src="images/line.gif" width="9" height="108"></td>
                  <td><img src="images/word_5.gif" width="71" height="23"></td>
                  <td>
                    <select name="searched_price" style="width:156;">           
                    <option value="0">都可以</option>
	            <option value="1">$0 ~ $10000</option>
	            <option value="2">$10001 ~ $30000</option>
	            <option value="3">$30001 ~ $50000</option>
	            <option value="4">$50001 ~ $100000</option>
 	            <option value="5">$100001 ~ $150000</option>
	            <option value="6">$150001 以上</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_2.gif" width="71" height="23"></td>
                  <td>           
                  <select name="searched_cc" style="width:156;">           
                  <option value="0">都可以</option>
	                <option value="1">1 ~ 50 c.c.</option>
	                <option value="2">51 ~ 100 c.c.</option>
	                <option value="3">101 ~ 150 c.c.</option>
	                <option value="4">151 ~ 250 c.c.</option>
	                <option value="5">251 ~ 500 c.c.</option>
	                <option value="6">501 ~ 750 c.c.</option>
	                <option value="7">751 ~ 1000 c.c.</option>
	                <option value="8">1001 ~ 1250 c.c.</option>
	                <option value="9">1251 ~ 1500 c.c.</option>
	                <option value="10">1501 c.c. 以上</option>
		  </select>
                  </td>
                  <td><img src="images/word_6.gif" width="71" height="23"></td>
                  <td>           
                  <select name="searched_km" style="width:156;">           
                  <option value="0">都可以</option>
	                <option value="1">0 ~ 1000 公里</option>
	                <option value="2">1001 ~ 5000 公里</option>
	                <option value="3">5001 ~ 10000 公里</option>
	                <option value="4">10001 ~ 20000 公里</option> 	     
	                <option value="5">20001 ~ 50000 公里</option>
                  <option value="6">50001 ~ 100000 公里</option>
                  <option value="7">100001 公里以上</option>
                  </select>
                  </td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_3.gif" width="71" height="23"></td>
                  <td>           
                  <select name="searched_make" style="width:156;">           
                  <option value="0">都可以</option>
	                <option value="1">BMW</option>
	                <option value="2">Harley-Davidson 哈雷</option>
	                <option value="3">Honda 本田</option>
	                <option value="4">Kawasaki 川崎</option> 	     
	                <option value="5">Kymco 光陽</option>
                  <option value="6">PGO 比雅久</option>
                  <option value="7">Suzuki 鈴木</option>
                  <option value="8">SYM 三陽</option>
                  <option value="9">Yamaha 山葉</option> 
                  </select>
                  </td>
                  <td><img src="images/word_7.gif" width="71" height="23"></td>
                  <td>
                  <select name="searched_model" style="width:156;">
                  <option value="">都可以</option>	                	                 
                  </select> 
                  </td>
                </tr>
                <tr>
                  <td height="30"><img src="images/word_4.gif" width="71" height="23"></td>
                  <td>           
                  <select name="searched_year" style="width:156;">           
                  <option value="0">都可以</option>
				  <option value="10">2013</option>
				  <option value="9">2012</option>
				  <option value="8">2011</option>
	              <option value="7">2006 ~ 2010</option>
				  <option value="6">2001 ~ 2005</option> 	     
				  <option value="5">1996 ~ 2000</option>
                  <option value="4">1991 ~ 1995</option>
                  <option value="3">1986 ~ 1990</option>
                  <option value="2">1982 ~ 1985</option>
                  <option value="1">1981 以前</option>
                  </select>
                  </td>
                  <td><img src="images/word_8.gif" width="71" height="23"></td>
                  <td>           
                  <select name="searched_post_date" style="width:156;">           
                  <option value="0">都可以</option>
	                <option value="1">最近一週</option>
	                <option value="2">最近一個月</option>
	                <option value="3">最近三個月</option>
	                <option value="4">最近半年</option> 	     
	                <option value="5">半年前</option>
                  </select>
                  </td>
                </tr>
		<tr>
                  <td height="30">鄉鎮市區</td>                  
                  <td>           
                  <select name="searched_district" style="width:156;">                  
		   <option value="">都可以</option>	          
                  </select>
                  </td>
                  <td>&nbsp;</td>                  
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td height="40" colspan="5" align="center" valign="bottom"><input type="image" src="images/button_surf.jpg" alt="Submit" width="81" height="21" /></td>                  
                </tr>
              </table>
                        </form>
            </td>
          </tr>
<!--new ad begin
-->
          
<%        
          if(iAdNumber > 0)
          {
             ad_link = "show_ad_detail.jsp?fromSearchResult=1&fromIndex=1&ad_id=" + ad_id[0];
%>
          <tr>
            <td height="45" valign="top"><img src="images/banner_goodcar.gif" width="662" height="42"></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="28">&nbsp;</td>
                <td width="146">
                    <a href=<%=ad_link%>><img src=<%= image_path[0] %> width="145" height="145" class="imgborder_small"></a>
                </td>
                <td width="146"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="10">&nbsp;</td>
                    <td><img src="images/word_detial.gif" width="76" height="18"></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td><img src="images/word_pot.gif" alt="" width="137" height="8"></td>
                  </tr>
                  <tr>
                    <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="50" align="center" class="a1">城市</td>
                        <td class="a1"><%= city[0]%></td>
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
                <td>&nbsp;</td>
<%
          } //end if(iAdNumber > 0)
%>
<!-- second ad begin
-->
<%
          if(iAdNumber > 1)
          { 
             ad_link = "show_ad_detail.jsp?fromSearchResult=1&fromIndex=1&ad_id=" + ad_id[1];
%>
                <td width="146">
                    <a href=<%=ad_link%>><img src=<%= image_path[1] %> width="145" height="145" class="imgborder_small"></a>
                </td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                          <td class="a1"><%= city[1]%></td>
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

<!-- second ad end
-->
<%
          } //end if(iAdNumber > 1)          
%>
              </tr>
            </table></td>
          </tr>


<!--end new ad
-->
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