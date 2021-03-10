<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ydao" class="yagaja.member.MemberDAO"></jsp:useBean>

<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
boolean result=ydao.pwdRe(id, pwd);

if(result){
	%>
	<script>
	window.alert('기존 비밀번호와 동일합니다.\n비밀번호를 재설정 해주세요.');
	location.href='/yagaja/member/pwdRe.jsp?id=<%=id%>';
	</script>
	<%
}else {
	int count=ydao.pwdRe_ok(id, pwd);
	%>
	<script>
	window.alert('비밀번호가 변경되었습니다.');
	location.href='/yagaja/member/login.jsp';
	</script>
	<%
}
%>

