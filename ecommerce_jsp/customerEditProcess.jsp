<%@ page import="java.sql.*" %>
<%
  	try {
			String UserName = session.getAttribute("username").toString();

                
				   String Password = new String();
  
  try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }


	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;

		int i = 0;


String pass = "http://cs-server.usc.edu:9007/mtpress/customerProfileDisplayData.jsp";

 try {
Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
 Statement s=C.createStatement();
            String sql="select * from user where empid = '"+UserName+"'";
 s.execute(sql);
  ResultSet rs=s.getResultSet();
  
	  if (rs.next()) {
	 	     			Password = rs.getString("pwd");
    }   
	 
	 
		stmt = C.prepareStatement("DELETE FROM customer WHERE username =  ? ");
		stmt2 = C.prepareStatement("INSERT INTO customer VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        stmt.setString(1, UserName);
		stmt2.setString(1, UserName);
		stmt2.setString(2, Password);
		stmt2.setString(3,request.getParameter("Fname") );
		stmt2.setString(4,request.getParameter("Lname"));
		stmt2.setString(5,request.getParameter("Address"));
		stmt2.setString(6,request.getParameter("state"));
		stmt2.setString(7, request.getParameter("country"));
		stmt2.setString(8, "USA");
		stmt2.setString(9, request.getParameter("city"));
		stmt2.setString(10, request.getParameter("phno"));
		stmt2.setString(11,request.getParameter("email"));
		stmt.executeUpdate();
		stmt2.executeUpdate();
        stmt.close(); 
		stmt2.close();
		 response.sendRedirect(pass);
       
	
 rs.close();
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
  
  






%>

