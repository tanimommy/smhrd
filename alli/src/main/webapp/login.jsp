<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/metatag.jsp"%>
</head>
<body>
	<%@ include file="./include/header.jsp"%>
	<div id="wrap" class="login_wrap">
		<div class="sub_top">
			<div>
				<p>로그인</p>
			</div>
		</div>
		<div class="sub_login">
			<div class="sub_login01">
				<img src="./img/logo.png">
				<p>개발인력을 위한 모든 것, ALL-IT</p>
			</div>
			<div class="sub_login02">
				<ul>
					<li>개인회원</li>
					<li>기업회원</li>
				</ul>
				<ul>
					<li id="login_people">
						<p>
							<span>개인회원</span> 로그인입니다
						</p>
						<form id="login_form" action="userLoginService.do"
							onsubmit="return validateForm()">
							<ul class="login_box">
								<li><input type="text" placeholder="아이디" name="user_id">
									<input type="password" placeholder="비밀번호" name="user_pw"></li>
								<li><input type="submit" value="로그인"></li>
							</ul>
						</form>
 						<%
 							String loginFailed = null; 
							loginFailed = (String)session.getAttribute("loginFailed");
							System.out.println("가지고온 값" + loginFailed);
						%>
						<% if (loginFailed != null && loginFailed.equals("login.jsp")) { %>
						    <script>
						    	alert("아이디 혹은 비밀번호를 다시 확인 해주세요.");
						    </script>
						    <%
						    	loginFailed = null;
						    %>
						<% } %>
						<ul class="login_bottom">
							<li><a href="#">회원가입</a></li>
							<li>&#124;</li>
							<li><a href="#">아이디 &#183; 비밀번호 찾기</a></li>
						</ul>
					</li>
					<li id="login_emp">
						<p>
							<span>기업회원</span> 로그인입니다
						</p>
						<form id="cmp_login_form" action="cmpLoginService.do"
							onsubmit="return cmpValidateForm()">
							<ul class="login_box">
								<li><input type="text" placeholder="아이디" name="cmp_id">
									<input type="password" placeholder="비밀번호" name="cmp_pw"></li>
								<li><input type="submit" value="로그인"></li>
							</ul>
						</form>
						<%
							String cmploginFailed = null; 
							cmploginFailed = (String)session.getAttribute("cmploginFailed");
							System.out.println("가지고온 값" + cmploginFailed);
						%>
						<% if (cmploginFailed != null && cmploginFailed.equals("login.jsp")) { %>
						    <script>
						    	alert("아이디 혹은 비밀번호를 다시 확인 해주세요.");
						    </script>
						    <%
						    	cmploginFailed = null;
						    %>
						<% } %>
						<ul class="login_bottom">
							<li><a href="join.jsp">회원가입</a></li>
							<li>&#124;</li>
							<li><a href="#">아이디 &#183; 비밀번호 찾기</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>
	<script>
        $('.sub_login02 > ul:nth-child(1)>li').click(function(){
            $(this).removeClass('off').addClass('on');
            $('.sub_login02 > ul:nth-child(1) >li').not(this).removeClass('on').addClass('off');
        });
        $('.sub_login02 > ul:nth-child(1)>li:nth-child(1)').click(function(){
            $('#login_emp').hide();
            $('#login_people').show();
        });
        $('.sub_login02 > ul:nth-child(1)>li:nth-child(2)').click(function(){
            $('#login_people').hide();
            $('#login_emp').show();
        });
		/* 로그인(구직자) null값 체크 */
		function validateForm() {
			  const form = document.getElementById("login_form");
			  const inputs = form.querySelectorAll("input[type='text'], input[type='password']");
			  
			  for (let input of inputs) {
			    if (input.value === "") {
			      alert("아직 작성해야할 칸이 남았습니다.");
			      input.focus();
			      return false;
			    }
			  }
			  return true;
			}
		/* 로그인(기업) null값 체크 */
		function cmpValidateForm() {
			  const form = document.getElementById("cmp_login_form");
			  const inputs = form.querySelectorAll("input[type='text'], input[type='password']");
			  
			  for (let input of inputs) {
			    if (input.value === "") {
			      alert("아직 작성해야할 칸이 남았습니다.");
			      input.focus();
			      return false;
			    }
			  }
			  return true;
			}
    </script>
</body>
</html>