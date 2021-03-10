<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type = "text/css" href = "/yagaja/css/mainLayout_yagaja.css">
</head>
<body>
<%@ include file = "/header.jsp" %>
<section id="loginSection">
<article>
<h2 align = "center">게시글 작성</h2>
<form id="ContentAdd_form" name = "ContentAdd_fm" action = "/yagaja/admin/ContentAdd_ok.jsp" method="post" enctype="multipart/form-data">
<table>
<tr>
<td colspan = "4">
<label>시</label>
<select name = "city">
<option value="서울" selected>서울</option>
<option value="경기">경기</option>
<option value="강원도">강원도</option>
<option value="충북">충북</option>
<option value="충남">충남</option>
<option value="경북">경북</option>
<option value="경남">경남</option>
<option value="전북/전남">전북/전남</option>
</select>
<label>지역</label>
<select name = "gu">
<option value="서북권" selected>서북권</option>
<option value="서남권">서남권</option>
<option value="도심권">도심권</option>
<option value="동북권">동북권</option>
<option value="동남권">동남권</option>
</select>
<label>테마</label>
<select name = "thema">
<option value="전체" selected>전체</option>
<option value="맛집">맛집</option>
<option value="커피/디저트">커피/디저트</option>
<option value="축제">축제</option>
<option value="드라이브">드라이브</option>
<option value="영화">영화</option>
<option value="숙소/공간대여/레저">숙소/공간대여/레저</option>
<option value="공연/예술">공연/예술</option>
</select>
</td>
</tr>
<tr>
<th>제목</th>
<td><input type="text" name = "subject"></td>
<th>전화번호</th>
<td><input type="text" name = "tel"></td>
</tr>
<tr>
<th>위치</th>
<td><input type = "text" name = "location"></td>
<th>영업시간</th>
<td><input type = "text" name = "runningtime"></td>
</tr>
<tr>
<td colspan = "4">
<textarea rows="15" cols="100" name = "content"></textarea>
</td>
</tr>
<tr>
<td>사진 업로드</td>
<td><input type = "file" name = "fileup[]" multiple="multiple"></td>
</tr>
<tr>
<td colspan = "4"><span id = "uploadlist"></span>
</td>
</tr>
<tr>
	<td>
	<input type = "submit" value = "작성 완료 및 파일 올리기">
	<input type = "reset" value = "다시  작성">
	</td>
</tr>
</table>
</form>
</article>
</section>
<%@ include file = "/footer.jsp" %>
</body>
</html>