<%@page import="com.smhrd.model.resumeVO"%>
<%@page import="com.smhrd.model.resumeDAO"%>
<%@page import="com.smhrd.model.developVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.developDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/metatag.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>  
</head>
<body>
	<%@ include file="./include/header.jsp" %>
	<%
	// session값 가져오기
	cmpVO cmpLoginVO = (cmpVO) session.getAttribute("cmpLogin_vo");

	// 개발T 가져오기
	developDAO dao = new developDAO();
	List<developVO> list = dao.selectDevelopList();

	if (list != null) {
		System.out.println("개발T 성공");
		// 주의. el문법을 사용하기 위해서는 값을 가져와서 'set'해야한다
		request.setAttribute("list", list);
		//session.setAttribute("list", list);
		System.out.println(list);
	} else {
		System.out.println("개발T 실패");
	}
	%>
	<div id="wrap" class="resumeReg_wrap">
       <div class="sub_top sub_top_a">
            <div>
                <p>구직을 위한, <img src="./img/logo_w.png"></p>
            </div>
       </div>	       
       <div class="resumeReg">
            <div class="member_inform">
                <div>개인<br>회원</div>
                <p><%=login_vo.getUser_name()%>님, 반갑습니다.</p>
            </div>
            <div class="sub_box">
                <h2 class="sub_title">이력서 등록</h2>
                <form action="resumeReqService.do" method="post" id="myForm" enctype="multipart/form-data">
                <!-- 임의 스타일 수정 추후 확인바람 -->
                <p align="right" style="font-size: 12px;margin-bottom: 3px"><span class="star">&#42;</span> 필수 입력 정보입니다.</p>
                    <div class="resume_box rbox1">
                        <input name="resume_title" class="mandatory" type="text" placeholder="기업에게 알리는 나의 강점,목표,관심분야 등 이력서의 제목을 적어주세요">
                    </div>
                    <div class="resume_box rbox2">
                        <h3>인적사항</h3>
                        <p><span class="star">&#42;</span> 필수 입력 정보입니다.</p>
                        <div>
                            <section class="col-sm-2 imgUp">
						    	<div class="imagePreview"></div>
								<label class="btn btn-primary">
									사진등록<input name="picture" type="file" class="uploadFile img" value="Upload Photo" style="width: 0px;height: 0px;overflow: hidden;">
								</label>
						 	 </section><!-- col-2 -->
                            <div>
                                <div class="input readonly">
                                    <label>이름 <span class="star">&#42;</span></label>
                                    <input class="mandatory" type="text" placeholder=<%=login_vo.getUser_name() %> value=<%=login_vo.getUser_name() %> name="user_name" readonly>
                                    <input type="hidden" value="<%=login_vo.getUser_id() %>" name="user_id">
                                </div>
                                <div class="input readonly">
                                    <label>생년월일 <span class="star">&#42;</span></label>
                                    <input class="mandatory" type="text" placeholder=<%=login_vo.getDate_birth() %> value=<%=login_vo.getDate_birth() %> name="date_birth" readonly>
                                </div>
                                <div class="input readonly">
                                    <label>성별 <span class="star">&#42;</span></label>
                                    <input class="mandatory" type="text" placeholder="<%=login_vo.getGender() %>" value="<%=login_vo.getGender() %>" name="gender" readonly>
                                </div>
                                <div class="input readonly">
                                    <label>이메일<span class="star">&#42;</span></label>
                                    <input class="mandatory" type="email" placeholder=<%=login_vo.getUser_email() %> value=<%=login_vo.getUser_email() %> name="user_email" readonly>
                                </div>
                            </div>
                            <div>
                                <div class="input readonly">
                                    <label>연락처 <span class="star">&#42;</span></label>
                                    <input class="mandatory" type="text" placeholder=<%=login_vo.getUser_tel() %> value=<%=login_vo.getUser_tel() %> name="user_tel" readonly>
                                </div>
                                <div class="input">
                                    <label>추가연락처</label>
                                    <input type="text" placeholder="" name="user_tel2">
                                </div>
                                <div class="input">
                                    <label>주소 <span class="star">&#42;</span></label>
                                    <input class="mandatory" type="text" placeholder="동까지 입력해주세요" name="address">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="resume_box rbox3">
                        <h3>최종학력</h3>
                        <div>
                            <div class="input">
                                <div class="label">학교구분<span class="star">&#42;</span></div>
                                <select id="school_division" name="school_division" class="mandatory" onChange="AddClass()">
                                    <option value="고등학교">고등학교</option>
                                    <option value="대학(2,3년)">대학(2,3년)</option>
                                    <option value="대학(4년)">대학(4년)</option>
                                    <option value="대학원">대학원</option>
                                    <option value="대입검정고시">대입검정고시</option>
                                </select>
                            </div>
                            <div class="input ged">
                                <label>학교명 <span class="star">&#42;</span></label>
                                <input type="text" placeholder="" name="school_name" class="mandatory alpha">
                            </div>
                            <div class="input ged">
                                <label>전공</label>
                                <input type="text" placeholder="" name="major" class="alpha">
                            </div>
                            <div class="input ged">
                                <div class="label">졸업상태<span class="star">&#42;</span></div>
                                <!-- 글자 세로로 출력댐 수정필요 -->
                                <select name="graduation_status" class="mandatory alpha">
                                    <option value="졸업">졸업</option>
                                    <option value="졸업예정">졸업예정</option>
                                    <option value="재학중">재학중</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="resume_box rbox4">
                        <h3>개발기술스택</h3>
                        <div>
                            <section>
                                <div class="choose">
                                    <ul>
                                        <li class="c_btn">
                                        	<div>프로그래밍 언어</div>
                                        	<div></div>
                                        </li>
                                        <li class="c_btn">
                                        	<div>프레임워크</div>
                                        	<div></div>
                                        </li>
                                        <li class="c_btn">
                                        	<div>OS</div>
                                        	<div></div>
                                        </li>
                                        <li class="c_btn">
                                        	<div>자격증</div>
                                        	<div></div>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="c_content"><!-- 프로그래밍언어 시작 -->
                                            <ul>
												<c:forEach items="${list}" var="item">
												<li>
													<p class='language'>${item.languages}</p>
													<div>
														<input type="radio" value="${item.languages}_상" name="${item.languages}">
														<input type="radio" value="${item.languages}_중" name="${item.languages}">
														<input type="radio" value="${item.languages}_하" name="${item.languages}">
														<input type="hidden" value="${item.languages}" name="languages">
													</div>
												</li>
											</c:forEach> 
                                          </ul>
                                        </li>
                                        <li class="c_content"><!-- 프레임워크 시작 -->
                                            <ul>
												<c:forEach items="${list}" var="item">
												<li>
													<p>${item.frameworks}</p>
													<div>
														<input type="radio" value="${item.frameworks}_상" name="${item.frameworks}">
														<input type="radio" value="${item.frameworks}_중" name="${item.frameworks}">
														<input type="radio" value="${item.frameworks}_하" name="${item.frameworks}">
														<input type="hidden" value="${item.frameworks}" name="frameworks">
													</div>
												</li>
											</c:forEach> 
                                            </ul>
                                        </li>
                                        <li class="c_content"><!-- OS 시작 -->
                                            <ul>
												<c:forEach items="${list}" var="item">
												<li>
													<p>${item.oss}</p>
													<div>
														<input type="radio" value="${item.oss}_상" name="${item.oss}">
														<input type="radio" value="${item.oss}_중" name="${item.oss}">
														<input type="radio" value="${item.oss}_하" name="${item.oss}">
														<input type="hidden" value="${item.oss}" name="oss">
													</div>
												</li>
											</c:forEach> 
                                            </ul>
                                        </li>
                                        <li class="c_content" id="licenseList"><!-- 자격증 시작 -->
                                         <ul>
											<c:forEach items="${list}" var="item">
												<li>
													<p>${item.licenses}</p>
													<div>
														<input type="radio" value="${item.licenses}_" name="${item.licenses}">
														<input type="hidden" value="${item.licenses}" name="licenses">
													</div>
												</li>
											</c:forEach> 
                                    	</ul>
                                </ul>
                                </div>
                                <div class="choose_content">
                                    <p>선택한 항목</p>
                                     <div id="selected_values_list">	
                                    	<p>
                                    	</p>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <div class="resume_box rbox5">
                        <h3>기타자격증</h3>
                        <div>
                        	<ul>
                        		<li>
		                            <div class="input">
		                                <label>자격증명</label>
		                                <input type="text" name="other_license">
		                            </div>
		                            <span class="material-symbols-outlined delete">
		                                Close
		                            </span>
	                           	</li>
                            </ul>
                            <div class="add">
                            	<div>
	                                <span class="material-symbols-outlined">
	                                    add_circle
	                                </span>
	                                추가
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="resume_box rbox6" id="career">
                        <h3>경력</h3>
                        <div>
                        	 <div class="input">
                                <div class="label">기간<span class="star">&#42;</span></div>
                                <select name="career_date">
                                    <option value="신입">신입</option>
                                    <option value="1년 이상">1년 이상</option>
                                    <option value="2년 이상">2년 이상</option>
                                    <option value="3년 이상">3년 이상</option>
                                    <option value="5년 이상">5년 이상</option>
                                    <option value="7년 이상">7년 이상</option>
                                    <option value="10년 이상">10년 이상</option>
                                </select>
                            </div>
                            <div class="input">
                                <div class="label">회사명, 부서명, 입사년월과 퇴사년월, 직급/직책, 담당직무 등을 입력해주세요.</div>
                                <textarea placeholder="" name="career"></textarea>
                            </div>
                            <span class="material-symbols-outlined delete">
                                Close
                            </span>
                            <div class="add add2">
                            	<div>
	                                <span class="material-symbols-outlined">
	                                    add_circle
	                                </span>
	                                추가
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="resume_box rbox6">
                        <h3>수상</h3>
                        <div>
                            <div class="input">
                                <div class="label">수상명, 수여기관, 수상연도, 수상내용 등을 입력해주세요.</div>
                                <textarea placeholder="" name="award"></textarea>
                            </div>
                            <span class="material-symbols-outlined delete">
                                Close
                            </span>
                            <div class="add add3">
                            	<div>
	                                <span class="material-symbols-outlined">
	                                    add_circle
	                                </span>
	                                추가
                                </div>
                            </div>                        
                            </div>
                    </div>
                    <div class="resume_box rbox8">
                        <h3>자기소개서</h3><span class="star">&#42;</span>
                        <div>
                            <div class="input">
                                <div class="label">성장과정, 성격의 장단점, 경력사항, 지원동기 및 입사 후 포부 등을 입력해주세요.</div>
                                <textarea placeholder="" name="self_introduction" class="mandatory"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="resume_box rbox9">
                        <h3>포트폴리오</h3>
                        <div>
                            <input type="file" name="file_name">
                            <input name="picture" type="file" class="uploadFile img" value="Upload Photo" style="width: 0px;height: 0px;overflow: hidden;">
                            <div class="input">
                                <label>URL</label>
                                <input type="text" placeholder="" name="url">
                            </div>
                        </div>
                    </div>
                    <div class="resume_box rbox10">
                        <h3>희망근무조건</h3>
                        <div>
                            <div class="input">
                                <label>희망연봉</label>
                                <input type="text" placeholder="" name="hope_salary">
                                <span>만원이상</span>
                            </div>
                            <div class="input">
                                <label>희망지역<span class="star">&#42;</span></label>
                                <input type="text" placeholder="<%=login_vo.getHope_area() %>" class="mandatory" name="hope_area" value="<%=login_vo.getHope_area() %>" readonly>
                            </div>
                            <div class="input">
                                <label>희망지역2</label>
                                <input type="text" placeholder="" name="hope_area2">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="on_off" id="choice" value="">
                    <input type="submit" id="resumeReg_btn" value="이력서 저장" onclick="confirmSubmit(event)">
                    </form>
            </div>
       </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script>
	// 개발기술스택 tab 처리
	    //함수 호출 반복문
	     for(let i = 0; i < $('.c_btn').length; i++){
	         tabOpen(i); 
	     }
	     //함수에 보관
	     function tabOpen(e){
	         $('.c_btn').eq(e).click(function(){
	        	 $(this).removeClass('choose_off').addClass('choose_on');
	             $('.c_btn').not(this).removeClass('choose_on').addClass('choose_off');
	             $('.c_content').eq(e).show();
	             $('.c_content').not( $('.c_content').eq(e)).hide();
	         });
	     }

	 	// 이력서사진
		$(document).on("click", "i.del" , function() {
		// 	to remove card
		$(this).parent().remove();
		// to clear image
		  // $(this).parent().find('.imagePreview').css("background-image","url('')");
		});
		$(function() {
		    $(document).on("change",".uploadFile", function()
		    {
		    		var uploadFile = $(this);
		        var files = !!this.files ? this.files : [];
		        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
		 
		        if (/^image/.test( files[0].type)){ // only image file
		            var reader = new FileReader(); // instance of the FileReader
		            reader.readAsDataURL(files[0]); // read the local file
		 
		            reader.onloadend = function(){ // set image data as background of div
		                //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
		uploadFile.closest(".imgUp").find('.imagePreview').css("background-image", "url("+this.result+")");
		            }
		        }
		      
		    });
		});
		// 삭제 및 추가 기타자격증
		$('.add > div').click(function() {
			var input = $("<li><div class='input'><label>자격증명</label><input type='text' placeholder=''></div><span class='material-symbols-outlined delete'>Close</span></li>");
			$(this).parent().siblings('ul').append(input);
			input.find('.delete').click(function() {
				$(this).parent('li').remove();
			});
		});

		// 삭제 및 추가 수상
		$(document).ready(function() {
		  // 추가 버튼을 누르면 input 클래스를 가진 div를 추가합니다.
		  $('.add3').click(function() {
		    var newInput = '<div class="input" style="margin-top: 10px"><div class="label">수상명, 수여기관, 수상연도, 수상내용 등을 입력해주세요.</div><textarea placeholder=""></textarea></div><span class="material-symbols-outlined delete">Close</span>';
		    $(this).before(newInput);
		  });
		  
		  // 삭제 버튼을 누르면 해당 input 클래스를 가진 div를 삭제합니다.
 		  $(document).on('click', '.delete', function() {
		    $(this).prev('.input').remove();
		    $(this).remove();
		  });
		});
		
		// 삭제 및 추가 경력
		$(document).ready(function() {
		  // 추가 버튼을 누르면 input 클래스를 가진 div를 추가합니다.
		  $('.add2').click(function() {
		    var newInput = '<div class="input" style="margin-top: 10px"><div class="label">회사명, 부서명, 입사년월과 퇴사년월, 직급/직책, 담당직무 등을 입력해주세요.</div><textarea placeholder=""></textarea></div><span class="material-symbols-outlined delete">Close</span>';
		    $(this).before(newInput);
		  });
		  
		  // 삭제 버튼을 누르면 해당 input 클래스를 가진 div를 삭제합니다.
		  $(document).on('click', '.delete', function() {
		    $(this).prev('.input').remove();
		    $(this).remove();
		  });
		});
		// 대입검정고시
		var schoolDivision = document
				.querySelector('select[name="school_division"]');
		var schoolName = document.querySelector('input[name="school_name"]');
		var major = document.querySelector('input[name="major"]');
		var graduationStatus = document
				.querySelector('select[name="graduation_status"]');

		schoolDivision.addEventListener('change', function() {
			if (schoolDivision.value === '대입검정고시') {
				schoolName.readOnly = true;
				major.readOnly = true;
				graduationStatus.value = '';
				graduationStatus.disabled = true;
			} else {
				schoolName.readOnly = false;
				major.readOnly = false;
				graduationStatus.value = '';
				graduationStatus.disabled = false;
			}
		});
		function confirmSubmit(event) {
			  // 필수항목 null체크
			  const requiredInputs = document.querySelectorAll('.mandatory');
			  let hasError = false;
			  requiredInputs.forEach(function(input) {
			    if (!input.value) {
			      hasError = true;
			    }
			  });
			  if (hasError) {
			    event.preventDefault(); // form submit 취소
			    alert('모든 필수 입력 항목을 작성해주세요.');
			    return;
			  }

			  // 이력서 공개여부
			  var confirmed = confirm("이력서가 등록되었습니다. 공개하시겠습니까?");
			  if (confirmed) {
			    // "예"를 선택한 경우
			    document.getElementById("choice").value = "on";
			    document.getElementById("myForm").submit(); // form 제출
			  } else {
			    // "아니오"를 선택한 경우
			    document.getElementById("choice").value = null;
			    // 다른 작업 수행...
			  }
			}
		// 대입검정고시 선택시, class추가
		
		function AddClass(){
			let ged_all = document.getElementById('school_division');
			let ged = ged_all.options[ged_all.selectedIndex].value;
			let gedList = document.getElementsByClassName('ged'); 
			
			if(ged == '대입검정고시'){
				for(var i = 0; i<gedList.length;i++){
					document.querySelectorAll('.alpha')[i].value='';
					gedList[i].classList += ' readonly';
				 	
				}
			}else{
				for(var i = 0; i<gedList.length;i++){
				 	gedList[i].classList.remove('readonly');
				}
			} 
		}
		$(document).ready(function() {
		    // 선택된 값을 저장할 배열
		    var selectedValues = [];

		    // 라디오 버튼 클릭 이벤트 처리
		    $('input[type="radio"]').click(function() {
		        // 선택된 값 가져오기
		        var selectedValue = $(this).val();
		        var selectedLanguage = $(this).siblings('input[type="hidden"]').val();

		        // 선택된 값이 이전에 선택된 값인지 확인
		        var isDuplicate = false;
		        for (var i = 0; i < selectedValues.length; i++) {
		            if (selectedValues[i].value === selectedValue && selectedValues[i].language === selectedLanguage) {
		                isDuplicate = true;
		                break;
		            }
		        }

		        // 중복된 값이 없으면 선택된 값 추가하기
		        if (!isDuplicate) {
		            selectedValues.push({
		                value: selectedValue,
		                language: selectedLanguage
		            });

		            // 선택된 값들을 출력할 div 태그 찾기
		            var selectedValuesList = $('#selected_values_list');

		            // 선택된 값 추가하기
		            var newItem = $('<div class="selected_item" style="float: left;"></div>');
		            newItem.text(selectedValue);

		            // 삭제 버튼 추가하기
		            var deleteButton = $('<span class="material-symbols-outlined delete">Close</span>');
		            newItem.append(deleteButton);

		            // 선택된 값들을 가로로 출력하기
		            selectedValuesList.append(newItem);

		            // 기존에 선택되어 있던 라디오 버튼 비활성화
		            $('input[type="radio"][name="' + selectedLanguage + '"]').not(this).prop('disabled', true);

		            // 삭제 버튼 클릭 이벤트 처리
		            deleteButton.click(function() {
		                $(this).parent().remove();
		                $('input[type="radio"][name="' + selectedLanguage + '"]').prop('checked', false).prop('disabled', false);

		                // 선택된 값 배열에서 제거하기
		                for (var i = 0; i < selectedValues.length; i++) {
		                    if (selectedValues[i].value === selectedValue && selectedValues[i].language === selectedLanguage) {
		                        selectedValues.splice(i, 1);
		                        break;
		                    }
		                }
		            });
		        }
		    });
		});
	</script>
</body>
</html>