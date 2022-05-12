<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User usage details</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="components/jquery.min.js"></script>
<script src="components/userValues.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-8">

 <h3 class="m-3">Usage details</h3>
 <br>

 <form id="formStudent">
  <!-- NAME -->
	 <div class="input-group input-group-sm mb-3">
		 <div class="input-group-prepend">
		 	<span class="input-group-text" id="lblName">Name: </span>
		 </div>
		 <input type="text" id="txtName" name="txtName">
	 </div>
 
  <!-- USAGE -->
	 <div class="input-group input-group-sm mb-3">
		 <div class="input-group-prepend">
		 	<span class="input-group-text" id="lblUnits">No of Units: </span>
		 </div>
		 <input type="number" id="txtUnits" name="txtUnits">
	 </div>
 
 <div id="alertSuccess" class="alert alert-success"></div>
 <div id="alertError" class="alert alert-danger"></div>
	<input type="button" id="btnSave" value="Save" class="btn btn-primary">
</form>
</div>
</div>

<br>

<div class="row">
<div class="col-12" id="colStudents">

</div>
</div>
</div>
</body>
</html>
 