<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
	<title>NITK </title>
	
	<link rel="stylesheet" href="style/homestyle.css">
<script src="https://kit.fontawesome.com/06a408d3d5.js" crossorigin="anonymous"></script>
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
	
    <div class="slider-box">
        <div id="slider">
            <img class="myslide" src="images/nirf.JPG" alt="">
            <img class="myslide" src="images/campusLife.JPG" alt="">
            <img class="myslide" src="images/awards.JPG" alt="">
            <img  class="myslide"src="images/vidhyug.JPG" alt="">
        </div>
        <div class="indicators">
        <span class="dot" id="btn1" onclick="currentSlide(1)"></span>
        <span class="dot" id="btn2" onclick="currentSlide(2)"></span>
        <span class="dot" id="btn3" onclick="currentSlide(3)"></span>
        <span class="dot" id="btn4" onclick="currentSlide(4)"></span>
        </div>
    </div>
 <div class="below_slider">
        <div id="ranking">
            <h2>Rankings</h2>
            <div class="b1">
                <span class="nirf_eng_rank_L">
                    <span class="eng_rank_digit">10</span>
                    <span class="eng_rank_word">RANK</span>
                </span>
                <span class="nirf_eng_rank_R">
                    NIRF Engineering
                </span>
            </div>
            <div class="b2">
                <span class="nirf_overall_rank_L">
                    <span class="overall_rank_digit">32</span>
                    <span class="overall_rank_word">RANK</span>
                </span>
                <span class="nirf_overall_rank_R">
                    NIRF Overall
                </span>
            </div>
            <div class="b3">
                <span class="qs_india_rank_L">
                    <span class="qs_india_rank_digit">63</span>
                    <span class="qs_india_rank_word">RANK</span>
                </span>
                <span class="qs_india_rank_R">
                    QS India
                </span>
            </div>
        </div>

        <div id="news">
            <h2>News and Updates</h2>
            <div class="c1">
                <span class="news_date1">
                   NOV 12, 2021
                </span>
                <span class="news_text1">
                    <a href="images/news1.pdf">NITK Faculty Researchers in Stanford University List of Top 2% Scientist</a>
                </span>
            </div>
            <div class="c2">
                <span class="news_date2">
                   NOV 03, 2021
                </span>
                <span class="news_text2">
                    <a href="images/news2.pdf">Doctor of Science for Sri Suhas Yathiraj & an interview with him</a>
                </span>
            </div>
            <div class="c3">
                <span class="news_date3">
                    OCT 28, 2021
                </span>
                <span class="news_text3">
                    <a href="images/news3.pdf">Prof. D. Krishna Bhat is awarded as highly cited author</a>
                </span>
            </div>
            <div class="c4">
                <span class="news_date4">
                    OCT 04, 2021
                </span>
                <span class="news_text4">
                    <a href="images/news4.pdf">Indian Patent has been granted to Dr. Hari Prasad Dasari and his team</a>
                </span>
            </div>
        </div>
    </div>
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
   
    <script>
        
        var slideIndex = 1;
        var timer = null;
        showSlides(slideIndex);

        function plusSlides(n) {
          clearTimeout(timer);
          showSlides(slideIndex += n);
        }

        function currentSlide(n) {
          clearTimeout(timer);
          showSlides(slideIndex = n);
        }

        function showSlides(n) {
          var i;
          var slides = document.getElementsByClassName("myslide");
          var dots = document.getElementsByClassName("dot");
          if (n==undefined){n = ++slideIndex}
          if (n > slides.length) {slideIndex = 1}
          if (n < 1) {slideIndex = slides.length}
          for (i = 0; i < slides.length; i++) {
              slides[i].style.display = "none";
          }
          for (i = 0; i < dots.length; i++) {
              dots[i].className = dots[i].className.replace(" active", "");
          }
          slides[slideIndex-1].style.display = "block";
          dots[slideIndex-1].className += " active";
          timer = setTimeout(showSlides, 3000);
        } 

    </script>
	   
</body>
</html>
