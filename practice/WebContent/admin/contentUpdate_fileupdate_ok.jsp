<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="adao" class="yagaja.admin.AdminDAO"></jsp:useBean>
<!DOCTYPE html>
<%
String ref_s = request.getParameter("ref");
int ref = Integer.parseInt(ref_s);
String path = adao.PATH;
String savepath = path + "\\" + ref_s;
File file = new File(savepath);
if(!file.exists())file.mkdir();
try {
	int size = 1024 * 1024;
	System.out.println(savepath);
	
	MultipartRequest mr = new MultipartRequest(request, savepath, size, "utf-8", new DefaultFileRenamePolicy());
	String image = mr.getFilesystemName("fileup");
	int count = adao.ContentUpdate_file(image,ref);	
	if(count>0)
	{
		%>
		<script>
		window.alert('파일 수정 완료');
		history.back()-1);
		location.reload();
		</script>
		<%
	}
	else
	{
		%>
		<script>
		window.alert('파일 수정 실패');
		history.back(-1);
		location.reload();
		</script>
		<%
	}
} catch (Exception e) {
%>
<script>
	window.alert('남은 용량이 부족합니다.');
	window.self.close();
</script>
<%
}
%>
