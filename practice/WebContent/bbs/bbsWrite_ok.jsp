<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ydto" class="yagaja.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ydto"/>
<jsp:useBean id="ydao" class="yagaja.bbs.BbsDAO" scope="session"></jsp:useBean>
<%

int result=ydao.BbsWrite_bbs(ydto);
String msg=result>0?"게시글 작성완료.":"게시글 작성실패.";
%>
<script>
window.alert('<%=msg %>');
location.href='bbs.jsp';
</script>