<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.bbs.*" %>
<%@ page import="yagaja.comment.*" %>
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
<jsp:setProperty property="*" name="ydto"/>
<jsp:useBean id="ydao" class="yagaja.bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="yadto" class="yagaja.comment.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="yadto"/>
<jsp:useBean id="yadao" class="yagaja.comment.CommentDAO" scope="session"></jsp:useBean>
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
#repair_1{
	text-align: left;
}
</style>


<%
/* int idx=Integer.parseInt(request.getParameter("idx")); */

String idx_s=request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}

int idx=Integer.parseInt(idx_s);
//조회수 관련 메서드 자리
BbsDTO dto=ydao.bbsContent(idx);
if(dto==null){
	%>
	<script type="text/javascript">
	window.alert('삭제된 게시글이거나 잘못된 접근입니다.');
	location.href="bbs.jsp";
	</script>
	<%
	return;
}
%>

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
		<h2>게시판 본문</h2>
		<form name="bbsContent" action="bbsContent_update_ok.jsp">
			<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
		<table>
		<caption>게시판 본문</caption>
		<thead>

			<tr>
				<th id="repair_1">제목</th>
				<td><input id="text_all" type="text" size="80" name="subject" value="<%=dto.getSubject()%>"><td>
			</tr>
			
			<tr height="250">
				<td colspan="2"><textarea id="text_all" rows="15" cols="85" name="content"><%=dto.getContent().replaceAll("\n", "<br>") %></textarea> </td>
				<%-- <td colspan="4"><pre><%=dto.getContent() %></pre></td> --%>
			</tr>
			
			<tr>
				<th colspan="2">
				<input type="submit" value="수정">
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

