<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<h5 class="mt-3"><a href="http://localhost:8080/WebApp/home.jsp">Home</a> > <a href="http://localhost:8080/WebApp/recruiters.jsp">Recruiters</a> > Add Recruiter</h5>
	 <div class="form-center">
		<form action="addRecruiterAction.jsp" method="post" class="form-border">
			<h2 class="text-center ">Add Recruiter</h2>
	          <div class="form-group row mt-1">
	            <label class="col-form-label">Recruiter Name</label>
	            <div class="col">
	            	<input
		              	type="text"
		            	placeholder="Recruiter Name"
		              	name="recruitername"
		              	class="form-control"
	            	></input>
	            </div>
	          </div>
	          <div class="col text-center mt-4">
	            <button
	              type="submit"
	              class="btn btn-primary"
	              value="recruiter"
	            >
	              Add Recruiter
	             </button>
	          </div>
	          <% 
				String msg = request.getParameter("msg");
				if("valid".equals(msg)) {
			%>
			<h5 class="text-center text-success mt-2">Recruiter added successfully</h5>
			<% } %>
			<%
				if("invalid".equals(msg)) {
			%>
			<h5 class="text-center text-danger mt-3">Recruiter already exists</h5>
			<% } %>
			</form>
		</div>
	</div>
</body>
</html>
