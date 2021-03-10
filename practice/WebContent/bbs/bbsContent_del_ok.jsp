<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.bbs.*" %>
<jsp:useBean id="ydao" class="yagaja.bbs.BbsDAO"></jsp:useBean>
<% 
 int idx=Integer.parseInt(request.getParameter("idx")); 
ydao.contentDel(idx);
		


%>
<script>

location.href='bbs.jsp';

</script>