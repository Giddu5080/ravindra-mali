package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Logout() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
				Cookie user=new Cookie("current_user","");
				user.setMaxAge(0);
				response.addCookie(user);
				//request.getSession().removeAttribute("current_user");
				request.getSession().invalidate();
				response.sendRedirect("JSP/index.jsp");
		
		}catch(Exception e){
			response.sendRedirect("JSP/index.jsp");
		}
		
	}
}
