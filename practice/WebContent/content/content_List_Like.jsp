<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ldao" class="yagaja.like.LikeDAO" scope="session"></jsp:useBean>
<%

String userid = (String)session.getAttribute("yid");

String like = request.getParameter("like");
String idx_s = request.getParameter("idx");
if(like==null || idx_s==null){
	%>
	<script>
	window.alert('잘못된 접근입니다.');
	opener.location.href='메인페이지';
	window.self.close();
	</script>
	<%
}

int idx = Integer.parseInt(idx_s);

if(like.equals("true")){
	int result = ldao.setLike(userid, idx);
} else {
	int result = ldao.delLike(userid, idx);
}
%>
<script>
opener.location.reload();
window.self.close();
</script>