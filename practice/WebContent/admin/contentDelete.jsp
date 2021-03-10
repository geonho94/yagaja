<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="adao" class="yagaja.admin.AdminDAO"></jsp:useBean>
<!DOCTYPE html>
<%
String id = (String)session.getAttribute("yid");
if(id == null)
{
	%>
	<script>
	window.alert('로그인 후 이용해주세요.');
	location.href = '/yagaja/member/login.jsp'
	</script>
	<%
	return;
}


if(!id.equals("admin"))
{
	%>
	<script>
	window.alert('관리자 계정이 아닙니다.');
	location.href = '/yagaja/zone/city.jsp';
	</script>
	<%
	return;
}
%>
<%
String idx_s= request.getParameter("idx");
int idx = 0;
if(idx_s!=null)idx=Integer.parseInt(idx_s);
String ref_s = request.getParameter("ref");
int ref=0;
if(ref_s!=null)ref = Integer.parseInt(ref_s);
File f = new File(adao.PATH + "\\" + ref);
File files[] = f.listFiles();
for(int i = 0 ; i < files.length ; i++)
{
	files[i].delete();
}
f.delete();

int count = adao.ContentDelete(idx);
if(count>0)
{
	%>
	<script>
	window.alert('게시글 삭제 완료');
	location.href='/yagaja/content/content_List.jsp';
	</script>
	<%
}
else
{
	%>
	<script>
	window.alert('게시글 삭제 실패');
	location.href='/yagaja/content/content.jsp?idx=<%=idx%>'
	</script>
	<%
}
%>