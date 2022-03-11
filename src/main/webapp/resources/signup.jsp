<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>NITK </title>
	
	<link rel="stylesheet" href="/style/Signup.css">
	<script src="https://kit.fontawesome.com/06a408d3d5.js" crossorigin="anonymous"></script>
	<script>
function myFunction() {
	  alert("SuccessFully Registered if redirected to login page else make changes according to the format and try again");
	}
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
	
	<div id="signupform">
		<img src="images/usericon.png" class="img">
	<h3 id="signuphead">Sign up</h3>
	<form:form action="userRegister" method="post" modelAttribute="user" onsubmit="myFunction()">
		<input type="text" class="input-box" name= "username" placeholder="username" required>
		<form:errors path="username" cssStyle="color:red"></form:errors>
		<input type="password" class="input-box" name= "password" placeholder="password" required>
		<form:errors path="password" cssStyle="color:red"></form:errors>
		<input type="email" class="input-box" name= "emailid"placeholder="email" required>
		<input type="text" class="input-box"name= "address"placeholder="address" required>
		<input type="tel" class="input-box" name= "contact_num"placeholder="contact no" required>
		<form:errors path="contact_num" cssStyle="color:red"></form:errors>
	
		<button type="submit" class="signupbut">sign up</button>
		<hr class="hr">
		<p class="or">OR</p>
		<p>Do you have an account ?<a href="login">Login</a></p>

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