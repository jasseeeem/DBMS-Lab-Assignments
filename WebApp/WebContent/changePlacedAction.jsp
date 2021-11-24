<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
	String user_id = request.getParameter("id");
	
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("update students set placementStatus = not placementStatus where id = ?");
		ps.setString(1, user_id);
		PreparedStatement ps1 = con.prepareStatement("delete from applications where student_id = ?");
		ps1.setString(1, user_id);
		ps.executeUpdate();
		ps1.executeUpdate();
		response.sendRedirect("home.jsp");
	} catch (Exception e) {
		System.out.println(e);
	}
%>