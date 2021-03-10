<%@page import="yagaja.user.YagajaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>

<jsp:useBean id="ydao" class="yagaja.member.MemberDAO"></jsp:useBean>
<%

String id=(String)session.getAttribute("yid");


YagajaDTO dto=ydao.yagajaUpdateFind(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function pwdPopUp(){
	window.open('userInfoPwd.jsp','notice','width=550, height=450,left=100,top=50');
	
}
function delPopUp(){
	window.open('delInfo.jsp','notice','width=700, height=450,left=100,top=50');
	
}
</script>
<body>
<div>
	<form name="user">
		<img alt="userImage" name="userImage" src="">
		<%=id %>님	
		<input type="hidden" name="id" value="<%=id%>"> 
		
		<input type="button" value="회원정보 수정" onclick="pwdPopUp();">
		<input type="button" value="회원 탈퇴" onclick="delPopUp();">
	

	<hr>
	

이름: <%=dto.getName()%><br>
<input type="hidden" name="name" value="<%=dto.getName()%>"> 
전화번호: <%=dto.getTel()%><br>
이메일: <%=dto.getEmail() %><br>
가입날짜: <%=dto.getJoindate()%><br>
</form>
</div>
<hr>

</body>
</html>