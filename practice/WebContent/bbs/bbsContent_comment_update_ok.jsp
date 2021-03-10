<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.comment.*" %>
<jsp:useBean id="yadto" class="yagaja.comment.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="yadto"/>
<jsp:useBean id="yadao" class="yagaja.comment.CommentDAO" scope="session"></jsp:useBean>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);

String ref_s=request.getParameter("ref");
int ref=Integer.parseInt(ref_s);

int result= yadao.commentUpdate(yadto, ref);
String msg=result>0?"등록완료.":"등록실패.";
%>
<script>
window.alert('<%=msg %>');
location.href='bbsContent.jsp?idx=<%=idx%>';
</script>