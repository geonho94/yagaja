<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
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

<style type="text/css">
h5,h2,h6{
	text-align: center;
}

table td{
	text-align: left;
}
.table_1{
width: 600px;
border-radius:12px;
margin: 0px auto;
}
.table_2{
	width: 600px;
	margin: 0px auto;
	border-radius:12px;
}
table{
border: 1px solid gray;
}
table td{
border: 1px solid #555555;
border-radius:12px;
}

table th{
background-color: rgb(294,294,294);

}
caption {
	visibility: hidden;
}

#test1{
	padding: 0 30px;
}
#g{
	float: left;
}
#gg,#test1{
	text-align: left;
}
#ddd,#g_4{
	font-size: 10px;
	color: gray;
}

#g_1,#g_2,#g_3,#g_4{
 text-align: left;
}
#g_2{
	float: left;
}

.user_section{
	border: 1px solid gray;
border-radius:12px;
}
#gle_left{
	text-align: left;
}
#gle_center{
	text-align: center;
}
#gle_right{
	text-align: right;
}

#footer_end{
	border-radius:12px;
	margin-top: 15px;
}
#g_2 img{
	width: 30px;
	height: 30px;
	border-radius:20px;
}
</style>


<%
/* int idx=Integer.parseInt(request.getParameter("idx")); */

String idx_s=request.getParameter("idx");
if(idx_s==null||idx_s.equals("")){
	idx_s="0";
}

int idx=Integer.parseInt(idx_s);
int result=ydao.countPlus(idx);
BbsDTO dto=ydao.bbsContent(idx);
if(dto==null){
	%>
	<script type="text/javascript">
	window.alert('삭제된 게시글이거나 잘못된 접근입니다.');
	location.href="bbs.jsp";
	</script>
	<%
	return;
}
%>

<script type="text/javascript">
function delPopup() {
if(confirm('정말 삭제하시겠습니까?')){
	location.href="bbsContent_del_ok.jsp?idx=<%=idx%>";
		alert("삭제되었습니다.");
    }else {
        
    }
}

</script>
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

		<h2>게시판 본문</h2>
		<form name="bbsContent" action="bbsContent_update.jsp">
			<input type="hidden" name="idx" value="<%=dto.getIdx()%>">
			<input type="hidden" value="로그인 아이디와 확인하여 writer와 같다면 수정,삭제 보여지게하기">
		<table class="table_1">
		<caption>게시판 본문</caption>
		<thead>

			<tr>
				<th class="user_section">
				<div id="g_0">
				<div id="g_1"><h4><%=dto.getSubject()%></h4></div>
				<hr>
				<div id="g_2"><img alt="사진" src="/practice/img/<%=user.getImg()%>"></div>
				<div id="g_3"><%=dto.getWriter()%></div>
				<div id="g_4">작성날짜:<%=dto.getJoindate()%>&nbsp;조회수:<%=dto.getCount()%></div>
				</div>
				</th>
			</tr>
			
			
			<tr height="250">
				<td><%=dto.getContent().replaceAll("\n", "<br>") %></td>
				<%-- <td colspan="4"><pre><%=dto.getContent() %></pre></td> --%>
			</tr>
			
			<% 
			if(id.equals(dto.getWriter())){
			%>
			<tr>
				<th>
				<div id="g">
				<span id="gle_left"><a href="#"> < 이전글</a></span>
				<span id="gle_center"><a href="bbs.jsp">목록</a></span>
				<span id="gle_right"><a href="#">다음글></a></span>
				<input type="submit" value="수정">
				<input type="button" value="삭제" onclick="delPopup()">
				</div>
				</th>
			</tr>
			<%
			}else{
				%>
				<tr>
				<th>
				<div id="g">
				<a href="#">< 이전글</a>
				<a href="#">다음글></a>
				<a href="bbs.jsp">목록</a>
				</div>
				</th>
				</tr>
				<%
			}
			%>
				</thead>
		</table>
		</form>

			
	
			<form name="bbsContent_comment_ok" action="bbsContent_comment_ok.jsp?idx=<%=idx%>">
			<table class="table_2">
			<%
			String num_s="1";
			int num = Integer.parseInt(num_s);
			ArrayList<CommentDTO> list=yadao.commenttList(num);
			if(list==null||list.size()==0){
			
				%>
				<tr>
					<td>댓글을 남겨보세요~</td>
				</tr>
				
				<%
			}else{
				for(int i=0; i<list.size();i++){
					if(idx==list.get(i).getIdx()&&list.get(i).getLev()==0){
						if(id.equals(list.get(i).getWriter())){
							
							
			%>
			<script>
			function commentDelPopup(ref,idx) {
				location.href="bbsContent_comment_del_ok.jsp?ref="+ref+"&idx="+idx;
			}
			function commentUpdatePopup() {
				location.href="bbsContent_comment_update_ok.jsp?idx="+idx+"&ref="+ref;
			}
			function openUpdate_content(i,value,idx,ref) {
				var temp='comment_one'+i;
				document.getElementById(temp).innerHTML="<input id='three' type='text' value='"+value+"'><input type='button' value='등록' onclick='bbscomment_updatePopup_three("+ref+","+idx+");'>";
				
			}
			function bbscomment_updatePopup_three(ref,idx) {
				var com= document.getElementById('three').value;
				location.href="bbsContent_comment_update_ok.jsp?idx="+idx+"&ref="+ref+"&content="+com;
			}
			function plusdecPopup_1(i,idx,num,id,img,addr,ref,lev) {
				var comm= document.getElementById('se_s'+i).value;
				location.href="bssContent_comment_decupdate_ok.jsp?idx="+idx+"&num="+num+"&writer="+id+"&userimg="+img+"&addr="+addr+"&content="+comm+"&ref="+ref+"&lev="+lev;
			}
			function decDel_ok(j,lev,idx) {
				location.href="bbsContent_decDel_ok.jsp?lev="+lev+"&idx="+idx;
			}
			function decOpenPopup(i) {
				document.getElementById('hidden-dec'+i).style.display=(document.getElementById('hidden-dec'+i).style.display=='block') ? 'none' : 'block';
			}
			</script>
					<tr>
						<td>
						<div id="gg">
							<div><img alt="유저사진" src="<%=list.get(i).getUserimg()%>"><%=list.get(i).getWriter() %>&nbsp;&nbsp;<span id="ddd"><%=list.get(i).getWritedate() %></span><span><input type="button" value="수정" onclick="openUpdate_content('<%=i%>','<%=list.get(i).getContent() %>','<%=idx%>','<%=list.get(i).getRef()%>');"><input type="button" value="삭제" onclick="commentDelPopup(<%=list.get(i).getRef()%>,<%=list.get(i).getIdx()%>);"></span></div>
							<hr>
	
							<div id="comment_one<%=i%>"><%=list.get(i).getContent() %></div>
							
							<div><span id="ddd"><a href="javascript:decOpenPopup(<%=i%>)">댓글()</a></span></div>
							<div id="hidden-dec<%=i%>" style="display: none;">
						
							<%
							ArrayList<CommentDTO> listt=yadao.commenttList(num);
							if(list==null||list.size()==0){
							%>
							<input type="text" id="se_s<%=i %>" name="se_s"><input type="button" value="등록" onclick="plusdecPopup_1('<%=i%>','<%=list.get(i).getIdx()%>','<%=list.get(i).getNum()%>','<%=id%>','<%=user.getImg()%>','<%=list.get(i).getAddr()%>','<%=list.get(i).getRef()%>','<%=list.get(i).getLev()%>');">
							<%
							}else{
								for(int j=0;j<listt.size();j++){
									if(list.get(i).getRef()==listt.get(j).getRef()&&listt.get(j).getLev()>0){
									%>
									&nbsp;&nbsp;&nbsp;<%=listt.get(j).getUserimg() %>&nbsp;<%=listt.get(j).getWriter()%>&nbsp;<%=listt.get(j).getWritedate() %>&nbsp;<%=listt.get(j).getContent() %><input type="button" value="삭제" onclick="decDel_ok('<%=j %>','<%=listt.get(j).getLev() %>','<%=list.get(j).getIdx()%>');"> <br>
									
									<%
									}else{
										
									}
								}
								%>
								<input type="text" id="se_s<%=i %>" name="se_s"><input type="button" value="등록" onclick="plusdecPopup_1('<%=i%>','<%=list.get(i).getIdx()%>','<%=list.get(i).getNum()%>','<%=id%>','<%=user.getImg()%>','<%=list.get(i).getAddr()%>','<%=list.get(i).getRef()%>','<%=list.get(i).getLev()%>');">
								<%
							}
							%>
							</div>
							<%-- </div>	
								<%
								int count=0;
								for(int j=i+1; j<list.size();j++){
									if(list.get(i).getRef()==list.get(j).getRef()){
										count++;
										out.println("&nbsp;&nbsp;&nbsp;");
								%>
								<div id="test1">
								<div><span><img alt="유저사진" src="<%=list.get(j).getUserimg()%>"><%=list.get(j).getWriter() %></span></div>
								<div><%=list.get(j).getContent() %></div>
								<div><span><%=list.get(j).getWritedate() %></span></div>
								</div>
								<% 
									}
								else{
									break;
								}
									i+=count;
									%>
									
									<%
								}
								%> --%>
								
							<input type="hidden" name="idx" value="<%=idx%>">
							<input type="hidden" name="num" value="<%=num%>">
							<input type="hidden" name="writer" value="<%=id%>">
							<input type="hidden" name="userimg" value="<%=user.getImg()%>">
							<input type="hidden" name="ref" value="<%=list.get(i).getRef()%>">
						</div>
						</td>
					</tr>
						
			<%
					}else{
						%>
						<tr>
						<th>
							<div id="gg">
							<div><img alt="유저사진" src="<%=list.get(i).getUserimg()%>"><%=list.get(i).getWriter() %>&nbsp;&nbsp;<span id="ddd"><%=list.get(i).getWritedate() %></span></div>
							<hr>
	
							<div id="comment_one<%=i%>"><%=list.get(i).getContent() %></div>
							<div><span id="ddd"><a href="document.getElementById('hidden-dec<%=i %>').style.display=(document.getElementById('hidden-dec<%=i %>').style.display=='block') ? 'none' : 'block';">댓글()</a></span></div>
							<div id="hidden-dec<%=i%>" style="display: none;">
								<%
							ArrayList<CommentDTO> listt=yadao.commenttList(num);
							if(list==null||list.size()==0){
							%>
							<input type="text" id="se_s<%=i %>" name="se_s"><input type="button" value="등록" onclick="plusdecPopup_1('<%=i%>','<%=list.get(i).getIdx()%>','<%=list.get(i).getNum()%>','<%=id%>','<%=user.getImg()%>','<%=list.get(i).getAddr()%>','<%=list.get(i).getRef()%>','<%=list.get(i).getLev()%>');">
							<%
							}else{
								for(int j=0;j<listt.size();j++){
									if(list.get(i).getRef()==listt.get(j).getRef()&&listt.get(j).getLev()>0){
									%>
									&nbsp;&nbsp;&nbsp;<%=listt.get(j).getUserimg() %>&nbsp;<%=listt.get(j).getWriter()%>&nbsp;<%=listt.get(j).getWritedate() %>&nbsp;<%=listt.get(j).getContent() %><br>
									
									<%
									}else{
										
									}
								}
								%>
								<input type="text" id="se_s<%=i %>" name="se_s"><input type="button" value="등록" onclick="plusdecPopup_1('<%=i%>','<%=list.get(i).getIdx()%>','<%=list.get(i).getNum()%>','<%=id%>','<%=user.getImg()%>','<%=list.get(i).getAddr()%>','<%=list.get(i).getRef()%>','<%=list.get(i).getLev()%>');">
								<%
							}
							%>
							</div>
							</div>	
							<input type="hidden" name="idx" value="<%=idx%>">
							<input type="hidden" name="num" value="<%=num%>">
							<input type="hidden" name="writer" value="<%=id%>">
							<input type="hidden" name="userimg" value="<%=user.getImg()%>">
						</th>
					</tr>
						<%
						}
					}
				}
			}
			%>
				<tr>
					<th>
						<input type="hidden" name="idx" value="<%=idx%>">
						<input type="hidden" name="num" value="<%=num%>">
						<input type="hidden" name="writer" value="<%=id%>">
						<input type="hidden" name="userimg" value="<%=user.getImg()%>">
						<textarea id="footer_end" name="content" cols="80" rows="10"></textarea>
						<input type="submit" value="등록">
					</th>
				</tr>
			</table>
			</form>
	
	
<%@include file="../footer.jsp" %>
</body>
</html>

