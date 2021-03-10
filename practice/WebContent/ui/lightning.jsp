<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/uiLayout.css">
<script src="/css/uiScript.js"></script>

</head>
<body>
<%@include file="header.jsp" %>
<div id="bbs">
	<h5>게시판</h5>
	<h6>왜그렇게 다운돼있어 뭐가 문제야 쎄이 썸띵</h6>
</div>
	<div id="bbs_menu">
	<span><a href="lightning.jsp">번개</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
	<span><a href="bbs.jsp">자유</a></span>
	</div>
<section>
	<article>
		<h2>번개</h2>
		<form action="lightning_ok.jsp">
		
			<table>
				<caption>번개</caption>
				<thead>
				<tr>
					<th>
						<textarea name="content" cols="80" rows="10"></textarea>
					</th>
				</tr>
				<tr>
					<th>
					<div  id="addr">
						<select name="addr">
							<option value="마포구" >마포구</option>
							<option value="강서구">강서구</option>
						</select> 
						<input type="submit" value="등록">
						</div>
					</th>
				</tr>
				</thead>
				<tbody>
				
					<tr>
						<th>
							<div class="p">
							<div id="p_1"><img alt="유저사진" src="../img/usernone.jpg"></div>
							<div id="p_2">노건호</div>
							<div id="p_3">2020.11.18</div>
							</div>
						</th>
					<tr>
						<td>	
							<div><hr></div>
							<div><p>가나다라마바사아자차카타파하.가나다라마바사아자차카타파하.가나다라마바사아자차카타파하.가나다라마바사아자차카타파하.</p></div>
							<div id="dec">댓글</div>
						</td>
					</tr>
					</tr>
					
					<tr>
						<th>
							<div class="p">
							<div id="p_1"><img alt="유저사진" src="../img/usernone.jpg"></div>
							<div id="p_2">노건호</div>
							<div id="p_3">2020.11.18</div>
							</div>
						</th>
					<tr>
						<td>	
							<div><hr></div>
							<div><p>가나다라마바사아자차카타파하.가나다라마바사아자차카타파하.가나다라마바사아자차카타파하.가나다라마바사아자차카타파하.</p></div>
							<div id="dec">댓글</div>
						</td>
					</tr>
					</tr>
				
				
			
				</tbody>
				<tfoot>
					<tr>
						<th>
							<div id="number">1,2,3,4,5 > </div>
							<hr>
						</th>
					</tr>
					<tr>
						<th>
						<div id="see">
						<select>
							<option>전체기간</option>
							<option>1일</option>
							<option>1주일</option>
							<option>1개월</option>
							<option>6개월</option>
							<option>1년</option>
						</select> 
						<select>
							<option>전체지역</option>
							<option>마포구</option>
							<option>강서구</option>
							<option>강남구</option>
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
<%@include file="footer.jsp" %>
</body>
</html>