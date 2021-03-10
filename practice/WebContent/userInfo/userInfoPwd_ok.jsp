<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pwd=request.getParameter("pwd");
String realPwd=(String)session.getAttribute("ypwd");

if(pwd.equals(realPwd)){
	%>
	<script>
	window.alert('확인되었습니다.');
	opener.location.href="userInfoUpdate.jsp";
	window.self.close();
	
	</script>
	<%
}else{
	%>
	<script>
	window.alert('입력하신 비밀번호를 다시 확인해주세요..');
	location.href="/yagaja/userInfo/userInfoPwd.jsp";

	</script>
	<%
}
%>