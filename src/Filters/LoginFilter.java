package Filters;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebFilter("/LoginServlet")
public class LoginFilter implements Filter {
	HttpServletRequest req;
	HttpServletResponse res;
    public LoginFilter() {
    }
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			req=(HttpServletRequest)request;
			res=(HttpServletResponse)response;
		try
		{
			String empid,pass;
			empid=request.getParameter("empid").toString();
			pass=request.getParameter("pass").toString();
			
			
			boolean authorized=false;
			Connection con=(Connection)request.getServletContext().getAttribute("connection");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from Employee where Emp_desig='manager'");
			
			while(rs.next())
			{
				if(rs.getString("EmpId").equals(empid) && rs.getString("password").equals(pass))
				{
						authorized=true;
						break;
				}
			}
			if(authorized)
			{
		
				chain.doFilter(request, response);
			}
			else
			{
				//out.print("not aallowed");
				//request.getServletContext().setAttribute("invalid", "true");
				req.getServletContext().setAttribute("invalid", "true");
				res.sendRedirect("JSP/index.jsp");
				//request.getRequestDispatcher("JSP/index.jsp").forward(req, res);
				//req.getRequestDispatcher("JSP/index.jsp").forward(req, res);
			}
	}catch(Exception e)
	{
		
	}
		
		
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
