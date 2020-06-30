/**
 	JAVASCRIPT
 */
/* insert_record.jsp script */
function showPassword(){
	var option=document.getElementById("option").value;
	if(option=="manager")
	{
			document.getElementById("password").style.display="block";
			document.getElementById("password").style.visibility="visible";
	}
	else if(option=="Select")
		{
			document.getElementById("password").style.display="none";
			document.getElementById("password").style.visibility="hidden";
			document.getElementById("require").innerHTML="Desgination is required";
			//alert(option);
		}
	else
		{
		document.getElementById("password").style.display="none";
		document.getElementById("password").style.visibility="hidden";
		document.getElementById("require").innerHTML="	";
		}
}
/* insert_record.jsp script */
function validate()
{	
		//alert("working");
	
	var option=document.getElementById("option").value;
	if(option=="Select")
	{
		document.getElementById("require").innerHTML="Desgination is required";
		return false;
	}
	else
	{
		document.getElementById("require").innerHTML="";	
	}
}
