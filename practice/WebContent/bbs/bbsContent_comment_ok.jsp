<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.bbs.*" %>
<%@ page import="yagaja.comment.*" %>
<jsp:useBean id="ydto" class="yagaja.bbs.BbsDTO"></jsp:useBean>
<jsp:useBean id="yadto" class="yagaja.comment.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="yadto"/>
<jsp:useBean id="yadao" class="yagaja.comment.CommentDAO" scope="session"></jsp:useBean>
<%
String idx_s=request.getParameter("idx");

int idx=Integer.parseInt(idx_s);

int result=yadao.commentAdd(yadto);
String msg=result>0?"작성완료.":"작성실패.";

%>
<script>
window.alert('<%=msg %>');
location.href='bbsContent.jsp?idx=<%=idx%>';
</script>