<%@ page import="java.util.Random" %>
<%@ page import = "java.util.StringTokenizer"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.*" %>

<%
{
/*try {
			String user = session.getAttribute("username").toString(); */

	try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }

				//String admin = session.getAttribute("username").toString();
				String state1 =request.getParameter("country");
				String city1 =request.getParameter("state");
				String zip1 =request.getParameter("city");

				String username [];
				username = new String[100];	

				String city [];
				city = new String[100];

				String state [];
				state = new String[100];

				String zip [];
				zip = new String[100];

				String productCategory [];
				productCategory = new String[100];

				String productName [];
				productName = new String[100];

				String quantity [];
				quantity = new String[100];

				String totalPurchase [];
				totalPurchase = new String[100];

				String dateOfOrder [];
				dateOfOrder = new String[100];

				String sql= "";

				int i = 0;

				String grandTotal = "";
				int TotalCost = 0;





		try {
			

			Connection C =DriverManager.getConnection("jdbc:mysql://csci4xx.usc.edu:8511/hw2","root","deepak24");


			Statement s=C.createStatement();
			

			if ((!(state1.equals("1"))) && (city1.equals("1")) && (zip1.equals("1")))
			{
				//sql= "SELECT * FROM sale WHERE state = '"+state1+"'order by state";
				sql="select o.username,c.city,c.state,c.zip,p.productCategory,o.productname,sum(o.quantity) quantity,p.actualPrice,o.orderdate,sum(p.actualPrice*quantity) totalprice  from product p, orderdetail o ,customer c where p.productId = o.productid and o.username = c.username and c.state='"+state1+"' group by p.productCategory,o.productname,c.city,c.state,c.zip";

			}



			if ((!(state1.equals("1"))) && (!(city1.equals("1"))) && (zip1.equals("1")))
			{
				//sql= "SELECT * FROM sale WHERE state = '"+state1+"' AND city = '"+city1+"'order by state, city";
				sql="select o.username,c.city,c.state,c.zip,p.productCategory,o.productname,sum(o.quantity) quantity,p.actualPrice,o.orderdate,sum(p.actualPrice*quantity) totalprice  from product p, orderdetail o ,customer c where p.productId = o.productid and o.username = c.username and c.state='"+state1+"' and c.city = '"+city1+"' group by p.productCategory,o.productname,c.city,c.state,c.zip";

			}	
			

			if ((!(state1.equals("1"))) && (city1.equals("1")) && ((!zip1.equals("1"))))
			{
				//sql= "SELECT * FROM sale WHERE state = '"+state1+"' AND zip = '"+zip1+"'order by state, zip";
				sql="select o.username,c.city,c.state,c.zip,p.productCategory,o.productname,sum(o.quantity) quantity,p.actualPrice,o.orderdate,sum(p.actualPrice*quantity) totalprice  from product p, orderdetail o ,customer c where p.productId = o.productid and o.username = c.username and c.state='"+state1+"' and c.zip = '"+zip1+"' group by p.productCategory,o.productname,c.city,c.state,c.zip";

			}	
			

			if ((state1.equals("1")) && ((!city1.equals("1"))) && ((!zip1.equals("1"))))
			{
				//sql= "SELECT * FROM sale WHERE city = '"+city1+"' AND zip = '"+zip1+"'order by state, zip";
				sql="select o.username,c.city,c.state,c.zip,p.productCategory,o.productname,sum(o.quantity) quantity,p.actualPrice,o.orderdate,sum(p.actualPrice*quantity) totalprice  from product p, orderdetail o ,customer c where p.productId = o.productid and o.username = c.username and c.city='"+city1+"' and c.zip = '"+zip1+"' group by p.productCategory,o.productname,c.city,c.state,c.zip";

			}	
			

			if ((state1.equals("1")) && ((!city1.equals("1"))) && (zip1.equals("1")))
			{
				//sql= "SELECT * FROM sale WHERE city = '"+city1+"'order by city";
				sql="select o.username,c.city,c.state,c.zip,p.productCategory,o.productname,sum(o.quantity) quantity,p.actualPrice,o.orderdate,sum(p.actualPrice*quantity) totalprice  from product p, orderdetail o ,customer c where p.productId = o.productid and o.username = c.username and c.city = '"+city1+"' group by p.productCategory,o.productname,c.city,c.state,c.zip";

			}
			
			
			if ((state1.equals("1")) && (city1.equals("1")) && ((!zip1.equals("1"))))
			{
				//sql= "SELECT * FROM sale WHERE zip = '"+zip1+"'order by city";
				sql="select o.username,c.city,c.state,c.zip,p.productCategory,o.productname,sum(o.quantity) quantity,p.actualPrice,o.orderdate,sum(p.actualPrice*quantity) totalprice  from product p, orderdetail o ,customer c where p.productId = o.productid and o.username = c.username and c.zip='"+zip1+"' group by p.productCategory,o.productname,c.city,c.state,c.zip";

			}
			
			
			if ((!(state1.equals("1"))) && ((!city1.equals("1"))) && ((!zip1.equals("1"))))
			{
				//sql= "SELECT * FROM sale WHERE state = '"+state1+"' AND city = '"+city1+"' AND zip = '"+zip1+"' order by state, city, zip";
				sql="select o.username,c.city,c.state,c.zip,p.productCategory,o.productname,sum(o.quantity) quantity,p.actualPrice,o.orderdate,sum(p.actualPrice*quantity) totalprice  from product p, orderdetail o ,customer c where p.productId = o.productid and o.username = c.username and c.state='"+state1+"' and c.city = '"+city1+"'  and c.zip='"+zip1+"' group by p.productCategory,o.productname,c.city,c.state,c.zip";

			}

					


			s.execute(sql);
			ResultSet rs=s.getResultSet();




     // ------------- Get  Results ------------------------------------->

      while (rs.next()) {



			  username[i] = rs.getString("username");
			  city[i] = rs.getString("city");
			  state[i] = rs.getString("state");
			  zip[i] = rs.getString("zip");
			  productCategory[i] = rs.getString("productCategory");
			  productName[i] = rs.getString("productName");
			  quantity[i] = rs.getString("quantity");
			  totalPurchase[i] = rs.getString("totalprice");
			  dateOfOrder[i] = rs.getString("orderdate");


	  
					i++;

    }      


		
				/*for(int j = 0; j<i;j++)
				{
					TotalCost = TotalCost + Integer.parseInt(totalPurchase[j]);
				}

					grandTotal = new Integer(TotalCost).toString();	*/


	    rs.close();

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
  <TITLE>Welcome Manager - The MT Press</TITLE>
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
	color:#F7F5DE;
    font-size: 25;
	font-weight:bold;


}


	.footer{
		background-image: URL("footerline.jpg");
	}
	.profilelistholder
	{
		background-color:#F4F3F3;
		
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
<TR><TD>

Location Report


  
 </TD></TR>
</TABLE>

</div>
<div>

<table border="0" style="border-width: 1px; border-color:#000000;
	border-style: solid;" width = "960" class = "shoptable">

		<tr class = "shophead">
			<th>State</th>
			<th>City</th>
			<th>zip</th>
			<th>Product Category</th>
			<th>Product Name</th>
			<th>Quantity Sold</th>
			<th>Total Purchase</th>


		</tr>
			
		<form name ="preport" id = "preport" action="manager.jsp" method="post">

			
		<%
		int j;
		for (j=0; j<i; j++)
		{
		%>
		<tr>
					<td align="center"><b><%out.println(state[j]);%></b></td>
					<td align="center"><b><%out.println(city[j]);%></b></td>
					<td align="center"><b><%out.println(zip[j]);%></b></td>
					<td align="center"><b><%out.println(productCategory[j]);%></b></td>
					<td align="center"><b><%out.println(productName[j]);%></b></td>
					<td align="center"><b><%out.println(quantity[j]);%></b></td>
					<td align="center"><b><%out.println(totalPurchase[j]);%></b></td>



		</tr>
		<% } %>
					<tr>
					<td align="left" colspan = "6">.</td>

					</tr>

			
					<TR>
						<TD align =center  colspan = "6"><input type="submit" value= "DONE"> </TD>
					</TR>
			

			<!--<tr>
					<td align="center" colspan = "6"><input type="submit" value= "DONE"></td>
					<td align="center"><b>Total Sale <%out.println(grandTotal);%></b></td>


			</tr> -->
			</form>

</br>

		

	</table>
	
</div>

	





<!-- Footer-->

<div >
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
</div>




 
 </BODY>
</HTML>

<%



	} /*catch (Exception E) {

String fail = "http://csci4xx.usc.edu:9007/mtpress/sessionLogin.jsp";
response.sendRedirect(fail);


} */




%>