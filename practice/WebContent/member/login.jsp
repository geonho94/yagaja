<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.member.*" %>
<!-- ------------------------장지웅이 추가함----------------------------------- -->
<%
MemberDTO user = (MemberDTO)session.getAttribute("user"); // 이게 로그인 시 생성되는 유저정보 세션이에요
if(user!=null){
	%>
	<script>
	location.href='/practice/zone/city.jsp';
	</script>
	<%
	return;
}
%>
<!-- ---------------------------------------------------------------- -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" type="text/css" href="/pract/css/mainLayout_yagaja.css">
</head>
<body>
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
<section id="loginSection">
	<article>
	<div class="left">
	<form>
		<table>
			<tr>
				<th>야 가자!</th>
			</tr>
			<tr>
				<td>내 기분은 내가 정해.</td>
			<tr>
			<td>오늘 나는 "야 가자!"로 할래</td>
			</tr>
			
		</table>
	</form>
	</div>
	
	<div class="right">
		<form name="fm" action="login_ok.jsp">
			<table>
				<tr>
					<td><input type="text" name="id" placeholder="아이디" onfocus="this.placeholder= ''" onblur="this.placeholder= '아이디'" 
					required="required" maxlength="10"></td>
				</tr>
				
				<tr>
					<td><input type="password" name="pwd" placeholder="비밀번호" onfocus="this.placeholder= ''" 
					onblur="this.placeholder= '비밀번호'" required="required" maxlength="16">
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인"></td>
				</tr>
				<tr>
					<td colspan="2">
					<a href="idSearch.jsp">아이디 찾기</a>
					<a href="pwdSearch.jsp">비밀번호 찾기</a></td>
				</tr>
				<tr>
					<td><input type="button" value="회원가입" onclick="location.href='memberJoin.jsp'"></td>
				</tr>
			</table>
		</form>
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>