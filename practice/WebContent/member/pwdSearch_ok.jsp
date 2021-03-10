<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%
Random rd=new Random();
int random=rd.nextInt(9000)+1000;
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	direction: 1tr;
	line-height: 1.34;
	margin: 0px;
	height: 300px;
	unicode-bidi: embed;
	background-color: #f0f2f5;
}
#footer {
	text-align: center;
}
#loginSection{ /*공통 바디 세션영역*/
	height: 450px;
	width: 900px;
	margin: 100px auto;	
}
.naya{
	width:570px;
}
.pwdsearch{
	display: table;
	margin: 0px auto;
}
</style>
<script>
function button(){
	var id=document.fm.id.value;
	var email=document.fm.email.value;
	
	if(id==""||email==""){
		window.alert('아이디와 이메일을 입력해주세요.');
	}else {
		window.alert('인증번호는 <%=random%> 입니다.');
	}
}

function injeungNum(){
	var bigyo=document.fm.injeung.value;
	
	var id=document.fm.id.value;
	var email=document.fm.email.value;
	
	if(id==""){
		window.alert('아이디를 입력해주세요.');
		return;
	}else if(email==""){
		window.alert('이메일을 입력해주세요.');
		return;
	}
	
	if(bigyo==<%=random%>){
		document.fm.submit();
	}else {
		window.alert('인증번호를 확인해주세요.');
		location.href='/yagaja/member/pwdSearch.jsp';
	}
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section id="loginSection">
	<article>
		<div class="pwdsearch">
		<form name="fm" action="/yagaja/member/pwdSearch_ok.jsp">
			<h3>ㅇ본인확인 인증</h3>
			<table class="naya">
				<caption>아이디와 이메일, 입력한 인증번호가 동일한 경우 비밀번호 찾기가 가능합니다.</caption>
				<tr></tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" size="20" required="required" ></td>
				</tr>
				<tr></tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" size="20" required="required"></td>
				</tr>
				<tr></tr>
				<tr>
				<td></td>
					<td><input type="text" name="injeung" placeholder="인증번호 4자리 숫자입력" onfocus="this.placeholder= ''" 
				onblur="this.placeholder= '인증번호 4자리 숫자입력'" required="required" size="20">
				<input type="button" value="인증번호 받기" onclick="button();">
				</td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
				<td></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name="ok" value="확인" onclick="injeungNum();">
				<input type="button" value="취소" onclick="location.href='/yagaja/member/login.jsp'"></td>
				</tr>
			</table>
		</form>
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>