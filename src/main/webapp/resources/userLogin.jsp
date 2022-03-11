<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<title>NITK </title>
	
	<link rel="stylesheet" href="style/Login.css">
<script src="https://kit.fontawesome.com/06a408d3d5.js" crossorigin="anonymous"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		$("#username").click(function() {
			$("#mess").text("");
		})

	});
</script>
</head>
<body>
	<nav class="nav">
		<img id="NavHeader" src="images/navHeader.JPG" class="center">
		
		<ul class="a">
			<li><a href="home"><i class="fas fa-home fa-fw"></i> Home</a></li>
			<li><a href="signup"><i class="fas fa-user fa-fw"></i> Sign Up</a></li>
			<li><a href="login"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
		</ul>
	</nav>
	<br>
	<br>
	<br>

	<div id="loginform">
		<img src="images/usericon.png" class="img">
		<h3 id="loginhead">Login</h3>
		<form:form action="userlogin" method="post" modelAttribute="user">
			<input type="text" class="login-input-box" name= "username" id="username" placeholder="username" required>
			<input type="password" class="login-input-box" name= "password" id="password" placeholder="Your password" required>
			
			<button type="submit" class="loginbut">Login</button>
			<div id="mess" style="color:red;">${message }</div>
			<hr class="hr">
			<p class="or">OR</p>
			<p>Don't have an account ?<a href="signup">Signup</a></p>

		</form:form>
	</div>

	<div id="contact">
        <div class="d">
            <span class="contact">NITK Surathkal <br></span>
            <span class="address">NH 66, Srinivasnagar Surathkal, Mangalore Karnataka 575025</span>
            <span class="phone">0824 2474000</span>
            <span class="mail">
                <a href="mailto:registrar@nitk.ac.in">registrar@nitk.ac.in</a>
            </span>
        </div>
    </div>
	
	
</body>
</html>