<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment details</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="components/jquery.min.js"></script>
<script src="components/payments.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-8">

 <h1 class="m-3">Payment details</h1>

 <form id="formStudent">
 
<!-- Units -->
<div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblName">Minimum Unit: </span>
</div>
<select id="ddlUnit" name="ddlMinUnit">
 <option value="0">--Select min unit--</option>
 <option value="1">0</option>
 <option value="2">30</option>
 <option value="3">60</option>
 <option value="4">90</option>
 <option value="5">120</option>
</select>
</div>

<!-- Units -->
<div class="input-group input-group-sm mb-3">
<div class="input-group-prepend">
 <span class="input-group-text" id="lblName">Maximum Unit: </span>
</div>
<select id="ddlUnit" name="ddlMaxUnit">
 <option value="0">--Select max unit--</option>
 <option value="1">30</option>
 <option value="2">60</option>
 <option value="3">90</option>
 <option value="4">120</option>
 <option value="5">180</option>
</select>
</div>
 
  <!-- USAGE -->
 <div class="input-group input-group-sm mb-3">
 <div class="input-group-prepend">
 <span class="input-group-text" id="lblUnits">Unit Price: </span>
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
 