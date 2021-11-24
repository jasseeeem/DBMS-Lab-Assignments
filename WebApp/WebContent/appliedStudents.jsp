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
		<h5 class="mt-3"><a href="http://localhost:8080/WebApp/home.jsp">Home</a> > <a href="http://localhost:8080/WebApp/jobs.jsp">Jobs</a> > Applied Students</h5>
		<hr>
		<%
		try {
			String job_id = request.getParameter("id");
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select student_id from applications where job_id = " + job_id);
		%>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Name</th>
		      <th scope="col">Reg. No.</th>
		      <th scope="col">Email ID</th>
		      <th scope="col">Phone</th>
		      <th scope="col">CGPA</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  while(rs.next()) {
			    Statement st2 = con.createStatement();
				ResultSet rs2 = st2.executeQuery("select * from students where id = " + rs.getString(1));
				while(rs2.next()) {
			%>
			  <tr>
			      <td><% out.print(rs2.getString(2)); %></td>
			      <td><% out.print(rs2.getString(3)); %></td>
			      <td><% out.print(rs2.getString(4)); %></td>
			      <td><% out.print(rs2.getString(5)); %></td>
			      <td><% out.print(rs2.getString(6)); %></td>
		    </tr>
	  <%
	  }
		  }
	  %>
	    
	   </tbody>
	</table>
	<%
	} catch (Exception e) {
			System.out.println(e);
	}
	%>
	</div>
</body>
</html>