<%@page import="com.userValues"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>


<%-- 
<%
if (request.getParameter("UserID") != null)
{
 userValues userObj = new userValues();
 String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidItemIDSave") == "")
 {
 stsMsg = userObj.insertUser(
 request.getParameter("userName"),
 request.getParameter("noOfUnits"));
 }
else//Update----------------------
 {
 stsMsg = userObj.updateUser(
 request.getParameter("UserID"),
 request.getParameter("userName"),
 request.getParameter("noOfUnits"));
 }
 session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null)
{
userValues userObj = new userValues();
 String stsMsg =
 userObj.deleteUser(request.getParameter("hidItemIDDelete"));
 session.setAttribute("statusMsg", stsMsg);
}
%>

--%>


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

 <form id="formUsers" name="formUsers" method="post" action="userValues.jsp">
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
 