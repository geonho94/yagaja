<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.citySelect {
	width: 400px;
	height: 600px;
	margin: 0px auto;

}

.citySelect table { /**버튼느낌으로 만들기*/
	border: 1px solid white;
	width: 400px;
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
 
	height:40px; 
	text-align:center; 

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
.gu{
	float: left;
}


/**지역별 색상 마우스 올렸을때 색변환*/
.t1{ /**전국*/
   background: #FBA504 ;
}
.t2{ /*서울*/
   background: #E5DA1A ;
}
.t3{ /*경기*/
   background: #B91BE5 ;
}
.t4{ /*강원도*/
   background: #F8383C ;
}
.t5{ /*충북*/
   background: #3965E1 ;
}
.t6{ /*충남*/
   background: #11C816 ;
}
.t7{ /*경북*/
   background: #E96416 ;
}
.t8{ /*경남*/
   background: #28E985 ;
}
.t9{ /*전북/전남*/
   background: #E63170;
}


.guSelect {
width:1096px;
height:600px;
margin:0px auto;
text-align:center;
}
 img{
 	max-width:100%;
 	height: auto;
 }

</style>
</head>
<body>
<%@include file = "/header.jsp" %>
	<section  class = "guSelect">
		<article>
		<div class="gu">
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
		<article>
		<div class="seoul">
			<!-- 서울시 지도 표시 부분 -->
			<img alt="서울 지도" name="seoul" usemap="#seoulMap" src="/yagaja/img/seoulmap.jpg">
			<map name="seoulMap">
			<area onmouseover="if(document.images) seoul.src='/yagaja/img/서북권.jpg'" onmouseout="if(document.images) seoul.src='/yagaja/img/seoulmap.jpg'" shape="poly" coords="130,223,194,269,197,277,245,281,267,258,265,248,269,237,253,211,260,182,249,176,249,128,267,119,255,82,246,82,227,100,200,102,185,189,163,190,152,213" href="thema.jsp"  onfocus="this.blur();" target="_self">
			<area onmouseover="if(document.images) seoul.src='/yagaja/img/서남권.jpg'" onmouseout="if(document.images) seoul.src='/yagaja/img/seoulmap.jpg'" shape="poly" coords="60,173,127,231,143,251,188,275,193,291,250,307,251,325,291,342,293,390,303,416,274,438,269,450,247,456,221,442,196,459,147,361,109,386,78,386,88,287,13,249,49,212" href="thema.jsp" onfocus="this.blur();"  target="_self">
			<area onmouseover="if(document.images) seoul.src='/yagaja/img/도심권.jpg'" onmouseout="if(document.images) seoul.src='/yagaja/img/seoulmap.jpg'" shape="poly" coords="252,284,261,304,261,316,300,328,335,296,330,273,347,235,341,210,296,163,279,128,257,139,256,171,270,182,265,213,275,235,272,266" href="thema.jsp" onfocus="this.blur();"  target="_self">
			<area onmouseover="if(document.images) seoul.src='/yagaja/img/동북권.jpg'" onmouseout="if(document.images) seoul.src='/yagaja/img/seoulmap.jpg'" shape="poly" coords="290,128,304,162,302,176,352,210,358,235,335,271,343,287,371,281,427,306,472,246,456,219,476,152,452,140,472,107,444,95,443,20,389,20,341,9,331,35,296,82,310,105" href="thema.jsp" onfocus="this.blur();" target="_self">
			<area onmouseover="if(document.images) seoul.src='/yagaja/img/동남권.jpg'" onmouseout="if(document.images) seoul.src='/yagaja/img/seoulmap.jpg'" shape="poly" coords="316,410,303,387,305,342,360,291,383,296,428,316,494,241,521,236,550,214,558,269,531,283,509,336,534,348,480,409,457,410,435,434,422,438,417,460,377,448,374,406,345,419,330,401" href="thema.jsp" onfocus="this.blur();"  target="_self">
			
			</map>
			</div>
		</article>
	</section>
	<%@include file = "/footer.jsp" %>
</body>
</html>