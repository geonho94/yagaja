
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.comment.*" %>
<jsp:useBean id="yadao" class="yagaja.comment.CommentDAO"></jsp:useBean>
<% 
 int idx=Integer.parseInt(request.getParameter("idx")); 
int ref=Integer.parseInt(request.getParameter("ref"));
int result=yadao.content_commentDel(ref);
String msg=result>0?"댓글삭제완료.":"댓글삭제실패.";		

%>
<script>
window.alert('<%=msg %>');
location.href="lightning.jsp";
</script>