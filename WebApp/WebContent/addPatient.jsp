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
	<div class="d-flex w-100 justify-content-between mt-3">
		<h5><a href="http://localhost:8080/WebApp/home.jsp">Home</a> > Add Patient</h5>
	</div>
	 <div class="form-center">
		<form action="addPatientAction.jsp" method="post" class="form-border">
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
	            <label class="col-form-label">Age</label>
	            <div class="col">
	            	<input
		              	type="number"
		            	placeholder="Age"
		              	name="age"
		              	class="form-control"
		              	required
	            	></input>
	            </div>
	          </div>
	          <div class="form-group row mt-1">
	            <label class="col-form-label">Gender</label>
	            <div class="col">
	            	<div class="form-check">
					  <input class="form-check-input" type="radio" name="gender" value="male" id="flexRadioDefault1">
					  <label class="form-check-label" for="male">
					    Male
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="gender" value="female" id="flexRadioDefault1">
					  <label class="form-check-label" for="female">
					    Female
					  </label>
					</div>
	            </div>
	          </div>
				<div class="form-group row mt-1">
	            <label class="col-form-label">Address</label>
	            <div class="col">
	            	<textarea
		            	placeholder="Address"
		              	name="address"
		              	class="form-control"
		              	rows="3"
		              	required
	            	></textarea>
	            </div>
	            </div>
				<div class="form-group row mt-1">
	            <label class="col-form-label">Health Condition</label>
	            <div class="col">
	            	<div class="form-check">
					  <input class="form-check-input" type="radio" name="health" value="healthy" id="flexRadioDefault1">
					  <label class="form-check-label" for="healthy">
					    Healthy
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio" name="health" value="critical" id="flexRadioDefault1">
					  <label class="form-check-label" for="critical">
					    Critical
					  </label>
					</div>
	            </div>
	            </div>
	            <div class="form-group row mt-2">
	            <label class="col-form-label">Body Temperature</label>
	            <div class="col">
	            	<input
		              type="number"
		              step="0.01"
		              placeholder="Body Temperature"
		              name="temperature"
		              class="form-control"
		              required
	            	></input>
	            </div>
	           </div>	            
	           <div class="form-group row mt-2">
	            <label class="col-form-label">Room Number</label>
	            <div class="col">
	            	<input
		              type="number"
		              placeholder="Room Number"
		              name="room"
		              class="form-control"
		              required
	            	></input>
	            </div>
	           </div>
	          <div class="col text-center mt-4">
	            <button
	              type="submit"
	              class="btn btn-primary"
	              value="add"
	            >
	              Add patient
	             </button>
	          </div>
			<% 
				String msg = request.getParameter("msg");
				if("valid".equals(msg)) {
			%>
			<h5 class="text-center text-success mt-2">Added patient successfully</h5>
			<% } %>
			<%
				if("invalid".equals(msg)) {
			%>
			<h5 class="text-center text-danger mt-3">Could not add patient</h5>
			<% } %>
			</form>
		</div>
	</div>
</body>
</html>
