package com;
import java.sql.*;
public class userValues
{ //A common method to connect to the DB
private Connection connect()
	 {
		 Connection con = null;
		 try
	 {
			 Class.forName("com.mysql.jdbc.Driver");
	
		 //Provide the correct details: DBServer/DBName, username, password
		 con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/elecbill", "root", "");
		 System.out.println("Connection Successfull");
	 }
		 catch (Exception e)
		 {e.printStackTrace();}
		 return con;
	 }
		public String insertUser(String userName, String noOfUnits)
		 {
			 String output = "";
			 try
			 {
				 Connection con = connect();
				 if (con == null)
					 {
					 	return "Error while connecting to the database for inserting."; 
					 }
					 // create a prepared statement
				 String query = " insert into user(`UserID`,`userName`,`noOfUnits`,)" + " values ( ?, ?, ?)";
				 PreparedStatement preparedStmt = con.prepareStatement(query);
				 
				 // binding values
				 
					 preparedStmt.setInt(1, 0);
					 preparedStmt.setString(2, userName);
					 preparedStmt.setString(3, noOfUnits);
					 // execute the statement
					 
					 preparedStmt.execute();
					 con.close();
					 output = "Inserted successfully";
					 System.out.println("Inserted successfully");

				 }
				 	catch (Exception e)
				 {
					 output = "Error while inserting the user";
					 System.err.println(e.getMessage());
					 System.out.println("Error");
			 }
		 return output;
		 }
		
		public String readUser()
			{
				String output = "";
				try
			{
				Connection con = connect();
				if (con == null)
			{
					return "Error while connecting to the database for reading.";
			}
				// Prepare the html table to be displayed
				 output = "<table border='1'><tr><th>UserID</th>" + "<th>User Name</th>" + "<th>No of Units</th>" +
						 "<th>Update</th><th>Remove</th></tr>";
					
						 String query = "select * from user";
						 Statement stmt = con.createStatement();
						 ResultSet rs = stmt.executeQuery(query);
						 
						 // iterate through the rows in the result set
						 
						 while (rs.next())
						 {
							 String UserID = Integer.toString(rs.getInt("UserID"));
							 String userName = rs.getString("userName");
							 String noOfUnits = rs.getString("noOfUnits");
							 
							 // Add into the html table
							 
							 output += "<tr><td>" + UserID + "</td>";
							 output	+= "<td>" + userName + "</td>";
							 output += "<td>" + noOfUnits + "</td>";
							 
							 // buttons
							 
							 output += "<td><form method='post' action='updateUserValues.jsp'>"
							 		+ "<input name='btnUpdate' type='submit' value='Update'class='btn btn-secondary'>"
							 		+ "<input name='ID' type='hidden' value='" + UserID + "'>" + "</form></td>"
									 + "<td><form method='post' action='userValues.jsp'>"
									 + "<input name='btnRemove' type='submit' value='Remove'class='btn btn-danger'>" 
									 + "<input name='UserID' type='hidden' value='" + UserID + "'>" + "</form></td></tr>";
						 }
						 con.close();
				// Complete the html table
				output += "</table>";
			}
				catch (Exception e)
				{
					output = "Error while reading the user.";
					System.err.println(e.getMessage());
				}
				return output;
		}
		
		public String updateUser(String UserID, String userName, String noOfUnits)
		 {
			 String output = "";
			 try
			 {
				 Connection con = connect();
				 if (con == null){
					 return "Error while connecting to the database for updating."; }
					 // create a prepared statement
				 String query = "UPDATE user SET userName=?,noOfUnits=? WHERE UserID=?";
				 PreparedStatement preparedStmt = con.prepareStatement(query);
				 
				 // binding values
				 
				 preparedStmt.setString(1, userName);
				 preparedStmt.setString(2, noOfUnits);
				 preparedStmt.setInt(3, Integer.parseInt(UserID));
					 // execute the statement
					 preparedStmt.execute();
					 con.close();
					 output = "Updated successfully";
					 
				 }
				 catch (Exception e)
			 {
					 output = "Error while updating the user";
						 System.err.println(e.getMessage());
		 }
		 return output;
	 }
		
		public String deleteUser(String UserID)
			 {
				 String output = "";
				 try
				 {
					 Connection con = connect();
					 if (con == null)
					 {return "Error while connecting to the database for deleting."; }
					 // create a prepared statement
					 String query = "delete from user where UserID=?";
					 PreparedStatement preparedStmt = con.prepareStatement(query);
					 // binding values
					 preparedStmt.setInt(1, Integer.parseInt(UserID));
					 // execute the statement
					 preparedStmt.execute();
					 con.close();
					 output = "Deleted successfully";

				 }
				 	catch (Exception e)
				 {
				 		output = "Error while deleting the user"; 

					 System.err.println(e.getMessage());
			 }
			 return output;
		 }
} 