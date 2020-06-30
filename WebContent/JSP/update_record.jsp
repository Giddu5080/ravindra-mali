<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>..:: Portal | Update Employee::..</title>
<script type="text/javascript" src="../Design/scripts.js" ></script>
</head>
<body>
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
<jsp:include page="header.jsp" />

<div class="content hide">
	
		<form method="post" action="../Controller" class="form"  >
		<h5 class="lightgreen">Provide Employee ID</h5>
		<input required type="number" class="form-element" name="update" placeholder="Enter Employee ID" />
		<br/>
		<input type="submit" class="btn-submit bgGreen white" name="submit" value="Check" >
		
		</form>
		
	</div>
	<% try
	{ if(request.getServletContext().getAttribute("checked").toString().equals("true")){
		ResultSet result=(ResultSet)request.getServletContext().getAttribute("values");
		result.absolute(1);
%>
<div class="content">
	
		<form method="post" action="../Controller"  onsubmit="return validate()" class="form"   >
		<h5 class="green">Update Employee Details</h5>
		<input type="hidden" value="<%= result.getString("EmpId") %>" name="empid" />
		<input required type="text" class="form-element" name="name" value="<%= result.getString("Emp_name") %>" placeholder="Enter Employee Name" />
		<br/>
		<select required id="option" onchange="showPassword()" name="designation" title="Select designation">
				<option <% if(result.getString("Emp_desig").equals("salesman")){ out.print("selected " ); } %> value='salesman' >Salesman</option>
				<option <% if(result.getString("Emp_desig").equals("designer")){ out.print("selected "); } %> value='designer' >Designer</option>
				<option <% if(result.getString("Emp_desig").equals("manager")){ out.print("selected "); } %> value='manager' >Manager</option>
				<option <% if(result.getString("Emp_desig").equals("distributor")){ out.print("selected "); } %> value='distributor' >Distributor</option>		
		</select><span style="color:red;" id="require"></span>
		
		<input type="password" <% if(result.getString("Emp_desig").equals("manager")){ out.print("required  style='display:block;visibility:visible;'"); } %> id="password" class="password-show" placeholder="Enter Password" name="password"  />
		<br/>
		<input required type="text" name="doj" value="<%= result.getString("Emp_J_Date") %>" title="Select joining date" />	
		<br/>
		<input required type="number" name="salary" value="<%= result.getString("Emp_Salary") %>" placeholder="Enter Salary" />
		<br/>
		<input type="submit"   id="btnSubmit" class="btn-submit bgGreen white" name="submit"  value="Update" />
		
		</form>
		
	</div>
<% } 
	}catch(Exception e){}finally{request.getServletContext().removeAttribute("checked");}
%>
	<h4 style="margin-left:550px;" class="lightgreen">
		<%
			try{
				String status=request.getServletContext().getAttribute("record").toString();
				out.print(status);
			}catch(Exception e){
				
			}
		finally{
			request.getServletContext().removeAttribute("record");
			
		}
		%>
		</h4>


<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>