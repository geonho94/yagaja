<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="idcheck" style="text-align: center;">
	<h3>아이디 중복확인</h3>
<form name="idCheck" action="idCheck_ok.jsp">
	아이디 : <input type="text" name="userid" maxlength="10">
	<input type="submit" value="중복확인">
</form>
</div>
</body>
</html>