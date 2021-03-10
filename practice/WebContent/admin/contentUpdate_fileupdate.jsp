<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="adao" class="yagaja.admin.AdminDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String ref = request.getParameter("ref");
String path = adao.PATH + "\\" + ref;
%>
<body>
<form action = "/yagaja/admin/ContentUpdate_fileupdate_ok.jsp?ref=<%=ref%>"  method="post" enctype="multipart/form-data">
<table>
<tr>
<td>사진 업로드</td>
<td><input type = "file" name = "fileup" multiple="multiple"></td>
</tr>
<%
File file = new File(path);
File files[] = file.listFiles();
for(int i = 0 ; i < files.length ; i ++)
{
	%>
	<tr>
	<td colspan="2"><%=files[i].getName()%></td><td><%=files[i].length()/1024 + " Kbyte" %></td>
	<td><a href="ContentUpdate_fileupdate_delete_ok.jsp?ref=<%=ref %>&filename=<%=files[i].getName()%>">삭제</a></td>
	</tr>
	<%
}
%>
<tr>
<td colspan = "2"><input type = "submit" value = "사진올리기"></td>
</tr>
</table>
</form>
</body>
</html>