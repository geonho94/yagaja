<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String id=(String)session.getAttribute("yid"); %>
<section>
<div>
	<article>
		<form name="delInfo" action="delPwd.jsp">
			<h3>탈퇴안내</h3>
			<h5>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br>
				사용하고 계신 아이디 (<%=id %>)는 탈퇴할 경우 회원정보 등 개인형 서비스 이용 기록은 모두 삭제 됩니다.<br>
				삭제 된 데이터는 복구되지 않습니다.<br>
				탈퇴 후 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.<br>
				삭제를 원하는 게시글이 있다면 <font color="red"> 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.<br>
				<font color="black">안내 사항을 모두 확인하였으며, 이에 동의할 경우 확인을 눌러주세요.
				</h5>
				<input type="submit" value="확인">
				<input type="button" value="취소" onclick="opener.location.href='/yagaja/userInfo/userInfo.jsp'; window.self.close();">
		</form>
	</article>
</div>
</section>
</body>
</html>