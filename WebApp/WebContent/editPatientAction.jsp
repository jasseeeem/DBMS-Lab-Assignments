<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String health = request.getParameter("health");
String id = request.getParameter("id");

try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update patients set health=? where id=?");
	ps.setString(1, health);
	ps.setString(2, id);
	ps.executeUpdate();
	response.sendRedirect("editPatient.jsp?id=" + id + "&msg=valid");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("editPatient.jsp?id=" + id + "&msg=invalid");
}
%>