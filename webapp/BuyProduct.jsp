<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BuyProduct</title>
<style>
@charset "ISO-8859-1";
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family:'Poppins', sans-serif;
}
body
{
	display:flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background: rgb(0, 0, 0);
}
.box
{
	position: relative;
	width: 380px;
	height: 650px;
	background: #1c1c1c;
	border-radius: 8px;
	overflow: hidden;
}
.box::before
{
	content: '';
	position: absolute;
	top: -50%;
	left: -50%;
	width: 380px;
	height: 420px;
	background: linear-gradient(0deg,transparent,transparent,rgb(255, 128, 0),rgb(255, 128, 0),rgb(255, 128, 0));
	transform-origin: bottom right;
	z-index: 1;
	animation: animate 6s linear infinite;
}
.box::after
{
	content: '';
	position: absolute;
	top: -50%;
	left: -50%;
	width: 380px;
	height: 420px;
	background: linear-gradient(0deg,transparent,transparent,rgb(0, 255, 0),rgb(128, 255, 0),rgb(0, 255, 0));
	transform-origin: bottom right;
	z-index: 1;
	animation: animate 6s linear infinite;
	animation-delay: -3s;
}
.borderLine
{
	position: absolute;
	top: 0;
	inset: 0;
}
.borderLine::before
{
	content: '';
	position: absolute;
	top: -50%;
	left: -50%;
	width: 380px;
	height: 420px;
	background: linear-gradient(0deg,transparent,transparent,rgb(255, 128, 0),rgb(255, 128, 0),rgb(255, 128, 0));
	z-index: 1;
	transform-origin: bottom right;
	animation: animate 6s linear infinite;
	animation-delay:-1.5s;
}
.borderLine::after
{
	content: '';
	position: absolute;
	top: -50%;
	left: -50%;
	width: 380px;
	height: 420px;
	background: linear-gradient(0deg,transparent,transparent,rgb(0, 255, 0),rgb(0, 255, 0),rgb(0, 255, 0));
	transform-origin: bottom right;
	z-index: 1;
	animation: animate 6s linear infinite;
	animation-delay:-4.5s;
}
@keyframes animate
{
	0%
	{
	 transform: rotate(0deg);
	}
	100%
	{
	 transform: rotate(360deg);
	}
}

.box form 
{
	position: absolute;
	inset: 4px;
	background: #222;
	padding: 50px 40px;
	border-radius: 8px;
	z-index: 2;
	display: flex;
	flex-direction: column;
}
.box form h2
{
	color: #fff;
	font-weight: 500;
	text-align: center;
	letter-spacing: 0.1em;	
}
.box form .inputBox
{
	position: relative;
	width: 300px;
	margin-top: 35px;
}
.box form .inputBox input
{
	position: relative;
	width: 100%;
	padding: 20px 10px 10px;
	background: transparent;
	outline: none;
	border: none;
	box-shadow: none;
	color: #23242a;
	font-size: 1em;
	letter-spacing: 0.05em;
	transition:0.5s;
	z-index: 10;
}
.box form .inputBox span 
{
	position: absolute;
	left: 0;
	padding: 20px 0px 10px;
	pointer-events: none;
	color: #8f8f8f;
	font-size: 1em;
	letter-spacing: 0.05em;
	transition:0.5s;
}
.box form .inputBox input:valid ~ span,
.box form .inputBox input:focus ~ span
{
    color: #fff;
	font-size: 0.75em;
	transform: translateY(-34px);
}
.box form .inputBox i
{
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 2px;
	background:#fff;
	border-radius: 4px;
	overflow: hidden;
	transition:0.5s;
	pointer-events: none;
}
.box form .inputBox input:valid ~ i,
.box form .inputBox input:focus ~ i
{
	height: 44px;
}
.box form .links
{
	display: flex;
	justify-content: space-between;
}
.box form .links a
{
margin: 10px 0;
font-size: 0.75em;
color: #8f8f8f;
text-decoration: none;	
}
.box form .links a:hover 
.box form .links a:nth-child(2)
{
	color: #fff;
}
.box form input[type="submit"]
{
	border: none;
	outline: none;
	padding: 9px 25px;
	background: #fff;
	cursor: pointer;
	font-size: 0.9em;
	border-radius: 4px;
	font-weight: 600;
	width: 100px;
	margin-top: 10px;
}
.box form input[type="submit"]:active 
{
	opacity: 0.8;	
}
</style>
</head>
<body>
<%
	UserBean ub =(UserBean)application.getAttribute("ubean2");
%>
<%
	UserBean ab = (UserBean) session.getAttribute("ubean2");
	ProductBean pb = (ProductBean) request.getAttribute("pb2");
%>

<div class = "box">
<span class = "borderLine"></span>
	<form action="billproduct" method="post" id="myForm">
	<p><%out.println(ub.getfName()); %></p>
		<h2>Buy Product</h2>
		<div class = "inputBox">
			<input type ="text" name="pcode" readonly value=<%=pb.getpCode()%> required>
			<span>Code</span>
			<i></i>
		</div>
		
		<div class = "inputBox">
			<input type ="text" name="name" readonly value=<%=pb.getpName()%>>
			<span>Name</span>
			<i></i>
		</div>
		
		<div class = "inputBox">
			<input type ="text" name="price" readonly value=<%=pb.getpPrice()%>>
			<span>Price</span>
			<i></i>
		</div>
		<div class = "inputBox">
			<input type ="text" name="qty" readonly value=<%=pb.getpQty()%>>
			<span>Qty</span>
			<i></i>
		</div>
		<div class = "inputBox">
			<input type ="text" id="reqqty" name="reqqty" max=<%=pb.getpQty() %>>
			<span>ReqQty</span>
			<i></i>
		</div>
		 <span id="error" style="color: red;"></span>
		<div class = "links">
			<a href="#"></a>
			<a href="Customer_ViewAllProducts.jsp">Back</a>			
		</div>
		<input type ="submit" value ="Buy">
	</form>
</div>
<script>
  document.getElementById('myForm').addEventListener('submit', function(event) {
    const numberInput = document.getElementById('reqqty').value;

    if (!isPositiveNumber(numberInput)) {
      document.getElementById('error').innerText = 'Please enter more than 1 Quantity.';
      event.preventDefault(); // Prevent form submission
    }
  });

  function isPositiveNumber(value) {
    return /^\d+(\.\d+)?$/.test(value) && parseFloat(value) > 0;
  }

  document.getElementById('reqqty').addEventListener('focus', function() {
    document.getElementById('error').innerText = '';
  });
</script>
	<script>
        const numberInput = document.getElementById('reqqty');
        const errorText = document.getElementById('error');

        numberInput.addEventListener('input', function() {
            const maxValue = parseInt(numberInput.getAttribute('max'));
            const currentValue = parseInt(numberInput.value);
            
            if (currentValue > maxValue) {
                errorText.textContent = 'Product only  ' + maxValue +' Avalible';
                numberInput.setCustomValidity('Product only  ' + maxValue +' Avalible');
            } else {
                errorText.textContent = '';
                numberInput.setCustomValidity('');
            }
        });
    </script>
</body>
</html>









<!-- 



	<div class=buy>
	 <div class=buyin>
	<form action="billproduct" method="post" id="myForm">
		Code:<br> <input type="text" name="pcode" readonly value=<%=pb.getpCode()%>><br><br>
		Name:<br><input type="text" name="name" readonly value=<%=pb.getpName()%>><br><br>
	    Price:<br><input type="text" name="price" readonly value=<%=pb.getpPrice()%>> <br> <br>
	    Qty: <br><input type="text" name="qty" readonly value=<%=pb.getpQty()%>><br><br>
	    <label for="reqqty">ReqQty:</label>
	    
	    <br><input type="text" id="reqqty" name="reqqty" max=<%=pb.getpQty() %>><br>
	    <span id="error" style="color: red;"></span><br><br>
	    <input type="submit" value="BuyProduct">
	</form>
	
	
	</div>
	</div>
	<script>
  document.getElementById('myForm').addEventListener('submit', function(event) {
    const numberInput = document.getElementById('reqqty').value;

    if (!isPositiveNumber(numberInput)) {
      document.getElementById('error').innerText = 'Please enter a positive number.';
      event.preventDefault(); // Prevent form submission
    }
  });

  function isPositiveNumber(value) {
    return /^\d+(\.\d+)?$/.test(value) && parseFloat(value) > 0;
  }

  document.getElementById('reqqty').addEventListener('focus', function() {
    document.getElementById('error').innerText = '';
  });
</script>
	<script>
        const numberInput = document.getElementById('reqqty');
        const errorText = document.getElementById('error');

        numberInput.addEventListener('input', function() {
            const maxValue = parseInt(numberInput.getAttribute('max'));
            const currentValue = parseInt(numberInput.value);
            
            if (currentValue > maxValue) {
                errorText.textContent = 'Value cannot be more than ' + maxValue;
                numberInput.setCustomValidity('Value cannot be more than ' + maxValue);
            } else {
                errorText.textContent = '';
                numberInput.setCustomValidity('');
            }
        });
    </script>
	
</body>

</html>    -->