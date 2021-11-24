<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
try {
	session.setAttribute("id", "");
	session.setAttribute("regno", "");
	session.setAttribute("role", "");
	session.setAttribute("name", "");
	session.setAttribute("email", "");
	session.setAttribute("phone", "");
	session.setAttribute("cgpa", "");
	session.setAttribute("placementStatus", "");
	response.sendRedirect("login.jsp");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("login.jsp");
}
%>