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
.style10 {color: #816658; font-size: 10pt; }
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
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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
<body onLoad="MM_preloadImages('images/new/bt_mo2.jpg')">

<%
   request.setCharacterEncoding("UTF8");
   String id_number = request.getParameter("id_number");
   String contact_person = request.getParameter("contact_person");
   String password = request.getParameter("password");
   String confirmed_password = request.getParameter("confirmed_password");
   String city = request.getParameter("city");
   String address = request.getParameter("address");
   String area_code = request.getParameter("area_code");
   String phone = request.getParameter("phone");
   String cell_phone = request.getParameter("cell_phone");
   String email = request.getParameter("email");
   String errortype = request.getParameter("errortype");  
   String fromCheckCreateAccount = request.getParameter("fromCheckCreateAccount");
   String sex = request.getParameter("sex");   	

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
   String id_duplication = request.getParameter("id_duplication");
   String email_duplication = request.getParameter("email_duplication");
   String name_duplication = request.getParameter("name_duplication");      
   String sex_not_filled = request.getParameter("sex_not_filled");
   
   
   String reset_link = "create_account_individual.jsp";     
   String empty_string = ""; 
   
   int numOfRows = 6;

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
        <td height="28" valign="top"><div id="layer3">
              <form name="myform" method="post" action="check_create_account.jsp?fromCreateAccountIndividual=1">
                <table width="810" border="0" cellspacing="0" cellpadding="0">
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
                    <td width="30" height="0" rowspan=<%= numOfRows%>><img src="images/sell/long_line.gif" alt="1" width="5" height="138"></td>
                    <td width="80"><img src="images/sell/word_create_account6.gif" alt="1" width="75" height="23"></td>
                    <td width="186"><input type="password" name="password" id="textfield7" maxlength="15"></td>
                    <td><span class="style9">密碼長度: 6~15字. 請填英文大小寫,數字及符號</span></td>
                  </tr>
                <tr>
                <%
                   if("1".equals(contact_person_not_filled) || "1".equals(contact_person_incorrect) || "1".equals(contact_person_length_wrong) || "1".equals(name_duplication) )
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
                  <td height="30"><img src="images/sell/word_create_account6_1.gif" width="75" height="23"></td>
                  
                  <td>
        	      <input type="password" name="confirmed_password" id="textfield7" maxlength="15">
                  </td>
                  
 		  <td><span class="style9">重複輸入上面的密碼</span></td>
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
                    <td height="50"><img src="images/sell/gender.gif" width="75" height="23"></td>
                  <%
                      if("0".equals(sex) || "1".equals(sex))
                      {
                  %>
	            <td><span class="a2">
                  <%
		         if("1".equals(sex))
				 {
                  %>
                        <input type="radio" name="sex" value="1" checked> 男 <br>
						<input type="radio" name="sex" value="0">女
				  <%
				 }
				 else
				 {
                  %>
                        <input type="radio" name="sex" value="1"> 男 &nbsp;&nbsp;
					    <input type="radio" name="sex" value="0" checked>女
		  <%
			 }
                  %>	
                    </span></td>
                  <%
                      }
                      else
                      { 
                  %>
                    <td width="156"><span class="a2">
                        <input type="radio" name="sex" value="1">男 <br>
			<input type="radio" name="sex" value="0">女
                    </span></td>
                  <%
                      }                    
                  %>

                  <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
                  </tr>

                <tr>
                <%
                      if("1".equals(sex_not_filled))
                      {
		%>
                    <td width="75" height="23">&nbsp;</td>  
					<td><font color=red>請選擇性別!</font></td>
					<td colspan="3">&nbsp;</td>
			    <%                         
                      }
		      else
                      {  
                %>
                      	 <td colspan="6">&nbsp;</td>
                <%
                      }
                %>               
                </tr>

                  <tr>
                    <td height="15" valign="top">&nbsp;</td>
                    <td height="15" align="left" valign="top">&nbsp;</td>
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
        </div></td>
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