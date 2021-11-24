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
		<form action="loginAction.jsp" method="post" class="form-border">
			<h2 class="text-center ">Log In</h2>
	          <div class="form-group row mt-1">
	            <label class="col-form-label">Username</label>
	            <div class="col">
	            	<input
		              	type="text"
		            	placeholder="Username"
		              	name="username"
		              	class="form-control"
	            	></input>
	            </div>
	          </div>
	          <div class="form-group row mt-1">
	            <label class="col-form-label">Password</label>
	            <div class="col">
	            	<input
		              type="password"
		              placeholder="Password"
		              name="password"
		              class="form-control"
	            	></input>
	            </div>
	           </div>
	           <div class="form-group row mt-1">
	           		<label class="col-form-label">User Role</label>
	           		<div class="col">
	           			<select class="form-select" name="role" aria-label="Default select example">
						  <option value="pa" selected>Patient</option>
						  <option value="ad">Admin</option>
						</select>
					</div>
	           </div>
	          <div class="col text-center mt-4">
	            <button
	              type="submit"
	              class="btn btn-primary"
	              value="login"
	            >
	              Log In
	             </button>
	          </div>
	          <div class="text-center mt-2"><a href="signup.jsp">Sign Up</a></div>
	          <% 
				String msg = request.getParameter("msg");
				if("valid".equals(msg)) {
			%>
			<h5 class="text-center text-success mt-2">Logged in successfully</h5>
			<% } %>
			<%
				if("invalid".equals(msg)) {
			%>
			<h5 class="text-center text-danger mt-3">Incorrect Username or  Password</h5>
			<% } %>
			</form>
		</div>
	</div>
</body>
</html>
