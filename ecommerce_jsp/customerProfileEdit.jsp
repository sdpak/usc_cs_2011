<%@ page import="java.sql.*" %>
<%
{
	try {
			String user = session.getAttribute("username").toString();
             
				

				String FirstName = new String();
				String LastName = new String();
				String Emailid = new String();
				String PhoneNo = new String();
				String Address = new String();
				String State = new String();
				String City = new String();
				String Zip = new String();
				String CartItemCount = new String();

				
								

	try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }

	try {
		
	Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
			Statement s=C.createStatement();
			Statement s3=C.createStatement();

            String sql="select *  from customer where username = '"+user+"'";
			String sql4 = "Select Count(*) from cart where username ='"+user+"'";

			s.execute(sql);
			s3.execute(sql4);

			ResultSet rs=s.getResultSet();
			ResultSet rs4=s3.getResultSet();


     // ------------- Get  Results ------------------------------------->
      if (rs.next()) {
			FirstName = rs.getString("FName");
			LastName = rs.getString("LName");
			Emailid = rs.getString("email");
			PhoneNo = rs.getString("phno");
			Address = rs.getString("address");
			State = rs.getString("state");
			City = rs.getString("city");
			Zip = rs.getString("zip");
			

    }      	
	  if(rs4.next())
		{
	            CartItemCount = rs4.getString(1);
		}


	    rs.close();
		rs4.close();
		C.close();

			} catch (SQLException E) {
            out.println("SQLException: " + E.getMessage());
            out.println("SQLState:     " + E.getSQLState());
            out.println("VendorError:  " + E.getErrorCode());
        }


%> 



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Edit Profile Information - The MT Press</TITLE>
<script type ="text/javascript">
{

	function Validempid(id){
		regex =  /^[a-zA-Z]{4,10}$/;

		if (!regex.test(id))
		{
          return false;
		}
		else return true;
	}
function selectChange1()
{

var cntry = "";
for (var i=0; i < document.createform.country.length; i++)
   {
   if (document.createform.country[i].selected)
      {
      cntry = cntry + document.createform.country[i].value + "\n";
      }
   }


var stt = document.createform.state;

stt.options.length = 0;


var cty = document.createform.city;

cty.options.length = 0;

if (cntry == "CA\n")
{
stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('LA','LA');
stt.options[stt.options.length] = new Option('SB','SB');
stt.options[stt.options.length] = new Option('SF','SF');
stt.options[stt.options.length] = new Option('Others','Others');
cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('90007','90007');
cty.options[cty.options.length] = new Option('90028','90028');
cty.options[cty.options.length] = new Option('Others','Others');

}




if (cntry == "FL\n")
{

stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('Callaway','Callaway');
stt.options[stt.options.length] = new Option('CooperCity','CooperCity');
stt.options[stt.options.length] = new Option('Miami','Miami');
stt.options[stt.options.length] = new Option('Others','Others');


cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('32404','32404');
cty.options[cty.options.length] = new Option('32460','32460');
cty.options[cty.options.length] = new Option('Others','Others');
}


if (cntry == "MA\n")
{
stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('Hampden','Hampden');
stt.options[stt.options.length] = new Option('Bristol','Bristol');
stt.options[stt.options.length] = new Option('Essex','Essex');
stt.options[stt.options.length] = new Option('Others','Others');
cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('01003','01003');
cty.options[cty.options.length] = new Option('01029','01029');
cty.options[cty.options.length] = new Option('Others','Others');
}


if (cntry == "CH\n")
{

stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('Barrington','Barrington');
stt.options[stt.options.length] = new Option('Bolingbrook','Bolingbrook');
stt.options[stt.options.length] = new Option('EastChicago','EastChicago');
stt.options[stt.options.length] = new Option('Others','Others');
cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('60010','60010');
cty.options[cty.options.length] = new Option('60038','60038');
cty.options[cty.options.length] = new Option('Others','Others');
}




if (cntry == "Others\n")
{
stt.options[stt.options.length] = new Option('Select City','1');
stt.options[stt.options.length] = new Option('Others','Others');
cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (cntry == "1\n")
{
stt.options[stt.options.length] = new Option('Select City','1');
cty.options[cty.options.length] = new Option('Select Zip','1');
}


}

function selectChange2()
{

var stat = "";
for (var i=0; i < document.createform.state.length; i++)
   {
   if (document.createform.state[i].selected)
      {
      stat = stat + document.createform.state[i].value + "\n";
      }
   }


var cty = document.createform.city;

cty.options.length = 0;

if (stat == "LA\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('90007','90007');
cty.options[cty.options.length] = new Option('90028','90028');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "SB\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('93106','93106');
cty.options[cty.options.length] = new Option('93127','93127');
cty.options[cty.options.length] = new Option('Others','Others');

}
if (stat == "SF\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('94101','94101');
cty.options[cty.options.length] = new Option('94142','94142');
cty.options[cty.options.length] = new Option('Others','Others');

}

     

if (stat == "Callaway\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('32404','32404');
cty.options[cty.options.length] = new Option('32605','32605');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "CooperCity\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('33024','33024');
cty.options[cty.options.length] = new Option('33077','33077');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "Miami\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('33101','33101');
cty.options[cty.options.length] = new Option('33164','33164');
cty.options[cty.options.length] = new Option('Others','Others');

}

    

if (stat == "Hampden\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('01003','01003');
cty.options[cty.options.length] = new Option('01045','01045');
cty.options[cty.options.length] = new Option('Others','Others');

}


if (stat == "Bristol\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('02718','02718');
cty.options[cty.options.length] = new Option('02725','02725');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "Essex\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('01929','01929');
cty.options[cty.options.length] = new Option('01967','01967');
cty.options[cty.options.length] = new Option('Others','Others');

}
if (stat == "Barrington\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('60010','60010');
cty.options[cty.options.length] = new Option('60122','60122');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "Bolingbrook\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('60440','60440');
cty.options[cty.options.length] = new Option('60477','60477');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "EastChicago\n")
{

cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('60601','60601');
cty.options[cty.options.length] = new Option('60656','60656');
cty.options[cty.options.length] = new Option('Others','Others');

}

if (stat == "Others\n")
{
cty.options[cty.options.length] = new Option('Select Zip','1');
cty.options[cty.options.length] = new Option('Others','Others');
}


if (stat == "1\n")
{
cty.options[cty.options.length] = new Option('Select Zip','1');
}
}
			function Validpwd(id){
		regex =  /^[a-zA-Z0-9]{6,10}$/;

		if (!regex.test(id))
		{
          		  return false;
		}
		else return true;

	}

/* Validate the Form Fields Function */
 	function Validate()
	{
     
	var userCount = 0;
	var fname = "";
	var lname = "";
	var addr = "";
	var city = "";
	var state = "";
	var country = "";
	var zip = "";
	var phno = "";
	var email = "";
	var conty = new Array();
	var ste = new Array();
	var ct = new Array();
	// ------------------ First Name ----------------->
	fname = document.createform.Fname.value;
	if (fname == "")
	{
	document.getElementById("checkfield").innerHTML = "Please fill the the First Name";
	document.getElementById("checkfield").style.colour="red";
	document.createform.Fname.focus();
	return;
	}
		if(!isNaN(fname))
		{
		document.getElementById("checkfield").innerHTML = "First Name Should Not Be Numbers";
		document.getElementById("checkfield").style.colour="red";
		document.createform.Fname.focus();
		return;
		}

	if (fname.length > 20)
	{
	document.getElementById("checkfield").innerHTML = "Too long First Name";
	document.getElementById("checkfield").style.colour="red";
  	document.createform.Fname.focus();
	return;
	}
	// ------------------ Last Name ----------------->

	lname = document.createform.Lname.value;
	
	if (lname == "")
	{
	document.getElementById("checkfield").innerHTML = "Please fill the the Last Name";
	document.getElementById("checkfield").style.colour="red";
 	document.createform.Lname.focus();
	return;
	}

	if(!isNaN(lname))
	{

	document.getElementById("checkfield").innerHTML = "Last Name Should Not Be Numbers";
	document.getElementById("checkfield").style.colour="red";
	document.createform.Lname.focus();
	return;

	}



	if (lname.length > 20)
	{
	document.getElementById("checkfield").innerHTML = "Too long Last Name";
	document.getElementById("checkfield").style.colour="red";

    
	document.createform.Lname.focus();
	return;
	}

	// ------------------ Address  ----------------->
		addr = document.createform.Address.value;
	if (lname == "")
	{
	document.getElementById("checkfield").innerHTML = "Please fill the the Address";
	document.getElementById("checkfield").style.colour="red";
 	document.createform.Lname.focus();
	return;
	}

var contyt = "";
for (var i=0; i < document.createform.country.length; i++)
   {
   if (document.createform.country[i].selected)
      {
      contyt = contyt + document.createform.country[i].value;
      }
   }

conty[userCount] = contyt;


var stet = "";

for (var i=0; i < document.createform.state.length; i++)
   {
   if (document.createform.state[i].selected)
      {
      stet = stet + document.createform.state[i].value;
      }
   }
ste[userCount] = stet;




var ctt = "";

for (var i=0; i < document.createform.city.length; i++)
   {
   if (document.createform.city[i].selected)
      {
      ctt = ctt + document.createform.city[i].value + "\n";
      }
   }

ct[userCount] = ctt;


if ((conty[userCount] == "1")||(ste[userCount] == "1")||(ct[userCount] == "1"))
{

document.getElementById("checkfield").innerHTML = "Please fill Location";
	document.getElementById("checkfield").style.colour="red";

return;
}



if(ct[userCount] == 1)
	{
		document.getElementById("checkfield").innerHTML = "Please fill Location";
	document.getElementById("checkfield").style.colour="red";
	return;
	}











///////////////////////////////////////////////////////////////////////////////////////////////////////






	// ------------------ Phone Number ----------------->

	phno = document.createform.phno.value;

		if (phno == "")
		{
		document.getElementById("checkfield").innerHTML = "Please fill your Phone Number";
		document.getElementById("checkfield").style.colour="red";

		
		document.createform.phno.focus();
		return;
		}


		if (phno.length != 10)
		{
		document.getElementById("checkfield").innerHTML = "Phone number should be a 10 digit number";
		document.getElementById("checkfield").style.colour="red";

		
		document.createform.phno.focus();
		return;
		}

		phno = phno *1;


		if(isNaN(phno))
		{

		document.getElementById("checkfield").innerHTML = "Phone number should consist Numbers (0-9)";
		document.getElementById("checkfield").style.colour="red";

		
		document.createform.phno.focus();
		return;

		}



	// ------------------ Email Id ----------------->

	email = document.createform.email.value;

		if (email == "")
		{
		document.getElementById("checkfield").innerHTML = "Please fill your E-Mail address";


		
		document.createform.email.focus();
		return;
		}

		var emailFormat = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

		if(emailFormat.test(email) == false) 
		{
				document.getElementById("checkfield").innerHTML = "Invalid Email Address";
		

				
			  document.createform.email.focus();

			  return;
		}

	document.createform.submit();

	}

}
</script>
  <style type="text/css">
body{


  
  }
.toplinks
{
	
	    color: white;
    	font-weight:bold;
		text-decoration: underline;
}
.linkTable
{
	text-align:center;
	background-image:URL("toplinks.jpg");
	color: white;
    
	font-weight:bold;


}
	.listhead
	{
		
		text-align:center;
		background-image:URL('cathead.jpg');
		font-weight:bold;
		color:white;
	}

		.featured
	{
		text-align:center;
		background-image:URL('featured.jpg');
		font-weight:bold;
		color:white;
	}

	.footer{
		background-image: URL('footerline.jpg');
	}

	.profilelist
	{
		background-image: URL('profilelist.jpg');
		text-align:center;
		font-size: 15px;
		font-weight:bold;
		color:white;

	}
	.holder
	{
		padding-top:.3cm;
	}

	.profilelistholder
	{
		background-color:#F4F3F3;
		padding:1mm 3mm 1mm 3mm;
	}




  </style>
  </HEAD>

 <BODY >
 <div align="center">
<!-- Header-->
<div class="header" width= "960" >
<TABLE border ="0" >
<TR>
	<TD><img src = "logo.jpg"/></TD>
</TR>
</TABLE>
</div>
<!--Link Land-->

<div  width="960">
<TABLE class="linkTable" border ="0" width = "960" height="25" style="border-color:#90A7BD;">
<TR><TD  >
 <a class="toplinks" title="Home" href="http://csci4xx.usc.edu:9007/mtpress/customerMainPage.jsp"  STYLE = "text-decoration:none;">Home</a> &nbsp; &nbsp; &nbsp;| &nbsp;&nbsp; &nbsp;
 <a class="toplinks" title="Category" href="http://csci4xx.usc.edu:9007/mtpress/customerCategoryDisplay.jsp" STYLE = "text-decoration:none;">Browse Books</a> &nbsp; &nbsp; &nbsp;
	</TD>
</TR>
</TABLE>
</div>

<div>
<table width= "960" >
<TR>
	<!-- Left Column -->
	<TD width="20%">
<!-- Title decor -->
					<!-- PRofile lister -->
					<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
					<div style="position:absolute;top:1.5in;">
					<TABLE   width = "192" >
					<TR>
						<TD  STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:18px;text-align:left;background-color:#F4F3F3;padding:2mm 2mm 2mm 2mm" > Your Profile</TD>
					</TR>
											
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 13px;"><a href="http://cs-server.usc.edu:9007/mtpress/customerProfileDisplayData.jsp" STYLE = "text-decoration:none;">PROFILE INFORMATION</a>
              </SPAN></TD>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 13px;"><a href="http://cs-server.usc.edu:9007/mtpress/customerProfileEdit.jsp" STYLE = "text-decoration:none;">EDIT PROFILE</a></SPAN>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 13px;"><a href="http://cs-server.usc.edu:9007/mtpress/customerChangePassword.jsp" STYLE = "text-decoration:none;">CHANGE PASSWORD</a></SPAN></TD>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 13px;"><a href="http://cs-server.usc.edu:9007/mtpress/customerOrderHistory.jsp" STYLE = "text-decoration:none;">ORDER HISTORY</a></SPAN></TD>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 12px;"><a href="http://cs-server.usc.edu:9007/mtpress/customerSignout.jsp" STYLE = "text-decoration:none;">SIGN OUT</a></SPAN></TD>
					</TR>

					</TABLE>
					</div>
	</TD>
	 
<!-- Create Profile Form -->

					<TD style = "padding: 3mm 10mm " width = "60%">
						<form name = "createform"method ="Post" action ="customerEditProcess.jsp">
						<TABLE style="padding:1cm 1cm;" cellpadding = "5">
								<TR>
							<TD style="font-weight:bold;font-size: 20px;" colspan = 2>Edit Profile Information</TD>
						</TR>
						<TR>
							<TD align= center colspan= '2' id = "checkfield">  <Font color = "red" style="font-size:15px">*</font> indicates a mandatory field</TD>
					
						<!-- Personal Information----------------------------------------------------------------------------------->
						<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2> Personal Information </td>
						</TR>
						
						<TR>
							<TD width="120" style="font-size:15px"><b>First Name</b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="Fname" value ="<%=FirstName%>" /></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Last Name</b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="Lname" maxlength = "50" value ="<%=LastName%>" /></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Email id</b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="email"  maxlength = "50" value ="<%=Emailid%>" /></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Phone </b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="phno"   maxlength = "10" size = "10"  value ="<%=PhoneNo%>" /><code>&nbsp;10 digits numbers</code></TD>
						</TR>
						
						<TR>
							<TD colspan = 2><HR/></TD>
						</TR>
						
						<!-- Address Information----------------------------------------------------------------------------------->
						<TR>
						<td style = "text-align:center;font-size:18px;font-weight:bold;" colspan=2> Shipping Address </td>
						</TR>	
					
						<TR>
							<TD width="120" style="font-size:15px"><b>Address </b><Font color = "red" >* </font></TD>
							<TD><input type ="text" name="Address" maxlength = "50" size = "43" value ="<%=Address%>" /><br/><span style="font-size:13px;"> Street#, street, apt#</span> </TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>State/City/Zip</b><Font color = "red" >* </font></TD>
							<TD> <select name="country" id = "country" onchange = "selectChange1()">
							<option value="1" selected="selected" >Select State</option>
							<option value="CA">CA</option>
							<option value="FL">FL</option>
							<option value="MA">MA</option>
							<option value="CH">CH</option>
							<option value="Others">Others</option>
							</select>
							<select name="state" id = "state" onchange = "selectChange2()">
							<option value="1" selected="selected" >Select City </option>
							</select>

							<select name="city" id = "city">
							<option value="1" selected="selected" >Select Zip</option>
							</select>    
				         </TD>
						</TR>
						<TR>
						<TD>&nbsp;
						</TD>
						</TR>
						
						
						<!------------ Create Profile Button --------------->

						<TR>
							<TD  colspan = "2"> <input type="button" class= "submit"  value="Update Profile >" onclick="Validate()" ></TD>
						</TR>
						

						</TABLE>
						</form>



					</TD>	

<!-- End of Create Profile Form -->

	<!-- Right  Column -->
	<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
			<TD   width = "20%">
					<div style="position:absolute;top:1.5in;">
					<TABLE  width = "192" >
					<TR>
					
						<TD  STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:15px;text-align:left;background-color:#CDF2FD;padding:2mm 0 2mm 0" ><img src="left_dots.gif" width="5" height="15" border="0" alt="" align =left> YOUR ACCOUNT</TD>
					</TR>
					<!------------------------------------------------------------JSP-------------------------------------------------------------->						
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;">Welcome! <% out.println(FirstName); %><% out.println(LastName); %></a>
              </SPAN></TD>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;"><a href="http://cs-server.usc.edu:9007/mtpress/customerProfileDisplay.jsp" STYLE = "text-decoration:none;" title="Change your personal information, view your order history and address book, and manage your mailing list preferences.">Your Profile</a></SPAN>
					</TR>
					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;"><a href="http://cs-server.usc.edu:9007/mtpress/customerSignout.jsp" STYLE = "text-decoration:none;">Sign Out</a></SPAN></TD>
					</TR>
					
					<TR>
						<TD>&nbsp;</TD>
					</TR>
				
				    <TR>
					<TD  STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:15px;text-align:left;background-color:#F0F0C6;padding:2mm 0 2mm 0" ><img src="cart_new.gif" width="19" height="15" border="0" alt="" align =left>SHOPPING CART</TD>
					</TR>

					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;font-weight:bold;color:26869E;"><%out.println(CartItemCount);%> item's in your Cart
              </SPAN></TD>
					</TR>

					<TR>
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;"><a href="http://cs-server.usc.edu:9007/mtpress/customerCart.jsp" STYLE = "text-decoration:none;">Edit Cart</a>&nbsp;&nbsp;&nbsp;|&nbsp; &nbsp;&nbsp;<a href="http://cs-server.usc.edu:9007/mtpress/customerCheckout.jsp" STYLE = "text-decoration:none;"> Check Out</SPAN>
              </SPAN></TD>
					</TR>


					</TABLE>
					</div>

			</TD>
	
							

<div>
<TABLE width="960" class = "footer">
<TR>
	<TD > </TD>
</TR>
</TABLE>
<TABLE width="960">
<TR>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:9007/mtpress/about.jsp" STYLE = "text-decoration:none;">ABOUT</a>
              </SPAN>&nbsp; | &nbsp;</TD>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:9007/mtpress/copyright.jsp" STYLE = "text-decoration:none;">COPYRIGHT</a>
              </SPAN>&nbsp; | &nbsp;
	</TD>

	<TD WIDTH = "250">
	</TD>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:9007/mtpress/termsOfUse.jsp" STYLE = "text-decoration:none;">TERMS OF USE</a>
              </SPAN>&nbsp; | &nbsp;</TD>

	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;">COPY RIGHT @CSCI571 SUMMER-2010 </a>
              </SPAN></TD>

</TR>
</TABLE>

</div>


 
 </BODY>
</HTML>
<%

	} catch (Exception E) {

String fail ="http://cs-server.usc.edu:9007/mtpress/sessionLogin.jsp";
response.sendRedirect(fail);
	}

}

%>