<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%@ page language="java" pageEncoding="utf-8"
   
	import = "java.io.*"
	import = "java.lang.*"        
	import = "java.sql.*"
        import = "java.sql.Connection"
	import = "java.sql.Statement"
	import = "java.sql.DriverManager"
	import = "java.sql.ResultSet"
	import = "java.sql.ResultSetMetaData"
	import = "java.sql.SQLException"

	import="java.util.*"
	import="javax.mail.*"
	import="javax.mail.internet.*"
	import="javax.activation.*"	
	
	import = "javax.servlet.http.*"
%>

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

<%
   request.setCharacterEncoding("UTF8");
   //request.setCharacterEncoding("big5");


   String fromCreateAccount = request.getParameter("fromCreateAccount");
   String fromCreateAccountIndividual = request.getParameter("fromCreateAccountIndividual");
        

   if( (fromCreateAccount == null || "".equals(fromCreateAccount)) && (fromCreateAccountIndividual == null || "".equals(fromCreateAccountIndividual)) )
   { 
      response.sendRedirect("index.jsp");
      return;
   }

 
   String id_number = request.getParameter("id_number");  
   String password = request.getParameter("password");
   String contact_person = request.getParameter("contact_person");   
   String city = request.getParameter("city");
   String town_district = request.getParameter("town_district");
   String address = request.getParameter("address");
   String area_code = request.getParameter("area_code"); 
   String phone = request.getParameter("phone");
   String cell_phone = request.getParameter("cell_phone"); 
   String email = request.getParameter("email"); 
   String sex = request.getParameter("sex");
   String confirmed_password = request.getParameter("confirmed_password");
   
   String store_name = "";
   String license_number = "";

   int numberOfRows = 0;    

   
   if ( ("".equals(id_number)) || (id_number == null) )
      id_number = "";		
   

   if ("1".equals(fromCreateAccount))
   {
      store_name = request.getParameter("store_name");
      license_number = request.getParameter("license_number");
      numberOfRows = 5;
   }
   else
   {
      numberOfRows = 2;
   }
   
   String temp_name;
   String temp_email;
   String identification;
   String query;  
   String phoneNumber = ""; 
   String phoneNumberWithDash = ""; 
   int errortype = 0;      
   

   int id_number_not_filled = 0;
   int id_number_incorrect = 0;
   int password_not_filled = 0;        
   int contact_person_not_filled = 0; 
   int contact_person_incorrect = 0;
   int contact_person_length_wrong = 0;
   int address_not_filled = 0; 
   int phone_not_filled = 0;  
   int cell_phone_not_filled = 0;
   int cell_phone_incorrect = 0; 
   int cell_phone_length_wrong = 0;
   int email_not_filled = 0; 
   int email_incorrect = 0;
   int id_number_length_wrong = 0; 
   int store_name_not_filled = 0; 
   int license_number_not_filled = 0; 
   int id_duplication = 0;
   int email_duplication = 0;
   int name_duplication = 0;
   int password_length_wrong = 0;
   int password_format_incorrect = 0;
   int phone_incorrect = 0;
   int phone_length_wrong = 0;   
   int area_code_incorrect = 0;    
   int address_length_wrong = 0;          
   int address_incorrect = 0;
   int store_name_incorrect = 0;
   int store_name_length_wrong = 0;
   int license_number_length_wrong = 0;
   int license_number_incorrect = 0;
   int sex_not_filled = 0;
   int confirmed_password_not_filled = 0;
   int confirmed_password_not_matched = 0;   
   
   Character at = new Character('@'); 
   Character dot = new Character('.');  
   String str_dot = ".";

   int pos_at= email.indexOf(at);
   int pos_dot= email.indexOf(dot);    
   int email_length = email.length();

   Boolean duplicate_id = false;
   Boolean duplicate_email = false;
   Boolean duplicate_name = false;
   Boolean incorrect_id = false;
   Boolean go_back_to_create_account_page = false;
   Boolean go_back_to_create_account_individual_page = false;
   Boolean isNumber = true; 

   Connection dbconn;
   ResultSet rs;   
   Statement statement = null;
      
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";   
   String DATABASE_URL = "jdbc:mysql://localhost:3306/motorcycle_website?useUnicode=true&characterEncoding=UTF-8"; 
   String sqlCmd;
   int rowCount = 0, index, updateQuery = 0, loop = 0;
   String first_name, last_name;
   
   char s;
   int i;
   int map [] = {10,11,12,13,14,15,16,17,34,18,19,20,21,22,35,23,24,25,26,27,28,29,32,30,31,33};

   int a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10;
   int sum;
   int x;
   int y;



   if ("1".equals(fromCreateAccount))
   {
   
   if (id_number.length() == 10)
   {
	id_number = id_number.toUpperCase();
   	s = id_number.charAt(0);
   	i = s;
        i = i - 65;

        //do
        //{
  	   
          
            
          a0 =  map [i] / 10;
	  a1 = map [i] % 10;

	  a2 = id_number.charAt(1);
	  a2 = a2 - 48;

	  a3 = id_number.charAt(2);
	  a3 = a3 - 48;

	  a4 = id_number.charAt(3);
	  a4 = a4 - 48;

	  a5 = id_number.charAt(4);
	  a5 = a5 - 48;

	  a6 = id_number.charAt(5);
	  a6 = a6 - 48;

	  a7 = id_number.charAt(6);
	  a7 = a7 - 48;

	  a8 = id_number.charAt(7);
	  a8 = a8 - 48;

	  a9 = id_number.charAt(8);
	  a9 = a9 - 48;

	  a10 = id_number.charAt(9);
	  a10 = a10 - 48;

	  sum = (a0 * 1) + (a1 * 9) + (a2 * 8) + (a3 * 7) + (a4 * 6) + (a5 * 5) + (a6 * 4) + (a7 * 3) + (a8 * 2) + (a9 * 1);

	  x = (sum % 10);
	  y = (10 - x) % 10;

	  if(a10 != y)
	  {
	    incorrect_id = true;  
            if("1".equals(fromCreateAccount))
            {
              go_back_to_create_account_page = true; 
           }
	} 
   }
   
   if (id_number.equals(""))
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }

      id_number_not_filled = 1; 
      //errortype = 1;
      //response.sendRedirect("create_account_utf8_encodeURIComponent_OK.jsp?errortype="+errortype+"&id_number="+id_number+"&password="+password+"&contact_person="+java.net.URLEncoder.encode(contact_person)+"&city="+java.net.URLEncoder.encode(city)+"&address="+java.net.URLEncoder.encode(address)+"&phone="+phone+"&cell_phone="+cell_phone+"&email="+email);      
   }
   else 
   {
      if (incorrect_id)
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }

         id_number_incorrect = 1; 
      }
      else if (id_number.length() != 10)
      {         
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }

         id_number_length_wrong = 1;   
      } 
   }
   
   if (phone.equals(""))
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_not_filled = 1;            
   }
   else
   {

   if(city.equals("基隆市") || city.equals("台北市") || city.equals("新北市"))
{   
   if(phone.length() != 8) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{8}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
       
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '2') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("桃園縣") || city.equals("新竹市") || city.equals("新竹縣") || city.equals("宜蘭縣") || city.equals("花蓮縣"))
{ 
   if(phone.length() != 7) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{7}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
       
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '3') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("苗栗縣"))
{ 
   if(phone.length() != 6) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{6}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
       
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '3') || (area_code.charAt(2) != '7') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("台中市"))
{ 
   if(phone.length() != 8) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{8}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
       
      phone_incorrect = 1;
   }
   
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '4') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("彰化縣"))
{ 
   if(phone.length() != 7) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{7}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_incorrect = 1;
   }
   
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '4') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("南投縣"))
{ 
   if(phone.length() != 7) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{7}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
       
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '4') || (area_code.charAt(2) != '9') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("雲林縣") || city.equals("嘉義縣"))
{ 
   if(phone.length() != 7) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{7}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '5') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("台南市") || city.equals("澎湖縣"))
{ 
   if(phone.length() != 7) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{7}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '6') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("高雄市"))
{ 
   if(phone.length() != 7) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{7}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '7') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("屏東縣"))
{ 
   if(phone.length() != 7) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{7}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '8') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}
else if(city.equals("台東縣"))
{ 
   if(phone.length() != 6) 
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      phone_length_wrong = 1;
   }
   else if ( !(phone.matches("[0-9]{6}")) )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
       
      phone_incorrect = 1;
   }
   if ( (area_code.charAt(0) != '0') || (area_code.charAt(1) != '8') || (area_code.charAt(2) != '9') )
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      area_code_incorrect = 1;
   }
}

   } //end else

   if (address.equals(""))
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      address_not_filled = 1;      
   }
   else
   {
      if (address.indexOf('!') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('#') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('$') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('%') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('&') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('\'') != -1)  //
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      } 
      else if (address.indexOf('(') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf(')') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('*') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('+') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf(',') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('-') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('.') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('/') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf(':') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf(';') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      } 
      else if (address.indexOf('<') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('=') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('>') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('?') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('@') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      } 
      else if (address.indexOf('^') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('_') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      } 
      else if (address.indexOf('`') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('{') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('|') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('}') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if (address.indexOf('~') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_incorrect = 1;   
      }
      else if(address.length() < 5 ||  address.length() > 50)
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         address_length_wrong = 1;         
      }      
   }
   
 
   
   if (cell_phone.equals(""))
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      
      cell_phone_not_filled = 1;
   }
   else
   {
      if(cell_phone.length() != 10)
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         
         cell_phone_length_wrong = 1;         
      }
      else
      {
         for(loop = 0; loop < 10; loop++)
         {
   	    if (!(Character.isDigit(cell_phone.charAt(loop))))
            {
       	       isNumber = false;
               break;
            }

            if(cell_phone.charAt(0) != '0')  
            {
               isNumber = false;
               break;
            }

            if(cell_phone.charAt(1) != '9')  
            {
               isNumber = false;
               break;
            }
         }

         if(!isNumber)
         {
            if("1".equals(fromCreateAccount))
            {
               go_back_to_create_account_page = true; 
            }
            
            cell_phone_incorrect = 1;   
         }
      }      
   }


   
   } //end if ("1".equals(fromCreateAccount))

   if (password.equals(""))
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      else if("1".equals(fromCreateAccountIndividual))
      {
         go_back_to_create_account_individual_page = true; 
      }

      password_not_filled = 1;      
   }
   else
   {
      if(password.length() < 6 ||  password.length() > 15)
      {         
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }

         password_length_wrong = 1;         
      }
      /*
      else
      {
         if(!(password.matches("[a-zA-Z_0-9!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]+")))
         {      
            if("1".equals(fromCreateAccount))
            {
               go_back_to_create_account_page = true; 
            }
            else if("1".equals(fromCreateAccountIndividual))
            {
               go_back_to_create_account_individual_page = true; 
            }

            password_format_incorrect = 1;   
         }
      } 
      */
   }
   
   if (confirmed_password.equals(""))
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      else if("1".equals(fromCreateAccountIndividual))
      {
         go_back_to_create_account_individual_page = true; 
      }

      confirmed_password_not_filled = 1;      
   }
   else
   {
      if(!confirmed_password.equals(password))
      {         
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }

         confirmed_password_not_matched = 1;         
      }
   }
   
   if( ("".equals(sex)) || (sex == null) )
   {
      if("1".equals(fromCreateAccountIndividual))
      {
         go_back_to_create_account_individual_page = true; 
      }
	  sex_not_filled = 1;
   }
   
   if (contact_person.equals(""))
   {      
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      else if("1".equals(fromCreateAccountIndividual))
      {
         go_back_to_create_account_individual_page = true; 
      }

      contact_person_not_filled = 1;
   }
   else
   {
      //if((contact_person.matches("[\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~]+")))
      //if((contact_person.matches("^[!#$%&'()*+,-./:;<=>?@^_`{|}~]+$")))     
      if (contact_person.indexOf('!') != -1) 
      {         
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }

         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('#') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }

         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('$') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }

         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('%') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }

         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('&') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('\'') != -1)  //
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      } 
      else if (contact_person.indexOf('(') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf(')') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('*') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('+') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf(',') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('-') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('.') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('/') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf(':') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf(';') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      } 
      else if (contact_person.indexOf('<') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('=') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('>') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('?') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('@') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      } 
      else if (contact_person.indexOf('^') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('_') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      } 
      else if (contact_person.indexOf('`') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('{') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('|') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('}') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if (contact_person.indexOf('~') != -1) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_incorrect = 1;   
      }
      else if(contact_person.length() < 2 ||  contact_person.length() > 15)
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         contact_person_length_wrong = 1;         
      }
   }


   
   if (email.equals(""))
   {
      if("1".equals(fromCreateAccount))
      {
         go_back_to_create_account_page = true; 
      }
      else if("1".equals(fromCreateAccountIndividual))
      {
         go_back_to_create_account_individual_page = true; 
      }
      email_not_filled = 1;      
   }   
   else
   {   
      if (email.indexOf(at)==-1 || email.indexOf(at)==0 || email.indexOf(at)==email_length)
      {                   
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         email_incorrect = 1;
      }
      else if(email.indexOf(dot)==-1 || email.indexOf(dot)==0 || email.indexOf(dot)==email_length) 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         email_incorrect = 1;
      }
      else if (email.indexOf(at,(pos_at+1))!=-1)                    
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         email_incorrect = 1;
      } 
      else if (email.substring(pos_at-1,pos_at)==str_dot || email.substring(pos_at+1,pos_at+2)==str_dot)                    
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         email_incorrect = 1;
      }
      else if (email.indexOf(dot,(pos_at+2))==-1)
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         email_incorrect = 1;
      }           
      else if (email.indexOf(" ")!=-1)
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         email_incorrect = 1;
      }                             
      else if(!(email.matches("^[_.a-z0-9]+@[_a-z0-9]+(.[a-z0-9]{2,3})(.[a-z0-9]{2})?$")))  // ^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$ 
      {
         if("1".equals(fromCreateAccount))
         {
            go_back_to_create_account_page = true; 
         }
         else if("1".equals(fromCreateAccountIndividual))
         {
            go_back_to_create_account_individual_page = true; 
         }
         email_incorrect = 1;
      }
   }

   if ("1".equals(fromCreateAccount))
   {
      if (store_name.equals(""))
      {
         go_back_to_create_account_page = true;
         store_name_not_filled = 1;

      }
      else
      {
         if (store_name.indexOf('!') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('#') != -1) 
         { 
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('$') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('%') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('&') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('\'') != -1)  //
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         } 
         else if (store_name.indexOf('(') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf(')') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('*') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('+') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf(',') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('-') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('.') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('/') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf(':') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf(';') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         } 
         else if (store_name.indexOf('<') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('=') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('>') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('?') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('@') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         } 
         else if (store_name.indexOf('^') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('_') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         } 
         else if (store_name.indexOf('`') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('{') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('|') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('}') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if (store_name.indexOf('~') != -1) 
         {
            go_back_to_create_account_page = true;
            store_name_incorrect = 1;   
         }
         else if(store_name.length() < 2 || store_name.length() > 20)
         {
            go_back_to_create_account_page = true;
            store_name_length_wrong = 1;         
         }      
      }
   } //end if ("1".equals(fromCreateAccount)) 


   if ("1".equals(fromCreateAccount))
   {   
      if (license_number.equals(""))
      {
         go_back_to_create_account_page = true; 
         license_number_not_filled = 1;  
      }
      else
      {
         if(license_number.length() != 8)
         {
            go_back_to_create_account_page = true;
            license_number_length_wrong = 1;         
         }
         else if (license_number.indexOf('!') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('#') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('$') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('%') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('&') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('\'') != -1)  //
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         } 
         else if (license_number.indexOf('(') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf(')') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('*') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('+') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf(',') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('-') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('.') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('/') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf(':') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf(';') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         } 
         else if (license_number.indexOf('<') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('=') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('>') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('?') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('@') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         } 
         else if (license_number.indexOf('^') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('_') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         } 
         else if (license_number.indexOf('`') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('{') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         } 
         else if (license_number.indexOf('|') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('}') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }
         else if (license_number.indexOf('~') != -1) 
         {
            go_back_to_create_account_page = true;
            license_number_incorrect = 1;   
         }            
         else
         {
            isNumber = true;
            for(loop = 0; loop < 8; loop++)
            {
   	       if (!(Character.isDigit(license_number.charAt(loop))))
               {
       	          isNumber = false;
                  break;
               }            
            }

            if(!isNumber)
            {
               go_back_to_create_account_page = true;
               license_number_incorrect = 1;   
            } 
         }
      }
   } //end if ("1".equals(fromCreateAccount))


   try
   {
      Class.forName(JDBC_DRIVER);
         try
	 {
         
	 dbconn = DriverManager.getConnection(DATABASE_URL, "root", "chthebest");
        
         statement = dbconn.createStatement();
   
         query = "SELECT id_card_number, email, name FROM members";
         
         rs = statement.executeQuery(query);

         // iterate through the result set
         while (rs.next())
         {
            identification = rs.getString("id_card_number");
			temp_email = rs.getString("email");
            temp_name = rs.getString("name");
			
            if ( id_number.equals(identification) )
            {
               duplicate_id = true;               
               if("1".equals(fromCreateAccount))
               {
                  go_back_to_create_account_page = true; 
               }               
           
               id_duplication = 1;
               break;
            }
			
			if ( email.equals(temp_email) )
			{
               duplicate_email = true;               
               if("1".equals(fromCreateAccount))
               {
                  go_back_to_create_account_page = true; 
               }
               else if("1".equals(fromCreateAccountIndividual))
               {
                  go_back_to_create_account_individual_page = true; 
               }
           
               email_duplication = 1;
               break;
            }
			
			if ( contact_person.equals(temp_name) )
			{
               duplicate_name = true;               
               if("1".equals(fromCreateAccount))
               {
                  go_back_to_create_account_page = true; 
               }
               else if("1".equals(fromCreateAccountIndividual))
               {
                  go_back_to_create_account_individual_page = true; 
               }
           
               name_duplication = 1;
               break;
            }
         }

         if(!go_back_to_create_account_page && !go_back_to_create_account_individual_page) 
         {
            if ( (!duplicate_id) && (!duplicate_email) && (!duplicate_name) )
            {
               phoneNumber = area_code + phone;
               phoneNumberWithDash = area_code + "-" + phone;

               if("1".equals(fromCreateAccount))
               {
                  sqlCmd = ("insert into members (name, email, id_card_number, password, city, district, address, phone_number, cell_phone, store_name, license_number, valid, sex, forget_password, paid_membership_fee, image_1_fileName, image_2_fileName, image_3_fileName, sale, repair, inspection, transport, rental, insurance, fabricate, electrical, heavycycle, recharge, yearroundservice)" + "values ('" + contact_person + "', '" + email + "', '" + id_number + "', '" + password + "', '" + city +  "', '" + town_district + "', '" + address + "', '" + phoneNumberWithDash + "', '" + cell_phone + "', '" + store_name + "', '" + license_number + "', '0', '1', '0', '0', 'na', 'na', 'na', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0')");
               }
               else
               {
                  sqlCmd = ("insert into members (name, email, id_card_number, password, city, district, address, phone_number, cell_phone, store_name, license_number, valid, sex, forget_password, paid_membership_fee, image_1_fileName, image_2_fileName, image_3_fileName, sale, repair, inspection, transport, rental, insurance, fabricate, electrical, heavycycle, recharge, yearroundservice)" + "values ('" + contact_person + "', '" + email + "', 'na', '" + password + "', 'na', " 
                   + "'na', 'na', 'na', 'na', 'na', 'na', '0', '" + sex + "', '0', '0', 'na', 'na', 'na', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0')");
               }
 
               statement.executeUpdate(sqlCmd);
            }
         } 
         statement.close();         
         dbconn.close();
      }
      catch (SQLException sqlException)
      {
%>
	       
         can not insert data into table members.
<%
      }
   }  
   catch (ClassNotFoundException err)
   {
%>
 	    
     Class loading error
<%
   } //end catch


   if(go_back_to_create_account_page)
   {
%>   
          <jsp:forward page="create_account.jsp"> 
          <jsp:param name="id_number_not_filled" value="<%= id_number_not_filled %>" />           
          <jsp:param name="id_number_incorrect" value="<%= id_number_incorrect %>" /> 
          <jsp:param name="password_not_filled" value="<%= password_not_filled %>" />
          <jsp:param name="password_length_wrong" value="<%= password_length_wrong %>" />
          <jsp:param name="password_format_incorrect" value="<%= password_format_incorrect %>" />           
          <jsp:param name="contact_person_not_filled" value="<%= contact_person_not_filled %>" />           
          <jsp:param name="contact_person_incorrect" value="<%= contact_person_incorrect %>" />
          <jsp:param name="contact_person_length_wrong" value="<%= contact_person_length_wrong %>" />                    
          <jsp:param name="address_not_filled" value="<%= address_not_filled %>" /> 
          <jsp:param name="address_incorrect" value="<%= address_incorrect %>" />
          <jsp:param name="address_length_wrong" value="<%= address_length_wrong %>" />           
          <jsp:param name="phone_not_filled" value="<%= phone_not_filled %>" /> 
          <jsp:param name="phone_incorrect" value="<%= phone_incorrect %>" /> 
          <jsp:param name="phone_length_wrong" value="<%= phone_length_wrong %>" /> 
                   
          <jsp:param name="area_code_incorrect" value="<%= area_code_incorrect %>" />
          <jsp:param name="cell_phone_not_filled" value="<%= cell_phone_not_filled %>" /> 
          <jsp:param name="cell_phone_incorrect" value="<%= cell_phone_incorrect %>" /> 
          <jsp:param name="cell_phone_length_wrong" value="<%= cell_phone_length_wrong %>" />                    
          <jsp:param name="email_not_filled" value="<%= email_not_filled %>" /> 
          <jsp:param name="email_incorrect" value="<%= email_incorrect %>" />
          <jsp:param name="id_number_length_wrong" value="<%= id_number_length_wrong %>" /> 
          <jsp:param name="store_name_not_filled" value="<%= store_name_not_filled %>" /> 
          <jsp:param name="store_name_incorrect" value="<%= store_name_incorrect %>" /> 
          <jsp:param name="store_name_length_wrong" value="<%= store_name_length_wrong %>" /> 
          <jsp:param name="license_number_incorrect" value="<%= license_number_incorrect %>" /> 
          <jsp:param name="license_number_length_wrong" value="<%= license_number_length_wrong %>" /> 
           
           
          <jsp:param name="license_number_not_filled" value="<%= license_number_not_filled %>" /> 
          <jsp:param name="id_duplication" value="<%= id_duplication %>" />
          <jsp:param name="email_duplication" value="<%= email_duplication %>" />
		  <jsp:param name="name_duplication" value="<%= name_duplication %>" />
          <jsp:param name="id_number" value="<%= id_number %>" />           
          <jsp:param name="contact_person" value="<%= contact_person %>" /> 
          <jsp:param name="city" value="<%= city %>" /> 
          <jsp:param name="address" value="<%= address %>" /> 
          <jsp:param name="area_code" value="<%= area_code %>" />          
          <jsp:param name="phone" value="<%= phone %>" /> 
          <jsp:param name="cell_phone" value="<%= cell_phone %>" /> 
          <jsp:param name="email" value="<%= email %>" />                     
          <jsp:param name="store_name" value="<%= store_name %>" /> 
          <jsp:param name="license_number" value="<%= license_number %>" />  
          <jsp:param name="confirmed_password_not_filled" value="<%= confirmed_password_not_filled %>" />
          <jsp:param name="confirmed_password_not_matched" value="<%= confirmed_password_not_matched %>" />
                 
          <jsp:param name="fromCheckCreateAccount" value="1" /> 
          </jsp:forward>
<%      
   }
   else if(go_back_to_create_account_individual_page)
   {
%>   
          <jsp:forward page="create_account_individual.jsp"> 
          <jsp:param name="id_number_not_filled" value="<%= id_number_not_filled %>" />           
          <jsp:param name="id_number_incorrect" value="<%= id_number_incorrect %>" /> 
          <jsp:param name="password_not_filled" value="<%= password_not_filled %>" />
          <jsp:param name="password_length_wrong" value="<%= password_length_wrong %>" />
          <jsp:param name="password_format_incorrect" value="<%= password_format_incorrect %>" />           
          <jsp:param name="contact_person_not_filled" value="<%= contact_person_not_filled %>" />           
          <jsp:param name="contact_person_incorrect" value="<%= contact_person_incorrect %>" />
          <jsp:param name="contact_person_length_wrong" value="<%= contact_person_length_wrong %>" />                    
          <jsp:param name="address_not_filled" value="<%= address_not_filled %>" /> 
          <jsp:param name="address_incorrect" value="<%= address_incorrect %>" />
          <jsp:param name="address_length_wrong" value="<%= address_length_wrong %>" />           
          <jsp:param name="phone_not_filled" value="<%= phone_not_filled %>" /> 
          <jsp:param name="phone_incorrect" value="<%= phone_incorrect %>" /> 
          <jsp:param name="phone_length_wrong" value="<%= phone_length_wrong %>" /> 
                   
          <jsp:param name="area_code_incorrect" value="<%= area_code_incorrect %>" />
          <jsp:param name="cell_phone_not_filled" value="<%= cell_phone_not_filled %>" /> 
          <jsp:param name="cell_phone_incorrect" value="<%= cell_phone_incorrect %>" /> 
          <jsp:param name="cell_phone_length_wrong" value="<%= cell_phone_length_wrong %>" />                    
          <jsp:param name="email_not_filled" value="<%= email_not_filled %>" /> 
          <jsp:param name="email_incorrect" value="<%= email_incorrect %>" />
          <jsp:param name="id_number_length_wrong" value="<%= id_number_length_wrong %>" /> 
          <jsp:param name="store_name_not_filled" value="<%= store_name_not_filled %>" /> 
          <jsp:param name="store_name_incorrect" value="<%= store_name_incorrect %>" /> 
          <jsp:param name="store_name_length_wrong" value="<%= store_name_length_wrong %>" /> 
          <jsp:param name="license_number_incorrect" value="<%= license_number_incorrect %>" /> 
          <jsp:param name="license_number_length_wrong" value="<%= license_number_length_wrong %>" /> 
          <jsp:param name="sex_not_filled" value="<%= sex_not_filled %>" /> 
           
          <jsp:param name="license_number_not_filled" value="<%= license_number_not_filled %>" /> 
          <jsp:param name="id_duplication" value="<%= id_duplication %>" />
		  <jsp:param name="email_duplication" value="<%= email_duplication %>" />
		  <jsp:param name="name_duplication" value="<%= name_duplication %>" />	
          <jsp:param name="id_number" value="<%= id_number %>" />           
          <jsp:param name="contact_person" value="<%= contact_person %>" /> 
          <jsp:param name="city" value="<%= city %>" /> 
          <jsp:param name="address" value="<%= address %>" /> 
          <jsp:param name="area_code" value="<%= area_code %>" />          
          <jsp:param name="phone" value="<%= phone %>" /> 
          <jsp:param name="cell_phone" value="<%= cell_phone %>" /> 
          <jsp:param name="email" value="<%= email %>" />                     
          <jsp:param name="store_name" value="<%= store_name %>" /> 
          <jsp:param name="license_number" value="<%= license_number %>" />
		  <jsp:param name="sex" value="<%= sex %>" />
          <jsp:param name="confirmed_password_not_filled" value="<%= confirmed_password_not_filled %>" />
          <jsp:param name="confirmed_password_not_matched" value="<%= confirmed_password_not_matched %>" />
		  
          <jsp:param name="fromCheckCreateAccount" value="1" /> 
          </jsp:forward>
<%      
   }
   else
   {   
%>





<table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <%@include file="logo.jsp"%>
  </tr>
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
        <td width="890" height="55" valign="top">
        <%
		 if("1".equals(fromCreateAccount))
         {
		%>
         　　<img src="images/sell/banner_check.gif" width="840" height="25">
         <%
		 }
		 else
		 {
		    String member_page_link = "http://www.coolbee.com.tw/validate_member.jsp?valid=1&memberLogin=1&email=" + email + "&password=" + password;
		    String email_content = contact_person + "您好, <br><br>感謝您註冊成為會員.<br>請點選下列連結以完成註冊程序. 謝謝您!<br><br>" +
			"<a href=\"" + member_page_link + "\">會員專區</a><br><br>coolbee 團隊敬上";
			Properties theProperties = System.getProperties();
			theProperties.put("mail.host", "127.0.0.1");
		    theProperties.put("mail.smtp.port","25");	 
			theProperties.put("mail.transport.protocol", "smtp");
			
			Session theSession = Session.getDefaultInstance(theProperties,null);			
			theSession.setDebug(true);
			
			MimeMessage theMessage = new MimeMessage(theSession);
			theMessage.setFrom(new InternetAddress("noreply@coolbee.com.tw"));
			
			theMessage.setRecipients(Message.RecipientType.TO,email);
			
			theMessage.setSubject("會員註冊確認");
			theMessage.setContent(email_content, "text/html;charset=UTF-8" );
			
			try
  		    {
				Transport.send(theMessage);
			}
			catch(SendFailedException e)
			{
				out.println("SendFailedException occured!<br>");				
				//out.println("correct address not sent successfully: " + e.getValidUnsentAddresses().toString() + "<br>");
			}
			catch(MessagingException ex)
			{
				out.println("mail sending failed!<br>");
				out.println(ex.getNextException() + "<br>");
			}
		 
		%>
        　　	<img src="images/sell/banner_check_1.gif" width="840" height="65">
        <%
		 }
		%> 
        </td>
      </tr>

      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="70" height="200" valign="bottom">&nbsp;</td>
            <td valign="bottom"><table width="610" border="0" cellspacing="0" cellpadding="0">
<%
if("1".equals(fromCreateAccount))
{
%>			
              <tr>
                <td width="80" height="30"><img src="images/sell/word_create_account1.gif" alt="1" width="75" height="23"></td>
                <td class="a2"><%= id_number %></td>
                <td width="30" height="0" rowspan=<%= numberOfRows%>><img src="images/sell/long_line.gif" alt="1" width="5" height="138"></td>
                <td width="80"><img src="images/sell/word_create_account6.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= password %></span></td>
              </tr>
              <tr>
                <td height="30"><img src="images/sell/word_create_account2.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= contact_person %></span></td>
                <td><img src="images/sell/word_create_account7.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= cell_phone %></span></td>
              </tr>
              <tr>
                <td height="30"><img src="images/sell/word_create_account8.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= email %></span></td>
                <td><img src="images/sell/word_create_account3.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= phoneNumberWithDash %></span></td>
              </tr>
              <tr>
                <td height="30"><img src="images/sell/word_create_account4.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= city %><%= town_district %></span></td>
                <td><img src="images/sell/word_create_account9.gif" alt="11" width="75" height="23"></td>
                <td><span class="a2"><%= address %></span></td>
              </tr>
              <tr>
                <td height="30"><img src="images/sell/word_create_account5.gif" alt="1" width="75" height="23"></td>
                <td height="30" align="left" valign="middle"><span class="a2"><%= store_name %></span></td>
                <td height="30"><img src="images/sell/gui_number.jpg" alt="1" width="75" height="23"></td>
                <td height="30" align="left" valign="middle"><span class="a2"><%= license_number %></span></td>
              </tr>
              <tr>
                <td height="60" colspan="5" align="center" valign="bottom">　<img src="images/sell/word_check.gif" width="499" height="28"></td>
              </tr>
<%
}
else
{
%>
              <tr>
                <td height="30"><img src="images/sell/word_create_account2.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= contact_person %></span></td>
                <td width="30" height="0" rowspan=<%= numberOfRows%>><img src="images/sell/long_line.gif" alt="1" width="5" height="138"></td>
                <td width="80"><img src="images/sell/word_create_account6.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= password %></span></td>
              </tr>
              <tr>
                <td height="30"><img src="images/sell/word_create_account8.gif" alt="1" width="75" height="23"></td>
                <td><span class="a2"><%= email %></span></td>
                <td height="30"><img src="images/sell/gender.gif" width="75" height="23"></td>
<%				
if("1".equals(sex))
{
%>
                <td><span class="a2">男</span></td>
<%				
}
else
{
%>				
                <td><span class="a2">女</span></td>				
<%				
}
%>				
              </tr>
<%
}
		String to_email = "j.h168@yahoo.com";
		String emailContent;
		if("1".equals(fromCreateAccount))
		{
			emailContent = "機車行會員 '" + contact_person + "' 已註冊.<br>請驗證店家資訊並確認會員資格. 謝謝您!" +
			"<br><br>coolbee 團隊敬上";
		}
		else
		{
			emailContent = "個人會員 '" + contact_person + "' 已註冊. 需點選確認信中的連結才能成為合格會員!" +
			"<br><br>coolbee 團隊敬上";
		}	
			Properties mailProperties = System.getProperties();
			mailProperties.put("mail.host", "127.0.0.1");
		    mailProperties.put("mail.smtp.port","25");	 
			mailProperties.put("mail.transport.protocol", "smtp");
			
			Session mailSession = Session.getDefaultInstance(mailProperties,null);			
			mailSession.setDebug(true);
			
			MimeMessage mailMessage = new MimeMessage(mailSession);
			mailMessage.setFrom(new InternetAddress("noreply@coolbee.com.tw"));
			
			mailMessage.setRecipients(Message.RecipientType.TO,to_email);
			
			mailMessage.setSubject("會員註冊通知");
			mailMessage.setContent(emailContent, "text/html;charset=UTF-8" );
			
			try
  		    {
				Transport.send(mailMessage);
			}
			catch(SendFailedException e)
			{
				out.println("SendFailedException occured!<br>");				
			}
			catch(MessagingException ex)
			{
				out.println("mail sending failed!<br>");
				out.println(ex.getNextException() + "<br>");
			}
%>
            </table></td>
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
   } //end else
%>

</body>
</html>