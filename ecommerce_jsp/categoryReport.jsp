<%@ page import="java.sql.*" %>
<%

	try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }
				String productCat = request.getParameter("category");

				String productCategory [];
				productCategory = new String[100];	
				
				String productId [];
				productId = new String[100];	

				String productName [];
				productName = new String[100];

				String actualPrice [];
				actualPrice = new String[100];

				String currentAvilability [];
				currentAvilability = new String[100];

				int i = 0;

try {
			
			Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
			Statement s=C.createStatement();
            String sql="select * from product where productCategory ='"+productCat+"'";
			s.execute(sql);
			ResultSet rs=s.getResultSet();


     // ------------- Get  Results ------------------------------------->
      while (rs.next()) {
			  productId[i] = rs.getString("productId");
			  productName[i] = rs.getString("productName");
			  actualPrice[i] = rs.getString("actualPrice");
			  currentAvilability[i] = rs.getString("currentAvilability");
  
					i++;

    }      	

	    rs.close();

		} catch (SQLException E) {
            out.println("SQLException: " + E.getMessage());
            out.println("SQLState:     " + E.getSQLState());
            out.println("VendorError:  " + E.getErrorCode());
        }

%> 

<html>
<head>
<title>Category Report</title>

</head>

<body>
<table>
	<table width = "963" >

		</table>
		
		<table border="0" style="border-width: 1px; border-color:#000000;
	border-style: solid;" width = "963" class = "shoptable">

		<tr class = "shophead">
			
			<th>Product Id</th>
			<th>Product Name</th>
			<th>Actual Price</th>
			<th>Current Avilability</th>			
		</tr>
					
		<%
		int j;
		for (j=0; j<i; j++)
		{
		%>
		<tr>
					<td align="center"><b><%out.println(productId[j]);%></b></td>
					<td align="center"><b><%out.println(productName[j]);%></b></td>
					<td align="center"><b><%out.println(actualPrice[j]);%></b></td>
					<td align="center"><b><%out.println(currentAvilability[j]);%></b></td>

		</tr>

		<% } %>

</br>

		<tr>
			
		    <td align = "right" colspan = "4">
			<form name ="home" id = "home" action="manager.jsp" method="post">
			<input class  = "submit1" type = "submit"  border="0" value = "DONE">
			</form>
			</td>		

		</tr>
</table>
	</table>
</body>
</html>
