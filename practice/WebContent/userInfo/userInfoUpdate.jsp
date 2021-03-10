<%@page import="yagaja.member.MemberDAO"%>
<%@page import="yagaja.user.YagajaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ydao" class="yagaja.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="ydto" class="yagaja.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ydto"/>

<%


String id=(String)session.getAttribute("yid");
YagajaDTO dto=ydao.yagajaUpdateFind(id);


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

</script>
</head>
<body>
<section>
	<article>
	<div>
	<form name="userInfoUpdate" action="userInfoUpdate_ok.jsp?id='<%=id%>">
	<h3>회원 정보 수정</h3>
		<table>
			
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="<%=id %>" readonly="readonly">
				<input type="hidden" value="<%=dto.getId()%>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" required="required"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" value="<%=dto.getTel()%>"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email" value="<%=dto.getEmail()%>"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정">
				<input type="reset" value="다시쓰기">
				<input type="button" value="나가기" onClick="location.href='/yagaja/userInfo/userInfo.jsp'"></td>
			</tr>
		</table>
		</form>
		</div>
	</article>
</section>

</body>
</html>