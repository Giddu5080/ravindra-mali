<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% try
    	{
    		String s=request.getSession().getAttribute("current_user").toString();
    		if(s.equals(""))
    		{
    			response.sendRedirect("index.jsp");	
    		}
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
<title>..:: Portal | Delete Employee::..</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="content">
	
		<form method="post" action="../Controller" class="form"  >
		<h5 class="lightgreen">Provide Employee ID</h5>
		<input required type="number" class="form-element" name="del_page" placeholder="Enter Employee ID" />
		<br/>
		<input type="submit" class="btn-submit bgRed white" onclick="return confirm('are you sure to Delete ?');" name="submit" value="Delete" />
		
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