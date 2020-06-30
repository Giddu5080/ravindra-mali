package com;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String s=request.getSession().getAttribute("current_user").toString();
		}
		catch(Exception e)
		{
			response.sendRedirect("JSP/index.jsp");	
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
				String empid;
				empid=request.getParameter("empid").toString();
				Cookie user=new Cookie("current_user",empid);
				response.addCookie(user);
				request.getSession().setAttribute("current_user", empid);
				response.sendRedirect("HTML/home.html");
			
	}

}
