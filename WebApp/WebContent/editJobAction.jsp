<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String role = request.getParameter("role");
String id = request.getParameter("id");
String description = request.getParameter("description");
String ctc = request.getParameter("ctc");
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update jobs set role=?, description=?, ctc=? where id=?");
	ps.setString(1, role);
	ps.setString(2, description);
	ps.setString(3, ctc);
	ps.setString(4, id);
	ps.executeUpdate();
	response.sendRedirect("jobs.jsp");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("editJob.jsp?msg=invalid");
}
%>