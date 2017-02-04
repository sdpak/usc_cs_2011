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

	

/* Validate the Form Fields Function */
 	function Validate()
	{
     
	
	// ------------------ Password ----------------->

	currentpassword = document.createform.currentpassword.value;
	password1 = document.createform.password2.value;
	password2 = document.createform.password2.value;


	if (currentpassword == "")
	{
	document.getElementById("checkfield").innerHTML = "Fill Current Password";
   	document.createform.currentpassword.focus();
	return;
	}


	if (currentpassword.length > 8)
	{
	document.getElementById("checkfield").innerHTML = "Invalid Current Password";
   	document.createform.currentpassword.value = "";
	document.createform.password1.value = "";
	document.createform.password2.value = "";
	document.createform.currentpassword.focus();
	return;
	}

	if (currentpassword.length < 6)
	{
	document.getElementById("checkfield").innerHTML = "Invalid Current Password";
   	document.createform.currentpassword.value = "";
	document.createform.password1.value = "";
	document.createform.password2.value = "";
	document.createform.currentpassword.focus();
	return;
	}

// Password 1

		if (password1 == "")
	{
	document.getElementById("checkfield").innerHTML = "Fill New Password field";
   	document.createform.password1.focus();
	return;
	}


	if (currentpassword.length > 8)
	{
	document.getElementById("checkfield").innerHTML = "New Password max 8 Characters";
   	document.createform.password1.value = "";
		document.createform.password2.value = "";
	document.createform.password1.focus();
	return;
	}

	if (currentpassword.length < 6)
	{
	document.getElementById("checkfield").innerHTML = "New Password min 6 Characters";
   	document.createform.password1.value = "";
		document.createform.password2.value = "";
	document.createform.password1.focus();
	return;
	}
	
// Password 2

		if (password2 == "")
	{
	document.getElementById("checkfield").innerHTML = "Fill Re-Enter New Password Field";
   	document.createform.password2.focus();
	return;
	}


	if (currentpassword.length > 8)
	{
	document.getElementById("checkfield").innerHTML = "Re-Enter New Password max 8 Characters";
   	document.createform.password2.value = "";
	document.createform.password2.focus();
	return;
	}

	if (currentpassword.length < 6)
	{
	document.getElementById("checkfield").innerHTML = "Re-Enter New Password min 6 Characters";
   	document.createform.password2.value = "";
	
	document.createform.password2.focus();
	return;
	}
	
			if (document.createform.password1.value !=document.createform.password2.value)
			{
               var f = document.getElementById("checkfield");
		       f.style.color = "red";
			   document.getElementById('checkfield').innerHTML = "New Password's  entered does not match";
			   createform.password1.focus();
			 return ;
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
<a class="toplinks" title="Home" href="http://csci4xx.usc.edu:9007/mtpress/main.jsp"  STYLE = "text-decoration:none;">Home</a> &nbsp; &nbsp; &nbsp;| &nbsp;&nbsp; &nbsp;
  <a class="toplinks" title="Category" href="http://csci4xx.usc.edu:9007/mtpress/display.jsp" STYLE = "text-decoration:none;">Browse Books</a> &nbsp; &nbsp; &nbsp; |&nbsp;&nbsp; &nbsp;

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

					<TD style = "padding: 3mm 10mm "  width = "60%">
						<form name = "createform"method ="Post" action ="customerChangePasswordProcess.jsp">
						<TABLE cellpadding = "5">
						<TH align= center colspan = 2 style="font-size:18px;padding-top:.4cm">Change Password </TH>
						
						
						<TR>
							<TD align= center colspan= '2' id = "checkfield">  <Font color = "red" style="font-size:15px">*</font> indicates a mandatory field</TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Current Password</b><Font color = "red" >* </font></TD>
							<TD><input type="password" name="currentpassword" size = "10" maxlength ="10"> <code>&nbsp;(min 6 char of a-z,A-z)
                         </code></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>New Password</b><Font color = "red" >* </font></TD>
							<TD> <input type="password" name="password1" size ='10' maxlength = "10"><code>&nbsp;(6 to 8 char of a-z,A-z,,0-9)
							</code></TD>
						</TR>
						<TR>
							<TD width="120" style="font-size:15px"><b>Re-Enter New Password</b><Font color = "red" >*</font></TD>
							<TD><input type="password" name="password2" size ='10' maxlength = "10">	</TD>
								<tr>			
							<TD colspan=2> <BR/></TD>
						</TR>
					
					
						
						<!------------ Change Password  Button --------------->

						<TR>
							<TD  colspan = "2"> <input type="button" class= "submit"  value="Change Password >" onclick="Validate()" ></TD>
						</TR>
						

						</TABLE>
						</form>



					</TD>	

<!-- End of Create Profile Form -->

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