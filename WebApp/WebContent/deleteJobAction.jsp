<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
	String job_id = request.getParameter("id");
	
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("delete from jobs where id = ?");
		ps.setString(1, job_id);
		ps.executeUpdate();
		response.sendRedirect("jobs.jsp");
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("jobs.jsp?msg=invalid");
	}
%>