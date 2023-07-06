<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/metatag.jsp"%>
</head>
<body>
	<%@ include file="./include/header.jsp"%>
	<div id="wrap" class="login_wrap">
		<div class="sub_top">
			<div>
				<p>회원가입</p>
			</div>
		</div>
		<div class="sub_join">
			<div class="sub_join01">
				<img src="./img/logo.png">
				<p>개발인력을 위한 모든 것, ALL-IT</p>
			</div>
			<div class="sub_join02">
				<ul>
					<li>개인회원</li>
					<li>기업회원</li>
				</ul>
				<ul>
					<li id="join_people">
						<ul>
							<li><span>개인회원</span> 가입하고 다양한 혜택을 누리세요!</li>
							<li>*필수 입력 정보입니다.</li>
						</ul>
						<form id="join_form" action="userJoinService.do" method="post"
							onsubmit="return validateForm()">
							<ul class="join_box01">
								<li><input type="text" placeholder="아이디 *" name="user_id">
									<input type="password" placeholder="비밀번호 *" name="user_pw">
									<input type="text" placeholder="이름(성명) *" name="user_name">
									<input type="text" placeholder="연락처 *" name="user_tel">
									<input type="text" placeholder="이메일 *" name="user_email">
									<input type="text" placeholder="생년월일(YYMMDD) *"
									name="date_birth"> <input type="text" placeholder="희망지역 *" name="hope_area">
									<div class="gender">
										<span>성별 *　　</span>
										남<input type="radio" placeholder="성별 *" name="gender" value="남">　　
										여<input type="radio" placeholder="성별 *" name="gender" value="여">
									</div>
									
									</li>
								<li><input type="submit" value="가입하기"></li>
							</ul>
						</form>
					</li>
					<li id="join_emp">
						<ul>
							<li><span>기업회원</span> 가입하고 다양한 혜택을 누리세요!</li>
							<li>*필수 입력 정보입니다.</li>
						</ul>
						<form id="cmp_join_form" action="cmpJoinService.do" method="post"
							onsubmit="return cmpValidateForm()">
							<ul class="join_box02">
								<li><input type="text" placeholder="아이디 *" name="cmp_id">
									<input type="password" placeholder="비밀번호 *" name="cmp_pw">
									<input type="text" placeholder="기업명 *" name="cmp_name">
									<input type="text" placeholder="사업자번호 *" name="business_num">
									<input type="text" placeholder="기업의 주소 *" name="area">
								</li>
								<li><input type="submit" value="가입하기"></li>
							</ul>
						</form>
					</li>

				</ul>
			</div>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>
	<script>
		$('.sub_join02 > ul:nth-child(1)>li').click(
				function() {
					$(this).removeClass('off').addClass('on');
					$('.sub_join02 > ul:nth-child(1) >li').not(this)
							.removeClass('on').addClass('off');
				});
		$('.sub_join02 > ul:nth-child(1)>li:nth-child(1)').click(function() {
			$('#join_emp').hide();
			$('#join_people').show();
		});
		$('.sub_join02 > ul:nth-child(1)>li:nth-child(2)').click(function() {
			$('#join_people').hide();
			$('#join_emp').show();
		});
		/* 회원가입(구직자) null값 체크 */
		function validateForm() {
			  const form = document.getElementById("join_form");
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
		/* 회원가입(기업) null값 체크 */
		function cmpValidateForm() {
			  const form = document.getElementById("cmp_join_form");
			  const inputs = form.querySelectorAll("input[type='text'], input[type='password']");

			  for (let input of inputs) {
			    if (input.value === "") {
			      alert("값을 입력해주세요.");
			      input.focus();
			      return false;
			    }
			  }
			  return true;
			}
	</script>

</body>
</html>