<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="adao" class="yagaja.admin.AdminDAO"></jsp:useBean>
<%
String ref = request.getParameter("ref");
String filename = request.getParameter("filename");
File f = new File(adao.PATH+"\\" +ref + "\\" +  filename);
if(f.delete())
{
	%>
	<script>
window.alert('삭제되었습니다.');
location.href = '/yagaja/admin/ContentUpdate_fileupdate.jsp?ref=<%=ref%>';
</script>
	<%
}
else
{
	%>
	<script>
window.alert('실패하였습니다.');
location.href = '/yagaja/admin/ContentUpdate_fileupdate.jsp?ref=<%=ref%>';
</script>
	<%
}
%>

