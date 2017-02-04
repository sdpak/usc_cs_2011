<%

			session.removeAttribute("empid");

			session.invalidate();

			String pass = "http://cs-server.usc.edu:9007/login.jsp";

			response.sendRedirect(pass);

			

%>