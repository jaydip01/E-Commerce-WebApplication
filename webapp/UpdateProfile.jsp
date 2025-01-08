<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="test.UserBean"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
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
	padding-left: 200px;
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
	
	color: black;
	background-color: white;
	width: 110px;
	height: 25px;
	text-align: center;
}
.div6{
display: inline-block;
background-color: red;
color: white;
width: 100px;
height: 25px;
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
	width: 100px;
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

.slider-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	transition: opacity 1s ease-in-out;
}
</style>
</head>
<body>
<%
	UserBean ub =(UserBean)application.getAttribute("ubean2");
%>
<script> 
	<%
	String message=(String)request.getAttribute("msg");
	%>
	//alert("This is an alert box!");
	 var message = "<%= message %>";
        alert(message);
        </script>
<div class="div1">

		<div class="div3">
		<form action="search" method="post" >
			<input type="text" name="show" placeholder="search for products,brands and more" style="height: 27px; width: 400px;">
				<input type="submit" value="Search">
				
				</form>
		</div>
		<div class="div">
			<div class="container">
				<a href="logout">Logout</a>
			</div>
			<div class="div5">See Offers</div>
			
			<div class="div5"><a href="edit1">Edit Profile</a></div>
			<div class="div5"><a href="viewProducts1">ViewAllProduts</a></div>
			<div class="div5"><%out.println(ub.getfName()+"<br>"); %></div>
		</div>
	</div>



</body>
</html>