<%@ page import="java.sql.*" %>
<%
{
	try {
			String user = session.getAttribute("username").toString();
  
				

				String FirstName = new String();
				String LastName = new String();
				String CartItemCount = new String();
				String orderid = request.getParameter("orderid");
				String orderprice = new String();
				
				
				String count = "0";
int x=0;
		
		

        String bookid [];
		bookid = new String[100];
		        String bookname [];
		bookname = new String[100];
		        String bookquantity [];
		bookquantity = new String[100];
		        String bookprice [];
		bookprice = new String[100];
		       String orderdate [];
		orderdate = new String[100];
	

				

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
			Statement s5=C.createStatement();
			Statement s6=C.createStatement();
			Statement s7=C.createStatement();

            String sql="select FName, LName  from customer where username = '"+user+"'";
			String sql4 = "Select Count(*) from cart where username ='"+user+"'";
			//String sql5 = "Select max(orderid) from ordergen where username ='"+user+"'";
			
			
			
			s.execute(sql);
			s3.execute(sql4);
    		


			ResultSet rs=s.getResultSet();
			ResultSet rs4=s3.getResultSet();
		
		

        
		String sql6 = "Select * from orderdetail where orderid = '"+orderid+"'";
		String sql7 = "Select orderprice from orderdetail where orderid = '"+orderid+"'";
		
		s6.execute(sql6);
		ResultSet rs6=s6.getResultSet();

		s7.execute(sql7);
		ResultSet rs8=s7.getResultSet();

			if(rs8.next())
		{
            orderprice =  rs8.getString(1);
		}

		while(rs6.next())
		{
           bookid[x] = rs6.getString("productid");
			   bookname[x] = rs6.getString("productname");
			   bookprice[x] = rs6.getString("actualprice");
			   bookquantity[x] = rs6.getString("quantity");
			   orderdate[x] = rs6.getString("orderdate");
		   
			x++;
		}

		

     // ------------- Get  Results ------------------------------------->
      if (rs.next()) {
			FirstName = rs.getString("FName");
			LastName = rs.getString("LName");

    }      	
/*	  if(rs4.next())
		{
	            CartItemCount = rs4.getString(1);
				if(CartItemCount.equals(count))
			{      
					String  emptycart = "http://csci4xx.usc.edu:9007/mtpress/customerCartEmpty.jsp";
					response.sendRedirect(emptycart);
			}
		} */




%> 

<!------------------------------------------------------------JSP-------------------------------------------------------------->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Welcome To MT Press!</TITLE>

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
					<!-- Title decor -->
					<!-- PRofile lister -->
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


<!-- PRofile Display -->
<!-- PRofile Display -->
<!-- PRofile Display -->
<!-- PRofile Display -->
<!-- PRofile Display -->
<!-- PRofile Display -->
<!------------------------------------------------------------JSP-------------------------------------------------------------->
			<TD style = "padding: 3mm 10mm "width = "60%">
			<TABLE>
			<TR>
				<TD width = "30%"STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:14px;text-align:left;background-color:#E7EEF9;padding:1mm 1mm 1mm 1mm">
						Order ID :<%out.println(orderid);%></TD>
				<TD width = "30%" STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:14px;text-align:left;background-color:#E7EEF9;padding:1mm 1mm 1mm 1mm">
						Order Price :<%out.println(orderprice);%></TD>
				<TD width = "30%" STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:14px;text-align:left;background-color:#E7EEF9;padding:1mm 1mm 1mm 1mm">
						Order Date :<%out.println(orderdate[0]);%></TD>
			</TR>
			</TABLE>
					 
				
		                  <Table width = "550" >
			  <% 
						int y =0;
						for(y =0; y<x; y++)	{  %>
                     						
						<TR>
							<TD width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Book ID:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"> <%out.println(bookid[y]);%> </SPAN>
                       </TD>
						
						</TR>
						<TR>
							<TD  width = "70%"  style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Name:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"> <%out.println(bookname[y]);%> </SPAN>
							</TD>
						
						</TR>
						<TR>
							<TD  width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Quantity:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;"> <%out.println(bookquantity[y]);%> </SPAN>
							</TD>
						</TR>
						<TR>
							<TD  width = "70%" style= "padding:1mm 3mm 1mm 3mm;">
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;">Price:</span>
							<SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:4DAA27;"> $<%out.println(bookprice[y]);%> </SPAN>
							<br/>
							<HR/>
							</TD>
							
						</TR>
							
						
						
                        
                         <%
						}						
						%>

						</Table>

						  <Table width = "550" >
						  <Tr><TD><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <a href="http://csci4xx.usc.edu:9007/mtpress/customerOrderHistory.jsp" style="text-decoration:none;font-size:13;"> <INPUT type="button" value="Done >" style="font-size:13;"/> </a></TD></TR>
						  </Table>


             
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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
						<TD CLASS = "profilelistholder"> <SPAN style="font-size: 14px;font-weight:bold;color:26869E;">0 item's in your Cart
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
	<TD>

	<TD WIDTH = "250">
	</TD>
	<TD><SPAN style="font-size: 13px;FONT-WEIGHT:BOLD;"><a href="http://cs-server.usc.edu:9007/mtpress/termsOfUse.jsp" STYLE = "text-decoration:none;">TERMS OF USE</a>
              </SPAN>&nbsp; | &nbsp;</TD>
	<TD>

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
