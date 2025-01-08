<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Direct Servlet</title>
</head>
<body>
    <form action="payment" method="post">
     Confirm Order :<br> <input type="submit" value="Confirm" name="co"><Br>
    </form>
    
    <%

	int qty=(int)request.getAttribute("qty");
	UserBean ab = (UserBean) session.getAttribute("ubean2");
	ProductBean pb = (ProductBean) request.getAttribute("pb2");
	float Payment = pb.getpPrice()* qty;

	%>
	
	<form action="payment" method="post">
	Confirm Order :<br> <input type="submit" value="Confirm" name="co"><Br>
		 <input type="hidden" name="code" readonly value=<%=pb.getpCode()%>>
		<input type="hidden" name="name" readonly value=<%=pb.getpName()%>>
	    <input type="hidden" name="reqqty" readonly value=<%=qty%>>
	    <input type="hidden" name="totpayment" readonly value=<%=Payment%>>
	    
	    <input type="submit" value="Confirm">
	</form>
	
</body>
</html>