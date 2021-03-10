<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ydto" class="yagaja.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ydto"/>
<jsp:useBean id="ydao" class="yagaja.member.MemberDAO"></jsp:useBean>

<%
int result=ydao.memberJoin(ydto);

if(result>0){
	String id=request.getParameter("id");
	session.setAttribute("id", id);
	%>
	<script>
	window.alert('회원가입을 축하합니다~');
	location.href='/practice/zone/city.jsp';
	</script>
	<% 	
	}else{
		%>
		<script>
		window.alert('회원가입을 다시해 주세요ㅠㅠ');
		location.href='/practice/member/memberJoin.jsp';
		</script>
		<%
	}
%>
