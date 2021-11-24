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
	<h5 class="mt-3"><a href="http://localhost:8080/WebApp/home.jsp">Home</a> > <a href="http://localhost:8080/WebApp/jobs.jsp">Jobs</a> > Add Job</h5>
	 <div class="form-center">
		<form action="addJobAction.jsp" method="post" class="form-border">
			<h2 class="text-center ">Add Job</h2>
	          <div class="form-group row mt-1">
	            <label class="col-form-label">Role</label>
	            <div class="col">
	            	<input
		              	type="text"
		            	placeholder="Role"
		              	name="role"
		              	class="form-control"
		              	required
	            	></input>
	            </div>
	          </div>
	           <div class="form-group row mt-1">
	           		<label class="col-form-label">Recruiter</label>
	           		<div class="col">
	           			<select class="form-select" name="recruiter" aria-label="Default select example">
						  <% 
						  Connection con = ConnectionProvider.getCon();
						  Statement st = con.createStatement();
						  ResultSet rs = st.executeQuery("select * from recruiters order by name");
						  while(rs.next()) {
						  %><option value=<%=rs.getString(1)%> selected><%=rs.getString(2)%></option>
						  <% } %>
						</select>
					</div>
	           </div>
	           <div class="form-group row mt-1">
	            <label class="col-form-label">Job Description</label>
	            <div class="col">
	            	<textarea
		              	type="text"
		            	placeholder="Job Description"
		              	name="description"
		              	class="form-control"
		              	rows="3"
		              	required
	            	></textarea>
	            </div>
	          <div class="form-group row mt-1">
	            <label class="col-form-label">CTC</label>
	            <div class="col input-group">
	            	<input
		              type="number"
		              step="0.1"
		              placeholder="CTC"
		              name="ctc"
		              class="form-control"
		              required
	            	></input>
	            	<div class="input-group-append">
					    <span class="input-group-text" id="basic-addon2">LPA</span>
				  </div>
	            </div>
	           </div>
	          <div class="col text-center mt-4">
	            <button
	              type="submit"
	              class="btn btn-primary"
	              value="addjob"
	            >
	              Add Job
	             </button>
	          </div>
	          <% 
				String msg = request.getParameter("msg");
				if("valid".equals(msg)) {
			%>
			<h5 class="text-center text-success mt-2">Job added successfully</h5>
			<% } %>
			<%
				if("invalid".equals(msg)) {
			%>
			<h5 class="text-center text-danger mt-3">Job could not be added</h5>
			<% } %>
			</form>
		</div>
	</div>
</body>
</html>
