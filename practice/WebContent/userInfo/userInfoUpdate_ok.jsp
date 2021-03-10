<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ydao" class="yagaja.member.MemberDAO"></jsp:useBean>
<jsp:useBean id="ydto" class="yagaja.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ydto"/>
<%



int result=ydao.yagajaUpdate(ydto);
String msg=result>0?"회원정보가 수정되었습니다.":"회원정보가 수정되지않았습니다. 다시 시도해주세요.";
%>
<script>
window.alert('<%=msg%>');
location.href='userInfo.jsp';
</script>