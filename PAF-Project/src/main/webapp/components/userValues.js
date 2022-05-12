$(document).ready(function()
{
	 $("#alertSuccess").hide();
	 $("#alertError").hide();
});
// SAVE ============================================
	$(document).on("click", "#btnSave", function(event)
{
// Clear status msges-------------
	 $("#alertSuccess").text("");
	 $("#alertSuccess").hide();
	 $("#alertError").text("");
	 $("#alertError").hide();
// Form validation----------------
var status = validateItemForm();
// If not valid-------------------
	if (status != true)
	 {
		 $("#alertError").text(status);
		 $("#alertError").show();
		 return;
	 }
// If valid----------------------
	var student = getStudentCard(
		 $("#txtName").val().trim(),
		 $("#txtUnits").val().trim()); 
		 $("#colStudents").append(student);
		
		 $("#alertSuccess").text("Saved successfully.");
		 $("#alertSuccess").show();
		
		 $("#formStudent")[0].reset();
	});
	// REMOVE==========================================
	$(document).on("click", ".remove", function(event)
	{
		 $(this).closest(".student").remove();
		
		 $("#alertSuccess").text("Removed successfully.");
		 $("#alertSuccess").show();
	});
	// CLIENT-MODEL=================================================================
	function validateItemForm()
	{
	// NAME
	if ($("#txtName").val().trim() == "")
	 {
	 	return "Insert user name.";
	 }
	 // Units
	if ($("#txtUnits").val().trim() == "")
	 {
	 	return "Insert no of units.";
	 }
	return true;
	}
	function getStudentCard(name, year)
	{
	 
	var student = "";
	 student += "<div class=\"student card bg-light m-2\" style=\"max-width: 10rem; float: left;\">";
	 student += "<div class=\"card-body\">";
	 student += "User Name :" + name + ",";
	 student += "<br>";
	 student += "No of units :" + year;
	 student += "</div>";
	 student += "<input type=\"button\" value=\"Remove\" class=\"btn btn-danger remove\">";
	 student += "</div>";
	return student;
	}