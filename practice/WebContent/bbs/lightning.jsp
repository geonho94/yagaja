<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yagaja.bbs.*" %>
<%@ page import="yagaja.comment.*" %>
<%@ page import="java.util.*" %>
<!-- ------------------------장지웅이 추가함----------------------------------- -->
<%@ page import="yagaja.member.*" %>
<%
MemberDTO user = (MemberDTO)session.getAttribute("user"); // 이게 로그인 시 생성되는 유저정보 세션이에요
if(user==null){
	%>
	<script>
	window.alert('로그인이 필요합니다.');
	location.href='/practice/member/login.jsp';
	</script>
	<%
	return;
}
String id = user.getId();// 이게 유저의 아이디를 받아온거에요 
%>
<!-- ---------------------------------------------------------------- -->
<jsp:useBean id="ydto" class="yagaja.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ydto"/>
<jsp:useBean id="ydao" class="yagaja.bbs.BbsDAO" scope="session"></jsp:useBean>
<jsp:useBean id="yadto" class="yagaja.comment.CommentDTO"></jsp:useBean>
<jsp:setProperty property="*" name="yadto"/>
<jsp:useBean id="yadao" class="yagaja.comment.CommentDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" type="text/css" href="/myweb/css/mainLayout_yagaja.css">
<style type="text/css">
h5,h2,h6{
	text-align: center;
}
table{
width: 550px;
border-top: 3px  rgb(224,224,224);
border-bottom: 3px  rgb(224,224,224);
margin: 0px auto;
}

table th{
background-color: rgb(294,294,294);
border-top: 3px  rgb(224,224,224);
border-bottom: 3px  rgb(224,224,224);
}
caption {
	visibility: hidden;
}
textarea{
	 border-radius:16px;
}
.p{
	display: table;
}
#p_1,#p_2,#p_3,#p_4,#p_5{
	display: table-cell;
}
#p_3,#p_4,#dec{
	font-size: 10px;
}
#p_5{
	text-align: right;
}
td{
	padding-bottom: 20px;
}
#se,#se_s{
	 border-radius:8px;
}
#see{
	float: right;
}
#p_1 img,#eimg{
	width: 30px;
	height: 30px;
	border-radius:20px;
}
#ddate{
	font-size: 10px;
}
</style>
<%
String num_s="2";
int num=Integer.parseInt(num_s);

int totalCnt=ydao.getTotalCnt(num);//db로부터 가져온 데이터
int listSize=10;//보여줄 리스트 수
int pageSize=5;// 보여줄 페이지 수
String cp_s=request.getParameter("cp");
if(cp_s==null||cp_s.equals("")){
	cp_s="1";
}
int cp=Integer.parseInt(cp_s);//현재 사용자 위치

int totalPage=(totalCnt/listSize)+1;//총페이지

if(totalCnt%listSize==0)totalPage--;

int userGroup=cp/pageSize;
if(cp%pageSize==0)userGroup--;

ArrayList<BbsDTO> list=ydao.contentList_l(num,cp,listSize);

%>
</head>
<body>
<%
if(user!=null)
{
   %>
<%@include file="/header_login.jsp" %>
<%
}else{
%>
<%@include file="/header_notlogin.jsp" %>
<%} %>

<section>
	<article>
		<h2>번개</h2>
		<form action="lightning_ok.jsp">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="writer" value="<%=id%>">
		<input type="hidden" name="userimg" value="userimg">
			<table>
				<caption>번개</caption>
				<thead>
				<tr>
					<th>
						<textarea name="content" cols="80" rows="10"></textarea>
					</th>
				</tr>
				<tr>
					<th align="right">
						<select name="addr">
							<option value="마포구" >마포구</option>
							<option value="강서구">강서구</option>
						</select> 
						<input type="submit" value="등록">
					</th>
				</tr>
				</thead>
				<tbody>
				<%
				if(list==null||list.size()==0){
				%>
				<tr>
				<td colspan="" align="center">
					등록된 게시물이 없습니다.
				</td>
				</tr>
				<%	

				}else{
					for(int i=0; i<list.size();i++){
						
				%>
				<script>
				function lightningPopup(idx) {
				if(confirm('정말 삭제하시겠습니까?')){
				location.href="lightning_del_ok.jsp?idx="+idx;
				alert("삭제되었습니다.");
	 		  	 }else {
	        
	 		  	 }	
				}
				function plusdecPopup_2(i,idx,num,id,img,addr) {
					var com= document.getElementById('se_s'+i).value;
					location.href="lightning_comment_update_ok.jsp?idx="+idx+"&num="+num+"&writer="+id+"&userimg="+img+"&addr="+addr+"&content="+com;
				}
				function decDel_ok(j,ref,idx) {
					location.href="lightning_comment_del_ok.jsp?ref="+ref+"&idx="+idx;
				}
				function decOpenPopup(i) {
					document.getElementById('hidden-dec'+i).style.display=(document.getElementById('hidden-dec'+i).style.display=='block') ? 'none' : 'block';
				}
				</script>
				
					<tr>
						<td>
							<div class="p">
							<div id="p_1"><img alt="유저사진" src="/practice/img/<%=user.getImg()%>"></div>
							<div id="p_2"><%=list.get(i).getWriter() %></div>
							<div id="p_3">&nbsp;<%=list.get(i).getAddr() %></div>
							<div id="p_4">&nbsp;<%=list.get(i).getJoindate()%></div>
							
							<% 
							if(id.equals(list.get(i).getWriter())){
							%>
							<div id="p_5<%=i%>"><input type="button" value="삭제" onclick="lightningPopup(<%=list.get(i).getIdx()%>);"></div>
							<%
							
							}
							%>
							</div>
							<hr>
							<div id="c_d<%=i%>"><%=list.get(i).getContent() %></div>
							<div id="dec"><a href="javascript:decOpenPopup(<%=i %>);" >댓글</a></div><br/>
							<div id="hidden-dec<%=i %>" style="display: none;">
													<%
							ArrayList<CommentDTO> listt=yadao.commenttList(num);
							if(listt==null||listt.size()==0){
							%>
							<input type="text" id="se_s<%=i%>" name="se_s"><input type="button" value="등록" onclick="plusdecPopup_2(<%=i%>,<%=list.get(i).getIdx()%>,<%=list.get(i).getNum()%>,'<%=id%>','<%=user.getImg()%>','<%=list.get(i).getAddr()%>'<%-- ,<%=list.get(i).getRef()%> --%>);">
							<% 
							}else{
								for(int j=0; j<listt.size();j++){
									if(list.get(i).getIdx()==listt.get(j).getIdx()){
							%>
							&nbsp;&nbsp;&nbsp;<img alt="유저사진" id="eimg" src="/practice/img/<%=listt.get(j).getUserimg() %>"> &nbsp;<%=listt.get(j).getWriter()%>&nbsp;<span id="ddate"><%=listt.get(j).getWritedate() %></span>&nbsp;<%=listt.get(j).getContent() %>
							<%
							if(id.equals(listt.get(j).getWriter())){
							%>
							<input type="button" value="삭제" onclick="decDel_ok('<%=j %>','<%=listt.get(j).getRef() %>','<%=listt.get(j).getIdx()%>');">
							<%
							}
							%><br><%
							}
								}
									%>
									<input type="text" id="se_s<%=i %>" name="se_s"><input type="button" value="등록" onclick="plusdecPopup_2(<%=i%>,<%=list.get(i).getIdx()%>,<%=list.get(i).getNum()%>,'<%=id%>','<%=user.getImg()%>','<%=list.get(i).getAddr()%>'<%-- ,<%=list.get(i).getRef()%> --%>);">
									
									<%
							}
						}
					}
							%>
							</div>
				</tbody>
				<tfoot>
					<tr>
						<th>
							<%
			if(userGroup!=0){
			%>
			<a href="lightning.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>">&lt;&lt;</a>
			<%
			}
			%>

			<%
			for(int i=(userGroup*pageSize)+1;
			i<=(userGroup*pageSize)+pageSize;i++){
			%>
			&nbsp;&nbsp;<a href="lightning.jsp?cp=<%=i%>"><%=i %></a>&nbsp;&nbsp;
			<%
			if(i==totalPage){
				break;
			}
			}
			%>

			<%
			if(userGroup!=((totalPage/pageSize)-(totalPage%pageSize==0?1:0))){
			%><a href="lightning.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a><%
			}
			%>
							<hr>
						</th>
					</tr>
					<tr>
						<th>
						<div id="see">
						<select name="writedate">
							<option value="" selected="selected">전체기간</option>
							<option value="">1일</option>
							<option value="">1주일</option>
							<option value="">1개월</option>
							<option value="">6개월</option>
							<option value="">1년</option>
						</select> 
						<select name="addr">
							<option value="" selected="selected">전체지역</option>
							<option value="">마포구</option>
							<option value="">강서구</option>
						</select> 
						<input id="se" type="text" ><input type="button" value="검색">
						</div>
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>