<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

session.setAttribute("yid", "admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	var temp = document.getElementsByName('city');
	window.alert(temp.length);
}
</script>
</head>
<body>
<form action="content_List.jsp">
	<input type="checkbox" name="city" value="서울" checked>
	<input type="checkbox" name="city" value="경기">
	<input type="checkbox" name="city" value="강원도">
	<input type="checkbox" name="city" value="충북">
	<input type="checkbox" name="city" value="충남">
	<input type="checkbox" name="city" value="경북">
	<input type="checkbox" name="city" value="경남">
	<input type="checkbox" name="city" value="전북/전남"><br>
	<input type="checkbox" name="gu" value="도심권" checked>
	<input type="checkbox" name="gu" value="서북권">
	<input type="checkbox" name="gu" value="서남권">
	<input type="checkbox" name="gu" value="동북권">
	<input type="checkbox" name="gu" value="동남권"><br>
	<input type="checkbox" name="thema" value="드라이브" checked>
	<input type="checkbox" name="thema" value="맛집">
	<input type="checkbox" name="thema" value="3">
	<input type="checkbox" name="thema" value="4">
	<input type="checkbox" name="thema" value="5">
	<input type="checkbox" name="thema" value="6"><br>
	<input type="checkbox" name="111" value="1"><br>
	<input type="submit" value="rr">
	<input type="button" value="bt" onclick="check();">
</form>
<style>
.icon_readnum{
				width: 170px;
    			height: 170px;
				background-image: url("/yagaja/img/readnum.png");
				display: inline-block;
    			vertical-align: middle;
}
.heart { 
}
.heart + label { 
				width: 170px;
    			height: 170px;
	display: inline-block; 
	cursor: pointer; 
	background: url('/yagaja/img/like.png') no-repeat; 
}
.heart:checked + label { 

	background-image: url('/yagaja/img/likenum.png'); 
}

</style>
<input type="checkbox" class="heart" name="like" ><label for=""></label>
</body>
</html>