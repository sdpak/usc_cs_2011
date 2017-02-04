<%
	session.removeAttribute("username");
	session.removeAttribute("password");
	session.removeAttribute("type");
	session.invalidate();
	String pass = "http://cs-server.usc.edu:9007/mtpress/main.jsp";
	response.sendRedirect(pass);
%>