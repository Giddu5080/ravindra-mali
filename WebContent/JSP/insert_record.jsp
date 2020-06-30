<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Portal | Insert Employee</title>

<script type="text/javascript" src="../Design/scripts.js" ></script>
<link rel="stylesheet" type="text/css" href="../Design/styles.css" />
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
<div class="content">
	
		<form method="post" action="../Controller"  onsubmit="return validate()" class="form"   >
		<h5 class="lightgreen">Provide Employee Details</h5>
		<input required type="text" class="form-element" name="name" placeholder="Enter Employee Name" />
		<br/>
		<select required id="option" onchange="showPassword()" name="designation" title="Select designation">
				<option value="Select">Select Desig..</option>
				<option  value="salesman">Salesman</option>
				<option value="designer">Designer</option>
				<option value="manager">Manager</option>
				<option value="distributor">Distributor</option>		
		</select><span style="color:red;" id="require"></span>
		
		<input type="password" value="" id="password" class="password-show" placeholder="Enter Password" name="password"  />
		<br/>
		<input required type="date" name="doj" title="Select joining date" />	
		<br/>
		<input required type="number" name="salary" placeholder="Enter Salary" />
		<br/>
		<input type="submit"   id="btnSubmit" class="btn-submit bgBlue white" name="submit"  value="Insert" />
		
		</form>
		
	</div>

	<h4 style="margin-left:550px;" class="lightgreen">
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

	<jsp:include page="footer.jsp"></jsp:include>
</body>

</html>