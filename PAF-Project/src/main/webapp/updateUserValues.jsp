<%@page import="com.userValues"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%    
//update part
 if (request.getParameter("UserID") != null)
 {
	 userValues userObj = new userValues();
	 String stsMsg = userObj.updateUser(request.getParameter("UserID"),
	
	 request.getParameter("userName"),
	 request.getParameter("noOfUnits"));
	 session.setAttribute("statusMesg", stsMsg);
 }
%>

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
<br><br><br>
<div class="container" style="width:30%; border:1px solid black; padding:40px 20px; border-radius:10px;">


 <h3><center>Usage Details</center></h3>
 <br>

 <form id="formUsers" name="formUsers" method="post" action="userValues.jsp">
  <!-- ID -->
	 <div class="form-group">
		 	<label for="exampleInputEmail1">USER ID</label>
		 	<input class="form-control" aria-describedby="emailHelp" placeholder="Enter user id" type="text" id="txtName" name="UserID">
	 </div>
	 
  <!-- NAME -->
	 <div class="form-group">
		 	<label for="exampleInputEmail1">USER NAME</label>
		 	<input class="form-control" aria-describedby="emailHelp" placeholder="Enter user name" type="text" id="txtName" name="userName">
	 </div>
	 
 
  <!-- USAGE -->
	 <div class="form-group">
		 	 <label for="exampleInputEmail1">NO OF UNITS</label>
		 	<input class="form-control" aria-describedby="emailHelp" placeholder="Enter no of units used" type="number" id="txtUnits" name="noOfUnits">
	 </div>
 
 <div id="alertSuccess" class="alert alert-success"></div>
 <div id="alertError" class="alert alert-danger"></div>
 
 <div class="text-center">
	<input type="button" id="btnSave" value="Save" class="btn btn-primary" style="width:120px; font-weight:bold">
</div>	
	
</form>

<br>

<div class="row">
<div class="col-12" id="colStudents">

<%
out.print(session.getAttribute("statusMesg"));
%>

</div>
</div>
</div>
</body>
</html>