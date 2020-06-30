<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../Design/styles.css" />
</head>
<body>
<div id="logo">
	<h3> <%= application.getInitParameter("company_name") %> </h3>
</div>
<div class="header">
	<a style="color:green;" href="../HTML/home.html" >Home</a>
	<a href="insert_record.jsp" >Add Employee</a>
	<a href="display_records.jsp" >Display Employees</a>
	<a href="delete_record.jsp" >Delete Employee</a>
	<a href="update_record.jsp" >Update Employee</a>
	<a href="../Logout" style="float:right;">Logout</a>
</div>
</body>
</html>	