<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.bbs.*" %>
<%@ page import="java.util.*" %>
<!-- ------------------------장지웅이 추가함----------------------------------- -->
<%@ page import="yagaja.member.*" %>
<%
MemberDTO user = (MemberDTO)session.getAttribute("user"); // 이게 로그인 시 생성되는 유저정보 세션이에요
if(user==null){
	%>
	<script>
	window.alert('로그인이 필요합니다.');
	location.href='/practice/member/login.jsp';
	</script>
	<%
	return;
}
String id = user.getId();// 이게 유저의 아이디를 받아온거에요 
%>
<!-- ---------------------------------------------------------------- -->
<jsp:useBean id="ydto" class="yagaja.bbs.BbsDTO"></jsp:useBean>
<jsp:useBean id="ydao" class="yagaja.bbs.BbsDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" type="text/css" href="/myweb/css/mainLayout_yagaja.css">
<style type="text/css">
h5,h2,h6{
	text-align: center;
}

table td{
	text-align: left;
}

table{
border: 1px solid gray;
border-radius:12px;
width: 600px;
	margin: 0px auto;
}


table th{
background-color: rgb(294,294,294);

}
caption {
	visibility: hidden;
}

#text_all{
	border-radius:12px;
}
</style>
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

<section>
	<article>
		<h2>글쓰기</h2>
		<form name="bbsWrite" action="bbsWrite_ok.jsp">
		<input type="hidden" name="writer" value="<%=user.getId() %>">
		<input type="hidden" name="userimg" value="<%=user.getImg() %>">
		<input type="hidden" name="num" value="1">
		<table  class="noticeWrite">
		<caption>글쓰기</caption>
		<thead>
			<tr>
				<th>제목</th>
				<div>
				<td ><input id="text_all" type="text" class="textline" name="subject" size="80"></td>
				</div>
				
			</tr>
			
			<tr>
				<td colspan="2">
				<textarea id="text_all" name="content" cols="85" rows="15"></textarea></td>
			</tr>
			
			<tr>
				<th id="btn_w_2" colspan="2">
				<input id="bt" type="submit" value="작성하기">
				<input id="bt" type="reset" value="다시작성">
				</th>
			</tr>
		</thead>
		</table>
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>