<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="yagaja.admin.*" %>    
<jsp:useBean id="adao" class="yagaja.admin.AdminDAO"></jsp:useBean>
<!DOCTYPE html>
<%
String id = (String)session.getAttribute("yid");
if(id == null)
{
	%>
	<script>
	window.alert('로그인 후 이용해주세요.');
	location.href = '/yagaja/member/login.jsp'
	</script>
	<%
	return;
}


if(!id.equals("admin"))
{
	%>
	<script>
	window.alert('관리자 계정이 아닙니다.');
	location.href = '/yagaja/zone/city.jsp';
	</script>
	<%
	return;
}
%>
<%
String idx_s = request.getParameter("idx");
int idx = 0;
if(idx_s!=null)
{
	idx = Integer.parseInt(idx_s);
}
AdminDTO dto = adao.ContentUpdate_Select(idx);
String city = dto.getCity();
String gu = dto.getGu();
String thema = dto.getThema();


%>
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
<h2 align = "center">게시글 수정</h2>
<form name = "ContentUpdate_fm" action = "/yagaja/admin/ContentUpdate_ok.jsp">
<input type="hidden" value = "<%=idx %>" name = "idx">
<table>
<tr>
<td colspan = "4">
<label>시</label>
<select name = "city">
<option value="서울" <%=city.equals("서울")?"selected":"" %>>서울</option>
<option value="경기" <%=city.equals("경기")?"selected":"" %>>경기</option>
<option value="강원도" <%=city.equals("강원도")?"selected":"" %>>강원도</option>
<option value="충북" <%=city.equals("충북")?"selected":"" %>>충북</option>
<option value="충남" <%=city.equals("충남")?"selected":"" %>>충남</option>
<option value="경북" <%=city.equals("경북")?"selected":"" %>>경북</option>
<option value="경남" <%=city.equals("경남")?"selected":"" %>>경남</option>
<option value="전북/전남" <%=city.equals("전북/전남")?"selected":"" %>>전북/전남</option>
</select>
<label>지역</label>
<select name = "gu">
<option value="서북권" <%=gu.equals("서북권")?"selected":"" %>>서북권</option>
<option value="서남권" <%=gu.equals("서남권")?"selected":"" %>>서남권</option>
<option value="도심권" <%=gu.equals("도심권")?"selected":"" %>>도심권</option>
<option value="동북권" <%=gu.equals("동북권")?"selected":"" %>>동북권</option>
<option value="동남권" <%=gu.equals("동남권")?"selected":"" %>>동남권</option>
</select>
<label>테마</label>
<select name = "thema">
<option value="전체" <%=thema.equals("전체")?"selected":"" %>>전체</option>
<option value="맛집" <%=thema.equals("맛집")?"selected":"" %>>맛집</option>
<option value="커피/디저트" <%=thema.equals("커피/디저트")?"selected":"" %>>커피/디저트</option>
<option value="축제" <%=thema.equals("축제")?"selected":"" %>>축제</option>
<option value="드라이브" <%=thema.equals("드라이브")?"selected":"" %>>드라이브</option>
<option value="영화" <%= thema.equals("영화")?"selected":"" %>>영화</option>
<option value="숙소/공간대여/레저" <%=thema.equals("숙소/공간대여/레저")?"selected":"" %>>숙소/공간대여/레저</option>
<option value="공연/예술" <%=thema.equals("공연/예술")?"selected":"" %>>공연/예술</option>
</select>
</td>
</tr>
<tr>
<th>제목</th>
<td><input type="text" name = "subject" value = "<%=dto.getSubject()%>"></td>
<th>전화번호</th>
<td><input type="text" name = "tel" value = "<%=dto.getTel()%>"></td>
</tr>
<tr>
<th>위치</th>
<td><input type = "text" name = "location" value = "<%=dto.getLocation()%>"></td>
<th>영업시간</th>
<td><input type = "text" name = "runningtime" value = "<%=dto.getRunningtime()%>"></td>
</tr>
<tr>
<td colspan = "4">
<textarea rows="15" cols="100" name = "content"><%=dto.getContent()%></textarea>
</td>
</tr>
<tr>
<td><input type = "button" value = "파일 수정하기" onclick = "window.open('/yagaja/admin/ContentUpdate_fileupdate.jsp?ref=<%=dto.getRef() %>','ContentUpdate_fileupdate','width=400, height=250,top=200, height=200');"></td>
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