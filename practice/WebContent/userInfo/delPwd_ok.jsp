<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ydao" class="yagaja.member.MemberDAO" ></jsp:useBean>
<%
String id=(String)session.getAttribute("yid");
String pwd=request.getParameter("pwd");
String realPwd=(String)session.getAttribute("ypwd");

if(pwd.equals(realPwd)){
	int result=ydao.yagajaDelete(id);

	if(result>0){
	
		%>
		<script>
		window.alert('회원 탈퇴가 완료되었습니다.');
		opener.location.href="/yagaja/index.jsp";
		window.self.close();
		</script>
		<%
	} else{
		System.out.println(4+":"+result);
		%>
		<script>
		window.alert('회원 탈퇴를 실패하였습니다. 고객센터로 문의 주시기 바랍니다.');
		opener.location.href="/yagaja/userInfo/userInfo.jsp";
		window.self.close();
		</script>
		<%
	}	
}else{

		%>
		<script>
		window.alert('입력하신 비밀번호를 다시 확인해주세요..');
		location.href="/yagaja/userInfo/delPwd.jsp";

		</script>
		<%
	
}
%>