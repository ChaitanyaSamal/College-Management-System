<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>NITK </title>
	
	<link rel="stylesheet" href="style/announce_style.css">
	<script src="https://kit.fontawesome.com/06a408d3d5.js" crossorigin="anonymous"></script>
<style type="text/css">
h3 {
	padding: 50px;
	text-transform: uppercase;
	color: #3D0000;
}

.adminclass{
margin-left: 50px;
margin-bottom: 30px;
}

</style>
</head>
<script>
$(document).ready(function () {
	
	$(document.body).on("click","tr[data-href]",function (){
		window.location.href=this.dataset.href;
	});
	
});

</script>
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
	
    <div class="First">
    
        <img id="FirstImg" src="images/cse.jpg" height="467" width="1600">
    </div>
<div><h3>WELCOME ${username} </h3>
<c:if test="${admin=='Y'}">
<h3>As Admin you can perform following operations : </h3>
<button onclick="location.href='addannouncement'" type="button" class="adminclass">
        Add Announcement</button>
 <button onclick="location.href='addadmin'" type="button" class="adminclass">
        Add Admin</button>
         <button onclick="location.href='viewusers'" type="button" class="adminclass">
        View Users</button>
 </c:if>       
</div>
    <h3>Announcements </h3>
    
    <table border="3" class="table table-striped table-hover">
		<thead>
			<tr class="tr">
				<th>Announcements</th>
				<th>Date</th>
				<th>Document</th>
				

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${publicAnnouncements}" var="anmt">
				<tr>
					<td>${anmt.announcement_name}</td>
					<td>${anmt.announcement_time }</td>
					<td><a href="<c:url value="${anmt.announcement_path}" />" target="_blank" class="dbutton">Download</a></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="contact">
		<div class="d">
			<span class="contact">NITK Surathkal</span>
			<span class="address">NH 66, Srinivasnagar <br> Surathkal, Mangalore Karnataka 575025</span>
			<span class="phone">0824 2474000</span>
			<span class="mail">
				<a href="mailto:registrar@nitk.ac.in">registrar@nitk.ac.in</a>
			</span>
		</div>
	</div>
</body>
</html>