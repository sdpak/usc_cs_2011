<%@ page import="java.sql.*" %>
<%
  	try {
			String UserName = session.getAttribute("username").toString();

                
				  String BookID = request.getParameter("bookid");
  
  try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }


	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;

	String sno = new String();


String pass = "http://cs-server.usc.edu:9007/mtpress/customerCart.jsp";

 try {
Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
  	 
	    Statement s=C.createStatement();

		String sql = "Select * FROM cart c WHERE  c.productid = "+BookID+" and c.username ='"+UserName+"'";

		s.execute(sql);
		ResultSet rs=s.getResultSet();

		if(rs.next())
	 {
			sno = rs.getString(1);
			Statement s1=C.createStatement();

			String sql2 = "Delete FROM cart WHERE  sno = '"+sno+"'";
			s.execute(sql);
			
				}

				Con.close();

       
	

     
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

