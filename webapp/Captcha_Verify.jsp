<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="test.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Random CAPTCHA</title>
    
<style>
.div1 {
	display: inline-block;
	width: 100%;
	height: 40px;
	padding: 2px;
	border: 1px solid blue;
	background-color: #0000FF;
}

.div2 {
	display: inline-block;
	padding-left: 15px;
	padding-top: 10px;
	background-color: white;
}

.div3 {
	display: inline-block;
	padding-left: 300px;
	padding-top: 4px;
}

.div4 {
	display: inline-block;
	width: 100px;
	height: 25px;
	background-color: white;
	text-align: center;
}

.div5 {
	display: inline-block;
	padding-left: 15px;
	color: black;
	background-color: white;
}

.div {
	padding-left: 50px;
	display: inline-block;
}

a {
	text-decoration: none;
}

.container {
	position: relative;
	display: inline-block;
	background-color: white;
	width: 110px;
	height: 25px;
	text-align: center;
}

.option-menu {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.container:hover .option-menu {
	display: block;
}

/* Additional styling for the options */
.option-menu a {
	display: block;
	padding: 5px;
	text-decoration: none;
	color: #333;
}

.option-menu a:hover {
	background-color: #ccc;
}

.showbar {
	background-color: #F0FFFF;
	width: 100%;
	height: 100px;
	justify-content: space-around;
}

img {
	width: 100px;
	height: 70px;
}

.Tv {
	display: inline-block;
}

.mobile {
	display: inline-block;
}

.Fashion {
	display: inline-block;
}

.fas {
	width: 50px;
	height: 70px;
}

.main-container {
	width: 100%;
	height: 100px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.child {
	width: 12.5%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid #ccc;
}

.child img {
	max-width: 100%;
	max-height: 100%;
}

.main-container2 {
	width: 100%;
	height: 150px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.child2 {
	width: 14.20%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid #ccc;
}

.child2 img {
	height: 85%;
	width: 85%
}

.slider-container {
	width: 100%;
	height: 250px;
	overflow: hidden;
	position: relative;
}

/* Define the slider image styles */
.slider-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	transition: opacity 1s ease-in-out;
}
.buy{
 padding-left: 38%;
 padding-top: 50px;
 
}
.buyin{
background-color: orange;
 height: 350px;
 width: 250px;
 padding-top: 50px;
 padding-left: 40px;
 color: white;
 font-family: sans-serif;
 border: 1px solid black;
 border-radius: 10px 50px;
}
.captcha{
 padding-left: 550px;
 padding-top: 100px;

}
.captcha1{
border: 1px solid red;
width: 300px;
height: 300px;
padding-left: 20px;
text-align: center;
padding-top: 100px;
 background-color: orange;
 font-family: sans-serif;
 border: 1px solid black;
 border-radius: 10px 50px;
}
.cap{
border: 1px solid red;
width: 150px;
text-align: center;
border-radius: 10px 50px;
background-color: white;
}
.capout{
padding-left: 70px;
}
</style>
</head>
<body>
<%
	UserBean ub =(UserBean)application.getAttribute("ubean2");
%>
<div class="div1">

		<div class="div3">
			<input type="text" placeholder="search for products,brands and more"
				style="height: 27px; width: 400px;">
		</div>
		<div class="div">
			<div class="container">
				<a href="logout">Logout</a>
			</div>
			<div class="container">See Offers</div>
			<div class="container"><a href="edit1">Edit Profile</a></div>
			<div class="container"><a href="viewProducts1">ViewAllProduts</a></div>
			<div class="container"><%out.println(ub.getfName()+"<br>"); %></div>
			
			
		</div>
	</div>
	
    <div class="captcha">
	<div class="captcha1">
        <% 
        String charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghighijklmnopqrstuvwxyz";
        StringBuilder captcha = new StringBuilder();
        java.util.Random random = new java.util.Random();
        
        for (int i = 0; i < 6; i++) { 
            char randomChar = charset.charAt(random.nextInt(charset.length()));
            captcha.append(randomChar);
        }
        String captchaCode = captcha.toString();
        
        %>
       <div class="capout"><div class="cap"> <h1><%out.print(captchaCode); %></h1></div></div>
    <br><br>
     <form method="post" action="compare.jsp">
        Enter a Captcha:<br> <input type="text" name="userInput" /><br/>
        <input type="hidden" name="captcha" value=<%=captchaCode %>><br><br>
        <input type="submit" value="Submit" /><br><br>
    </form>
    
    <button onclick="refreshCaptcha()">Refresh</button>
    </div>
    </div>
    <script>
        function refreshCaptcha() {
            location.reload();
        }
    </script>
</body>
</html>
