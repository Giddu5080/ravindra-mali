	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	try
	{
		String s=request.getSession().getAttribute("current_user").toString();
	}
	catch(Exception e)
	{
		response.sendRedirect("index.jsp");	
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>..:: Portal | Employee Records::..</title>

</head>
<body>
<jsp:include page="header.jsp" />
<div class="display header white">
	<h4 style="margin-left:550px;" class="red">
		<%
			try
			{	
				String status=request.getServletContext().getAttribute("record").toString();
				out.print(status);
			}catch(Exception e){
				
			}
		finally{
			request.getServletContext().removeAttribute("record");
		}
		%>
		</h4>
	<table>
		<caption>Employee Detail's</caption>
		<tr>
			<th>Sr.no</th>
			<th>EmployeeID </th>
			<th>Employee Name</th>
			<th>Designation</th>
			<th>Date Of Joinning</th>
			<th>Salary</th>
			<th>Action</th>
		</tr>
		<%
		try
		{
		Connection con=(Connection)request.getServletContext().getAttribute("connection");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select *  from Employee");
		int count=1;
		while(rs.next())
		{
			if(rs.getString("Emp_desig").equals("manager"))
				continue;
			
			out.print("<tr>"
				+"<td>"+(count++)+"</td>"
				+"<td>"+rs.getString("EmpId")+"</td>"
				+"<td>"+rs.getString("Emp_name")+"</td>"
				+"<td>"+rs.getString("Emp_desig")+"</td>"
				+"<td>"+rs.getString("Emp_J_Date")+"</td>"
				+"<td>"+rs.getString("Emp_salary")+"</td>"
				//+"<td><a href='../Controller?submit=Delete&del="+rs.getString("EmpId")+"'>Delete</a>"
				+"<td><form action='../Controller' method='post'>"
				+"<input type='hidden' name='del' value='"+rs.getString("EmpId")+"' />"
				+"<input type='submit' style='width:100px;' class='bgRed'   name='submit' value='Delete' />"
				+"</form></td>"
				+"</tr>");
		}
		}catch(Exception e){}
		
		%>
	</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
