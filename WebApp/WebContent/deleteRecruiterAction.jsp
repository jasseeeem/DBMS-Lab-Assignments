<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
	String recruiter_id = request.getParameter("id");
	
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("delete from recruiters where recruiter_id = ?");
		ps.setString(1, recruiter_id);
		ps.executeUpdate();
		response.sendRedirect("recruiters.jsp");
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("recruiters.jsp?msg=invalid");
	}
%>