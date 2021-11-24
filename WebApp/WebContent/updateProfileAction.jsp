<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String regno = request.getParameter("regno");
String cgpa = request.getParameter("cgpa");
String id = session.getAttribute("id").toString();

try {
	if (phone.length() != 10 || regno.length() != 9) response.sendRedirect("profile.jsp?msg=invalid");
	else {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("update students set name=?, email=?, phone=?, regno=?, cgpa=? where id=?");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, phone);
		ps.setString(4, regno);
		ps.setString(5, cgpa);
		ps.setString(6, id);
		ps.executeUpdate();
		session.setAttribute("regno", regno);
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		session.setAttribute("phone", phone);
		session.setAttribute("cgpa", cgpa);
		response.sendRedirect("profile.jsp?msg=valid");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("profile.jsp?msg=invalid");
}
%>