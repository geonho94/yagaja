<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.member.*" %>
<%
MemberDTO user = (MemberDTO)session.getAttribute("user"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2{
	text-align: center;
}
.company_check{
	margin:0px auto;
	border: 1px solid gray;
	margin-top: 55px;
}
#check_1,#check_2{
	border: 1px solid gray;
	font-size: 35px;
}
.ez_come{
	display: table;
	margin: 100px auto;
}
#ez_1,#ez_2{
display: table-cell;
}
#ez_1 img{
 width: 300px;
}
#ez_2 img{
 width: 900px;
}
</style>

</head>
<body>
<%
if(user!=null)
{
   %>
<%@include file="header_login.jsp" %>
<%
}else{
%>
<%@include file="header_notlogin.jsp" %>
<%} %>

<section>
<article>
<h2>찾아오는 길</h2>
<table class="company_check"><th id="check_1"><a href="#">서울본사</a></th><th id="check_2"><a href="#">그 외</a></th></table>

<div class="ez_come">
<div id="ez_1"><img src="/practice/img/ezmap1.png"></div>
<div id="ez_2"><img src="/practice/img/ezmap2.png"></div>

</div>


</article>
</section>

<%@include file="footer.jsp" %>
</body>
</html>