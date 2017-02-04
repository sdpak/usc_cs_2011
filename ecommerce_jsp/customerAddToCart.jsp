<%@ page import="java.sql.*" %>
<%

	try {
			   String user = session.getAttribute("username").toString();
            
       	// fetching product information from product table
		
		        String ProductId =request.getParameter("bookid");
		
		         String ProductName =request.getParameter("bookname"); ;
		
		         String ProductPrice =request.getParameter("bookprice");
		
		      String ProductAvailability=request.getParameter("availability");
			  String t = "0";
			  String quantity = "1";
			  String notyet = "Not Yet Defined";
		 
			   

// Cart info

		         String ProductFinalPrice =request.getParameter("bookprice") ;


			 

// To get data of Check box Selections
   
	PreparedStatement stmt2 = null;
	

	try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }

try{
		     
			 
			   String pass = "http://csci4xx.usc.edu:9007/mtpress/customerCategoryBookDisplay.jsp";
		
			   String errorcart = "http://csci4xx.usc.edu:9007/mtpress/customerInvalidCartOperation.jsp";


		
	         Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");

			Statement s=C.createStatement();
			String sql = "Select productid from cart where productid = '"+ProductId+"'";
           	s.execute(sql);
		    ResultSet rs =s.getResultSet();

		  if(rs.next()){
       
           response.sendRedirect(errorcart);
			

		  }

 else{
		  		stmt2 = C.prepareStatement("Insert into cart(username,productid,productname,quantity,actualprice,finalprice) Values (?, ?, ?, ?, ?, ?)");
		               
				 stmt2.setString(1,user );
				 stmt2.setString(2,ProductId );
				 stmt2.setString(3,ProductName);
				 stmt2.setString(4,quantity );
				 stmt2.setString(5,ProductPrice);
				 stmt2.setString(6,ProductFinalPrice);
				
				 stmt2.execute();
                 rs.close();
				 stmt2.close();
				
              response.sendRedirect(pass);		
			  
			  C.close();}


			} catch (SQLException E) {
            out.println("SQLException: " + E.getMessage());
            out.println("SQLState:     " + E.getSQLState());
            out.println("VendorError:  " + E.getErrorCode());
        }


			} catch (Exception E) {

String fail ="http://cs-server.usc.edu:9007/mtpress/sessionLogin.jsp";
response.sendRedirect(fail);

}





%> 