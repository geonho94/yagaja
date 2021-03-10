<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<article>
	<div>
	<form name="userInfoUpdate" action="">
		<table>
			<h3>회원 정보 수정</h3>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="" readonly="readonly"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" value=""></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pwd1" value=""></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value=""></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">
				<input type="reset" value="다시쓰기">
				<input type="button" value="나가기" onclick="history.back(-1);"></td>
			</tr>
		</table>
		</form>
		</div>
	</article>
</section>

</body>
</html>