<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String username = request.getParameter("username");
String password = request.getParameter("password");
String role = request.getParameter("role");
try {
	Connection con = ConnectionProvider.getCon();
	if(role.equals("pa")) {
		PreparedStatement ps = con.prepareStatement("select * from students where regno = ? and password = ?");
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		boolean userExists = false;
		while(rs.next()) {
			userExists = true;
			session.setAttribute("username", username);
			session.setAttribute("role", "st");
			session.setAttribute("name", rs.getString(2));
			session.setAttribute("email", rs.getString(4));
			session.setAttribute("phone", rs.getString(5));
			session.setAttribute("cgpa", rs.getString(6));
			session.setAttribute("placementStatus", rs.getString(7));
			response.sendRedirect("home.jsp");
		}
		if(! userExists) response.sendRedirect("login.jsp?msg=invalid");
	} else if(role.equals("ad")) {
		PreparedStatement ps = con.prepareStatement("select * from admins where username = ? and password = ?");
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		boolean userExists = false;
		while(rs.next()) {
			userExists = true;
			session.setAttribute("username", username);
			session.setAttribute("role", "po");
			response.sendRedirect("home.jsp");
		}
		if(! userExists) response.sendRedirect("login.jsp?msg=invalid");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("login.jsp?msg=invalid");
}
%>