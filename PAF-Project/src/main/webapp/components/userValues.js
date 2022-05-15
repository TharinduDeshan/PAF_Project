$(document).ready(function()
{
	 if ($("#alertSuccess").text().trim() == "")
	 {
	 $("#alertSuccess").hide();
	 }
	 $("#alertError").hide(); 

});
// SAVE ============================================
	$(document).on("click", "#btnSave", function(event)
	{
	// Clear alerts---------------------
	 $("#alertSuccess").text("");
	 $("#alertSuccess").hide();
	 $("#alertError").text("");
	 $("#alertError").hide();
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true)
	 {
	 $("#alertError").text(status);
	 $("#alertError").show();
	 return;
	 }
	// If valid------------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
	 $.ajax(
	 {
	 url : "userValuesAPI",
	 type : type,
	 data : $("#formUsers").serialize(),
	 dataType : "text",
	 complete : function(response, status)
	 {
	 onItemSaveComplete(response.responseText, status);
	 }
	 });
});

//Update
$(document).on("click", ".btnUpdate", function(event){
	 $("#hidItemIDSave").val($(this).data("UserID"));
	 $("#UserID").val($(this).closest("tr").find('td:eq(0)').text());
	 $("#userName").val($(this).closest("tr").find('td:eq(1)').text());
	 $("#noOfUnits").val($(this).closest("tr").find('td:eq(2)').text());
});

//DELETE
$(document).on("click", ".btnRemove", function(event)
{
	 $.ajax(
	 {
		 url : "userValuesAPI",
		 type : "DELETE",
		 data : "UserID=" + $(this).data("UserID"),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 	onItemDeleteComplete(response.responseText, status);
		 }
	 });
});

function onItemSaveComplete(response, status){
	
	if (status == "success"){
		 var resultSet = JSON.parse(response);
		 if (resultSet.status.trim() == "success") {
			 $("#alertSuccess").text("Successfully saved.");
			 $("#alertSuccess").show();
			 $("#divItemsGrid").html(resultSet.data);
		 } else if (resultSet.status.trim() == "error")
		 {
			 $("#alertError").text(resultSet.data);
			 $("#alertError").show();
		 }
	 } else if (status == "error")
	 {
		 $("#alertError").text("Error while saving.");
		 $("#alertError").show();
	 } else
	 {
		 $("#alertError").text("Unknown error while saving..");
		 $("#alertError").show();
	 }
	 $("#hidItemIDSave").val("");
	 $("#formItem")[0].reset();
}

function onItemDeleteComplete(response, status)
{
	if (status == "success")
	{
		 var resultSet = JSON.parse(response);
		 if (resultSet.status.trim() == "success")
		 {
			 $("#alertSuccess").text("Successfully deleted.");
			 $("#alertSuccess").show();
			 $("#divItemsGrid").html(resultSet.data);
		 } else if (resultSet.status.trim() == "error")
		 {
			 $("#alertError").text(resultSet.data);
			 $("#alertError").show();
		 }
	 } else if (status == "error")
	 {
		 $("#alertError").text("Error while deleting.");
		 $("#alertError").show();
	 } else
	 {
		 $("#alertError").text("Unknown error while deleting..");
		 $("#alertError").show();
	 }
}

	// CLIENT-MODEL=================================================================
	function validateItemForm()
	{
	// NAME
	if ($("#userName").val().trim() == "")
	 {
	 	return "Insert user name.";
	 }
	 // Units
	if ($("#noOfUnits").val().trim() == "")
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