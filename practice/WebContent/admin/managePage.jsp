<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.member.*" %>
<!-- ------------------------장지웅이 추가함----------------------------------- -->
<%
MemberDTO user = (MemberDTO)session.getAttribute("user"); // 이게 로그인 시 생성되는 유저정보 세션이에요
if(user==null){
	%>
	<script>
	window.alert('로그인이 필요합니다.');
	location.href='/yagaja/member/login.jsp';
	</script>
	<%
	return;
}
String id = user.getId(); // 이게 유저의 아이디를 받아온거에요 
%>
<!-- ---------------------------------------------------------------- -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type = "text/css" href = "/yagaja/css/mainLayout_yagaja.css">
</head>
<body>
<%@include file = "/header.jsp" %>
<%
if(id == null)
{
	%>
	<script>
	window.alert('로그인 후 이용해주세요.');
	location.href = '/yagaja/member/login.jsp'
	</script>
	<%
	return;
}


if(!id.equals("admin"))
{
	%>
	<script>
	window.alert('관리자 계정이 아닙니다.');
	location.href = '/yagaja/zone/city.jsp';
	</script>
	<%
}
%>
<section id = "loginSection">
<article>
<fieldset>
<legend>관리자 페이지</legend>
<ul id = "adminUl">
<li><a href = "/yagaja/admin/ContentAdd.jsp">게시글 작성</a></li>
<li><a href = "/yagaja/admin/ContentUpdate.jsp">게시글 수정</a></li>
<li><a href = "/yagaja/admin/ContentDelect.jsp">게시글 삭제</a></li>
<li><a href = "/yagaja/admin/MemberList.jsp">회원 관리</a></li>
</ul>
</fieldset>
</article>
</section>
<%@include file = "/footer.jsp" %>
</body>
</html>