<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" type="text/css" href="/yagaja/css/mainLayout_yagaja.css">
<script type="text/javascript">
function openIdCheck(){
	window.open('idCheck.jsp','idCheck','width=400,height=350,left=750,top=350');
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section id="loginSection">
	<article>
		<div class="memberjoin">
		<form name="memberjoin" action="/practice/member/memberJoin_ok.jsp">
			<table>
				<tr>
				<th>야 가자!</th>
				</tr>
				<tr>
					<td><input type="text" name="id" placeholder="아이디" onclick="openIdCheck();"></td>
			
				</tr>
				
				<tr>
					<td><input type="password" name="pwd" placeholder="비밀번호" onfocus="this.placeholder= ''" 
					onblur="this.placeholder= '비밀번호'" required="required" maxlength="16">
					<td>
				</tr>
				
				<tr>
					<td><input type="text" name="name" placeholder="이름" onfocus="this.placeholder= ''" onblur="this.placeholder= '이름'" required="required" ></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="이메일" onfocus="this.placeholder= ''" onblur="this.placeholder= '이메일'" required="required"></td>
				</tr>
				<tr>
					<td><input type="text" name="tel" placeholder="전화번호" onfocus="this.placeholder= ''" onblur="this.placeholder= '전화번호'" required="required"></td>
				</tr>
				<tr>
					<td><input type="submit" value="가입하기"></td>
				</tr>
				<tr>
					<td>야 가자!에 가입하시면 약관 및 데이터 정책, 쿠키 정책에 동의하는 것으로 간주됩니다.</td>
				</tr>
				<tr>
					<td>계정이 있으신가요?<a href="/practice/member/login.jsp">로그인</a></td>
				</tr>
			</table>
		</form>
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>