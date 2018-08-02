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
    import = "java.net.URLEncoder"
	import = "java.net.URLDecoder"
	import = "javax.servlet.http.*"
%>

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
      document.searchForm.district.length=district[selected_index-1].length+1;
       
      document.searchForm.district.options[0].value = "";
      document.searchForm.district.options[0].text = "全部";
	 
      for(var i=0;i<district[selected_index-1].length;i++)
      {
         document.searchForm.district.options[i+1].value = district[selected_index-1][i];
	 document.searchForm.district.options[i+1].text = district[selected_index-1][i];	
      }
   }
   else
   {           
      document.searchForm.district.length=1;
            
      document.searchForm.district.options[0].value = "";
      document.searchForm.district.options[0].text = "全部";        	
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

</script>

</head>

<body>

<%
   request.setCharacterEncoding("UTF8");

   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";

   String query, mysqlQuery = "";   
   Connection dbconn;
   ResultSet rs, rowSet;   
   Statement statement = null;
         
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 

   String previous_page_link = "", next_page_link = "";

   String str_city = "", str_district = "", str_category = ""; 
   
   String date_posted_selected = request.getParameter("date_posted_selected");
   String number_of_views_selected = request.getParameter("number_of_views_selected");
   String number_of_replies_selected = request.getParameter("number_of_replies_selected");
   
   String date_posted = request.getParameter("date_posted");
   String number_of_views = request.getParameter("number_of_views");
   String number_of_replies = request.getParameter("number_of_replies");
   
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
   else if("1".equals(number_of_views_selected))
   {
	   if( ("".equals(number_of_views)) || (number_of_views == null) )
	      number_of_views = "desc";
	   else
	   {
	      if( "desc".equals(number_of_views) )
		  {
		     number_of_views = "asc";			
		  }
		  else
		  {
			 number_of_views = "desc";	
		  }
	   }   
   }
   else if("1".equals(number_of_replies_selected))
   {
	   if( ("".equals(number_of_replies)) || (number_of_replies == null) )
	      number_of_replies = "desc";
	   else
	   {
	      if( "desc".equals(number_of_replies) )
		  {
		     number_of_replies = "asc";			
		  }
		  else
		  {
			 number_of_replies = "desc";	
		  }
	   }   
   } 
   else
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
   
   
   str_city = request.getParameter("city");
   str_district = request.getParameter("district");
   str_category = request.getParameter("category");
   
   
   if( (str_city == null) || ("".equals(str_city)) )
   {
	  str_city = "";
   }
   
   if( (str_district == null) || ("".equals(str_district)) )
   {
	  str_district = "";
   }
   
   if( (str_category == null) || ("".equals(str_category)) )
   {
	  str_category = "0";
   }
   
   boolean itemSearched = false;			
   int total = 0, total_page = 0, current_page = 1, start_record = 0, record_index = 0, loop_index;
   int result_count = 0;

   int message_id[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; 
   int num_of_views[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; 	
   int num_of_replies[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int num_of_likes[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
   int hide[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; 
   int violation[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; 
   
   String name[] = {"", "", "", "", ""};
   String email[] = {"", "", "", "", ""};
   String subject[] = {"", "", "", "", ""}; 
   String date[] = {"", "", "", "", ""};
   String time[] = {"", "", "", "", ""};
   String message[] = {"", "", "", "", ""};	
   String city[] = {"", "", "", "", ""};
   String district[] = {"", "", "", "", ""};
   String category[] = {"", "", "", "", ""};
   String categoryDescr[] = {"全部", "交通事故/違規", "機車買賣", "揪團", "其他"};
   
   String board_page = "";
   String category_descr = "";
   
   board_page = request.getParameter("page");

   if( (board_page == null) || ("".equals(board_page)) )
   {
	current_page = 1;
   }
   else
   {
   	current_page = Integer.valueOf(board_page);
   }
   
   start_record = (current_page - 1) * 5;   
	
   if("".equals(str_city) && "".equals(str_district) && "0".equals(str_category))
   {   
      if( "1".equals(date_posted_selected) ) 
	  {
	     if( "desc".equals(date_posted) )
		 {
		    query = "SELECT * FROM message_board ORDER BY date DESC, time DESC limit " + start_record + ", 5";
			mysqlQuery = "SELECT * FROM message_board ORDER BY date DESC, time DESC";
		 }
		 else // date_posted == "asc"
		 {
			query = "SELECT * FROM message_board ORDER BY date limit " + start_record + ", 5";
			mysqlQuery = "SELECT * FROM message_board ORDER BY date";				
		 }
	  }
	  else if( "1".equals(number_of_views_selected) ) 
	  {
	     if( "desc".equals(number_of_views) )
		 {
		    query = "SELECT * FROM message_board ORDER BY num_of_views DESC limit " + start_record + ", 5";
			mysqlQuery = "SELECT * FROM message_board ORDER BY num_of_views DESC";
		 }
		 else // number_of_views == "asc"
		 {
			query = "SELECT * FROM message_board ORDER BY num_of_views limit " + start_record + ", 5";
			mysqlQuery = "SELECT * FROM message_board ORDER BY num_of_views";				
		 }
	  }
	  else if( "1".equals(number_of_replies_selected) ) 
	  {
	     if( "desc".equals(number_of_replies) )
		 {
		    query = "SELECT * FROM message_board ORDER BY num_of_replies DESC limit " + start_record + ", 5";
			mysqlQuery = "SELECT * FROM message_board ORDER BY num_of_replies DESC";
		 }
		 else // number_of_replies == "asc"
		 {
			query = "SELECT * FROM message_board ORDER BY num_of_replies limit " + start_record + ", 5";
			mysqlQuery = "SELECT * FROM message_board ORDER BY num_of_replies";				
		 }
	  }
	  else
	  {
	     query = "SELECT * FROM message_board ORDER BY date DESC, time DESC limit " + start_record + ", 5";
		 mysqlQuery = "SELECT * FROM message_board ORDER BY date DESC, time DESC";
	  }
   }
   else
   {
      query = "SELECT * FROM message_board"; 
	  
      if( !("".equals(str_city)) && (str_city != null) )
      {
		query += " where city = '" + str_city + "'";
		itemSearched = true;	  
	  }
	  else
      { 
		query += " where ";
		itemSearched = false;
      }
   
	  if( !("".equals(str_district)) && (str_district != null) )
      {
		if(itemSearched)
		   query += " AND ";
		 
        query += "district = '" + str_district + "'";
        itemSearched = true;	  
	  }

      if( !("".equals(str_category)) && (str_category != null) && !("0".equals(str_category)) )
      {
		if(itemSearched)
		   query += " AND ";
		 
        query += "category = '" + str_category + "'";        	  
	  }	  
	  
	  mysqlQuery = query;
	  
	  if( "1".equals(date_posted_selected) ) 
	  {
	     if( "desc".equals(date_posted) )
		 {
		    mysqlQuery += " ORDER BY date DESC, time DESC";
			query += " ORDER BY date DESC, time DESC limit " + start_record + ", 5";
		 }
		 else // date_posted == "asc"
		 {
		    mysqlQuery += " ORDER BY date";
			query += " ORDER BY date limit " + start_record + ", 5";
		 }
	  }
	  else if( "1".equals(number_of_views_selected) ) 
	  {
	     if( "desc".equals(number_of_views) )
		 {
		    mysqlQuery += " ORDER BY num_of_views DESC";
			query += " ORDER BY num_of_views DESC limit " + start_record + ", 5";
		 }
		 else // number_of_views == "asc"
		 {
		    mysqlQuery += " ORDER BY num_of_views";
			query += " ORDER BY num_of_views limit " + start_record + ", 5";
		 }
	  }
	  else if( "1".equals(number_of_replies_selected) ) 
	  {
	     if( "desc".equals(number_of_replies) )
		 {
		    mysqlQuery += " ORDER BY num_of_replies DESC";
			query += " ORDER BY num_of_replies DESC limit " + start_record + ", 5";
		 }
		 else // number_of_replies == "asc"
		 {
			mysqlQuery += " ORDER BY num_of_replies";
			query += " ORDER BY num_of_replies limit " + start_record + ", 5";
		 }
	  }
	  else
	  {
		 mysqlQuery += " ORDER BY date DESC, time DESC";
		 query += " ORDER BY date DESC, time DESC limit " + start_record + ", 5";
	  }	  
   } //end else
   
/////////////

   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
         
         rs = statement.executeQuery(query);

         // iterate through the result set
         while (rs.next())
         {
            if(record_index < 5)
	        {	
	       message_id[record_index] = rs.getInt("message_id");	
	       name[record_index] = rs.getString("name");
               email[record_index] = rs.getString("email");
   	       subject[record_index] = rs.getString("subject");
               date[record_index] = rs.getString("date");
     	       time[record_index] = rs.getString("time");
	       num_of_views[record_index] = rs.getInt("num_of_views");	
   	       num_of_replies[record_index] = rs.getInt("num_of_replies");
   	       num_of_likes[record_index] = rs.getInt("num_of_likes");
	       message[record_index] = rs.getString("message");
		   city[record_index] = rs.getString("city");
		   district[record_index] = rs.getString("district");
		   category[record_index] = rs.getString("category");
		   hide[record_index] = rs.getInt("hide");
		   violation[record_index++] = rs.getInt("violation");
	        }	
         }
	 result_count = record_index;	
	 rowSet = statement.executeQuery(mysqlQuery);
  
	 rowSet.last();

	 total = rowSet.getRow();

	 total_page = (int)Math.ceil((double) total / 5.0);

	 if(total_page >= current_page && current_page > 1)
     {
		previous_page_link = "message_board.jsp?page=" + (current_page - 1) + "&city=" + str_city + "&district=" + str_district + "&category=" + str_category;
	 }

	 if(total_page > current_page)
     {
		next_page_link = "message_board.jsp?page=" + (current_page + 1) + "&city=" + str_city + "&district=" + str_district + "&category=" + str_category;
	 }
	
         statement.close();
         dbconn.close();
      }
      catch (SQLException sqlException)
      {

%>	       
         <!--can not insert data into table ad.-->
<%
      }
   }  
   catch (ClassNotFoundException err)
   {
%> 	    
     <!--Class loading error-->
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
    
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<form name="sortSearchResult" method="post" action="message_board.jsp">
<%	  
		if( ("1".equals(date_posted_selected)) || ((date_posted_selected==null) && 
		(number_of_views_selected==null) && (number_of_replies_selected==null)) ) 
		{
		    if( "desc".equals(date_posted) )
			{
%>	    
			<td><input type="submit" value="刊登時間">
			    <img src="images/down_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
			else
			{
%>	    
			<td><input type="submit" value="刊登時間">
			    <img src="images/up_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
        }
		else
		{
%>	    
			<td><input type="submit" value="刊登時間"></td>
<%		
        }
%>
			<input type="hidden" name="date_posted" value="<%= date_posted %>"/>
			<input type="hidden" name="date_posted_selected" value="1"/>
			<input type="hidden" name="city" value="<%= str_city %>"/>
			<input type="hidden" name="district" value="<%= str_district %>"/>
			<input type="hidden" name="category" value="<%= str_category %>"/>
	    </form>
	    <form name="sortSearchResult" method="post" action="message_board.jsp">

<%		
        if( ("1".equals(number_of_views_selected)) ) 
		{
		    if( "desc".equals(number_of_views) )
			{
%>	    
			<td><input type="submit" value="瀏覽次數">
			    <img src="images/down_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
			else
			{
%>	    
			<td><input type="submit" value="瀏覽次數">
			    <img src="images/up_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
        }
		else
		{
%>	    
			<td><input type="submit" value="瀏覽次數"></td>
<%		
        }
%>		
			<input type="hidden" name="number_of_views" value="<%= number_of_views %>"/>
			<input type="hidden" name="number_of_views_selected" value="1"/>
			<input type="hidden" name="city" value="<%= str_city %>"/>
			<input type="hidden" name="district" value="<%= str_district %>"/>
			<input type="hidden" name="category" value="<%= str_category %>"/>
	    </form>
		<form name="sortSearchResult" method="post" action="message_board.jsp">

<%		
        if( ("1".equals(number_of_replies_selected)) ) 
		{
		    if( "desc".equals(number_of_replies) )
			{
%>	    
			<td><input type="submit" value="回覆次數">
			    <img src="images/down_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
			else
			{
%>	    
			<td><input type="submit" value="回覆次數">
			    <img src="images/up_arrow.bmp" alt="1" width="16" height="30">
			</td>
<%		
            }
        }
		else
		{
%>	    
			<td><input type="submit" value="回覆次數"></td>
<%		
        }
%>	
			<input type="hidden" name="number_of_replies" value="<%= number_of_replies %>"/>
			<input type="hidden" name="number_of_replies_selected" value="1"/>
			<input type="hidden" name="city" value="<%= str_city %>"/>
			<input type="hidden" name="district" value="<%= str_district %>"/>
			<input type="hidden" name="category" value="<%= str_category %>"/>
	    </form>		
	  </tr>
    </table></td>
	</form>
  </tr>
  
  <tr>
    <form name="searchForm" method="post" action="message_board.jsp">
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
        <td>縣市
		  <select name="city" style="width:156;" onChange="changeZone(this.selectedIndex);">           
                    <option value="">全部</option>
<%					
		if ("基隆市".equals(str_city))
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
		
		if ("台北市".equals(str_city))
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
		
		if ("新北市".equals(str_city))
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
		
		if ("桃園縣".equals(str_city))
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

		if ("新竹市".equals(str_city))
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

		if ("新竹縣".equals(str_city))
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

		if ("苗栗縣".equals(str_city))
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

		if ("台中市".equals(str_city))
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

		if ("南投縣".equals(str_city))
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

		if ("彰化縣".equals(str_city))
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

		if ("雲林縣".equals(str_city))
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

		if ("嘉義市".equals(str_city))
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

		if ("嘉義縣".equals(str_city))
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

		if ("台南市".equals(str_city))
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

		if ("高雄市".equals(str_city))
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

		if ("屏東縣".equals(str_city))
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

		if ("宜蘭縣".equals(str_city))
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

		if ("花蓮縣".equals(str_city))
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

		if ("台東縣".equals(str_city))
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

		if ("澎湖縣".equals(str_city))
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

		if ("金門縣".equals(str_city))
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

		if ("連江縣".equals(str_city))
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
        <td>鄉鎮市區
		  <select name="district" style="width:156;">  
<%
		if (!("".equals(str_district)))
		{
%>			
           <option value="">全部</option> 	
		   <option value="<%= str_district %>" selected="selected"><%= str_district %></option>	  
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
        <td>類別
		  <select name="category" style="width:156;">                  
		   <option value="0">全部</option>
		   <option value="1">交通事故/違規</option>
		   <option value="2">機車買賣</option>
		   <option value="3">揪團</option>
		   <option value="4">其他</option>
                  </select>
		</td>
        <td><input type="submit" value="搜尋"></td>
      </tr>
    </table></td>
	</form>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
<%
	if(record_index > 0)
        {       
%>
  <tr>
    <td height="650" valign="top">
     <table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
	for(loop_index = 0; loop_index < record_index; loop_index++)
        { 
			if(hide[loop_index] > 0)
			{
%>
	  <tr>
	<td>留言編號:</td>
	<td><%= message_id[loop_index] %></td>
      </tr>
      <tr>
	<td>
<%	  
			if(violation[loop_index] == 1)
			{	
%>
			此訊息因涉及暴力, 已被刪除.
<%	  
			}
			else if(violation[loop_index] == 2)
			{	
%>			
			此訊息因涉及色情, 已被刪除.
<%	  
			}
			else if(violation[loop_index] == 3)
			{	
%>			
			此訊息因涉及毀謗或人身攻擊, 已被刪除.
<%	  
			}
%>			
	</td>
	<td>&nbsp</td>
      </tr>
      <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
      <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>	  
<%	  
			}
			else
			{
%>
	  <tr>
	<td>留言編號:</td>
	<td><%= message_id[loop_index] %></td>
      </tr>
      <tr>
	<td>主題:</td>
	<td><a href="display_message.jsp?message_id=<%= message_id[loop_index] %>&page=<%= current_page %>&fromMessageBoard=1"><%= subject[loop_index] %></a></td>
      </tr>
      <tr>
	<td>留言者:</td>
	<td><%= name[loop_index] %></td>
      </tr>            
      <tr>
	<td>刊登時間:</td>
	<td><%= date[loop_index] %> <%= time[loop_index] %></td>
      </tr>
      <tr>
	<td>瀏覽次數:</td>
	<td><%= num_of_views[loop_index] %></td>
      </tr>
      <tr>
	<td>回覆次數:</td>
	<td><%= num_of_replies[loop_index] %></td>
      </tr>
	  <tr>
	<td>城市:</td>
	<td><%= city[loop_index] %><%= district[loop_index] %></td>
      </tr>
	  <tr>
	<td>類別:</td>
	<%
		if("0".equals(category[loop_index]))
		{
			category_descr = categoryDescr[0];
	    }	
		else if("1".equals(category[loop_index]))
		{	
			category_descr = categoryDescr[1];
		}
		else if("2".equals(category[loop_index]))
		{
			category_descr = categoryDescr[2];
		}
		else if("3".equals(category[loop_index]))
		{
			category_descr = categoryDescr[3];
		}
		else if("4".equals(category[loop_index]))	
		{
			category_descr = categoryDescr[4];
		}
		else
		{
			category_descr = categoryDescr[0];
		}	
	%>
	<td><%= category_descr %></td>
      </tr>
      <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
      <tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
      </tr>
<%
		} //end else
	} //end for
%>      
      
    </table></td>
  </tr>

  
  
  
	<tr>
		   <form name="pageForm" method="post" action="message_board.jsp">
           <td align="left" class="a3">共<span class="a22"> <%= total %></span> 筆資料　   第<span class="a22"> <%= total_page%></span> 之 <span class="a22"><%= current_page%> </span>頁

	<input type="hidden" name="page"/>	    
<%
   if(total_page >= current_page && current_page > 1)
   {  
%>
	  <input type="hidden" name="prevpage" value="<%= current_page - 1 %>"/>
	  <input type="hidden" name="city" value="<%= str_city %>"/>
	  <input type="hidden" name="district" value="<%= str_district %>"/>
	  <input type="hidden" name="category" value="<%= str_category %>"/>
	  
      <!--<span class="a22"><a href=<%= previous_page_link %> class="a22">上一頁</a></span>-->
	  <input type="button" value="上一頁" onClick=goToPage(1)>
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
   else if( "1".equals(number_of_views_selected) ) 
   {
      if( "desc".equals(number_of_views) )
	  {
%>
			<input type="hidden" name="number_of_views" value="asc"/>
<%
	  }
	  else
	  {
%>
			<input type="hidden" name="number_of_views" value="desc"/>
<%
	  }		
%>
		 <input type="hidden" name="number_of_views_selected" value="1"/>
<%
   }
   else if( "1".equals(number_of_replies_selected) ) 
   {
      if( "desc".equals(number_of_replies) )
	  {
%>
			<input type="hidden" name="number_of_replies" value="asc"/>
<%
	  }
	  else
	  {
%>
			<input type="hidden" name="number_of_replies" value="desc"/>
<%
	  }		
%>
		 <input type="hidden" name="number_of_replies_selected" value="1"/>
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
		 <input type="hidden" name="city" value="<%= str_city %>"/>
	     <input type="hidden" name="district" value="<%= str_district %>"/>
	     <input type="hidden" name="category" value="<%= str_category %>"/>
      <strong><span class="a33">頁</span></strong>	  
<%
   } 
%>

	<!--<span class="a33"><a href="#" class="a33">　</a></span>-->

<%
   if(total_page > current_page)
   {  
%>
	  <input type="hidden" name="nextpage" value="<%= current_page + 1 %>"/>
	  <input type="hidden" name="city" value="<%= str_city %>"/>
	  <input type="hidden" name="district" value="<%= str_district %>"/>
	  <input type="hidden" name="category" value="<%= str_category %>"/>
	  
      <!--<a href=<%= next_page_link %> class="a22">下一頁</a>-->
	  <input type="button" value="下一頁" onClick=goToPage(3)>
<%
   } 
%>
               </td>
			   </form>
              </tr>


<%
	

	} //end if(record_index > 0)
	else 
	{
%>


  <tr>
        <td align="center" valign="middle" class="a3">共<span class="a22">0</span> 筆資料 
  </tr>
<%
	} //end else	
%>
   
  <tr>
    <form name="myForm" method="post" action="message.jsp">
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><input type="submit" value="留言"></td>
      </tr>
    </table></td>
	</form>
  </tr>


  <tr>
    <td height="60">
		<jsp:include page = "footer.jsp" />
	</td>
  </tr>
</table>
</body>
</html>