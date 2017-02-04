<%@ page import="java.sql.*" %>
<%
  	try {
			String UserName = session.getAttribute("username").toString();

                  
		     	   String currentPassword = request.getParameter("currentpassword");
				    String newPassword = request.getParameter("password1");
					 
  
  try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }


	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;



String pass = "http://cs-server.usc.edu:9007/mtpress/customerChangePasswordSucessful.jsp";
String fail = "http://cs-server.usc.edu:9007/mtpress/customerChangePasswordFailed.jsp";

 try {
Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
 Statement s=C.createStatement();
     String sql="select * from user where empid = '"+UserName+"' and pwd ='"+currentPassword+"'";
 s.execute(sql);
  ResultSet rs=s.getResultSet();
  
	  if (rs.next()) {
	    
		// Update the User Table
		stmt = C.prepareStatement("Update user SET pwd = ? WHERE empid =  ? ");
		stmt.setString(1, newPassword);
		stmt.setString(2, UserName);
			

		//Update Customer Table

		stmt2 = C.prepareStatement("Update customer SET password = ? WHERE username =  ? ");
		stmt2.setString(1, newPassword);
		stmt2.setString(2, UserName);
		stmt2.executeUpdate();
		stmt.executeUpdate();
		stmt.close();
		stmt2.close();
		rs.close();
        session.removeAttribute("username");
	session.removeAttribute("password");
	session.removeAttribute("type");
	session.invalidate();
		response.sendRedirect(pass);


	  }
	  else{
	 response.sendRedirect(fail);
	  }
       
	
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

