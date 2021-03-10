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
.main_company{
	text-align: center;
	color: #555555;
	    margin-bottom: 100px;
	    margin-top: 30px;
}
#main_company_1{
	float: left;
	 margin-left: 10%;
	 text-align: left;
	 font-size: 20px;
}
#main_company_2{
	 margin-left: 54%;
	 text-align: left;
}
#main_company_2_1{
	font-size: 20px;
}
#main_company_2{
font-size: 15px;
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
<h2>회사소개</h2>
<img src="/practice/img/company.png" style="width:100%; height:100%;">
<div class="main_company">
	<div id="main_company_1">언제 어디서든, 누구와 특별한 시간을<br>'야가자' 컴퍼니가 실패없는 시간을 약속드립니다. </div>
	<div id="main_company_2"><span id="main_company_2_1">'야가자'를 사랑해주시는 고객 여러분</span><br>'야가자'는 기업의 건정성을 바탕으로 정직한 경영을 통해 고객과의<br>
	신뢰를 쌓고 철저한 봉사 정신으로 고객에게 진심을 다해야 한다고 생각합니다.<br><br>
	'야가자'는 고객과의 약속을 최우선으로 여기는 기업 정신으로 인생의 가장<br>
	 특별한 순간을 지키는 파트너가 되겠습니다.
	 항상 여러분에게 사랑과 행복이<br>
	가득하시길 기원합니다.</div>
</div>
</article>
</section>

<%@include file="footer.jsp" %>
</body>
</html>