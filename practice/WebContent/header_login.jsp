<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
html, body { height: 100%; }

body {
  color: #444;
  font-family: monospace;
  margin: 0 auto;
  overflow-X: hidden;
  overflow-Y: auto;
  padding: 0;
  
}

#hamburger { display: none; }
#hamburger ~ * {
  position: absolute;
  transition: transform 0.4s;
}
#hamburger:checked ~ * { 

transform: translate3d(200px, 0, 0); 

}
#hamburger ~ label {
  font-size: 54px;
  top: -16px; left: 8px;
  cursor: pointer;
  z-index: 1;
  margin-top: 33px;
}
label{
margin-top: 30px;
}
#hamburger ~ nav {
  background: white;
  width: 200px;
  left: -200px;
  height: 100%;
  z-index: 1;
  position: fixed;
}
#hamburger ~ nav .sub-menu {
  width: 200px;
  left: -200px;
  height: 10%;
}
#hamburger ~ nav * {
  margin: 0; padding: 0;
  color: #555555;
}
#hamburger ~ nav #header_menu {
  background: #F7D6D5; /* 파스텔핑크 */
  padding: 1em;
}
#hamburger ~ nav a {
  display: block;
  text-decoration: none;
  padding: 1em;
}
#hamburger ~ nav a:hover { background: #F7D6D5; }

#content {
  position: relative;
  padding: 2.6em 1em 1em;
  text-align: center;
  width: 100%;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.35);
}

a {
  color: inherit;
  text-decoration: none;
}

a:hover {
  color: #FF5959;
}


.sign-up {
  background: #FF5959;
  border: 1px solid #FF5959;
  color: #FFF;
  font-family: monospace;
  font-size: 10px;
  font-weight: bold;
   border-radius:8px;
  letter-spacing: 1px;
  
  margin: 10px;
  overflow: hidden;
  padding: 0;
  position: relative;
  text-align: center;
}
.sign-up:hover {
  background: #FFF;
}

.sign-up a {
  display: block;
}
#userone{
	margin-top: 13px;
}
#userone_1{
	float: left;
}
#userone_1 img{
	border-radius: 30px;
	width: 40px;
	height: 40px;
	margin-top: -4px;
}

</style>
<header>

<input id="hamburger" type="checkbox" /><label for="hamburger">&equiv;</label>
  <nav>
  <div class="container"><!-- container start -->
   <div id="header_menu">MENU</div>
    <div class="box"><!-- box 시작 -->
       <div id="userone"><!-- userone start -->
       <%
       if(user!=null)
       {
          %>
          <div id="userone_1"><!-- userone1 start -->
            <img alt="회원사진" src="/practice/img/<%=user.getImg()%>" width="150">	 
         </div><!-- userone end -->
         <div id="userone_2" style="margin-top: 15px; padding-left: 50px;"><!-- userone2 start -->
            <%=user.getId() %>
         </div><!-- userone2 end -->
         <div id="userone_3" style="padding-left: 50px;"><!-- userone3 start -->
            <%=user.getEmail() %>
         </div><!-- userone3 end -->
          <%
       }      
       %>
       </div><!-- userone end -->
         <hr style="margin-top: 25px;">
      <ul id="main-menu">
            <li onclick="document.getElementById('hiddenContent01').style.display=(document.getElementById('hiddenContent01').style.display=='block') ? 'none' : 'block';"><a href="#">회사 소개</a>
            <ul  id="hiddenContent01" class="sub-menu" style="display: none;">
               <li><a href="/practice/company.jsp">&nbsp;&nbsp;&nbsp;소개 글</a></li>
               <li><a href="/practice/company_come.jsp">&nbsp;&nbsp;&nbsp;찾아오는 길</a></li>
            </ul>
            </li>
            
            <li onclick="document.getElementById('hiddenContent02').style.display=(document.getElementById('hiddenContent02').style.display=='block') ? 'none' : 'block';"><a href="#">게시판</a>
            <ul id="hiddenContent02" class="sub-menu" style="display: none;">
               <li><a href="/practice/bbs/lightning.jsp">&nbsp;&nbsp;&nbsp;번개</a></li>
               <li><a href="/practice/bbs/bbs.jsp">&nbsp;&nbsp;&nbsp;자유</a></li>
            </ul>
            </li>
            
            <li onclick="document.getElementById('hiddenContent03').style.display=(document.getElementById('hiddenContent03').style.display=='block') ? 'none' : 'block';"><a href="#">광고</a>
            <ul id="hiddenContent03" class="sub-menu" style="display: none;">
               <li><a href="/practice/ad/ad.jsp">&nbsp;&nbsp;&nbsp;광고게시판</a></li>
            </ul>
            </li>
            
            <li onclick="document.getElementById('hiddenContent04').style.display=(document.getElementById('hiddenContent04').style.display=='block') ? 'none' : 'block';"><a href="#">고객센터</a>
            <ul id="hiddenContent04" class="sub-menu" style="display: none;">
               <li><a href="/practice/csCenter/QnAList.jsp">&nbsp;&nbsp;&nbsp;문의하기</a></li>
               <li><a href="/practice/csCenter/noticeList.jsp">&nbsp;&nbsp;&nbsp;공지사항</a></li>
            </ul>
            </li>
            
            <li onclick="document.getElementById('hiddenContent05').style.display=(document.getElementById('hiddenContent05').style.display=='block') ? 'none' : 'block';"><a href="#">회원정보 보기</a>
            <ul id="hiddenContent05" class="sub-menu" style="display: none;">
               <li><a href="/practice/userInfo/userInfo.jsp">내정보보기</a></li>
            </ul>
            <%
            if(user!=null)
            {
            	if(user.getId().equals("admin"))
            	{
            		%>
            <li onclick="document.getElementById('hiddenContent06').style.display=(document.getElementById('hiddenContent06').style.display=='block') ? 'none' : 'block';"><a href="#">관리자 페이지</a>
            <ul id="hiddenContent06" class="sub-menu" style="display: none;">
               <li><a href="/yagaja/admin/memberList.jsp">회원 목록</a></li>
               <li><a href="/yagaja/admin/benList.jsp">정지 리스트</a></li>
            </ul>
            		<%
           		}
            }
            %>
            </li>
            <li><a href="/yagaja/admin/logOut.jsp">로그아웃</a></li>               
         </ul>
   </div><!-- box start -->
   </div>
  </nav>
  <div id="content">
    <h1>Yagaja</h1>
  </div>
</header>