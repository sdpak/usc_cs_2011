<%@ page import="java.sql.*" %>
<%
{
	try {
			String user = session.getAttribute("username").toString();
              
				

				String FirstName = new String();
				String LastName = new String();
				String CartItemCount = new String();
				String total = new String();
				String count = "0";
				String BookID [];
				BookID = new String[100];
								String BookName [];
				BookName = new String[100];
								String BookPrice [];
				BookPrice = new String[100];
								String BookQuantity [];
				BookQuantity = new String[100];
						int i =0;	
						String BookFinalPrice [];
						BookFinalPrice = new String[100];
					

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
				//Statement s4=C.createStatement();
				//	Statement s5=C.createStatement();
				//		Statement s6=C.createStatement();
	

            String sql="select FName, LName  from customer where username = '"+user+"'";
						String sql4 = "Select Count(*) from cart where username ='"+user+"'";
						//String sql5 = "Select *,actualprice*quantity from cart where username ='"+user+"'";
						//String sql6="select *, actualprice*quantity from cart where username='" + user + "' order by productname";
						//String sql7="select sum(actualprice*quantity) from cart where username='" + user + "'";
						
			s.execute(sql);
			s3.execute(sql4);
			//s4.execute(sql5);
			
			//ResultSet rs6=s5.executeQuery(sql6);
			ResultSet rs=s.getResultSet();
			ResultSet rs4=s3.getResultSet();
			//ResultSet rs5=s4.getResultSet();

			//ResultSet rs7 = s6.executeQuery(sql7);

			//if(rs7.next())
		//{
	//			 total = rs7.getString(1);
	//	}
			


			
     // ------------- Get  Results ------------------------------------->
      if (rs.next()) {
			FirstName = rs.getString("FName");
			LastName = rs.getString("LName");

    }      	
	  if(rs4.next())
		{
	            CartItemCount = rs4.getString(1);
				if(CartItemCount.equals(count))
			{      
					String  emptycart = "http://csci4xx.usc.edu:9007/mtpress/customerCartEmpty.jsp";
				
					response.sendRedirect(emptycart); 
					
			}

		}

	

	/*	while(rs5.next()){

			BookID[i] = rs5.getString("productid");
			BookName[i] = rs5.getString("productname");
			BookPrice[i] =rs5.getString("actualprice");
			BookQuantity[i] =rs5.getString("quantity");
			BookFinalPrice[i] = rs5.getString(7);
			i++;

		} */





%> 

<!------------------------------------------------------------JSP-------------------------------------------------------------->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Welcome To MT Press!</TITLE>
<script type = "text/javascript">


function ResetAll()
{
	document.confirmpayment.reset();
}

function validation()
{


	var fname = "";
	var lname = "";
	var addr = "";
	var city = "";
	var state = "";
	var country = "";
	var zip = "";
	var phno = "";
	var email = "";
    var ctype = "";
	var cnumb = "";
	var cvv = "";

	document.getElementById("msg").style.color='red';



	// ------------------ Card Type ----------------->


	for (var i=0; i < document.confirmpayment.cardType.length; i++)
   {
   if (document.confirmpayment.cardType[i].checked == true)
      {
      ctype = ctype + document.confirmpayment.cardType[i].value;
      }
   }


	   if((ctype == ""))
		{
		document.getElementById("msg").innerHTML = "Please Select the Card Type";


		
		return;
		}



	// ------------------ Card Number ----------------->

	cnumb = document.confirmpayment.cdno.value;
		if (cnumb == "")
		{
		document.getElementById("msg").innerHTML = "Please fill your Card Number";


		
		document.confirmpayment.cdno.focus();
		return;
		}


		if (cnumb.length != 16)
		{
		document.getElementById("msg").innerHTML = "Card number is a 16 digit number";
		document.getElementById("msg").style.colour="red";

		
		document.confirmpayment.cdno.focus();
		return;
		}

		cnumb = cnumb *1;


		if(isNaN(cnumb))
		{

		document.getElementById("msg").innerHTML = "Card number should consist Numbers (0-9)";
		document.getElementById("msg").style.colour="red";

		
		document.confirmpayment.cdno.focus();
		return;

		}

	// ------------------ CVV Number ----------------->


	cvv = document.confirmpayment.cvv.value;

		if (cvv == "")
		{
		document.getElementById("msg").innerHTML = "Please fill your CVV Number";
		document.getElementById("msg").style.colour="red";

		
		document.confirmpayment.cvv.focus();
		return;
		}


		if ((cvv.length != 3)&&(cvv.length != 4))
		{
		document.getElementById("msg").innerHTML = "CVV should be 3 or 4 digit";
		document.getElementById("msg").style.colour="red";

		
		document.confirmpayment.cvv.focus();
		return;
		}

		cvv = cvv *1;


		if(isNaN(cvv))
		{

		document.getElementById("msg").innerHTML = "CVV number should consist Numbers (0-9)";
		document.getElementById("msg").style.colour="red";

		
		document.confirmpayment.cvv.focus();
		return;

		}


document.confirmpayment.submit();

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

<div class = "holder">
<table  width= "960" >
<TR>
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
<!-- Profile Links -->
		<TD width = "20%">
					
					<div style="position:absolute;top:1.5in;">
					<TABLE   width = "192" >
					<TR>
						<TD  STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:16px;text-align:left;background-color:#F4F3F3;padding:2mm 2mm 2mm 2mm" >Payment Information ></TD>
					</TR>
															
					</TABLE>
					</div>


			</TD>


<!-- Payment Info -->


			<TD style = "padding: 3mm 5mm 3mm 5mm "width = "60%">
			 <div>
			  <table   width = "60%" >

						  <TR>
			  <TD id = msg align = center> &nbsp;
			  </TD>
			  </TR>
			
			  
			  <TR>
				<TD>
			 

			   
	           <form name = "confirmpayment" method="POST" action="customerConfirmOrderProcess.jsp">
													                              <!-- Payment Info -->
										   <TABLE cellpadding = 5 width = 560 style="border:1px solid;">
										 
										   <TR>
											<TD align=left width ="25%" style="background-color:#5277AC;text-weight:bold;color:#fff;">Card Type <font color=red>*</font></TD>
											<TD><input type="radio" name="cardType" value="Visa"> Visa
					                                 <input type="radio" name="cardType" value="Mastercard"> Mastercard
					                                       <input type="radio" name="cardType" value="Discover"> Discover
					                                                      <input type="radio" name="cardType" value="AmericanExpress"> American Express</TD>
										   </TR>
										   <TR>
											<TD align=left  style="background-color:#5277AC;text-weight:bold;color:#fff;"> Card No <font color=red>*</font></TD>
											<TD><input type ="text" size = 30 name="cdno" value ="" /><code>16 digit number</code></TD>
										   </TR>
										   <TR>
											<TD  style="background-color:#5277AC;text-weight:bold;color:#fff;">CVV Code<font color=red>*</font> </TD>
											<TD><input type ="text" size = 10 name="cvv" value ="" /><code>3 or 4 digit number</code></TD>
										   </TR>

										
								
										   </TABLE>	

										   </TD>
										   </TR>

										    <TR>
										   <TD>&nbsp;
										   </TD>
										   </TR>

										    <!-- End Payment Info -->
					                        <TR>
											<TD colspan = 2 align = center><input type="button" value="Reset" onclick = "ResetAll()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Confrim Payment >" onclick = "validation()" /></TD>
											
										   </TR>
			
			
			<form>
			</table>			
			<br/><br/><br/><br/><br/><br/><br/><br/>	<br/><br/><br/><br/>	
			</div>
			
			</TD>

<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
<!-- Shopping Cart and Profile info-->
			<TD   width = "20%">

					<div style="position:absolute;top:1.5in;">
					<TABLE  cellpadding = 10 width = "192" >
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


</TR>


</table>

</div>


<!-- Footer-->

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
	
	    rs.close();
		rs4.close();
		//rs5.close();

 C.close();


			} catch (SQLException E) {
            out.println("SQLException: " + E.getMessage());
            out.println("SQLState:     " + E.getSQLState());
            out.println("VendorError:  " + E.getErrorCode());
        }

	} catch (Exception E) {

String fail ="http://cs-server.usc.edu:9007/mtpress/sessionLogin.jsp";
response.sendRedirect(fail);
	}

}

%>
