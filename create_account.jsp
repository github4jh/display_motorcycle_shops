<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>coolbee機車族</title>
<style type="text/css">
<!--membership

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
.style9 {
	color: #AF6334;
	font-size: 10pt;
}
#layer {
	width: 620px;
	height: 350px;
	background-image: url(images/new/layer.gif);
	background-position: top;
	background-repeat: no-repeat;
	clear: both;
	float: none;
}
#layer2 {
	height: 160px;
	overflow: scroll;
	font-size: 10pt;
	color: #816658;
	width: 530px;
	clear: both;
	float: left;
	margin-top: 90px;
	margin-left: 50px;
}
#layer3 {

	margin-left: 60px;
}
.person {
	background-image: url(images/new/bt_1.gif);
	background-repeat: no-repeat;
	height: 35px;
	width: 74px;
}
-->
</style>
<style type="text/css">
<!--
.style10 {color: #816658; font-size: 10pt; }
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
        document.myform.town_district.length=district[selected_index].length;
	//document.writeln("len: " + document.myform.town_district.length);	
        
	for(var i=0;i<district[selected_index].length;i++)
        {
	   document.myform.town_district.options[i].value = district[selected_index][i];
	   document.myform.town_district.options[i].text = district[selected_index][i];	
	}         	
}



function show(id)
{
   if(id == 'yes') 
   {
      document.getElementById('show_buttons').style.display = '';            
      document.agreement[0].checked=true;
   }

   if(id == 'no') 
   {
      document.getElementById('show_buttons').style.display = 'none';
      document.agreement[1].checked=true;
   }
}
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>

</head>
<body onLoad="MM_preloadImages('images/new/bt_p2.jpg')">

<%
   request.setCharacterEncoding("UTF8");
   String id_number = request.getParameter("id_number");
   String contact_person = request.getParameter("contact_person");
   String password = request.getParameter("password");
   String city = request.getParameter("city");
   String address = request.getParameter("address");
   String area_code = request.getParameter("area_code");
   String phone = request.getParameter("phone");
   String cell_phone = request.getParameter("cell_phone");
   String email = request.getParameter("email");
   String errortype = request.getParameter("errortype");  
   String fromCheckCreateAccount = request.getParameter("fromCheckCreateAccount");
   String store_name = request.getParameter("store_name");
   String license_number = request.getParameter("license_number"); 

   String id_number_not_filled = request.getParameter("id_number_not_filled");
   String id_number_incorrect = request.getParameter("id_number_incorrect");
   String password_not_filled = request.getParameter("password_not_filled");
   String password_format_incorrect = request.getParameter("password_format_incorrect");
   String password_length_wrong = request.getParameter("password_length_wrong");
   String confirmed_password_not_filled = request.getParameter("confirmed_password_not_filled");
   String confirmed_password_not_matched = request.getParameter("confirmed_password_not_matched");
   String contact_person_not_filled = request.getParameter("contact_person_not_filled");
   String contact_person_incorrect = request.getParameter("contact_person_incorrect");
   String contact_person_length_wrong = request.getParameter("contact_person_length_wrong");   
   String address_not_filled = request.getParameter("address_not_filled");
   String address_incorrect = request.getParameter("address_incorrect");
   String address_length_wrong = request.getParameter("address_length_wrong");      
   String phone_not_filled = request.getParameter("phone_not_filled");
   String phone_incorrect = request.getParameter("phone_incorrect");
   String phone_length_wrong = request.getParameter("phone_length_wrong");
   String area_code_incorrect = request.getParameter("area_code_incorrect");
   String cell_phone_not_filled = request.getParameter("cell_phone_not_filled");
   String cell_phone_incorrect = request.getParameter("cell_phone_incorrect");
   String cell_phone_length_wrong = request.getParameter("cell_phone_length_wrong");   
   String email_not_filled = request.getParameter("email_not_filled");
   String email_incorrect = request.getParameter("email_incorrect");
   String id_number_length_wrong = request.getParameter("id_number_length_wrong");
   String store_name_not_filled = request.getParameter("store_name_not_filled");
   String store_name_incorrect = request.getParameter("store_name_incorrect");
   String store_name_length_wrong = request.getParameter("store_name_length_wrong");

   String license_number_not_filled = request.getParameter("license_number_not_filled");
   String license_number_incorrect = request.getParameter("license_number_incorrect");
   String license_number_length_wrong = request.getParameter("license_number_length_wrong");
   String id_duplication = request.getParameter("id_duplication");
   String email_duplication = request.getParameter("email_duplication");
   String name_duplication = request.getParameter("name_duplication");   
      
   String reset_link = "create_account.jsp";     
   String empty_string = ""; 
   
   int numOfRows = 12;

   //String identification_number = (String) session.getAttribute("identification_number");
   String session_id = (String) session.getAttribute("sid");
   String member_page_link = "";

  /*
   if("1".equals(id_number_not_filled) || "1".equals(id_number_incorrect) || "1".equals(id_number_length_wrong) || "1".equals(id_duplication) || 
         "1".equals(password_not_filled) || "1".equals(password_length_wrong) || "1".equals(password_format_incorrect))
      numOfRows++;
  */
 
%>


<!--password_format_incorrect: <%= password_format_incorrect %> <br><br>-->
<!--email_incorrect: <%= email_incorrect %>--> 
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
    <td height="480" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="890" height="40" valign="top"> 　　<img src="images/sell/banner_createaccount.jpg" width="834" height="21"></td>
      </tr>
      <tr>
        <td height="30" valign="top"><table width="300" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="60">&nbsp;</td>
            <td width="63"><a href="create_account_individual.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image22','','images/new/bt_p2.jpg',1)"><img src="images/new/bt_p1.gif" name="Image22" width="63" height="32" border="0"></a></td>
            <td><img src="images/new/bt_mo3.gif" width="70" height="32"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
              <td height="28" valign="top"><div id="layer3"><form name="myform" method="post" action="check_create_account.jsp?fromCreateAccount=1">
                <table width="810" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="80" height="50"><img src="images/sell/word_create_account1.gif" alt="1" width="75" height="23"></td>
                  <%
                      if(id_number != null)
                      {
                  %>
                  <td width="186"><input type="text" name="id_number" value="<%= id_number %>"></td>
                  <%
                      }
                      else
                      { 
                  %>
                    <td width="186"><input type="text" name="id_number"></td>
                  <%
                      }                    
                  %>
                    <td width="30" height="0" rowspan=<%= numOfRows%>><img src="images/sell/long_line.gif" alt="1" width="5" height="358"></td>
                    <td width="80"><img src="images/sell/word_create_account6.gif" alt="1" width="75" height="23"></td>
                    <td width="186"><input type="password" name="password" id="textfield7" maxlength="15"></td>
                    <td><span class="style9">密碼長度: 6~15字. 請填英文大小寫,數字及符號</span></td>
                  </tr>
                <tr>
                <%
                   if("1".equals(id_number_not_filled) || "1".equals(id_number_incorrect) || "1".equals(id_number_length_wrong) || 
                             "1".equals(id_duplication))
                   {
                %>
                    <td width="75" height="23">&nbsp;</td>  
                <%
                                          
                        if("1".equals(id_number_not_filled))
                        { 
                %>  
                    <td><font color=red>請填寫身分證號</font></td>
                <%
                        }
                        else if("1".equals(id_number_incorrect)) 
                        {
                %>
                    <td><font color=red>身分證號錯誤.請重填!</font></td>
                <%
                        }
                        else if("1".equals(id_number_length_wrong)) 
                        {
                %>
                    <td><font color=red>身分證號錯誤.請重填!</font></td>
                <%
                        }
                        else if("1".equals(id_duplication)) 
                        {
                %>  
                    <td><font color=red>身分證號已註冊.請重填!</font></td>
                <%
                        }
                %>
                    <td width="75" height="23">&nbsp;</td>    
                <%

                      if("1".equals(password_not_filled) || "1".equals(password_length_wrong) || "1".equals(password_format_incorrect))
                      {
                         if("1".equals(password_not_filled))
                         { 
                %>   
                    <td><font color=red>請填寫密碼</font></td>
                <%
                         }
                         else if("1".equals(password_length_wrong)) 
                         {
                %>
                    <td><font color=red>密碼長度錯誤.請重填!</font></td>
                <%
                         }
                         else if("1".equals(password_format_incorrect)) 
                         {
                %>
                    <td><font color=red>密碼錯誤.請重填!</font></td>
                <% 
                         } 
                      }
                      else
                      {                   
                %>
                         <td width="75" height="23">&nbsp;</td>
                <% 
                      }
                %> 
                    <td>&nbsp;</td>
                <%
                   }
                   else
                   { 
                      if("1".equals(password_not_filled) || "1".equals(password_length_wrong) || "1".equals(password_format_incorrect))
                      {
                %>
                       <td width="75" height="23">&nbsp;</td>
                       <td>&nbsp;</td>  
                       <td width="75" height="23">&nbsp;</td> 
                <%
                         if("1".equals(password_not_filled))
                         { 
                %>   
                    <td><font color=red>請填寫密碼</font></td>
                <%
                         }
                         else if("1".equals(password_length_wrong)) 
                         {
                %>
                    <td><font color=red>密碼長度錯誤.請重填!</font></td>
                <%
                         }
                         else if("1".equals(password_format_incorrect)) 
                         {
                %>
                    <td><font color=red>密碼錯誤.請重填!</font></td>
                <% 
                         }
                %>
                    <td>&nbsp;</td>  
                <%
                      }
                   }
                %>               
                </tr>

                  <tr>
                    <td height="50"><img src="images/sell/word_create_account2.gif" alt="1" width="75" height="23"></td>
                  <%
                      if(contact_person != null)
                      {
                  %>  
                  <td><input type="text" name="contact_person" maxlength="15" value="<%= contact_person %>"></td>
                  <%
                      }
                      else
                      { 
                  %>
                    <td><input type="text" name="contact_person" maxlength="15"></td>
                  <%
                      }                    
                  %>
                  <td><img src="images/sell/word_create_account6_1.gif" width="75" height="23"></td>
                  <td>
        	      <input type="password" name="confirmed_password" id="textfield7" maxlength="15">
                  </td>
				  <td><span class="style9">重複輸入上面的密碼</span></td>
                  </tr>
                <tr>
                <%
                   if("1".equals(contact_person_not_filled) || "1".equals(contact_person_incorrect) || "1".equals(contact_person_length_wrong) || "1".equals(name_duplication))
                   {
                %>
                    <td width="75" height="23">&nbsp;</td>  
                <%
                                          
                        if("1".equals(contact_person_not_filled))
                        { 
                %>  
                    <td><font color=red>請填寫聯絡人</font></td>
                <%
                        }
                        else if("1".equals(contact_person_incorrect)) 
                        {
                %>
                    <td><font color=red>聯絡人請勿填寫任何符號.!</font></td>
                <%
                        }
                        else if("1".equals(contact_person_length_wrong)) 
                        {
                %>
                    <td><font color=red>聯絡人長度為2~15字.請重填!</font></td>
                <%
                        }                        
                        else if("1".equals(name_duplication)) 
                        {
                %>
                    <td><font color=red>聯絡人與其他會員重複. 請重填!</font></td>
                <%
                        }
                %>
                    <td width="75" height="23">&nbsp;</td>    
                <%
                      if("1".equals(confirmed_password_not_filled) || "1".equals(confirmed_password_not_matched))
                      {
						 if("1".equals(confirmed_password_not_filled))
                         { 	
                %>         
                    <td><font color=red>請填寫密碼!</font></td>
				<%
                         }
                         else if("1".equals(confirmed_password_not_matched)) 
                         {
                %>
                    <td><font color=red>密碼與上方不相同!</font></td>                                 
                <%
                         }
                      }
                      else
                      {                   
                %>
                         <td width="75" height="23">&nbsp;</td>
                <% 
                      }
                %> 
                    <td>&nbsp;</td>				
                <%
                   }
                   else
                   { 
				%>
					<td width="75" height="23">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td width="75" height="23">&nbsp;</td>
				<%
                      if("1".equals(confirmed_password_not_filled) || "1".equals(confirmed_password_not_matched))
                      {
						 if("1".equals(confirmed_password_not_filled))
                         {
                %>
                         <td><font color=red>請填寫密碼!</font></td>
				<%
                         }
                         else if("1".equals(confirmed_password_not_matched)) 
                         {
                %>
                    	 <td><font color=red>密碼與上方不相同!</font></td>
                <%
                         }               
                      }
					  else
                      {  
                %>
                      	 <td>&nbsp;</td>
                <%
                      }
				%>	  
					<td>&nbsp;</td>
                <%
                   }
                %>               
                </tr>

                  <tr>
                    <td height="50"><img src="images/sell/word_create_account8.gif" alt="1" width="75" height="23"></td>
                  <%
                      if(email != null)
                      {
                  %>
                  <td><input type="text" name="email" maxlength="40" value="<%= email %>"></td>
                  <%
                      }
                      else
                      { 
                  %>
                    <td><input type="text" name="email" maxlength="40"></td>
                  <%
                      }                    
                  %>
                    <td height="30"><img src="images/sell/word_create_account3.gif" alt="1" width="75" height="23"></td>
                  <%
                      if(phone != null)
                      {
                  %>
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
                   <input type="text" name="phone" style="width:80px" maxlength="8" value="<%= phone %>">
                  </td>
                  <%
                      }
                      else
                      { 
                  %>
                  <td width="156">
                   <select name="area_code" style="width:50;">
                     <option selected="yes">02</option>
                     <option>03</option>
                     <option>037</option>
                     <option>04</option> 
                     <option>049</option>
                     <option>05</option>
                     <option>06</option>
                     <option>07</option>
                     <option>08</option>
		     <option>082</option>
		     <option>0826</option>
		     <option>0836</option>
                     <option>089</option>  
                   </select>
                   <input type="text" name="phone" style="width:100px" maxlength="8">
                  </td>
                  <%
                      }                    
                  %>
                  <td><span class="style9">填寫數字. 請勿填任何符號.</span></td>
                </tr>


                <tr>
                <%
                   if("1".equals(email_not_filled) || "1".equals(email_incorrect) || "1".equals(email_duplication))
                   {
                %>
                    <td width="75" height="23">&nbsp;</td>  
                <%
                                          
                        if("1".equals(email_not_filled))
                        { 
                %>  
                    <td><font color=red>請填寫 e-mail</font></td>
                <%
                        }
                        else if("1".equals(email_incorrect)) 
                        {
                %>
                    <td><font color=red>email 錯誤! 請重填</font></td>                                 
                <%
                        }
						else if("1".equals(email_duplication)) 
                        {
                %>
                    <td><font color=red>email 與其他會員重複! 請重填</font></td>                                 
                <%
                        }                		
                %>
                    <td width="75" height="23">&nbsp;</td>    
                <%

                      if("1".equals(area_code_incorrect) || "1".equals(phone_not_filled) || "1".equals(phone_incorrect) || "1".equals(phone_length_wrong))
                      {
                         if("1".equals(area_code_incorrect))
                         { 
                %>   
                    <td><font color=red>電話區碼與城市不符.請重選!</font></td>
                <%
                         }
                         else if("1".equals(phone_not_filled)) 
                         {
                %>
                    <td><font color=red>請填寫電話號碼!</font></td>
                <%
                         }
                         else if("1".equals(phone_incorrect)) 
                         {
                %>
                    <td><font color=red>請填寫數字!</font></td>
                <% 
                         } 
                         else if("1".equals(phone_length_wrong)) 
                         {
                %>
                    <td><font color=red>電話號碼長度不對!</font></td>
                <%
                         }       
                      }
                      else
                      {                   
                %>
                         <td width="75" height="23">&nbsp;</td>
                <% 
                      }
                %> 
                    <td>&nbsp;</td>
                <%
                   }
                   else
                   { 
                      if("1".equals(area_code_incorrect) || "1".equals(phone_not_filled) || "1".equals(phone_incorrect) || "1".equals(phone_length_wrong))
                      {
                %>
                       <td width="75" height="23">&nbsp;</td>
                       <td>&nbsp;</td>  
                       <td width="75" height="23">&nbsp;</td> 
                <%
                         if("1".equals(area_code_incorrect))
                         { 
                %>   
                    <td><font color=red>電話區碼與城市不符.請重選!</font></td>
                <%
                         }
                         else if("1".equals(phone_not_filled)) 
                         {
                %>
                    <td><font color=red>請填寫電話號碼!</font></td>
                <%
                         }
                         else if("1".equals(phone_incorrect)) 
                         {
                %>
                    <td><font color=red>請填寫數字!</font></td>
                <% 
                         }
                         else if("1".equals(phone_length_wrong)) 
                         {
                %>
                    <td><font color=red>電話號碼長度不對!</font></td>
                <%
                         }
                %>
                    <td>&nbsp;</td>  
                <%
                      }
                   }
                %>               
                </tr>

                  <tr>
                    <td height="50"><img src="images/sell/word_create_account4.gif" alt="1" width="75" height="23"></td>
                    <td><select name="city" style="width:156;" onChange="changeZone(this.selectedIndex);">
<%   
     if (city != null) 
     {
        if (city.equals("基隆市"))
        {
%>        
	<option selected="yes">基隆市</option>	
<%	
        }
	else
	{
%>     	
	<option>基隆市</option>	
<%	
        }
        if (city.equals("台北市"))
        {
%>        
	<option selected="yes">台北市</option>
<%	
        }
	else
	{
%>     		
	<option>台北市</option>
	

<%	
        }
        if (city.equals("新北市"))
        {
%>        
	<option selected="yes">新北市</option>
<%	
        }
	else
	{
%>     		
	<option>新北市</option>
	

<%	
        }
        if (city.equals("桃園縣"))
        {
%>        
	<option selected="yes">桃園縣</option>
<%	
        }
	else
	{
%>     		
	<option>桃園縣</option>
	
	
<%	
        }
        if (city.equals("新竹市"))
        {
%>        
	<option selected="yes">新竹市</option>
<%	
        } 
	else
	{
%>     		
	<option>新竹市</option>
	
			
<%	
        } 
        if (city.equals("新竹縣"))
        {
%>        
	<option selected="yes">新竹縣</option>
<%	
        } 
	else
	{
%>     		
	<option>新竹縣</option>	



<%	
        }
        if (city.equals("苗栗縣"))
        {
%>        
	<option selected="yes">苗栗縣</option>
<%	
        }
	else
	{
%>     		
	<option>苗栗縣</option>	
<%	
        }
        if (city.equals("台中市"))
        {
%>        
	<option selected="yes">台中市</option>
<%	
        }
	else
	{
%>     		
	<option>台中市</option>	
<%	
        }       
        if (city.equals("南投縣"))
        {
%>        
	<option selected="yes">南投縣</option>
<%	
        }
	else
	{
%>     		
	<option>南投縣</option>
	
	
<%	
        }
        if (city.equals("彰化縣"))
        {
%>        
	<option selected="yes">彰化縣</option>
<%	
        }
	else
	{
%>     		
	<option>彰化縣</option>
	
	
<%	
        } 
        if (city.equals("雲林縣"))
        {
%>        
	<option selected="yes">雲林縣</option>
<%	
        }
	else
	{
%>     		
	<option>雲林縣</option>
	
<%	
        }
        if (city.equals("嘉義市"))
        {
%>        
	<option selected="yes">嘉義市</option>
<%	
	}
	else
	{
%>     		
	<option>嘉義市</option>
	
<%	
        }
        if (city.equals("嘉義縣"))
        {
%>        
	<option selected="yes">嘉義縣</option>
<%	
	}
	else
	{
%>     		
	<option>嘉義縣</option>
	
	
<%	
        } 
        if (city.equals("台南市"))
        {
%>        
	<option selected="yes">台南市</option>
<%	
        }
	else
	{
%>     		
	<option>台南市</option>
<%	
        }
        if (city.equals("高雄市"))
        {
%>        
	<option selected="yes">高雄市</option>
<%	
	}
	else
	{
%>     		
	<option>高雄市</option>
<%	
        }
        if (city.equals("屏東縣"))
        {
%>        
	<option selected="yes">屏東縣</option>
<%	
	}
	else
	{
%>     		
	<option>屏東縣</option>			
	

<%	
        }
        if (city.equals("宜蘭縣"))
        {
%>        
	<option selected="yes">宜蘭縣</option>
<%	
	}
	else
	{
%>     		
	<option>宜蘭縣</option>			
	
	
<%	
        }
        if (city.equals("花蓮縣"))
        {
%>        
	<option selected="yes">花蓮縣</option>
<%	
	}
	else
	{
%>     		
	<option>花蓮縣</option>			
	
	
<%	
        }
        if (city.equals("台東縣"))
        {
%>        
	<option selected="yes">台東縣</option>
<%	
	}
	else
	{
%>     		
	<option>台東縣</option>
<%   
        }
	if (city.equals("澎湖縣"))
        {
%>        
	<option selected="yes">澎湖縣</option>
<%	
	}
	else
	{
%>     		
	<option>澎湖縣</option>
<%   
        }
	if (city.equals("金門縣"))
        {
%>        
	<option selected="yes">金門縣</option>
<%	
	}
	else
	{
%>     		
	<option>金門縣</option>
<%   
        }
	if (city.equals("連江縣"))
        {
%>        
	<option selected="yes">連江縣</option>
<%	
	}
	else
	{
%>     		
	<option>連江縣</option>
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
                      </select>                    </td>
                    <td><img src="images/sell/word_create_account9.gif" alt="1" width="75" height="23"></td>
                  <%
                     if (address != null)    
                     {
                  %>
                  <td><input type="text" name="address" value="<%= address %>"></td>
                  <%
                     }
                     else
                     { 
                  %>
                    <td><input type="text" name="address"></td>
                  <%
                     }    
                  %>
                    <td>&nbsp;</td>
                  </tr>

                <tr>
                <%
                      if("1".equals(address_not_filled) || "1".equals(address_incorrect) || "1".equals(address_length_wrong))
                      {
                %>
                       <td width="75" height="23">&nbsp;</td>
                       <td>&nbsp;</td>  
                       <td width="75" height="23">&nbsp;</td> 
                <%
                         if("1".equals(address_not_filled))
                         { 
                %>   
                       <td><font color=red>請填寫地址!</font></td>
                <%
                         }
                         else if("1".equals(address_incorrect)) 
                         {
                %>
                       <td><font color=red>地址不正確. 請重填!</font></td>
                <%
                         }
                         else if("1".equals(address_length_wrong)) 
                         {
                %>
                       <td><font color=red>地址長度不對!</font></td>
                <% 
                         }                         
                %> 
                       <td>&nbsp;</td>  
                <%
                      }                   
                %>               
                </tr>

                  <tr>
                    <td height="50" valign="middle"><img src="images/sell/word_create_account5.gif" alt="1" width="75" height="23"></td>
                    <td height="14" align="left" valign="middle">
                  <%
                      if (store_name != null)    
                      {
                  %>
                        <input type="text" name="store_name" maxlength="20" value="<%= store_name %>">                  
                  <%
                      }
                      else
                      { 
                  %>
                        <input type="text" name="store_name" maxlength="20">
                  <%
                      }    
                  %>
                    </td>
                    <td height="30" valign="middle"><img src="images/sell/gui_number.jpg" alt="1" width="75" height="23"></td>
                    <td valign="middle">
                  <%
                      if (license_number != null)    
                      {
                  %>
                       <input type="text" name="license_number" maxlength="8" value="<%= license_number %>">
                  <%
                      }
                      else
                      { 
                  %>
                       <input type="text" name="license_number" maxlength="8">
                  <%
                      }    
                  %>
                    </td>
                    <!--<td rowspan="2">&nbsp;</td>-->
                    <td>&nbsp;</td> 
                  </tr>
                <tr>
                <%
                   if("1".equals(store_name_not_filled) || "1".equals(store_name_incorrect) || "1".equals(store_name_length_wrong))
                   {
                %>
                    <td width="75" height="23">&nbsp;</td>
                    <td><font color=red>  
                    
                <%                                          
                        if("1".equals(store_name_not_filled))
                        { 
                %>  
                           請填寫店名
                <%
                        }
                        else if("1".equals(store_name_incorrect)) 
                        {
                %>
                           店名請勿填寫任何符號!
                <%
                        }
                        else if("1".equals(store_name_length_wrong)) 
                        {
                %>
                           店名長度為2~20字.請重填!
                <%
                        }                        
                %>                    
                    </font></td> 
                    <td width="75" height="23">&nbsp;</td>
                    <td><font color=red>                       
                <%

                      if("1".equals(license_number_not_filled) || "1".equals(license_number_incorrect) || "1".equals(license_number_length_wrong))
                      {
                         if("1".equals(license_number_not_filled))
                         { 
                %>   
                            請填寫統一編號
                <%
                         }
                         else if("1".equals(license_number_incorrect)) 
                         {
                %>
                   	    統一編號錯誤.請重填!
                <%
                         }
                         else if("1".equals(license_number_length_wrong)) 
                         {
                %>
                  	    請確認統一編號為八碼!
                <% 
                         } 
                      }
                      else
                      {                   
                %>
                         &nbsp;
                <% 
                      }
                %>                     
                    </font></td>
                    <td>&nbsp;</td>
                <%
                   }
                   else
                   { 
                      if("1".equals(license_number_not_filled) || "1".equals(license_number_incorrect) || "1".equals(license_number_length_wrong))
                      {
                %>
                       <td width="75" height="23">&nbsp;</td>
                       <td>&nbsp;</td>  
                       <td width="75" height="23">&nbsp;</td> 
                <%
                         if("1".equals(license_number_not_filled))
                         { 
                %>   
                    <td><font color=red>請填寫統一編號</font></td>
                <%
                         }
                         else if("1".equals(license_number_incorrect)) 
                         {
                %>
                    <td><font color=red>統一編號錯誤.請重填!</font></td>
                <%
                         }
                         else if("1".equals(license_number_length_wrong)) 
                         {
                %>
                    <td><font color=red>請確認統一編號為八碼!</font></td>
                <% 
                         }
                %>
                    <td>&nbsp;</td>  
                <%
                      }
                   }
                %>
                </tr>

		  <tr>
                    <td height="50" valign="middle"><img src="images/word_4_1.gif" alt="1" width="71" height="23"></td>
                    <td height="14" align="left" valign="middle">
                      <select name="town_district" style="width:156;">
			



<%   
     if (city != null) 
     {
        if (city.equals("基隆市"))
        {
%>    	 
        <option>仁愛區</option>
        <option>信義區</option>
        <option>中正區</option>
        <option>中山區</option>
        <option>安樂區</option>
        <option>暖暖區</option>
        <option>七堵區</option>		
<%	
        }	
        else if (city.equals("台北市"))
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
	else if (city.equals("新北市"))
        {
%>        
	<option>萬里區</option>
   	<option>金山區</option>
	<option>板橋區</option>
	<option>汐止區</option>
	<option>深坑區</option>
	<option>石碇區</option>
   	<option>瑞芳區</option>
	<option>平溪區</option>
	<option>雙溪區</option>
	<option>貢寮區</option>
	<option>新店區</option>
   	<option>坪林區</option>
	<option>烏來區</option>
	<option>永和區</option>
	<option>中和區</option>
	<option>土城區</option>
   	<option>三峽區</option>
	<option>樹林區</option>
	<option>鶯歌區</option>
	<option>三重區</option>
	<option>新莊區</option>
	<option>泰山區</option>
	<option>林口區</option>
	<option>蘆洲區</option>
	<option>五股區</option>
	<option>八里區</option>
	<option>淡水區</option>
	<option>三芝區</option>
	<option>石門區</option>
	
<%	
        }
	else if (city.equals("桃園縣"))
        {
%>        
	<option>中壢市</option>
	<option>平鎮市</option>
	<option>龍潭鄉</option>
	<option>楊梅市</option>
	<option>新屋鄉</option>
	<option>觀音鄉</option>
   	<option>桃園市</option>
	<option>龜山鄉</option>
	<option>八德市</option>
	<option>大溪鎮</option>
	<option>復興鄉</option>
   	<option>大園鄉</option>
	<option>蘆竹鄉</option>
<%	
        }
	else if (city.equals("新竹市"))
        {
%>      
	<option>東區</option>
	<option>北區</option>
	<option>香山區</option>
<%	
        } 
	else if (city.equals("新竹縣"))
        {
%>       
	<option>竹北市</option>
	<option>湖口鄉</option>
	<option>新豐鄉</option>
	<option>新埔鎮</option>
	<option>關西鎮</option>
	<option>芎林鄉</option>
   	<option>寶山鄉</option>
	<option>竹東鎮</option>
	<option>五峰鄉</option>
	<option>橫山鄉</option>
	<option>尖石鄉</option>
   	<option>北埔鄉</option>
	<option>峨眉鄉</option> 
	
<%	
        } 
	else if (city.equals("苗栗縣"))
        {
%>      
	<option>竹南鎮</option>
	<option>頭份鎮</option>
	<option>三灣鄉</option>
	<option>南庄鄉</option>
	<option>獅潭鄉</option>
	<option>後龍鎮</option>
   	<option>通宵鎮</option>
	<option>苑裡鎮</option>
	<option>苗栗市</option>
	<option>造橋鄉</option>
	<option>頭屋鄉</option>
   	<option>公館鄉</option>
	<option>大湖鄉</option>
	<option>泰安鄉</option>
	<option>銅鑼鄉</option>
	<option>三義鄉</option>
   	<option>西湖鄉</option>
	<option>卓蘭鎮</option>  
<%	
        }
	else if (city.equals("台中市"))
        {
%>     
	<option>中區</option>
	<option>東區</option>
	<option>南區</option>
	<option>西區</option>
	<option>北區</option>
	<option>北屯區</option>
   	<option>西屯區</option>
	<option>南屯區</option>
	<option>太平區</option>
	<option>大里區</option>
	<option>霧峰區</option>
   	<option>烏日區</option>
	<option>豐原區</option>
	<option>后里區</option>
	<option>石岡區</option>
	<option>東勢區</option>
   	<option>和平區</option>
	<option>新社區</option>
   	<option>潭子區</option>
	<option>大雅區</option>
	<option>神岡區</option>
	<option>大肚區</option>
	<option>沙鹿區</option>
	<option>龍井區</option>
	<option>梧棲區</option>
	<option>清水區</option>
	<option>大甲區</option>
	<option>外埔區</option>
	<option>大安區</option>
<%	
        }
	else if (city.equals("南投縣"))
        {
%>       
	<option>南投市</option>
	<option>中寮鄉</option>
	<option>草屯鎮</option>
	<option>國姓鄉</option>
	<option>埔里鎮</option>
	<option>仁愛鄉</option>
   	<option>名間鄉</option>
	<option>集集鎮</option>
	<option>水里鄉</option>
	<option>魚池鄉</option>
	<option>信義鄉</option>
   	<option>竹山鄉</option>
	<option>鹿谷鄉</option>
		 
	
<%	
        }
	else if (city.equals("彰化縣"))
        {
%>        
	<option>彰化市</option>
	<option>芬園鄉</option>
	<option>花壇鄉</option>
	<option>秀水鄉</option>
	<option>鹿港鎮</option>
	<option>福興鄉</option>
   	<option>線西鄉</option>
	<option>和美鎮</option>
	<option>伸港鄉</option>
	<option>員林鎮</option>
	<option>社頭鄉</option>
   	<option>永靖鄉</option>
	<option>埔心鄉</option>
	<option>溪湖鎮</option>
	<option>大村鄉</option>
	<option>埔鹽鄉</option>
   	<option>田中鎮</option>
	<option>北斗鎮</option>
   	<option>田尾鄉</option>
	<option>埤頭鄉</option>
	<option>溪州鄉</option>
	<option>竹塘鄉</option>
	<option>二林鎮</option>
	<option>大城鄉</option>
	<option>芳苑鄉</option>
	<option>二水鄉</option>
	
<%	
        }
	else if (city.equals("雲林縣"))
        {
%>        
	<option>斗南鎮</option>
	<option>大埤鄉</option>
	<option>虎尾鎮</option>
	<option>土庫鎮</option>
	<option>褒忠鄉</option>
	<option>東勢鄉</option>
   	<option>台西鄉</option>
	<option>崙背鄉</option>
	<option>麥寮鄉</option>
	<option>斗六市</option>
	<option>林內鄉</option>
   	<option>古坑鄉</option>
	<option>莿桐鄉</option>
	<option>西螺鎮</option>
	<option>二崙鄉</option>
	<option>北港鎮</option>
   	<option>水林鄉</option>
	<option>口湖鄉</option>
   	<option>四湖鄉</option>
	<option>元長鄉</option>

	
<%	
        }
	else if (city.equals("嘉義市"))
        {
%>      
	<option>東區</option>
	<option>西區</option>  
	
<%	
	}
	else if (city.equals("嘉義縣"))
        {
%>        
	<option>番路鄉</option>
	<option>梅山鄉</option>
	<option>竹崎鄉</option>
	<option>阿里山鄉</option>
	<option>中埔鄉</option>
   	<option>大埔鄉</option>
	<option>水上鄉</option>
	<option>鹿草鄉</option>
	<option>太保市</option>
	<option>朴子市</option>
   	<option>東石鄉</option>
	<option>六腳鄉</option>
	<option>新港鄉</option>
	<option>民雄鄉</option>
	<option>大林鎮</option>
   	<option>溪口鄉</option>
	<option>義竹鄉</option>
   	<option>布袋鎮</option>
	
<%	
	}
	else if (city.equals("台南市"))
        {
%>      
	<option>中西區</option>
	<option>東區</option>
	<option>南區</option>
	<option>北區</option>
	<option>安平區</option>
	<option>安南區</option>
   	<option>永康區</option>
	<option>歸仁區</option>
	<option>新化區</option>
	<option>左鎮區</option>
	<option>玉井區</option>
   	<option>楠西區</option>
	<option>南化區</option>
	<option>仁德區</option>
	<option>關廟區</option>
	<option>龍崎區</option>
   	<option>官田區</option>
	<option>麻豆區</option>
   	<option>佳里區</option>
	<option>西港區</option> 
	<option>七股區</option>
	<option>將軍區</option>
	<option>學甲區</option>
	<option>北門區</option>
	<option>新營區</option>
	<option>後壁區</option>
	<option>白河區</option>
	<option>東山區</option>
	<option>六甲區</option>
	<option>下營區</option>
	<option>柳營區</option>
	<option>鹽水區</option>
	<option>善化區</option>
	<option>大內區</option>
	<option>山上區</option>
	<option>新市區</option>
	<option>安定區</option>	
<%	
        }
	else if (city.equals("高雄市"))
        {
%>    
	<option>新興區</option>
	<option>前金區</option>
	<option>苓雅區</option>
	<option>鹽埕區</option>
	<option>鼓山區</option>
	<option>旗津區</option>
   	<option>前鎮區</option>
	<option>三民區</option>
	<option>楠梓區</option>
	<option>小港區</option>
	<option>左營區</option>
   	<option>仁武區</option>
	<option>大社區</option>
	<option>東沙群島</option>
	<option>南沙群島</option>
	<option>岡山區</option>
   	<option>路竹區</option>
	<option>阿蓮區</option>
   	<option>田寮區</option>
	<option>燕巢區</option>	
	<option>橋頭區</option>
	<option>梓官區</option>
	<option>彌陀區</option>
	<option>永安區</option>
	<option>湖內區</option>
	<option>鳳山區</option>
	<option>大寮區</option>
	<option>林園區</option>
	<option>烏松區</option>
	<option>大樹區</option>
	<option>旗山區</option>
	<option>美濃區</option>
	<option>六龜區</option>
	<option>內門區</option>
	<option>杉林區</option>
	<option>甲仙區</option>
	<option>桃源區</option>
	<option>那瑪夏區</option>
	<option>茂林區</option>
	<option>茄萣區</option>
<%	
	}
	else if (city.equals("屏東縣"))
        {
%>    
	<option>屏東市</option>
	<option>三地門鄉</option>
	<option>霧台鄉</option>
	<option>瑪家鄉</option>
	<option>九如鄉</option>
	<option>里港鄉</option>
   	<option>高樹鄉</option>
	<option>鹽埔鄉</option>
	<option>長治鄉</option>
	<option>麟洛鄉</option>
	<option>竹田鄉</option>
   	<option>內埔鄉</option>
	<option>萬丹鄉</option>
	<option>潮州鎮</option>
	<option>泰武鄉</option>
	<option>來義鄉</option>
   	<option>萬巒鄉</option>
	<option>崁頂鄉</option>
   	<option>新埤鄉</option>
	<option>南州鄉</option> 
	<option>林邊鄉</option>
	<option>東港鎮</option>
	<option>琉球鄉</option>
	<option>佳冬鄉</option>
	<option>新園鄉</option>
	<option>枋寮鄉</option>
	<option>枋山鄉</option>
	<option>春日鄉</option>
	<option>獅子鄉</option>
	<option>車城鄉</option>
	<option>牡丹鄉</option>
	<option>恆春鎮</option>
	<option>滿州鄉</option>
<%	
	}
	else if (city.equals("宜蘭縣"))
        {
%>       
	<option>宜蘭市</option>
	<option>頭城鎮</option>
	<option>礁溪鄉</option>
	<option>壯圍鄉</option>
   	<option>員山鄉</option>
	<option>羅東鎮</option>
	<option>三星鄉</option>
	<option>大同鄉</option>
	<option>五結鄉</option>
   	<option>冬山鄉</option>
	<option>蘇澳鎮</option>
   	<option>南澳鄉</option>
	<option>釣魚台</option> 
	
<%	
	}
	else if (city.equals("花蓮縣"))
        {
%>     
	<option>花蓮市</option>
	<option>新城鄉</option>
	<option>秀林鄉</option>
	<option>吉安鄉</option>
   	<option>壽豐鄉</option>
	<option>鳳林鎮</option>
	<option>光復鄉</option>
	<option>豐濱鄉</option>
	<option>瑞穗鄉</option>
   	<option>萬榮鄉</option>
	<option>玉里鎮</option>
   	<option>卓溪鄉</option>
	<option>富里鄉</option>   
	
<%	
	}
	else if (city.equals("台東縣"))
        {
%>     
	<option>台東市</option>
	<option>綠島鄉</option>
   	<option>蘭嶼鄉</option>
	<option>延平鄉</option>
	<option>卑南鄉</option>
	<option>鹿野鄉</option>
	<option>關山鎮</option>
   	<option>海瑞鄉</option>
	<option>池上鄉</option>
	<option>東河鄉</option>
	<option>成功鎮</option>
	<option>長濱鄉</option>
   	<option>太麻里鄉</option>
	<option>金峰鄉</option>
   	<option>大武鄉</option>
	<option>達仁鄉</option>   
	
<%	
	}
	else if (city.equals("澎湖縣"))
        {
%>     
	<option>馬公市</option>
	<option>西嶼鄉</option>
   	<option>望安鄉</option>
	<option>七美鄉</option>
	<option>白沙鄉</option>
	<option>湖西鄉</option>	
<%	
	}
	else if (city.equals("金門縣"))
        {
%>     
	<option>金沙鎮</option>
	<option>金湖鎮</option>
   	<option>金寧鄉</option>
	<option>金城鎮</option>
	<option>烈嶼鄉</option>
	<option>烏坵鄉</option>	
<%	
	}
	else if (city.equals("連江縣"))
        {
%>     
	<option>南竿鄉</option>
	<option>北竿鄉</option>
   	<option>莒光鄉</option>
	<option>東引鄉</option>
<%	
	}	 
     }
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
                    <td><img src="images/sell/word_create_account7.gif" alt="1" width="75" height="23"></td>
                  <%	
                      if(cell_phone != null)
                      {
                  %>
					<td><input type="text" name="cell_phone" maxlength="10" value="<%= cell_phone %>"></td>
                  <%
                      }
                      else
                      { 
                  %>
                    <td><input type="text" name="cell_phone" maxlength="10"></td>
                  <%
                      }                    
                  %>
                    <td><span class="style9">填寫十位數字. 請勿填任何符號.</span></td>					
                  </tr>
                  <%
					if("1".equals(cell_phone_not_filled) || "1".equals(cell_phone_incorrect) || "1".equals(cell_phone_length_wrong))
                    {
                  %>					
					<tr>				  
					   <td width="75" height="23">&nbsp;</td>
                       <td>&nbsp;</td>  
                       <td width="75" height="23">&nbsp;</td>				  
                  <%				  
						 if("1".equals(cell_phone_not_filled))
                         { 				  
                  %>
						<td><font color=red>請填寫手機號碼</font></td>
                <%
                         }
                         else if("1".equals(cell_phone_incorrect)) 
                         {
                %>
						<td><font color=red>手機號碼錯誤.請重填!</font></td>
                <%
                         }
                         else if("1".equals(cell_phone_length_wrong)) 
                         {
                %>
						<td><font color=red>請確認手機號碼為十碼!</font></td>
                <% 
                         } 
				%>
						<td>&nbsp;</td>
					</tr>
				<%		
                    }
				%>  
                  <tr>
                    <td height="15" valign="top">&nbsp;</td>
                    <td height="15" align="left" valign="top">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                    <td valign="top">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="20" colspan="5" align="left" valign="bottom"><img src="images/new/word_login.gif" width="313" height="26">
                      <div id="layer"><div id="layer2">                        
                        <p>為確保您的權益，請詳細閱讀本約定條款所載事項，當您選擇「同意」且按下「送出資料」鍵，表示您已同意成為鷗夜機車族服務會員並將遵守本約定條款所載之規範事項。</p>
                        
<p>(1) 您保證所填寫的資料是正確的。若刻意提供錯誤、不實、過時或不完整資訊，或網站管理者合理懷疑資料錯誤、不實、過時或不完整；鷗夜機車族有權利暫停或取消會員資格。</p>
<p>(2) 會員可免費刊登五筆賣車廣告。每筆廣告最多可上傳三張圖片。</p>
<p>(3) 會員刊登的廣告及照片若與機車出售無關，經網站管理者告知而不修改者，其刊登之廣告將被刪除。</p>
<p>(4) 鷗夜機車族僅提供一個機車買賣平台。買賣雙方所有一切因此網站而產生的損失，包括財物，金錢等；鷗夜機車族將不負任何責任。</p>
<p>(5) 會員資料只作為內部使用。除非配合政府機關要求，否則將不會刻意外洩。</p>
<p>(6) 鷗夜機車族保留更改此服務條款的權力，並且不需提前告知會員。</p>
<p>(7) 註冊會員可在任何時間內退出會員資格。當會員選擇退會時，會員的所有個人資料，包括刊登之廣告、上傳的圖片將被刪除.</p>
<p>(8) 若有任何訴訟事件，會員同意以台灣台北地方法院為第一審管轄法院。</p>
<p>(9) 本約定條款如有其他未盡事宜，將依照鷗夜機車族相關規定或相關法令辦理。</p>
                        
                        <p>&nbsp;</p>
                      </div>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>
                        <p><br>
                            <span class="style10"> 　　　　本人已詳細閱讀並了解約定條款內容 <br>
                                <label>
                           　　　     
                           <input type="radio" name="agreement" onClick="javascript:show('yes');return false;">
                                </label>
                      同意
                      <input type="radio" name="agreement" onClick="javascript:show('no');return false;">
                      不同意</span></p>
                        </div></td>
                  </tr>
                  <tr>
                    <td height="10" colspan="5" align="left" valign="top" class="style10"> <br>
                      <br></td>
                  </tr>
                  <tr>
                    <td height="10" colspan="5" align="center" valign="bottom">
<div id="show_buttons" style="display: none">
                      <input type="image" src="images/sell/button_senddata.jpg" alt="Submit" width="80" height="21"/>
                      <a href=<%=reset_link%> onClick="document.forms["myform"].reset();return false;">
                      <img src="images/sell/button_rewrite.jpg" alt="1" width="80" height="21" border="0">
                      </a>
</div>
                      <label></label>
                      <label></label></td>
                  </tr>
                </table>
              </form>
           </div>
        </td>
      </tr>
      <tr>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" height="0" valign="bottom">&nbsp;</td>
            <td valign="bottom">&nbsp;</td>
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
</body>
</html>