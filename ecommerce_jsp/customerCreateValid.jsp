<%@ page import="java.sql.*" %>
<%
  try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }

   	String UN [];
		UN = new String[1];
    String PWD[];
		PWD = new String[1];
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;

		int i = 0;

String Uname=request.getParameter("username");
String Pword=request.getParameter("password1");
String fail = "http://cs-server.usc.edu:9007/mtpress/customerRegister2.jsp";
String pass = "http://cs-server.usc.edu:9007/mtpress/login.jsp";

 try {
Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");
 Statement s=C.createStatement();
            String sql="select * from user where empid = '"+Uname+"'";
 s.execute(sql);
  ResultSet rs=s.getResultSet();
  
	  if (rs.next()) {
	  response.sendRedirect(fail);
    }   
	 	else
	 {
		stmt = C.prepareStatement("INSERT INTO user(empid,pwd,role) VALUES (?, ?, ?)");
		stmt2 = C.prepareStatement("INSERT INTO customer VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        stmt.setString(1, Uname);
        stmt.setString(2, Pword);
		stmt.setString(3, "Customer");
		stmt2.setString(1, Uname);
		stmt2.setString(2, Pword);
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
       
	 }
 rs.close();
     C.close();
 } catch (SQLException E) {
                out.println("SQLException: " + E.getMessage());
                out.println("SQLState:     " + E.getSQLState());
               out.println("VendorError:  " + E.getErrorCode());
        }






%>

