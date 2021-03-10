<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.member.*" %>
<jsp:useBean id="ydao" class="yagaja.member.MemberDAO"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String userid=request.getParameter("userid");
boolean result=ydao.idCheck_ok(userid);
%>

</head>
<body>
<div class="idcheck_ok">
<form name="idcheck_ok">
	<h3 align="center">아이디 중복확인 결과</h3>
	<table style="margin: 0px auto">
		<tr>
		<td>입력ID: <%=userid %></td>
		</tr>
		<%
		if(result){
			%>
			<tr>
			<td style="color: red;">해당 아이디는 사용하실 수 없습니다.</td>
			</tr>
			<tr>
			<td colspan="2" align="center">
			<input type="button" value="확인" onclick="location.href='/practice/member/idCheck.jsp'">
			<input type="reset" value="취소" onclick='window.self.close();'></td>
			</tr>
			<%
		}else {
			%>
			<tr>
			<td><b>사용 가능한 아이디입니다.</b></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
			<input type="button" value="확인" 
			onclick="opener.document.memberjoin.id.value='<%=userid%>'; window.self.close();">
			<input type="reset" value="취소" onclick='window.self.close();'></td>
			</tr>
			<%
		}
		%>
		
	</table>
</form>
</div>
</body>
</html>