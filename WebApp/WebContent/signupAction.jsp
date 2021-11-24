<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String regno = request.getParameter("regno");
String cgpa = request.getParameter("cgpa");
String password = request.getParameter("password");

try {
	if (phone.length() != 10 || regno.length() != 9) response.sendRedirect("signup.jsp?msg=invalid");
	else {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into students (name, email, phone, regno, cgpa, password) values (?, ?, ?, ?, ?, ?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, phone);
		ps.setString(4, regno);
		ps.setString(5, cgpa);
		ps.setString(6, password);
		ps.executeUpdate();
		
		response.sendRedirect("login.jsp");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
}
%>