<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User usage details</title>
<link rel="stylesheet" href="cssbootstrap.min.css">
<script src="components/jquery.min.js"></script>
<script src="components/payments.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-8">

 <h3 class="m-3">Payment details</h3>
 <br>

 <form id="formStudent">
 
   <!-- Unit Price -->
	 <div class="input-group input-group-sm mb-3">
		 <div class="input-group-prepend">
		 	<span class="input-group-text" id="txtUnit">Unit Price: </span>
		 </div>
		 <input type="number" id="txtUnit" name="txtUnit">
	 </div>
 
	  <!-- Min Unit -->
	 <div class="input-group input-group-sm mb-3">
		 <div class="input-group-prepend">
		 	<span class="input-group-text" id="lblMin">Min Unit: </span>
		 </div>
		 <select id="ddlMin" name="ddlMin">
			 <option value="0">--Select minimum unit--</option>
			 <option value="1">0</option>
			 <option value="2">30</option>
			 <option value="3">60</option>
			 <option value="4">90</option>
			 <option value="5">120</option>
		 </select>
	 </div>
	 
	 	  <!-- Max Unit -->
	 <div class="input-group input-group-sm mb-3">
		 <div class="input-group-prepend">
		 	<span class="input-group-text" id="lblMax">Max Unit: </span>
		 </div>
		 <select id="ddlMax" name="ddlMax">
			 <option value="0">--Select maximum unit--</option>
			 <option value="1">30</option>
			 <option value="2">60</option>
			 <option value="3">90</option>
			 <option value="4">120</option>
			 <option value="5">180</option>
		 </select>
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
 