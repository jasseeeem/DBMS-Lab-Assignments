<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
	String user_id = session.getAttribute("id").toString();
	String product_id = request.getParameter("id");
	
	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into applications (student_id, job_id) values (?, ?)");
		ps.setString(1, user_id);
		ps.setString(2, product_id);
		ps.executeUpdate();
		response.sendRedirect("home.jsp");
	} catch (Exception e) {
		System.out.println(e);
	}
%>