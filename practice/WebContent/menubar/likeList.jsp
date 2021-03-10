likeList.jsp

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	border: 1px solid black;
}

table {
	margin: 0px auto;
	border: 1px solid black;
	width: 70%;
	height: 200px;
}

table th, td {
	border: 1px solid black;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<section>
		<article>
			<div></div>
			<div>
				<input type="button" value="맛집"> <input type="button"
					value="커피/디저트"> <input type="button" value="축제"> <input
					type="button" value="드라이브"> <input type="button" value="영화">
				<input type="button" value="공연/예술"> <input type="button"
					value="이색데이트">
			</div>
		</article>
		<article>
			<div>
				<h2>게시글 들어갈 장소</h2>
				<table>
					<tr>
						<th>사진 및 제목</th>
						<th>♡</th>
						<th>제목</th>
						<th>별점</th>
					</tr>
					<tr>
						<td>사진</td>
						<td>하트</td>
						<td>제목</td>
						<td>별점</td>
					</tr>
				</table>
			</div>
		</article>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>
