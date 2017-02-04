<%@page import="java.sql.*"%>
<%
try {
	String user = session.getAttribute("username").toString();
	 


			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection Con=DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
			String sql="delete from cart where username='" + user + "'";
			PreparedStatement stmt=Con.prepareStatement("INSERT INTO cart VALUES (?,?,?,?,?,?)");
			
			Statement s=Con.createStatement();
			int rs=s.executeUpdate( sql );
			
			String [] bookid = request.getParameterValues("bookid");
			String [] bookname = request.getParameterValues("bookname");
			String [] bookprice = request.getParameterValues("bookprice");
			String [] bookquantity= request.getParameterValues("bookquantity");
			String [] bookusername = request.getParameterValues("bookuser");
			
			
			for(int i=0; bookid != null && i < bookid.length; i++) {
				stmt.setString(1,bookusername[i]);
				stmt.setString(2,bookid[i] );
				stmt.setString(3,bookname[i]);
				stmt.setString(4,bookquantity[i]);
				stmt.setString(5,bookprice[i] );
				stmt.setString(6,bookprice[i] );
				stmt.execute();
			}
	
			out.print( "User Information inserted successfully");
			response.sendRedirect("http://csci4xx.usc.edu:9007/mtpress/customerCart.jsp");
		
Con.close();
} catch (Exception error) {

out.print( error);
}
%>	
	