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
			<h5><a href="http://localhost:8080/WebApp/home.jsp">Home</a> > Jobs</h5>
			<a href="addJob.jsp">Add Job</a>
		</div>
		<hr>
		<%
		
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from jobs join recruiters on jobs.recruiter_id=recruiters.recruiter_id order by jobs.time_created desc");
			while(rs.next()) {
			%>
			
			  	<div class="list-group mb-1">
			    <div class="d-flex w-100 justify-content-between">
			      <h5 class="mb-1"><a href="appliedStudents.jsp?id=<%=rs.getString(1)%>"><% out.print(rs.getString(2) +", " + rs.getString(8)); %></a></h5>
			      <small><%
			     	Date time_created = rs.getDate(5);
			      	int days = (int) (((System.currentTimeMillis() - time_created.getTime()) / (1000*60*60*24)) % 7);
			      	if(days == 0) out.print("Today");
			      	else if(days == 1) out.print("Yesterday");
			      	else out.print(days + " days ago");
			      %></small>
			    </div>
			    <h6><% out.print(rs.getString(3)); %> LPA</h6>
			    <div class="d-flex w-100 justify-content-between">
			      <p class="mb-1"><%=rs.getString(6)%></p>
					<div>	
						<a href="editJob.jsp?id=<%=rs.getString(1)%>" class="ms-3 btn btn-primary">Edit</a>
			    	</div>
					<div>
						<a href="deleteJobAction.jsp?id=<%=rs.getString(1)%>" class="ms-3 btn btn-danger">Delete</a>
					</div>
			    </div>
				<hr>
			</div>
			  <% }
			} catch (Exception e) {
				System.out.println(e);
			}
	%>	
	</div>
</body>
</html>