<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.comment.*" %>
<jsp:useBean id="yadto" class="yagaja.comment.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="yadto"/>
<jsp:useBean id="yadao" class="yagaja.comment.CommentDAO" scope="session"></jsp:useBean>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);
String lev_s=request.getParameter("lev");
int lev=Integer.parseInt(lev_s);
int result=yadao.content_commentDel_lev(lev);
String msg=result>0?"삭제 성공.":"삭제 실패.";
%>
<script>
window.alert('<%=msg %>');
location.href='bbsContent.jsp?idx=<%=idx%>';
</script>