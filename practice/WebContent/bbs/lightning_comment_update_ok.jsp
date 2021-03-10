<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.comment.*" %>
<jsp:useBean id="yadto" class="yagaja.comment.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="yadto"/>
<jsp:useBean id="yadao" class="yagaja.comment.CommentDAO" scope="session"></jsp:useBean>
<%
int result=yadao.commentAdd(yadto);
String msg=result>0?"등록성공.":"등록실패.";
%>
<script>
window.alert('<%=msg %>');
location.href='lightning.jsp';
</script>