<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.bbs.*" %>
<%@ page import="yagaja.comment.*" %>
<jsp:useBean id="ydao" class="yagaja.bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="yadao" class="yagaja.comment.CommentDAO"></jsp:useBean>
<% 
 int idx=Integer.parseInt(request.getParameter("idx")); 
ydao.contentDel(idx);
yadao.content_commentDel_idx(idx);
%>
<script>

location.href='lightning.jsp';

</script>