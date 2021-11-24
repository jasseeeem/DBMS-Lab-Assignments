<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="styles.css">
	<title>TnP</title>
</head>
<body>
	<div class="container"> 
		<div class="d-flex w-100 justify-content-between mt-3">
			<h5><a href="http://localhost:8080/WebApp/home.jsp">Home</a> > Recruiters</h5>
			<a href="addRecruiter.jsp">Add Recruiter</a>
		</div>
		<hr>
		<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Name</th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
		<%
		
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from recruiters order by name");
			while(rs.next()) {
			%>
			
			  	<tr>
			      <td><% out.print(rs.getString(2)); %></td>
			      <td><div><a class="btn btn-primary" href="editRecruiter.jsp?id=<%=rs.getString(1)%>">Edit</a><a class="btn btn-danger ms-3" href="deleteRecruiterAction.jsp?id=<%=rs.getString(1)%>">Delete</a></div></td>
			    </tr>
			  <% } %>
		  <%
			} catch (Exception e) {
				System.out.println(e);
			}
	%>	
		 </tbody>
		 </table>
	</div>
</body>
</html>