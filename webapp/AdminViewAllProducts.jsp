<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="test.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Product</title>
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
	width: 200px;
	height: 200px;
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

.out {
	width: 222px;
	padding-top: 10px;
	display: inline-block;
}

.c {
	width: 222px;
	padding-top: 5px;
	border: 1px solid black;
	display: inline-block;
}

button {
	color: green;
	background-color: yellow;
	height: 30px;
	width: 50px;
}

h2 {
	color: green;
}

.buy-button {
	padding: 10px 20px;
	padding-bottom: 30px;
	background-color: green;
	color: #fff;
	font-size: 18px;
	text-align: center;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	width: 100px;
}

.buy-button:hover {
	background-color: #2980b9;
}

.cen {
	display: inline;
}
.whi{
 color: white;
}
</style>
</head>
<body>
	<%
	AdminBean ab = (AdminBean) session.getAttribute("abean3");
	%>
	<div class="div1">

		<div class="div3">
			<form action="search1" method="post">
				<input type="text" name="show"
					placeholder="search for products,brands and more"
					style="height: 27px; width: 400px;"> <input type="submit"
					value="Search">

			</form>
		</div>
		<div class="div">
			<div class="container">
				<a href="logout">Logout</a>
			</div>
			
			<div class="div5"> <a href="product.html" class="whi">AddProduct</a>
			</div>
			<div class="div5"><a href="viewProducts2" class="whi">ViewAllProducts</a>
			</div>
            <div class="div5"><a href="cart" class="whi">Collections</a>
			<div class="div5">
				<%
				out.println(ab.getfName());
				%>
			</div>
		</div>
	</div>

	<%
	ArrayList<ProductBean> al = (ArrayList<ProductBean>) session.getAttribute("al3");
	//out.println("Welcome : " + ab.getfName() + "<br>");
	//out.println(request.getAttribute("msg")); 
	if (al.size() == 0) {
		out.println("Products Not Available...<br>");
	} else {
		Iterator<ProductBean> it = al.iterator();
		while (it.hasNext()) {
			ProductBean pb = (ProductBean) it.next();
			out.println("<div class='out'>");
			out.println("<div class='c'>");
			String imagePath = "data:image/jpg;base64," + pb.getBase64();
			String altText = "nothing";
			out.println("<img src='" + imagePath + "' alt='" + altText + "' >");

			out.println(pb.getpCode() + "&nbsp&nbsp" + pb.getpName() +"&nbsp&nbsp<h3><del>" +pb.getMprice()+ "</del></h3>&nbsp&nbsp<h2><p> Rs : "+ + pb.getpPrice() + "</h2></p>&nbsp&nbsp<p> Only "
					+ pb.getpQty() + " Product Left <br> Please Add More Product</p>&nbsp&nbsp" + "<a href='editProduct2?pcode=" + pb.getpCode() + "'><div class='cen'><button class='buy-button'>Edit</button></div></a>"
					+ "&nbsp&nbsp" + "<a href='deleteProduct1?pcode=" + pb.getpCode() + "'><div class='cen'><button class='buy-button'>Delete</button></div></a>" + "");
					out.println("</div>");
					out.println("</div>");
		}
	}
	//request.getRequestDispatcher("/updateProduct").forward(request, response);
	%>

</body>
</html>