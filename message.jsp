﻿<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
      document.message_form.district.length=district[selected_index-1].length+1;
       
      document.message_form.district.options[0].value = "";
      document.message_form.district.options[0].text = "全部";
	 
      for(var i=0;i<district[selected_index-1].length;i++)
      {
         document.message_form.district.options[i+1].value = district[selected_index-1][i];
	 document.message_form.district.options[i+1].text = district[selected_index-1][i];	
      }
   }
   else
   {           
      document.message_form.district.length=1;
      
      document.message_form.district.options[0].value = "";
      document.message_form.district.options[0].text = "全部";        	
   }	  	        	
}

</script>




</head>

<body>

<%
   request.setCharacterEncoding("UTF8");

   String subject_not_filled = request.getParameter("subject_not_filled");
   String message_not_filled = request.getParameter("message_not_filled");
   String subject = request.getParameter("subject");
   String message = request.getParameter("message");

   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";   

   if(session_id == null || "".equals(session_id)) 
   {
     response.sendRedirect("need_to_login.jsp");
     return;
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
    <td height="650" valign="top">
     <form name="message_form" method="post" action="save_message.jsp" enctype="multipart/form-data">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  
	  <tr>
	<td colspan="2">
	  縣市
	  <select name="city" style="width:156;" onChange="changeZone(this.selectedIndex);">           
                    <option value="">全部</option>
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
		&nbsp; 鄉鎮市區
		<select name="district" style="width:156;">                  
		   <option value="">全部</option>	          
                  </select>
		&nbsp; 類別
			<select name="category" style="width:156;">                  
		   <option value="0">全部</option>
		   <option value="1">交通事故/違規</option>
		   <option value="2">機車買賣</option>
		   <option value="3">揪團</option>
		   <option value="4">其他</option>
                  </select>
	</td>
      </tr>
	  <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>      	  	
      <tr>
	<td>Subject:</td>
<%
	 if( (subject != null) && (!subject.equals("")) )
         {	 
%>
	<td><input type=text maxlength="60" name="subject" value="<%= subject %>"></td>
<%
	 }
	 else
	 {     
%>
        <td><input type=text maxlength="60" name="subject"></td>
<%
	 }
%>

      </tr>
      <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
      <tr>
	<td>留言:</td>

<%
	 if( (message != null) && (!message.equals("")) )
     {	 
%>
	<td><textarea maxlength="100" name="message" rows="4" cols="60"><%= message %></textarea></td>
<%
	 }
	 else
	 {     
%>
        <td><textarea maxlength="100" name="message" rows="4" cols="60"></textarea></td>
<%
	 }
%>	
      </tr>
	  <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>	
	  <tr>
	  <td>上傳圖片</td>
	  <td><input type="file" name="fileField" id="fileField">&nbsp;&nbsp;圖檔必須小於 4 MB
	  </td>
      </tr>
	  <tr>	  
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>	  
      <tr>
	<td colspan="2"><input type="submit" value="Submit"></td>
      </tr>
    </table></form></td>
  </tr>
  <tr>
    <td height="60">
		<jsp:include page = "footer.jsp" />
	</td>
  </tr>
</table>
</body>
</html>