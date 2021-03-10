<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.member.*, java.util.*" %>    
<jsp:useBean id="ydto" class="yagaja.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ydto"/>    
<jsp:useBean id="ydao" class="yagaja.member.MemberDAO"></jsp:useBean>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
ArrayList<MemberDTO> arr=ydao.idsr(name, email);
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
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section id="loginSection">
<article>
	<div class="idsearchResult">
		<form name="fm" action="/yagaja/member/login.jsp">
			<h3>아이디찾기</h3>
			<table class="idSearchResult">
				<% 
				if(arr.size()==0){
					%>
					<tr>
					<td>고객님의 정보와 일치하는 아이디가 없습니다.</td>
					</tr>
					<% 
				}else {
				%>
					<tr>
					<td>고객님의 정보와 일치하는 아이디 목록입니다.</td>
					</tr>
					<tr></tr>
					<%
				}
				 %>
				 
					<% 
					for(int i=0;i<arr.size();i++){
					%>
					<tr>
						<td colspan="2"><input type="radio" name="userid" value="userid1"><%=arr.get(i).getId() %></td>
						<td>가입:<%=arr.get(i).getJoindate() %> </td>
					</tr>
						<% 		
					}
					%>
				<tr>
					<td colspan="2">
					<input type="submit" value="로그인하기">
					<input type="button" value="비밀번호 찾기" onclick="location.href='pwdSearch.jsp'"></td>
				</tr>
			</table>
		</form>
	</div>
</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>