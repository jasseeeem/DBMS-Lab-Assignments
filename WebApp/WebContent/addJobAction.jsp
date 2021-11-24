<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String role = request.getParameter("role");
String ctc = request.getParameter("ctc");
String recruiter = request.getParameter("recruiter");
String description = request.getParameter("description");
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into jobs (role, recruiter_id, ctc, description) values (?, ?, ?, ?)");
	ps.setString(1, role);
	ps.setString(2, recruiter);
	ps.setString(3, ctc);
	ps.setString(4, description);
	ps.executeUpdate();
	response.sendRedirect("addJob.jsp?msg=valid");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("addJob.jsp?msg=invalid");
}
%>