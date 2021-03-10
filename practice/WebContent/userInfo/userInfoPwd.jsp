<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form name="pwd_fm" action="userInfoPwd_ok.jsp">
		<h2>비밀번호를 입력해주세요.</h2>
		<input type="password" name="pwd" placeholder="비밀번호" onfocus="this.placeholder= ''" onblur="this.placeholder= '비밀번호'" required="required">
		<input type="submit" value="확인"> <br>
		<input type="button" value="취소" onclick="opener.location.href='/yagaja/userInfo/userInfo.jsp'; window.self.close();">
     </form>      
</div>
</body>
</html>