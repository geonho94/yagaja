<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.member.*" %>
<jsp:useBean id="ydao" class="yagaja.member.MemberDAO"></jsp:useBean>

<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

int result=ydao.login(id, pwd);

if(result==ydao.LOGIN_OK) {
	MemberDTO dto = ydao.getUser(id);
	session.setAttribute("user", dto);
	if(id.equals("admin")){
		%>
		<script>
		window.alert('관리자님, 환영합니다.');
		location.href="/practice/admin/managePage.jsp";
		</script>
		<%
	}else{
		%>
		<script>
		window.alert('야 가자!에 오신걸 환영합니다.');
		location.href="/practice/zone/city.jsp";
		</script>
		<%
	}
	}else if(result==ydao.NOT_ID||result==ydao.NOT_PWD) {
		%>
		<script>
		window.alert('아이디와 비밀번호를 다시 입력해 주세요.');
		location.href="/practice/member/login.jsp";
		</script>
		<%
	}else {
		%>
		<script>
		window.alert('고객센터 연락바랍니다.');
		</script>
		<%
	}

%>