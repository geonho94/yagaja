<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.member.*" %>
<%
MemberDTO user=(MemberDTO)session.getAttribute("user");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


.sub-b{
   display:table;
   text-align: center;
   width: 600px;
   height: 69px;
   padding-bottom:2%;
   
   margin: 0 auto;
   
}
#title-t{
   display: table-cell;
}
.sub-b > ul > li{
   list-style: none;
   float: left;
   width: 22%;
   height: 100%;
   line-height: 50px;
   border-top:1px solid black;
   border-bottom:1px solid black;
}



* {box-sizing: border-box}
body {font-family: Verdana, monospace; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 10000px;
  position: relative;
  margin: auto;
}
/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: black;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}
/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}
.prev {
  left: 0;
  border-radius: 3px 0 0 3px;
}
/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
  border-radius: 20px;
}
/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}
#text_1,#text_2,#text_3{
margin: 24px;
    text-align: left;
    color: currentcolor;
}
#text_2{
 color: aliceblue;
 margin-left: 430px;
    margin-bottom: 156px;
}
#text_3{
margin-bottom: 119px;
}
/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
.active, .dot:hover {
  background-color: #717171;
}
/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}
@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
#main_pic{
   margin-top: 20px;
   margin-bottom: 20px;
   text-align:center;
   width: 100%;
}
.sub-section{
background-color: antiquewhite;
}
i{
	font-size: 25px;
}
#sub-1,#sub-2,#sub-3,#sub-4{
	padding-top: 5px;
}
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<script src="/css/uiScript.js"></script>


<script >
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
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
}
</script>

</head>
<body onload="currentSlide(1)">
<%
if(user!=null)
{
   %>
<%@include file="/header_login.jsp" %>
<%
}else{
%>
<%@include file="/header_notlogin.jsp" %>
<%} %>
<section>
      <article id="main_pic">
   
      <div class="slideshow-container">

         <div class="mySlides fade">
            <div class="numbertext">1 / 3</div>
             <img src="/practice/img/jmt.jpg" style="width:100%; height:100%;">
             <div class="text" id="text_1">Information on all the good Restaurants in the World<br>세상 모든 맛집 정보 </div>
         </div>

         <div class="mySlides fade">
             <div class="numbertext">2 / 3</div>
             <img src="/practice/img/wide.jpg" style="width:100%; height:100%;">
             <div class="text" id="text_2">All the Dating Spots are Here<br>모든 데이트 명소가 이곳에</div>
         </div>

         <div class="mySlides fade">
              <div class="numbertext">3 / 3</div>
              <img src="/practice/img/takephoto.jpg" style="width:100%; height:100%;">
              <div class="text" id="text_3">A Good Photo Restaurant<br>사진 맛집, 야 가자~</div>
         </div>

      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>

      </div>
         <br>

   <div style="text-align:center; margin-bottom: 50px;">
        <span class="dot" onclick="currentSlide(1)"></span> 
        <span class="dot" onclick="currentSlide(2)"></span> 
        <span class="dot" onclick="currentSlide(3)"></span> 
   </div>
    <section class="sub-section">
      <div class="sub-b">
      <div id="title-h">
      <h3>Yagaja web site Design</h3>
      <h5>너와 나 그리고 우리 모두를 위한 데이트 플렛폼. 야 가자.</h5>
      </div>
      <ul>
         <li><div id="sub-1"><a href = "/yagaja/ad/ad.jsp"><i class="fab fa-youtube"></i><br>광고</a></div></li>
         <%
         if(user==null)
         {
            %><li><div id="sub-2"><a href = "/yagaja/member/login.jsp"><i class="fas fa-user"></i><br>로그인</a></div></li><%
         }else{
            %><li><div id="sub-2"><a href = "/yagaja/admin/logOut.jsp"><i class="fas fa-user"></i><br>로그아웃</a></div></li><%
         }
         %>
         <li><div id="sub-3"><a href = "/yagaja/zone/city.jsp"><i class="fas fa-book-open"></i><br>게시판</a></div></li>
         <li><div id="sub-4"><a href = "/yagaja/csCenter/noticeList.jsp"><i class="far fa-handshake"></i><br>고객센터</a></div></li>
      </ul>
      </div>
      </section>
      </article>
   </section>
 
<%@include file="/footer.jsp" %>
</body>
</html>