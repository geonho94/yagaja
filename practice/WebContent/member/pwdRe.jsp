<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
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
.pwdSR{
	width:570px;
}
.pwdsearchResult{
	display: table;
	margin: 0px auto;
}
</style>

<script>
function pwdCheck(){
	var pwd=document.fm.pwd.value;
	var newpwd=document.fm.newpwd.value;
	if(pwd==newpwd){
		document.fm.submit();
	}else {
		window.alert('비밀번호를 다시 입력해주세요.');
	}
}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section id="loginSection">
<article>
	<div class="pwdsearchResult">
	<form name="fm" action="/yagaja/member/pwdRe_ok.jsp">
	<input type="hidden" name="id" value="<%=id%>">
		<h3>비밀번호 재설정</h3>
		<table class="pwdSR">
			<caption>자신만의 안전한 비밀번호로 변경해 주세요.</caption>
		<tr></tr>
		<tr>
			<td>아이디: <%=id %></td>
			<tr></tr>
			<tr>
			<td><input type="password" name="pwd" placeholder="새 비밀번호" onfocus="this.placeholder= ''" 
				onblur="this.placeholder= '새 비밀번호'" required="required" size="20" >
			</td>
		</tr>
		<tr>
			<td><input type="password" name="newpwd" placeholder="새 비밀번호 확인" onfocus="this.placeholder= ''" 
				onblur="this.placeholder= '새 비밀번호 확인'" required="required" size="20" >
			</td>
		</tr>
		<tr>
			<td><input type="button" value="확인" onclick="pwdCheck();"></td>
		</tr>
		</table>
	</form>
	</div>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>