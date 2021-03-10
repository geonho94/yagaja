<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="yagaja.content.*" %>
<%@ page import="yagaja.review.*" %>
<jsp:useBean id="cdao" class="yagaja.content.ContentDAO" scope="session"></jsp:useBean>
<jsp:useBean id="rdao" class="yagaja.review.ReviewDAO" scope="session"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/yagaja/css/mainTop.css">
<style>
	body{
		margin: 0px auto;
	}
	section{
		width: 900px;
		margin: 0px auto;
	
	}
</style>
</head>
<%
String userid = (String)session.getAttribute("yid");
if(userid==null){
	%>
	<script>
	window.alert('로그인이 필요합니다.');
	location.href='/yagaja/member/login.jsp';
	</script>
	<%
}

String idx_s = request.getParameter("idx");
if(idx_s==null){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	location.href='content_List.jsp';
	</script>
	<%
	return;
}
int idx = Integer.parseInt(idx_s);
ContentDTO dto = cdao.getContent(idx);
if(dto==null){
	%>
	<script>
	window.alert('게시물이 존재하지 않습니다.');
	location.href='content_List.jsp';
	</script>
	<%
	return;
}
%>
<body>
<div class="bg_black" id="bg_black"></div>
<%@include file="/header.jsp" %>
<section>
<%
if(userid.equals("admin")){
	%>
	<input type="button" value="수정하기" onclick="location.href='/yagaja/admin/ContentUpdate.jsp?idx=<%=idx %>'">
	<input type="button" value="삭제하기" onclick="location.href='/yagaja/admin/ContentUpdate.jsp?idx=<%=idx %>&ref=<%=dto.getRef() %>'">
	<%
}
%>
	<article>
		<div class="main">
			<div class="img_contaner">
			<%
			String imgs[] = dto.getImage().split(",");
			for(int i=0; i<imgs.length; i++){
				%>
				<div>
					<img src="/yagaja/admin/upload/<%=dto.getRef() %>/<%=imgs[i] %>">
				</div>
				<%
				System.out.println("/yagaja/admin/upload/"+dto.getRef()+"/"+imgs[i]);
			}
			%>			
			</div>
			<div class="content_title">
			<h2><%=dto.getSubject() %></h2>
			<i class="star"></i><%=dto.getStar() %>
			<i class="readnum"></i><%=dto.getReadnum() %>
			<i class="reviewnum"></i><%=dto.getReviewnum() %>
			<i class="likenum"></i><%=dto.getLikenum() %>
			<input type="checkbox" name="like">
			</div>
			<div class="content_main" style="overflow: auto;">
				<table>
					<tr>
						<th>주 내용</th>
						<td>
						<%=dto.getContent() %>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%=dto.getLocation() %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=dto.getTel() %></td>
					</tr>
					<tr>
						<th>영업시간</th>
						<td><%=dto.getRunningtime() %></td>
					</tr>
				</table>
			</div>
	</article>
	<article>
		<style>
		.bg_black{
        position: absolute;
        width: 100%;
        height: 200%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        bottom: 0;
        z-index: 1;
        display:none;
    	}
		.write_review{
		display: none;
        width: 500px;
        height: 300px;
        position: fixed;
        top: 50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
		}
		.review_close{
        width: 26px;
        height: 26px;
        position: absolute;
        top: -30px;
        right: 0;
    	}
		</style>
		<script>
		function review_onclick(){
			document.getElementById('bg_black').style.display='block';
			document.getElementById('write_review').style.display='block';
		}
		function review_offclick(){
			document.getElementById('bg_black').style.display='none';
			document.getElementById('write_review').style.display='none';
		}
		</script>
		<!-- 리뷰 작성 내역 -->
		<input type="text" onclick="review_onclick()">
		<div class="write_review" id="write_review">
			<div class="review_close"><a href="javascript:review_offclick();">X</a></div>
			<form name="fm" action="content_review.jsp">
				<!-- 별점 선택, 나중에 CSS 먹여야함 -->
				<input type="radio" name="star" value="1">
				<input type="radio" name="star" value="2">
				<input type="radio" name="star" value="3" checked>
				<input type="radio" name="star" value="4">
				<input type="radio" name="star" value="5">
				<br>
				
				<!-- 파일 선택하는 곳 및 파일 선택한거 출력해주는 곳 -->
				<input type="file">
				<br>
				
				
				<textarea name="content" style="width:100%; height:80%;"></textarea>
				<input type="submit" value="작성">
			</form>
		</div>
		
		
		<!-- 리뷰 내용 영역 -->
		<div class="content_review">
		<%
		ArrayList<ReviewDTO> al = rdao.getReview(idx);
		%>
		</div>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>

























