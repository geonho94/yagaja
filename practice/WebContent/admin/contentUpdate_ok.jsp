<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.admin.*" %>
<jsp:useBean id="adto" class="yagaja.admin.AdminDTO"></jsp:useBean>
<jsp:setProperty property="*" name = "adto"></jsp:setProperty>
<jsp:useBean id="adao" class="yagaja.admin.AdminDAO"></jsp:useBean>

<%
	int count = adao.ContentUpdate_Update(adto);
	if(count>0)
	{
		%>
		<script>
		window.alert('수정 완료');
		location.href = '/yagaja/content/content.jsp?idx=<%=adto.getIdx()%>';
		</script>
		<%
	}
%>