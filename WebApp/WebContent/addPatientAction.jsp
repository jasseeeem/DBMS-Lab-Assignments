<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String name = request.getParameter("name");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String health = request.getParameter("health");
String temperature = request.getParameter("temperature");
String room = request.getParameter("room");

try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into patients (name, age, gender, address, health, temperature, room) values (?, ?, ?, ?, ?, ?, ?)");
	ps.setString(1, name);
	ps.setString(2, age);
	ps.setString(3, gender);
	ps.setString(4, address);
	ps.setString(5, health);
	ps.setString(6, temperature);
	ps.setString(7, room);
	ps.executeUpdate();
	
	response.sendRedirect("addPatient.jsp?msg=valid");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("addPatient.jsp?msg=invalid");
}
%>