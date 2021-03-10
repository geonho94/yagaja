<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
themaSelect {
width:1096px;
height:600px;
margin:0px auto;
}
.themaSelect table {
border: 1px solid white;
width:900px;
height:600px;
margin: 0px auto;
text-align:center;
}
</style>
</head>
<body>
<%@include file = "/header.jsp" %>
<section>
	<article>
	<form name="fm" action="/yagaja/content/content_List.jsp">
		<div>
			<table>
				<tr>
					<td><a href="javascript:document.fm.submit();">전체</a></td>
					<td><a href="javascript:document.fm.submit();">맛집</a></td>
					<td><a href="javascript:document.fm.submit();">커피/디저트</a></td>
				</tr>
				<tr>
					<td><a href="javascript:document.fm.submit();">축제</a></td>
					<td><a href="javascript:document.fm.submit();">드라이브</a></td>
					<td><a href="javascript:document.fm.submit();">영화</a></td>
				</tr>
				<tr>
					<td><a href="javascript:document.fm.submit();">숙소/공간대여/레저</a></td>
					<td><a href="javascript:document.fm.submit();">이색데이트</a></td>
					<td><a href="javascript:document.fm.submit();">공연/예술</a></td>
				</tr>
			</table>
		</div>
	</form>
	</article>
</section>
<%@include file = "/footer.jsp" %>
</body>
</html>