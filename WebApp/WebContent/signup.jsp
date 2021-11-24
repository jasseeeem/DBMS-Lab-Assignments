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
	 <div class="form-center">
		<form action="signupAction.jsp" method="post" class="form-border">
			<h2 class="text-center ">Sign Up</h2>
				<div class="form-group row mt-1">
	            <label class="col-form-label">Name</label>
	            <div class="col">
	            	<input
		              	type="text"
		            	placeholder="Name"
		              	name="name"
		              	class="form-control"
		              	required
	            	></input>
	            </div>
	            </div>
				<div class="form-group row mt-1">
	            <label class="col-form-label">Registration Number</label>
	            <div class="col">
	            	<input
		              	type="text"
		            	placeholder="Registration Number"
		              	name="regno"
		              	class="form-control"
		              	minlength="9"
		              	maxlength="9"
		              	required
	            	></input>
	            </div>
	          </div>
	          <div class="form-group row mt-1">
	            <label class="col-form-label">Email ID</label>
	            <div class="col">
	            	<input
		              	type="email"
		            	placeholder="Email ID"
		              	name="email"
		              	class="form-control"
		              	required
	            	></input>
	            </div>
	          </div>
				<div class="form-group row mt-1">
	            <label class="col-form-label">Phone Number</label>
	            <div class="col">
	            	<input
		              	type="number"
		            	placeholder="Phone Number"
		              	name="phone"
		              	class="form-control"
		              	required
	            	></input>
	            </div>
	            </div>
				<div class="form-group row mt-1">
	            <label class="col-form-label">Current CGPA</label>
	            <div class="col">
	            	<input
		              	type="number"
		            	placeholder="Current CGPA"
		              	name="cgpa"
		              	step="0.01"
		              	min="0" 
		              	max="5"
		              	class="form-control"
		              	required
	            	></input>
	            </div>
	            </div>
	            <div class="form-group row mt-2">
	            <label class="col-form-label">Password</label>
	            <div class="col">
	            	<input
		              type="password"
		              placeholder="Password"
		              name="password"
		              class="form-control"
		              required
	            	></input>
	            </div>
	           </div>
	          <div class="col text-center mt-4">
	            <button
	              type="submit"
	              class="btn btn-primary"
	              value="signup"
	            >
	              Sign Up
	             </button>
	          </div>
	          <div class="text-center mt-2"><a href="login.jsp">Log In</a></div>
			<% 
				String msg = request.getParameter("msg");
				if("valid".equals(msg)) {
			%>
			<h5 class="text-center text-success mt-2">Signed up successfully</h5>
			<% } %>
			<%
				if("invalid".equals(msg)) {
			%>
			<h5 class="text-center text-danger mt-3">Sign up failed</h5>
			<% } %>
			</form>
		</div>
	</div>
</body>
</html>
