<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
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
		<% 
			String role = session.getAttribute("role").toString(); 
			if(role.equals("st")) {
		}
		else if(role.equals("po")) {
		%>
			<div class="d-flex w-100 justify-content-between mt-3">
				<h5>Home</h5>
				<div>
					<a class="ms-4" href="http://localhost:8080/WebApp/addPatient.jsp">Add Patient</a>
					<a class="ms-4" href="http://localhost:8080/WebApp/logout.jsp">Logout</a>
				</div>
			</div>
			<hr>
			<form action="searchPatientAction.jsp" method="post" class="form-border">
				<label class="col-form-label">Enter patient name</label>
	            <div class="col">
	            	<input
		              type="text"
		              placeholder="Patient Name"
		              name="name"
		              class="form-control"
		              required
	            	></input>
	            	</div><div class="col text-center mt-4">
	            <button
	              type="submit"
	              class="btn btn-primary"
	              value="submit"
	            >
	              Search patient
	             </button>
	          </div>
	           
			</form>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">Patient Name</th>
			      <th scope="col">Health Condition</th>
			      <th scope="col"></th>
			    </tr>
			  </thead>
			  <tbody>
		
			<%
			try {
				String patient_name = request.getParameter("patient_name");
				if(patient_name == null) {
					patient_name = "";
				}
				Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from patients where name like '%" + patient_name + "%'");
	while(rs.next()) {
		%>
		
		  	<tr>
		      <td><% out.print(rs.getString(2)); %></td>
		      <td><% out.print(rs.getString(6)); %></td>
		      <td><a class="btn btn-primary" href="editPatient.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
		      
		    </tr>
		  <% }
			} catch (Exception e) {
			System.out.println(e);
		}
	}
	%></tbody>
		 </table>
	</div>
	            </div>
</body>
</html>