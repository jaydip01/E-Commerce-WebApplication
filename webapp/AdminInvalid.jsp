<%@ page 
       language="java" 
       contentType="text/html; charset=UTF-8"
  	   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	
	<script> 
	<%
	String message=(String)request.getAttribute("msg");
	%>
	 var message = "<%= message %>";
        alert(message);
        </script>
<jsp:include page="adminLogin.html"/>
</body>
</html>