package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Controller")
public class Controller extends HttpServlet {
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
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		//out.print("work");
		try
		{
			
			String name,des,pass,date;
			int salary;
			Connection con=(Connection)request.getServletContext().getAttribute("connection");			
			String operation=request.getParameter("submit").toString();
			Statement stmt;
			ResultSet rs,upd;
			PreparedStatement ps;
			switch(operation)
			{
				case "Insert" :
								name=request.getParameter("name").toString();
								des=request.getParameter("designation").toString();
								pass=request.getParameter("password").toString();
								date=request.getParameter("doj").toString();
								salary=Integer.parseInt(request.getParameter("salary").toString());
								String query="insert into Employee(Emp_name,Emp_desig,Emp_J_Date,Emp_salary,password) values(?,?,?,?,?)";
								 ps=con.prepareStatement(query);
									ps.setString(1, name);
									ps.setString(2, des);
									ps.setString(3, date);
									ps.setInt(4, salary);
									ps.setString(5, pass);
									ps.execute();
									request.getServletContext().setAttribute("record", "Record insert Successfully.");
									//request.getRequestDispatcher("JSP/insert_record.jsp").forward(request, response);;
									response.sendRedirect("JSP/insert_record.jsp");
								break;
				case "Delete":
									boolean flag=false;
									stmt=con.createStatement();
									Enumeration en=request.getParameterNames();
									while(en.hasMoreElements())
									{
										if(en.nextElement().toString().equals("del_page"))
										{
											flag=true;
											break;
										}
									}
									request.getServletContext().setAttribute("record", "Record Deleted Successfully.");
									if(flag)
									{
										stmt.execute("delete from Employee where EmpId="+request.getParameter("del_page"));
										response.sendRedirect("JSP/delete_record.jsp");
										
									}
									else
									{
										stmt.execute("delete from Employee where EmpId="+request.getParameter("del"));
										response.sendRedirect("JSP/display_records.jsp");
									}
									
									
								break;
				
				case "Check" : 
						
							flag=false;
							String empid;
							empid=request.getParameter("update").toString();
							stmt=con.createStatement();
							rs=stmt.executeQuery("select * from Employee");
							
							while(rs.next())
							{
								if(rs.getString("EmpId").equals(empid))
								{
									upd=stmt.executeQuery("select * from Employee where EmpId="+rs.getString("EmpId"));
									request.getServletContext().setAttribute("values", upd);
									flag=true;
									break;
								}
							}
							if(flag)
							{
								
								request.getServletContext().setAttribute("checked", "true");
								response.sendRedirect("JSP/update_record.jsp");
							}
							else
							{
								request.getServletContext().setAttribute("record", "Employee ID not found");
								response.sendRedirect("JSP/update_record.jsp");
							}
						break;
				case "Update" :
							
							name=request.getParameter("name").toString();
							des=request.getParameter("designation").toString();
							pass=request.getParameter("password").toString();
							date=request.getParameter("doj").toString();
							salary=Integer.parseInt(request.getParameter("salary").toString());
							String q="update Employee set Emp_name=?,Emp_desig=?,Emp_J_Date=?,Emp_salary=?,password=? where EmpId="+request.getParameter("empid").toString();
							ps=con.prepareStatement(q);
							ps.setString(1, name);
							ps.setString(2, des);
							ps.setString(3, date);
							ps.setInt(4, salary);
							ps.setString(5, pass);
							
							ps.execute();
							request.getServletContext().setAttribute("record", "Record Updated Successfully.");
							//request.getRequestDispatcher("JSP/insert_record.jsp").forward(request, response);;
							response.sendRedirect("JSP/update_record.jsp");
			}
		}
		catch(Exception e){
				out.print(e);
		}
		
	}
}
