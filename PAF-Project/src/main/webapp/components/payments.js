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
		 $("#txtUnit").val().trim(),
		 $("#ddlMin").val().trim(),
		 $("#ddlMax").val().trim()); 
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
	if ($("#txtUnit").val().trim() == "")
	 {
	 	return "Insert unit Price.";
	 }
	 // Units
	if ($("#ddlMin").val().trim() == "")
	 {
	 	return "Insert minimum unit.";
	 }
	 if ($("#ddlMax").val().trim() == "")
	 {
	 	return "Insert maximum unit.";
	 }
	return true;
	}
	function getStudentCard(name, gender, year)
	{
	
		var yearNumber = "";
		switch (year) {
			case "1":
			 yearNumber = "1st";
			 break;
			case "2":
			 yearNumber = "2nd";
			 break;
			case "3":
			 yearNumber = "3rd";
			 break;
			case "4":
			 yearNumber = "4th";
			 break;
	 }
	 
	var student = "";
	 student += "<div class=\"student card bg-light m-2\" style=\"max-width: 10rem; float: left;\">";
	 student += "<div class=\"card-body\">";
	 student += title + " " + name + ",";
	 student += "<br>";
	 student += yearNumber + " year";
	 student += "</div>";
	 student += "<input type=\"button\" value=\"Remove\" class=\"btn btn-danger remove\">";
	 student += "</div>";
	return student;
	}