<%@page import="java.util.Enumeration"%>
<%@page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="adao" class="yagaja.admin.AdminDAO"></jsp:useBean>
<%
int maxref = adao.getMaxref();
int folderpath = maxref+1;
String path = adao.PATH;
String savepath = path + "\\" + folderpath;
File file = new File(savepath);
if(!file.exists())file.mkdir();
try {
	int size = 1024 * 1024;
	
	MultipartRequest mr = new MultipartRequest(request, savepath, size, "utf-8");
	String city = mr.getParameter("city");
	String gu = mr.getParameter("gu");
	String thema = mr.getParameter("thema");
	String subject = mr.getParameter("subject");
	String tel = mr.getParameter("tel");
	String location = mr.getParameter("location");
	String runningtime = mr.getParameter("runningtime");
	String content = mr.getParameter("content");
	String image = mr.getFilesystemName("fileup[]");
	int count = adao.ContentAdd(subject, content, image, location, runningtime, tel, city, gu, thema, maxref);
	
	if(count>0)
	{
		%>
		<script>
		window.alert('게시글 생성 완료');
		location.href = '/yagaja/content/content_List.jsp';
		</script>
		<%
	}
	else
	{
		%>
		<script>
		window.alert('게시글 생성 실패');
		location.href = '/yagaja/admin/ContentAdd.jsp';
		</script>
		<%
	}
} catch (Exception e) {
%>
<script>
	window.alert('남은 용량이 부족합니다.');
	window.alert('<%=savepath%>');
	location.herf = '/yagaja/admin/ContentAdd.jsp';
</script>
<%
}
%>
