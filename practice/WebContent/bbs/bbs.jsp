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


body {
font-family: monospace;
}

h5,h2,h6{
	text-align: center;
}
#bbs_menu{
	text-align: center;
	background-color: #F4F5EF;
	
}
#bbs{
	background-color: #F7D6D5;
	overflow: hidden;
}


table td{
	text-align: center;
}
table{
width: 550px;
border-top: 3px  rgb(224,224,224);
border-bottom: 3px  rgb(224,224,224);
margin: 0px auto;
}

table th{
background-color: rgb(294,294,294);
border-top: 3px  rgb(224,224,224);
border-bottom: 3px  rgb(224,224,224);
}
#se{
	 border-radius:8px;
}
#text-box{
	text-align: right;
}
#f-end{
padding-bottom:100px;
}
</style>
<%
String num_s="1";
int num=Integer.parseInt(num_s);
String key=request.getParameter("key");
String value=request.getParameter("value");
if(key==null){
	key="";
	value="";
}

int totalCnt=ydao.getTotalCnt(num);//db로부터 가져온 데이터
int listSize=10;//보여줄 리스트 수
int pageSize=5;// 보여줄 페이지 수
if(key.equals("writer")){
	totalCnt=ydao.getTotalCnt_w(num, value);
}else if(key.equals("subject")){
	totalCnt=ydao.getTotalCnt_s(num, value);
}
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);//현재 사용자 위치

int totalPage=(totalCnt/listSize)+1;//총페이지
if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;


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
	<h2>게시판</h2>
	<form action="bbs.jsp">
	<article>
	<table>
	<tr>
		<th colspan="6">
		<div id="text-box">
		<select name="key">
		<option value="" selected="selected">전체</option>
		<option value="subject">제목</option>
		<option value="writer">작성자</option>
		</select>
		<input type="text" name="value" id="se"><input type="submit" value="검색">
		</div>
		<%
		
		
		ArrayList<BbsDTO> list=ydao.contentList(num,cp,listSize,key,value);
		%>
		</th>
	</tr>
	</form>
			
			<tr>
				<th >번호</th>
				<th >제목</th>
				<th >작성자</th>
				<th >등록일</th>
				<th >조회수</th>
			</tr>
			
			<%
			
			if(list==null||list.size()==0){
			%>
			<tr>
				<td colspan="5" align="center">
					등록된 게시물이 없습니다.
				</td>
			</tr>
			<%}else{ 
				for(int i=0; i<list.size();i++){
				
			
			%>
			<tr>
				<td><%=list.get(i).getIdx()%></td>
				<td><a href="bbsContent.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getSubject()%></a></td>
				<td><%=list.get(i).getWriter()%></td>
				<td><%=list.get(i).getJoindate()%></td>
				<td><%=list.get(i).getCount()%></td>
			</tr>
			<%
				}
			}
			%>
			
			<form name="bbs" action="bbsWrite.jsp">
			<tr>
				<th colspan="4"></th>
				<th colspan="1"><input type="submit" value="글쓰기"></th>
			</tr>
			</form>
			<tr>
			<th colspan="5" id="f-end">
			<%
			if(userGroup!=0){
			%>
			<a href="bbs.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
			<%
			}
			%>

			<%
			for(int i=(userGroup*pageSize)+1;
			i<=(userGroup*pageSize)+pageSize;i++){
			%>
			&nbsp;&nbsp;<a href="bbs.jsp?cp=<%=i%>&key=<%=key%>&value=<%=value%>"><%=i %></a>&nbsp;&nbsp;
			<%
			if(i==totalPage){
				break;
			}
			}
			%>

			<%
			if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
			%><a href="bbs.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
			}
			%>
			</th>
			</tr>
			
	</table>
	</article>
	
</section>
<%@include file="../footer.jsp" %>
</body>
</html>
