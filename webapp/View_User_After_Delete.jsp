<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,test.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All User </title>
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
	color: white;
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

.slider-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	transition: opacity 1s ease-in-out;
}
.whi{
color: white;

}
table, th, td{
border: 1px solid white;
width: 800px;
border-collapse: collapse;

}
table{
 background-color: orange;
 color: black;
}
.center{
padding-left: 20%;
padding-top: 20px;
}
.price{
 padding-left:57%;
}
.deleteAll{
padding-left: 50%;
}
.btn{
color: white;
background-color: green;
width: 150px;
height: 30px;
}
.inth{
color: purple;
}
</style>
</head>
<body>

<%
	AdminBean ab =(AdminBean)session.getAttribute("abean3");
%>
<div class="div1">

		<div class="div3">
		<form action="search1" method="post" >
			<input type="text" name="show" placeholder="search for products,brands and more" style="height: 27px; width: 400px;">
				<input type="submit" value="Search">
				
				</form>
		</div>
		<div class="div">
			<div class="container">
				<a href="logout">Logout</a>
			</div>
			<div class="div5">  <a href="product.html" class="whi">AddProduct</a></div>
			<div class="div5"><a href="viewProducts2" class="whi">ViewAllProducts</a></div>
			<div class="div5"><a href="cart" class="whi">Collections</a>
			<div class="div5"><%out.println(ab.getfName()); %></div>
		</div>
	</div>
	
	<script> 
	<%String message = (String) request.getAttribute("msg3");%>
	 var message = "<%=message%>";
		alert(message);
	</script>
<%
out.println("<div class='center'>");

out.println("<table >");
out.println("<tr> <th class='inth'>User Name</th> <th class='inth'>Password</th> <th class='inth'>First Name</th><th class='inth'>Last Name</th> <th class='inth'>Address</th> <th class='inth'>Email</th> <th class='inth'>Phone No</th > <th class='inth'>Option</th></tr>");
 ArrayList<AllUserBean> al = (ArrayList<AllUserBean>) session.getAttribute("al6");
	if (al.size() == 0) {
		out.println("User Not Avalible...");
		
	} else {
		Iterator<AllUserBean> it = al.iterator();
		while (it.hasNext()) {
			AllUserBean pb = (AllUserBean) it.next();
			out.println("<div class='center'>");
			out.println("<tr>");
			

			out.println("" + "<th>" + "" + "" + pb.getuName() + "</th><th> "
			+ pb.getpWord() + "</th><th> " + pb.getfName() + "</th><th>" 
			+ pb.getlName() + "</th><th>"  +pb.getAddr()+"</th><th>" +pb.getmId()+ "</th><th>"+pb.getPhNo()+ "</th><th>" +  "<a href='deleteuser?pcode="
			+ pb.getuName() + "'><div class='cen'><button class='buy-button'>Delete User</button></div></a>" + "</th>");
         
			
			out.println("</div>");
		}
		out.println("</table>");
		out.println("</div>");
	}
	%>
</body>
</html>