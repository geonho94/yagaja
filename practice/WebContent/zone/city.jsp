<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ------------------------장지웅이 추가함----------------------------------- -->
<%@ page import="yagaja.member.*" %>
<%
MemberDTO user = (MemberDTO)session.getAttribute("user"); // 이게 로그인 시 생성되는 유저정보 세션이에요
if(user==null){
	%>
	<script>
	window.alert('로그인이 필요합니다.');
	location.href='/yagaja/member/login.jsp';
	</script>
	<%
	return;
}
String id = user.getId();// 이게 유저의 아이디를 받아온거에요 
%>
<!-- ---------------------------------------------------------------- -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.citySelect {
	width: 1096px;
	height: 600px;
	margin: 0px auto;
	
}

.citySelect table { /**버튼느낌으로 만들기*/
	border: 1px solid white;
	width: 700px;
	height: 600px;
	margin: 0px auto;
	text-align: center;
	border-radius:3px; 

}

.citySelect table td{ /**테이블 속성 설정*/
	width: 155px;
	border:5px outset white;
    padding: 10px;
    font-family: 굴림; 
    font-size: 30px;
    text-align:center;

    position:relative;


	text-align:center; 
	line-height:40px; 
 	text-decoration:none;
 	color: #000;
 	transition: all  0.3s; /**애니메이션 속도 조절*/
 
}
.citySelect table td:after{ /**after: 꾸밈을 위해서 의미없는 태그를 더 추가해야 될 때, 태그 대신에 가상으로 처리해 주는 css 기능*/
  content:"";
  position: absolute;
  top:5px; left:5px;
  width:100%; height:100%;

}
.citySelect table td:active{/**:active 마우스를 사용하는 경우, "활성"이란 보통 마우스 버튼을 누르는 순간부터 떼는 시점까지를 의미*/
  top:5px;
  left:5px;
}
.citySelect table td:active:after{
  border:0;
}


/**지역별 색상 마우스 올렸을때 색변환*/
.t1{ /**전국*/
   background: #FBA504 ;
}
.t2{ /**서울*/
   background: #E5DA1A ;
}
.t3{ /**경기*/
   background: #B91BE5 ;
}
.t4{ /**강원도*/
   background: #F8383C ;
}
.t5{ /**충북*/
   background: #3965E1 ;
}
.t6{ /**충남*/
   background: #11C816 ;
}
.t7{ /**경북*/
   background: #E96416 ;
}
.t8{ /**경남*/
   background: #28E985 ;
}
.t9{ /**전북/전남*/
   background: #E63170;
}
</style>
</head>
<body>
	<%@include file="/headerTest_3.jsp"%>
	<section class="citySelect">
		<article>
			<div>
				<table>
					<tr>
						<!-- 한국 전역 지역 선택 부분 -->

						<td class="t1" onMouseOver="this.style.backgroundColor='#D19018';" onMouseOut="this.style.backgroundColor='#FBA504';" onclick="location.href='thema.jsp'">
						전국</td>
						<td class="t2" onMouseOver="this.style.backgroundColor='#D0C722';" onMouseOut="this.style.backgroundColor='#E5DA1A';" onclick="location.href='seoul.jsp?city=서울'">
						서울</td>
						<td class="t3" onMouseOver="this.style.backgroundColor='#9414B7';" onMouseOut="this.style.backgroundColor='#B91BE5';" onclick="alert('서비스 오픈 준비중 입니다.');">
						경기</td>
					</tr>
					<tr>
						<td class="t4" onMouseOver="this.style.backgroundColor='#C21719';" onMouseOut="this.style.backgroundColor='#F8383C';"  onclick="alert('서비스 오픈 준비중 입니다.');">
						강원도</td>
						<td class="t5" onMouseOver="this.style.backgroundColor='#2754D0';" onMouseOut="this.style.backgroundColor='#3965E1';"  onclick="alert('서비스 오픈 준비중 입니다.');">
						충북</td>
						<td class="t6" onMouseOver="this.style.backgroundColor='#16AB1B';" onMouseOut="this.style.backgroundColor='#11C816';"  onclick="alert('서비스 오픈 준비중 입니다.');">
						충남</td>
					</tr>
					<tr>
						<td class="t7" onMouseOver="this.style.backgroundColor='#C6510D';" onMouseOut="this.style.backgroundColor='#E96416';"  onclick="alert('서비스 오픈 준비중 입니다.');">
						경북</td>
						<td class="t8" onMouseOver="this.style.backgroundColor='#1CC86E';" onMouseOut="this.style.backgroundColor='#28E985';"  onclick="alert('서비스 오픈 준비중 입니다.');">
						경남</td>
						<td class="t9" onMouseOver="this.style.backgroundColor='#D42361';" onMouseOut="this.style.backgroundColor='#E63170';"  onclick="alert('서비스 오픈 준비중 입니다.');">
						전북/전남</td>
					</tr>
				</table>
			</div>
		</article>
	</section>
	<%@include file="/footer.jsp"%>
</body>
</html>