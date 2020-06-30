<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Cookie[] ck=request.getCookies();
	for(Cookie c :ck)
	{
		if(c.getName().toString().equals("current_user"))
		{
			response.sendRedirect("../HTML/home.html");
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>..:: Page | Login ::..</title>
<link rel="stylesheet" type="text/css" href="../Design/styles.css" />
</head>
<body>
<div style="text-align:center;">
	<h2 style="color:lightgreen;"><%= application.getInitParameter("company_name") %></h2>
</div>
	<div class="content-login" >
	<form  action="../LoginServlet" method="post" >
		<h1 class="green">Login</h1>
			<input required type="text" name="empid" placeholder="Enter Employee ID" />
			<br/>
			<input required type="password" name="pass" placeholder="Enter Password" />
			<br/>
			<input type="submit" class="btn-submit bgBlue" value="Login" />
	</form>
	</div>
	<div style="text-align:center;color:red;margin:5px;padding:5px;">
	<strong>
		<%
		try 
		{
			if(request.getServletContext().getAttribute("invalid").toString().equals("true"))
			{
				out.print("Access Denied !<br/>Invalid Employee ID or Password..!");
			}
			
		}catch(Exception e){}
		finally{ request.getServletContext().removeAttribute("invalid"); }
		%>
	</strong>
</div>
</body>
</html>