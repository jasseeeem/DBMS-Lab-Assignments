<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String recruitername = request.getParameter("recruitername");
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into recruiters (name) values (?)");
	ps.setString(1, recruitername);
	ps.executeUpdate();
	response.sendRedirect("addRecruiter.jsp?msg=valid");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("addRecruiter.jsp?msg=invalid");
}
%>