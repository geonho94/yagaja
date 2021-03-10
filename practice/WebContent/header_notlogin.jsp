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


</style>
<header>

<input id="hamburger" type="checkbox" /><label for="hamburger">&equiv;</label>
  <nav>
  <div class="container"><!-- container start -->
   <div id="header_menu">Yagaja</div>
    <div class="box"><!-- box 시작 -->
       <div id="userone"><!-- userone start -->
          <div class="sign-up"><!-- sign-up start -->
          <a href="/yagaja/member/login.jsp">로그인 후 이용하세요.</a>
          </div><!-- sign-up end -->
       </div><!-- userone end -->
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
               <li><a href="/yagaja/ad/ad.jsp">&nbsp;&nbsp;&nbsp;광고게시판</a></li>
            </ul>
            </li>
            
            <li onclick="document.getElementById('hiddenContent04').style.display=(document.getElementById('hiddenContent04').style.display=='block') ? 'none' : 'block';"><a href="#">고객센터</a>
            <ul id="hiddenContent04" class="sub-menu" style="display: none;">
               <li><a href="/yagaja/csCenter/QnAList.jsp">&nbsp;&nbsp;&nbsp;문의하기</a></li>
               <li><a href="/yagaja/csCenter/noticeList.jsp">&nbsp;&nbsp;&nbsp;공지사항</a></li>
            </ul>
            </li>            
         </ul>
   </div><!—- box start -—>
   </div>
  </nav>
  <div id="content">
   <h1><a href = "/yagaja/index.jsp">Yagaja</a></h1>
  </div>
</header>