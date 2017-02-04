<%@page import="java.sql.*"%>
<%
try {
	String user = session.getAttribute("username").toString();
	 
	  
			 String orderid  = new String();
			 String orderprice  = new String();
			 String cardtype  = new String();
			 String cardno  = new String();
			 String cardcvv  = new String();

              cardtype = request.getParameter("cardType");
			  cardno = request.getParameter("cdno");
			  cardcvv = request.getParameter("cvv");

			 PreparedStatement stmt = null;

			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection Con=DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
			 Statement s1=Con.createStatement(); 
			  Statement s2=Con.createStatement(); 
			   Statement s3=Con.createStatement(); 
			      Statement s4=Con.createStatement(); 
					
			//Create unique order id

			String sql1="Insert Into ordergen (username) values('"+user+"')";
			s1.execute(sql1);

			//Fetch the latest orderid

		   String sql2 = "Select max(orderid) from ordergen where username = '"+user+"'";
			
			//Get order total from the cart

		   String sql3 = "select sum(actualprice*quantity) from cart where username = '"+user+"'";
		
		 ResultSet rs2=s2.executeQuery(sql2);
	   	 ResultSet rs3=s3.executeQuery(sql3);

		 while(rs2.next())
	{
			orderid = rs2.getString(1);

	}
	
		  		 while(rs3.next())
	{
			orderprice = rs3.getString(1);

	}
	   //Insert in the order detail table

		    String sql4="insert into orderdetail(username,productid,productname,quantity,actualprice,orderid,orderprice,orderdate) select username,productid,productname,quantity,actualprice,"+orderid+","+orderprice+",sysdate() from cart where username ='" + user + "'";
		    s3.execute(sql4);
           
		   // Update Credit Card info

		   stmt = Con.prepareStatement("Insert into orderpay Values (?,?,?,?)");
		   stmt.setString(1, orderid);
		   stmt.setString(2, cardno);
		   stmt.setString(3, cardtype);
		    stmt.setString(4, cardcvv);
			stmt.executeUpdate();

		   	//tuncate cart

			String sql5 = "Delete from cart where username = '"+user+"'";
            s4.execute(sql5);


        out.println("successful");

        stmt.close();
		rs2.close();		
		rs3.close();		

         Con.close();
		 		response.sendRedirect("http://csci4xx.usc.edu:9007/mtpress/customerOrderDisplay.jsp");
} catch (Exception error) {

out.print( error);
}
%>	
	