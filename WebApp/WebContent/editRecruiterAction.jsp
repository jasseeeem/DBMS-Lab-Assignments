<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<% 
String name = request.getParameter("recruitername");
String id = request.getParameter("id");
System.out.print(name);
try {
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update recruiters set name=? where recruiter_id=?");
	ps.setString(1, name);
	ps.setString(2, id);
	ps.executeUpdate();
	response.sendRedirect("recruiters.jsp");
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("editRecruiter.jsp?msg=invalid");
}
%>