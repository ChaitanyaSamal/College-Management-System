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
	<script>
function myFunction() {
	  alert("SuccessFully added admin");
	}
</script>
</head>
<body>
	<%
 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); 

if(session.getAttribute("username")==null)
{
	response.sendRedirect("userLogin.jsp");
}
%>
	<nav class="nav">
		<img id="NavHeader" src="images/navHeader.JPG" class="center">
		
		<ul class="a">
				<li><a href="home"><b><i class="fas fa-home fa-fw"></i>Home</b></a></li>
			<li><a href="announcements"><b><i class="fa fa-bullhorn" aria-hidden="true"></i>Announcements</b></a></li>
			<li><a href="changePassword"><b><i class="fa fa-bullhorn" aria-hidden="true"></i>Change_Password</b></a></li>
		    <li><a href="userLogout"><b><i class="fa fa-sign-out" aria-hidden="true"></i>Logout </b></a></li>
		</ul>
	</nav>
	<br>
	<br>
	<br>

	<div id="loginform">
		<img src="images/usericon.png" class="img">
		<h3 id="loginhead">Add Admin</h3>
		<form:form action="addAdmin" method="post" modelAttribute="user" >
			<input type="text" class="input-box" name= "username" id="username" placeholder="username" required>
			<input type="email" class="input-box" name= "emailid"placeholder="email" required>
			<form:errors path="username" cssStyle="color:red">${message }</form:errors>
			<button type="submit" class="loginbut">Add Admin</button>

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