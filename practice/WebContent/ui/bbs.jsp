<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/uiLayout.css">

</head>
<body>
<%@include file="header.jsp" %>

<div id="bbs">
	<h5>게시판</h5>
	<h6>왜그렇게 다운돼있어 뭐가 문제야 쎄이 썸띵</h6>
</div>
	<div id="bbs_menu">
	<span><a href="lightning.jsp">번개</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
	<span><a href="bbs.jsp">자유</a></span>
	</div>


<section id="loginSection">
	<h2>게시판</h2>
	<form name="bbs" action="bbsWrite.jsp">
	<article>
	<table>
	<nav class="bbs_one">
	<tr>
		<th colspan="6"><select>
		<option value="제목">제목</option>
		<option value="작성자">작성자</option>
		</select>
		<input id="se" type="text"><input type="button" value="검색">
		</th>
	</tr>
	</nav>
			<tr>
				<th colspan="1">번호</th>
				<th colspan="1">첨부파일</th>
				<th colspan="1">제목</th>
				<th colspan="1">작성자</th>
				<th colspan="1">등록일</th>
				<th colspan="1">조회수</th>
			</tr>
			
			
			
			<tr>
				<td>1</td>
				<td>o</td>
				<td>마포구에 맛집어디 있나요?</td>
				<td>노건호</td>
				<td>2020.11.18</td>
				<td>34</td>
			</tr>
			
			<tr>
				<td>2</td>
				<td>o</td>
				<td>강서구에 맛집어디 있나요?</td>
				<td>강병길</td>
				<td>2020.11.18</td>
				<td>24</td>
			</tr>
			
			<tr>
				<td>3</td>
				<td>o</td>
				<td>강남구에 맛집어디 있나요?</td>
				<td>손한슬</td>
				<td>2020.11.18</td>
				<td>54</td>
			</tr>
			<tr>
				<td>4</td>
				<td>o</td>
				<td>인천에 맛집어디 있나요?</td>
				<td>구병모</td>
				<td>2020.11.18</td>
				<td>74</td>
			</tr>
			<tr>
				<td>5</td>
				<td>o</td>
				<td>능곡에 맛집어디 있나요?</td>
				<td>장지웅</td>
				<td>2020.11.18</td>
				<td>14</td>
			</tr>
			<tr>
				<th colspan="5"></th>
				<th colspan="1"><input type="submit" value="글쓰기"></th>
			</tr>
			
			<tr>
			<th colspan="6">
			<div id="number_1">1,2,3,4,5 ></div>
			</th>
			</tr>
			
	</table>
	</article>
	</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
