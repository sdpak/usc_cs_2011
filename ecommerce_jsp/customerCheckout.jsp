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
				Statement s4=C.createStatement();
					Statement s5=C.createStatement();
						Statement s6=C.createStatement();
	

            String sql="select FName, LName  from customer where username = '"+user+"'";
						String sql4 = "Select Count(*) from cart where username ='"+user+"'";
						String sql5 = "Select *,actualprice*quantity from cart where username ='"+user+"'";
						String sql6="select *, actualprice*quantity from cart where username='" + user + "' order by productname";
						String sql7="select sum(actualprice*quantity) from cart where username='" + user + "'";
						
			s.execute(sql);
			s3.execute(sql4);
			s4.execute(sql5);
			
			ResultSet rs6=s5.executeQuery(sql6);
			ResultSet rs=s.getResultSet();
			ResultSet rs4=s3.getResultSet();
			ResultSet rs5=s4.getResultSet();

			ResultSet rs7 = s6.executeQuery(sql7);

			if(rs7.next())
		{
				 total = rs7.getString(1);
		}
			


			
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

	

		while(rs5.next()){

			BookID[i] = rs5.getString("productid");
			BookName[i] = rs5.getString("productname");
			BookPrice[i] =rs5.getString("actualprice");
			BookQuantity[i] =rs5.getString("quantity");
			BookFinalPrice[i] = rs5.getString(7);
			i++;

		}





%> 

<!------------------------------------------------------------JSP-------------------------------------------------------------->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE>Welcome To MT Press!</TITLE>
<SCRIPT language="javascript">
		
		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if(null != chkbox && true == chkbox.checked) {
					if(rowCount <= 1) {
						alert("Cannot delete all the rows.");
						break;
					}
					table.deleteRow(i);
					rowCount--;
					i--;
				}

			}
			}catch(e) {
				alert(e);
			}
		}
		
		function deleteallRows(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=1; i<rowCount; i++) {
			
				if(true) {
					table.deleteRow(i);
					rowCount--;
					
					
					i--;
				}

			}
			}catch(e) {
				alert(e);
			}
		}
		
		
	
	</SCRIPT>

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
						<TD  STYLE="FONT-WEIGHT:BOLD;FONT-SIZE:16px;text-align:left;background-color:#F4F3F3;padding:2mm 2mm 2mm 2mm" >Checkout Cart ></TD>
					</TR>
															
					</TABLE>
					</div>


			</TD>


<!-- Cart Display --><!-- Cart Display --><!-- Cart Display --><!-- Cart Display --><!-- Cart Display --><!-- Cart Display --><!-- Cart Display --><!-- Cart Display --><!-- Cart Display --><!-- Cart Display -->

<!------------------------------------------------------------JSP-------------------------------------------------------------->
			<TD style = "padding: 3mm 5mm 3mm 5mm "width = "60%">
			
             <div>
			                 
                        
	          <table   width = "60%" ><TR><TD>
	
		             <form method="POST" action="customerPayment.jsp">
	<TABLE cellpadding = "2" width = "560" id="dataTable" >
		<TR>
		<!--<TH style="background-color:#C2D4D6;font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;">Select</TH>-->
		<TH style="background-color:#C2D4D6;font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;">Book ID</TH>
		<TH style="background-color:#C2D4D6;font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;">Book Name</TH>
		<TH style="background-color:#C2D4D6;font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;">Price</TH>
		<TH style="background-color:#C2D4D6;font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;">Quantity</TH>
		<TH style="background-color:#C2D4D6;font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;">Total Price</TH>
		
		</TR>
	
		<%
		while(rs6.next()){
		%>
		<tr>
		<!--<TD style="font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;" width = 50><INPUT  type="checkbox" name="chk"/></TD>-->
		<td style ="font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;"><%out.println(rs6.getString("productid"));%>	<INPUT size=8 type="hidden" name="bookid"	readonly value="<%=rs6.getString("productid")%>"/></td>
		<td style ="font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;"><%out.println(rs6.getString("productname"));%>	<INPUT  size= 20 type="hidden" name="bookname"	readonly value="<%=rs6.getString("productname")%>"/></td>
		<td style ="font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;"><%out.println(rs6.getString("actualprice"));%>	<INPUT size = 5  type="hidden" name="bookprice"	readonly value="<%=rs6.getString("actualprice")%>"/></td>
		<td style ="font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;"><%out.println(rs6.getString("quantity"));%></td>
		<td style ="font-size:13px;padding:2mm 2mm 2mm 2mm;border:1px solid;"><%out.println(rs6.getString(7));%></td>
		
		</tr>
	
	<%
	}
	%>
	</TABLE>
	<BR/>&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
		<span style= "font-weight:bold;color:#330DB9" >Total Price : </Span><span style= "font-weight:bold;font-style:italic;color:#8D4C0C"><%out.println(total);%></Span><BR/><INPUT  size= 20 type="hidden" name="totalprice"	readonly value="<%=total%>"/>

		<BR/>
		
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; <a href="http://csci4xx.usc.edu:9007/mtpress/customerCart.jsp" style="text-decoration:none"> <INPUT type="button" value="< Edit Cart" /> </a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; 
	<INPUT type="Submit" value="Proceed to Payment >" /><BR/><BR/><SPAN style="font-size: 14px;FONT-WEIGHT:BOLD;color:366696;"><BR/><BR/>

</form>



	</TD>
	</TR>
	
	</table>
			<br/><br/><br/><br/><br/><br/><br/><br/>
		
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
		rs5.close();

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
