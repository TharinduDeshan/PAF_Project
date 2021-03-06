package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.userValues;
/**
 * Servlet implementation class userValuesAPI
 */
@WebServlet("/userValuesAPI")
public class userValuesAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	userValues userObj = new userValues();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userValuesAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//return userObj.readUser();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String output = userObj.insertUser(
				 request.getParameter("userName"),
				request.getParameter("noOfUnits"));
				response.getWriter().write(output); 

	}
	
	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request){
		
	 Map<String, String> map = new HashMap<String, String>();
		try {
			
			 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			 String queryString = scanner.hasNext() ?
			 scanner.useDelimiter("\\A").next() : "";
			 scanner.close();
			 String[] params = queryString.split("&");
			 for (String param : params){ 
				 String[] p = param.split("=");
			 	 map.put(p[0], p[1]);
			 }
		 }
		catch (Exception e)
		 {
		 }
		return map;
	}


	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request);
		 String output = userObj.updateUser(
		 paras.get("UserID").toString(),
		paras.get("userName").toString(),
		paras.get("noOfUnits").toString());
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request);
		 String output = userObj.deleteUser(paras.get("UserID").toString());
		response.getWriter().write(output); 

	}

}
