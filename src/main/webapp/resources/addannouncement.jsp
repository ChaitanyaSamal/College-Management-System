<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<title>NITK </title>
	
	<link rel="stylesheet" href="style/Login.css">
	<style>
	#custom-button {
  padding: 10px;
  color: white;
  background-color: #009578;
  border: 1px solid #000;
  border-radius: 5px;
  cursor: pointer;
}

#custom-button:hover {
  background-color: #00b28f;
}

#custom-text {
  margin-left: 10px;
  font-family: sans-serif;
  color: #aaa;
}
	
	</style>
<script src="https://kit.fontawesome.com/06a408d3d5.js" crossorigin="anonymous"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	$(document).ready(function() {

		$("#password").click(function() {
			$("#mess").text("");
		})

	});
	
	
</script>
	<script>
function myFunction() {
	  alert("SuccessFully changed password");
	}
</script>
<script>
function myFunction1() {
const realFileBtn = document.getElementById("real-file");
const customBtn = document.getElementById("custom-button");
const customTxt = document.getElementById("custom-text");

customBtn.addEventListener("click", function() {
  realFileBtn.click();
});

realFileBtn.addEventListener("change", function() {
  if (realFileBtn.value) {
    customTxt.innerHTML = realFileBtn.value.match(
      /[\/\\]([\w\d\s\.\-\(\)]+)$/
    )[1];
  } else {
    customTxt.innerHTML = "No file chosen, yet.";
  }
});
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
		<h3 id="loginhead">Add Announcement</h3>
		<form:form action="Addannouncement" method="post" modelAttribute="user" enctype="multipart/form-data" >
			<input type="text" class="login-input-box" name= "announcement_name" id="announcement_name" placeholder="Announcement Name" required>
			
			<input type="file" name="file" id="real-file" hidden="hidden" />
<button type="button" id="custom-button" onclick="myFunction1()">CHOOSE A FILE</button>
<span id="custom-text">No file chosen, yet.</span>
			<button type="submit" class="loginbut">Add Announcement</button>
			<form:errors path="anceName" cssStyle="color:red">${message }</form:errors>


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