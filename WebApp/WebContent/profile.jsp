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
		<h5 class="mt-3"><a href="http://localhost:8080/WebApp/home.jsp">Home</a> > My Profile</h5>
		<% 
			String role = session.getAttribute("role").toString(); 
			if(role.equals("st")) {
		%>
			<div class="form-center">
			<form action="updateProfileAction.jsp" method="post" class="form-border">
				<h2 class="text-center ">Edit Profile</h2>
					<div class="form-group row mt-1">
		            <label class="col-form-label">Name</label>
		            <div class="col">
		            	<input
			              	type="text"
			            	placeholder="Name"
			              	name="name"
			              	class="form-control"
			              	value=<% out.print(session.getAttribute("name")); %>
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
			              	value=<% out.print(session.getAttribute("regno")); %>
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
			              	value=<% out.print(session.getAttribute("email")); %>
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
			              	maxlength="10"
			              	class="form-control"
			              	value=<% out.print(session.getAttribute("phone")); %>
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
			              	max="10"
			              	class="form-control"
			              	value=<% out.print(session.getAttribute("cgpa")); %>
			              	required
		            	></input>
		            </div>
	            	</div>
	            	<div class="form-group row mt-1">
		            <label class="col-form-label">Placement Status : 
		            <% if("1".equals(session.getAttribute("placementStatus"))) {
		            	out.print("Placed");
		            } else {
		            	out.print("Not Placed");
		            }
		            %>	
		            </label>	
		           </div>
					
		          <div class="col text-center mt-2">
		            <button
		              type="submit"
		              class="btn btn-primary"
		              value="signup"
		            >
		              Update Profile
		             </button>
		          </div>
				<% 
					String msg = request.getParameter("msg");
					if("valid".equals(msg)) {
				%>
				<h5 class="text-center text-success mt-2">Updated Successfully</h5>
				<% } %>
				<%
					if("invalid".equals(msg)) {
				%>
				<h5 class="text-center text-danger mt-3">Could not be updated successfully</h5>
				<% } %>
				</form>
		<%
			}
			else if(role.equals("po")) {
		%>
			Placement Officer
		<%
			}
		%>
	</div>
</body>
</html>