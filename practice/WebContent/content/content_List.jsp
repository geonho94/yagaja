<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="yagaja.content.*" %>
<%@ page import="java.net.*" %>
<jsp:useBean id="cdao" class="yagaja.content.ContentDAO" scope="session"></jsp:useBean>
<jsp:useBean id="ldao" class="yagaja.like.LikeDAO" scope="session"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/yagaja/css/mainLayout_yagaja.css">
<script>
function selectThema(){
	var thema_s = document.getElementsByName('thema');
	for(var i=0; i<thema_s.length; i++){
		if(thema_s[i].checked==true){
			var thema = thema_s[i].value;
		}
	}
	location.href='content_List.jsp?thema='+thema;
}

function likeCheck(idx){
	var value = idx.value;
	if(idx.checked){
		window.open('content_List_Like.jsp?like=true&idx='+value,'setlike','top=10000,left=10000,width=1,height=1');
	}else {
		window.open('content_List_Like.jsp?like=false&idx='+value,'dellike','top=10000,left=10000,width=1,height=1');
	}
}
function setLocation(){
	var citys = document.getElementsByName('city');
	var gus = document.getElementsByName('gu');
	var citys_c = 0;
	var gus_c = 0;
	for(var i=0; i<citys.length; i++){
		if(citys[i].checked) citys_c++;
	}
	for(var i=0; i<gus.length; i++){
		if(gus[i].checked) gus_c++;
	}
	if(citys_c==0){
		window.alert('시를 선택해주십시오.')
		return;
	}else if(gus_c==0){
		window.alert('구를 선택해주십시오.')
		return;
	}
	document.loc.submit();
}
</script>
</head>
<!-- ---------------------------------로그인 세션 확인 ------------------------------------ -->
<%
String userid = (String)session.getAttribute("yid");
if(userid==null){
	%>
	<script>
	window.alert('로그인이 필요합니다.');
	location.href='/yagaja/member/login.jsp';
	</script>
	<%
}

String city="";
String gu="";
String thema="";

Cookie cks[] = request.getCookies();

if(cks != null){
	for(int i=0; i<cks.length; i++){
		if(cks[i].getName().equals("city")){
			city = URLDecoder.decode(cks[i].getValue());
		} else if(cks[i].getName().equals("gu")){
			gu = URLDecoder.decode(cks[i].getValue());
		} else if(cks[i].getName().equals("thema")){
			thema = URLDecoder.decode(cks[i].getValue());
		}
	}
}

String citys[] = request.getParameterValues("city");
String gus[] = request.getParameterValues("gu");
String thema_p = request.getParameter("thema");

if(citys!=null || gus!=null){ 
	city = cdao.getString(citys);
	gu = cdao.getString(gus);
	
	String city_c = URLEncoder.encode(city);
	String gu_c = URLEncoder.encode(gu);
	
	Cookie ck_city = new Cookie("city",city_c);
	ck_city.setMaxAge(60*60*24*30);
	response.addCookie(ck_city);
	Cookie ck_gu = new Cookie("gu",gu_c);
	ck_gu.setMaxAge(60*60*24*30);
	response.addCookie(ck_gu);
	
} 

if(thema_p!=null){
	thema = thema_p;
	
	Cookie ck_thema = new Cookie("thema",thema);
	ck_thema.setMaxAge(60*60*24*30);
	response.addCookie(ck_thema);
}
	

String nowpage_s = request.getParameter("page");

int nowpage=1;
int maxlist = 4; //한 페이지의 게시물 수
int maxpage = 5; //페이징 처리 시 나타낼 페이지의 수


if(!(nowpage_s==null)){
	nowpage=Integer.parseInt(nowpage_s);
}


%>
<body> <!--  style="padding-top: 75px;" 바디의 스타일은 헤더에 있는 fixed 메뉴바가 상단에 고정되며 바디로부터 독립된 것으로 바디의 높이를 해당 헤더의 높이만큼 띄어주어야할 필요가 있음 -->
<%@include file="/header.jsp" %>
<section>
	<!-- ---------------------------------시, 구 선택 체크박스 영역---------------------------------------------- -->
	<div>
		<form name="loc" action="content_List.jsp">
			<div>
				<input type="checkbox" name="city" value="서울" <%=city.contains("서울")?"checked":"" %>>서울
				<input type="checkbox" name="city" value="경기" <%=city.contains("경기")?"checked":"" %>>경기
				<input type="checkbox" name="city" value="강원도" <%=city.contains("강원도")?"checked":"" %>>강원도
				<input type="checkbox" name="city" value="충북" <%=city.contains("충북")?"checked":"" %>>충북
				<input type="checkbox" name="city" value="충남" <%=city.contains("충남")?"checked":"" %>>충남
				<input type="checkbox" name="city" value="경북" <%=city.contains("경북")?"checked":"" %>>경북
				<input type="checkbox" name="city" value="경남" <%=city.contains("경남")?"checked":"" %>>경남
				<input type="checkbox" name="city" value="전북/전남" <%=city.contains("전북/전남")?"checked":"" %>>전북/전남
			</div>
			<div>
				<input type="checkbox" name="gu" value="도심권" <%=gu.contains("도심권")?"checked":"" %>>도심권
				<input type="checkbox" name="gu" value="서북권" <%=gu.contains("서북권")?"checked":"" %>>서북권
				<input type="checkbox" name="gu" value="서남권" <%=gu.contains("서남권")?"checked":"" %>>서남권
				<input type="checkbox" name="gu" value="동북권" <%=gu.contains("동북권")?"checked":"" %>>동북권
				<input type="checkbox" name="gu" value="동남권" <%=gu.contains("동남권")?"checked":"" %>>동남권
			</div>
			<div>
				<input type="button" value="적용하기" onclick="setLocation();">
			</div>
		</form>
	</div>
	
	
	<!-- ----------------------------테마 선택 라디오박스 영역---------------------------------------------- -->
	<div>
		<input type="radio" name="thema" value="전체" onclick="selectThema();" <%=thema.equals("전체")?"checked":""%>>전체
		<input type="radio" name="thema" value="맛집" onclick="selectThema();" <%=thema.equals("맛집")?"checked":""%>>맛집
		<input type="radio" name="thema" value="커피/디저트" onclick="selectThema();" <%=thema.equals("커피/디저트")?"checked":""%>>커피/디저트
		<input type="radio" name="thema" value="축제" onclick="selectThema();" <%=thema.equals("축제")?"checked":""%>>축제
		<input type="radio" name="thema" value="드라이브" onclick="selectThema();" <%=thema.equals("드라이브")?"checked":""%>>드라이브
		<input type="radio" name="thema" value="영화" onclick="selectThema();" <%=thema.equals("영화")?"checked":""%>>영화
		<input type="radio" name="thema" value="숙소/공간대여/레저" onclick="selectThema();" <%=thema.equals("숙소/공간대여/레저")?"checked":""%>>숙소/공간대여/레저
		<input type="radio" name="thema" value="이색데이트" onclick="selectThema();" <%=thema.equals("이색데이트")?"checked":""%>>이색데이트
		<input type="radio" name="thema" value="공연/예술" onclick="selectThema();" <%=thema.equals("공연")?"checked":""%>>공연/예술
	</div>
	
	
	
	<!-- --------------------------이전 페이지 이동------------------------------------------- -->
	<div>
		<% 
		if(nowpage>1){
			%>
			<div style="float: left; margin:0px auto;">
			<input type="button" name="back" value="이전" onclick="location.href='content_List.jsp?page=<%=nowpage-1 %>'">
			</div>
			<% 
		}
		%>
		
		<!-- --------------------------게시물 출력 부분------------------------------------------- -->
		<div style="float:left;">
		<%
		ArrayList<ContentDTO> al = cdao.getList(nowpage, maxlist, city, gu, thema);
		ArrayList<String> al_like = ldao.getLikeList(userid);
		if(al.size()==0){
			%>
			<label>게시물이 존재하지 않습니다.</label>
			<%
		}
		for(int i=0; i<al.size(); i++){
			%>
			<style>
			body{
				margin: 0px auto;
			}
			section{
				height: 450px;
				width: 900px;
				margin: 100px auto;
	
			}
			.card {
				position:relative;
				height: 300px;
				width: 230px;
				display: inline-block;
				background-color: pink;
				border-radius: 15px;
				overflow: hidden;
				box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}
			.card_front{
				width: 100%;
				height: 220px;
				background-repeat : no-repeat;
				background-size: 100% 220px;
				transition: 0.5s;
			}
			.card_body{
				width: 100%;
				text-align: center;
			}
			.card_footer{
				position: absolute;
			    bottom: 0;
			    font-size: 10px;
			    width: 90%;
			    padding: 0 5%;
			    text-align: center;
			}
			.card_back{
				opacity: 0;
			}
			.card_like{
				position: absolute;
				width: 100%;
				top: 0;
				text-align: right;
				padding-top: 3px;
				padding-right: 5px;
			}
			
			/**카드에 마우스가 올라갔을 때*/
			.card:hover{
				opacity: 0.8;
			}
			.card:hover .card_front{
				height: 170px;
			}
			.card:hover .card_body{
			
			}
			.card:hover .card_back{
				opacity: 1;
			}
			/**--------------------*/
			
			.heart { 
				display:none; 
			}
			.heart + label { 
				width: 40px;
				height: 40px;
				display: inline-block; 
				cursor: pointer; 
				background: url('/yagaja/img/likenum.png') left/22px no-repeat; 
				background-size: 100%;
			}
			.heart:checked + label { 
				background-image: url('/yagaja/img/like.png'); 
			}
			.icon_readnum{
				width: 17px;
    			height: 17px;
				background-image: url("/yagaja/img/readnum.png");
				display: inline-block;
    			vertical-align: middle;
    			background-size: 100%;
			}
			.icon_reviewnum{
				width: 13px;
    			height: 13px;
				background-image: url("/yagaja/img/reviewnum.png");
				background-repeat: no-repeat;
				display: inline-block;
    			vertical-align: middle;
    			background-size: 100%;
			}
			.icon_likenum{
				width: 13px;
    			height: 13px;
				background-image: url("/yagaja/img/likenum.png");
				background-repeat: no-repeat;
				display: inline-block;
    			vertical-align: middle;
    			background-size: 100%;
			
			}
			</style>
			<div class="card">
				<a href="content.jsp?idx=<%=al.get(i).getIdx() %>">
<!-- getImage의 경우 ,구분자로 스플릿을 하여 첫번째 인덱스의 값을 가져와 사용할 예정. 스플릿은 해당 구분자가 없으면 한개의 길이의 배열로 반환함 그냥 0번으로 사용하면 됨 -->
					<div class="card_front" style="background-image: url('/yagaja/admin/upload/<%=al.get(i).getRef() %>/<%=al.get(i).getImage() %>')"></div>
				</a>
				<div class="card_body">
					<label><%=al.get(i).getSubject() %></label>
				</div>
				<div class="card_back">
					
				</div>
				<div class="card_footer">
					<hr style=" opacity: 0.5;">
					<i class="icon_readnum"></i>조회 <%=al.get(i).getReadnum() %>회&nbsp;&nbsp;
					<i class="icon_reviewnum"></i>리뷰 <%=al.get(i).getReviewnum() %>&nbsp;&nbsp;
					<i class="icon_likenum"></i>하트 <%=al.get(i).getLikenum() %>
				</div>
				<div class="card_like">
					<input type="checkbox" id="like<%=al.get(i).getIdx() %>" name="like" class="heart" value="<%=al.get(i).getIdx() %>" onclick="likeCheck(this);" <%=al_like.contains(al.get(i).getIdx()+"")? "checked":"" %>>
					<label for="like<%=al.get(i).getIdx() %>"></label>
				</div>
			</div>
			
			<%
			}
			%>
		</div>
		<!-- --------------------------다음 페이지 이동------------------------------------------- -->
		
		<div style="float:left;">
		<%
		int totalcnt = cdao.getTotalContent(city, gu, thema);
		int totalpage = (totalcnt-1)/maxlist+1;
		if(!(nowpage==totalpage)){
		%>
		<input type="button" name="next" value="다음" onclick="location.href='content_List.jsp?page=<%=nowpage+1 %>'">
		<%
		}
		%>
		</div>
	</div>
	
	<!-- -------------------------------------페이징 넘버----------------------------------------------- -->
	<div style="clear:left;">
	<%
		int temp = (nowpage-1)/maxpage;
		int min = temp*maxpage+1;
		int max = (temp+1)*maxpage;
		for(int i=min; i<=max; i++){
			if(i==nowpage){
			%>
			<%=i %>
			<%
			} else{
			%>
			<a href="content_List.jsp?page=<%=i %>"><%=i %> </a>
			<%
			}
			if(i==totalpage) break;
		}
	%>
	</div>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>