<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="yagaja.bbs.*" %>
<jsp:useBean id="ydto" class="yagaja.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ydto"/>
<jsp:useBean id="ydao" class="yagaja.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
String idx_s=request.getParameter("idx");
int idx=Integer.parseInt(idx_s);

int result=ydao.bbsUpdate(ydto, idx);
String msg=result>0? "게시글 수정 완료." : "게시글 수정 실패.";
if(idx!=0){
	%>
	<script>
	window.alert('<%=msg %>');
	location.href='bbs.jsp';
	window.self.close();
	</script>
	<%
}else{
	%>
	<script>
	window.alert('<%=msg %>');
	location.href='bbs.jsp';
	window.self.close();
	</script>
	<%
}
%>
