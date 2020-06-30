package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Access")
public class Access extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try
    	{
    		String s=request.getSession().getAttribute("current_user").toString();
    		if(s.equals(""))
    		{
    			response.sendRedirect("JSP/index.jsp");	
    		}
    	}
    	catch(Exception e)
    	{
    		response.sendRedirect("JSP/index.jsp");	
    	}
	}

}
