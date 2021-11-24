<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String name = request.getParameter("name");

try {
	response.sendRedirect("home.jsp?patient_name=" + name);
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("home");
}
%>