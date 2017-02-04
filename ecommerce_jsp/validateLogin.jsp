<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.lang.*" %>
<%
 try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception E) {
            out.println("Unable to load driver.");
            E.printStackTrace();
        }

   // ------------- Initializing variables ------------------------------------->

String UN = new String();	
String PWD = new String();	
String type = new String();	
	

			int i = 0;

	String Uname=request.getParameter("username");
    String Pword=request.getParameter("password");

   // ------------- Connection String ------------------------------------->
 try {

Connection C =DriverManager.getConnection("jdbc:mysql://cs-server.usc.edu:8511/hw2","root","deepak24");

 Statement s=C.createStatement();

            String sql="select * from user where empid ='"+Uname+"'";
		
 s.execute(sql);
  ResultSet rs=s.getResultSet();

   // ------------- Get  Results ------------------------------------->
      while(rs.next()) {
      UN=  rs.getString("empid");
      PWD= rs.getString("pwd");
	  type = rs.getString("role");
	
    }      
	
		String fail = "http://csci4xx.usc.edu:9007/mtpress/failedLogin.jsp";
		
		String admin = "http://csci4xx.usc.edu:9007/admin.jsp";

		String manager = "http://csci4xx.usc.edu:9007/mtpress/manager.jsp";

		String employee = "http://csci4xx.usc.edu:9007/employee.jsp";

		String customer = "http://csci4xx.usc.edu:9007/mtpress/customerMainPage.jsp";

   // ------------- Get  Check if User name exists ------------------------------------->
       

		if((Uname .equals(UN))&&(Pword.equals(PWD)))
			{
			if (type.equals("Admin")){
			
		 	session.setAttribute("loginid",UN);
			session.setAttribute("loginpwd",PWD);
			session.setAttribute("loginrole",type);
			session.setMaxInactiveInterval(600);

			response.sendRedirect(admin);

			} 	
			else if (type.equals("Manager")){
			
		 
		 	session.setAttribute("username",UN);
			session.setAttribute("password",PWD);
			session.setAttribute("role",type);
			session.setMaxInactiveInterval(600);

			response.sendRedirect(manager);

			} 
			else if (type.equals("Employee")){
				
		 
		 	session.setAttribute("loginid",UN);
			session.setAttribute("loginpwd",PWD);
			session.setAttribute("loginrole",type);
			session.setMaxInactiveInterval(600);

			response.sendRedirect(employee);

			} 	

			else if (type.equals("Customer")){
			
		   session = request.getSession(true);
		 	
			session.setAttribute("username",UN);
			session.setAttribute("password",PWD);
			session.setAttribute("role",type);
			session.setMaxInactiveInterval(600);

			response.sendRedirect(customer);

			} 
		}
		

		else {


			response.sendRedirect(fail);

		}

    rs.close();
	C.close();

  
     
 } catch (SQLException E) {
                out.println("SQLException: " + E.getMessage());
                out.println("SQLState:     " + E.getSQLState());
               out.println("VendorError:  " + E.getErrorCode());
        }
%>

