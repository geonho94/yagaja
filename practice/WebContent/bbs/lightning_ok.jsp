<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.comment.*" %>
<jsp:useBean id="ydto" class="yagaja.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ydto"/>
<jsp:useBean id="ydao" class="yagaja.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
int result=ydao.BbsWrite_lightning(ydto);
String msg=result>0?"등록완료.":"등록실패.";
%>
<script>
window.alert('<%=msg %>');
location.href='lightning.jsp';
</script>