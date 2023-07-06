<%@page import="com.smhrd.model.jjimVO"%>
<%@page import="com.smhrd.model.jjimDAO"%>
<%@page import="com.smhrd.model.LicenseVO"%>
<%@page import="com.smhrd.model.LicenseDAO"%>
<%@page import="com.smhrd.model.OsVO"%>
<%@page import="com.smhrd.model.OsDAO"%>
<%@page import="com.smhrd.model.FrameworkVO"%>
<%@page import="com.smhrd.model.FrameworkDAO"%>
<%@page import="com.smhrd.model.LanguageDAO"%>
<%@page import="com.smhrd.model.LanguageVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.model.resumeVO"%>
<%@page import="com.smhrd.model.resumeDAO"%>
<%@page import="com.smhrd.model.developDAO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.developVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/metatag.jsp"%>
</head>
<body>
   <%@ include file="./include/header.jsp"%>
   <%
   // session값 가져오기
   cmpVO cmpLoginVO = (cmpVO)session.getAttribute("cmpLogin_vo"); //cmpLoginVO는 스크립틀릿의 변수명이고, session명을 가져와서 뿌려야함
   
   // 개발T 가져오기
   developDAO dao = new developDAO();
   List<developVO> list = dao.selectDevelopList();
   
    if(list != null) {
         System.out.println("개발T 성공");
         // 주의. el문법을 사용하기 위해서는 값을 가져와서 'set'해야한다
            request.setAttribute("list", list);
            //session.setAttribute("list", list);
   } else {
      System.out.println("개발T 실패");
   }
    
   // 이력서 미리보기(공개)
   resumeDAO rdao = new resumeDAO();
   List<resumeVO> rlist = rdao.selectListToEmp();
   
   if(rlist != null){
      System.out.println("이력서 미리보기 성공");
      request.setAttribute("rlist", rlist);
   }else{
      System.out.println("이력서 미리보기 실패");
   }
   
   // 이력서 미리보기(나이변경)
   int age = 0;
   Date date = new Date(); // 날짜형 데이터임
   for(int i = 0; i<rlist.size();i++){
   // 사용자의 생년월일 정보를 세션의 login_vo에서 가져옴
      String birth = rlist.get(i).getDate_birth();
      // 현재 날짜를 초기화
      SimpleDateFormat format = new SimpleDateFormat("yymmdd"); // yymmdd형으로 전환
      String str = format.format(date); // yymmdd형의 문자형으로 전환
      String birth_y = birth.substring(0,2); // 문자형 앞의 두글자만 잘라서 연도 추출
      String date_y = str.substring(0,2); // 문자형 앞의 두글자만 잘라서 연도 추출
      int birth_y_int = Integer.parseInt(birth_y); // 문자열을 정수형으로 바꾼다.
      int date_y_int = Integer.parseInt(date_y)+2000; // 문자열을 정수형으로 바꾸고 2000을 더해서 2023의 형태로
      
      // 생년월일의 연도가 현재 연도보다 작으면 2000을 더하고 크면 1900을 더해서
      // 생년월일 연도 추출
      if(birth_y_int<date_y_int){
         birth_y_int += 1900;
      }else{
         birth_y_int += 2000;
      };
      
      age = date_y_int - birth_y_int + 1 ; // 현재 연도에서 생년 연도를 빼서 나이 계산
   }
   
   // 개발스택 상중하 가져오기
      LanguageDAO Ldao = new LanguageDAO();
      List<LanguageVO> Llist = Ldao.selectLanguage();
      
      FrameworkDAO Fdao = new FrameworkDAO();
      List<FrameworkVO> Flist = Fdao.selectFramework();

      OsDAO Odao = new OsDAO();
      List<OsVO> Olist = Odao.selectOs();

      LicenseDAO LIdao = new LicenseDAO();
      List<LicenseVO> LIlist = LIdao.selectLicense();
      
      
       if(Llist != null || Flist != null || Olist != null || LIlist != null ) {
            System.out.println("개발상중하 성공");
            // 주의. el문법을 사용하기 위해서는 값을 가져와서 'set'해야한다
               request.setAttribute("Llist", Llist);
               request.setAttribute("Flist", Flist);
               request.setAttribute("Olist", Olist);
               request.setAttribute("LIlist", LIlist);   
               
      } else {
         System.out.println("개발상중하 실패");
      }
       
   //찜기능
      jjimDAO jdao = new jjimDAO();
      List<jjimVO> jlist = jdao.selectjjim();
      
      if(jlist != null) {
         System.out.println("찜목록가져오기 성공");
         // 주의. el문법을 사용하기 위해서는 값을 가져와서 'set'해야한다
            request.setAttribute("jlist", jlist);         
      } else {
         System.out.println("찜목록가져오기 실패");
      }
      
      
      
      

   %>
   <div id="wrap" class="boardEmp_wrap">
      <div class="sub_top sub_top_a">
         <div>
            <p>
               채용을 위한, <img src="./img/logo_w.png">
            </p>
         </div>
      </div>
      <div class="resumeReg">
         <div class="member_inform">
            <div>
               기업<br>회원
            </div>
            <c:if test="${not empty cmpLogin_vo}" >
               <p>
                  ${cmpLogin_vo.cmp_name}님, 반갑습니다.
               </p>
            </c:if>
         </div>
         <div class="sub_box" id="pick">
            <h2 class="sub_title">인재 PICK</h2>
            <p class="sub_title_text">기업이 원하는 인재를 '즐겨찾기 기능'으로 PICK하세요. 아래
               게시판에서 관리가 가능합니다. (단, 구직자가 이력서를 비공개 처리한 경우, 자동으로 숨김처리됩니다.)</p>
            <div class="boardJob02">
               <ul>
                  <c:forEach items="${rlist}" var="item">
                     <c:forEach items="${jlist}" var="jjim">      
                        <c:if test="${jjim.resume_num eq item.resume_num }">
                           <li>
                              <div class="boardJob_listTop">
                                 <div>
                                    <!-- 사진구분 -->
                                       <c:choose> 
                                             <c:when test = "${item.picture ne null }">
                                                <img src="${item.picture}">
                                             </c:when>
                                             <c:otherwise>
                                                <span class="material-symbols-outlined person_icon">
                                                account_circle
                                             </span>
                                             </c:otherwise>
                                         </c:choose>
                                 </div>
                                 <c:set var="isCheckList" value="true" />
                                 <c:if test="${item.resume_num eq jjim.resume_num}">
                                    <a href="jjimDelService.do?cmp_id=${cmpLogin_vo.cmp_id}&resume_num=${item.resume_num}">
                                       <img class="like" src="./img/star1.png" data-num="${item.resume_num}">
                                    </a>
                                    <c:set var="isCheckList" value="false" />
                                 </c:if>

                                 <c:if test="${isCheckList eq true}">
                                    <a href="jjimService.do?cmp_id=${cmpLogin_vo.cmp_id}&resume_num=${item.resume_num}"> 
	                                 <img class="like_off" src="./img/star0.png" data-num="${item.resume_num}">
	                              </a>
                                 </c:if>

                                 <div>
                                    <p>
                                       <span>${item.user_name}</span><span>(${item.gender}, <%=age %>세)</span>
                                    </p>
                                    <p>
                                       ${item.career_date}
                                    </p>
                                 </div>
                              </div>
                              <div class="boardJob_listBtm">
                                 <h3>${item.resume_title}</h3>
                                 <p>
                                    ${item.school_name}
                                    <!-- 학교구분 -->
                                       <c:choose> 
                                             <c:when test = "${item.school_division == '대학(4년)'}">
                                                (4년)
                                             </c:when>
                                             <c:when test = "${item.school_division == '대학(2,3년)'}">
                                                (2,3년)
                                             </c:when>
                                             <c:when test = "${item.school_division == '대입검정고시'}">
                                                대입검정고시(검정고시)<br>
                                                졸업
                                             </c:when>
                                             <c:otherwise>
                                                (${item.school_division})
                                             </c:otherwise>
                                         </c:choose>
                                    <br> ${item.major} ${item.graduation_status}
                                 </p>
                                 <p>
                                    희망지역 : ${item.hope_area} ${item.hope_area2} <br> 희망연봉 : ${item.hope_salary}
                                 </p>
                                 <p>
                                    <c:forEach items="${Llist}" var="tech">
                                       <c:if test = "${item.resume_num eq tech.resume_num}"> 
                                             <span>${tech.language_name }</span>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${Flist}" var="tech">
                                       <c:if test = "${item.resume_num eq tech.resume_num}"> 
                                             <span>${tech.framework_name }</span>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${Olist}" var="tech">
                                       <c:if test = "${item.resume_num eq tech.resume_num}"> 
                                             <span>${tech.os_name }</span>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${LIlist}" var="tech">
                                       <c:if test = "${item.resume_num eq tech.resume_num}"> 
                                             <span>${tech.license_name }</span>
                                        </c:if>
                                    </c:forEach>
                                 </p>
                              </div>
                           </li>
                        </c:if>
                     </c:forEach>
                  </c:forEach>
               </ul>
            </div>
            <!-- <div class="board_list">
               <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
               <a href="#">5</a> <a href="#" class="end">></a>
            </div> -->
         </div>
         <div class="sub_box" id="filter">
            <h2 class="sub_title">인재 필터링</h2>
            <p class="sub_title_text">기업이 원하는 인재를 '필터링 기능'으로 만나보세요. 회사에서
               사용하는 프로그래밍 언어, 프레임워크, 필수자격증 뿐 아니라 학력, 경력도 선택이 가능합니다.</p>
            <div class="resume_box rbox4">
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
                           <li class="c_btn">
                              <div>학력</div>
                              <div></div>
                           </li>
                           <li class="c_btn">
                              <div>경력</div>
                              <div></div>
                           </li>
                        </ul>
                        <ul>
                           <li class="c_content">
                              <!-- 프로그래밍언어 시작 -->
                              <ul>
                                 <c:forEach items="${list}" var="item">
                                    <li>
                                       <p>${item.languages}</p>
                                       <div>
                                          <input type="checkbox">
                                       </div>
                                    </li>
                                 </c:forEach> 
                              </ul>
                           </li>
                           <li class="c_content">
                              <!-- 프레임워크 시작 -->
                              <ul>
                                 <c:forEach items="${list}" var="item">
                                    <li>
                                       <p>${item.frameworks}</p>
                                       <div>
                                          <input type="checkbox">
                                       </div>
                                    </li>
                                 </c:forEach> 
                              </ul>
                           </li>
                           <li class="c_content">
                              <!-- OS 시작 -->
                              <ul>
                                 <c:forEach items="${list}" var="item">
                                    <li>
                                       <p>${item.oss}</p>
                                       <div>
                                          <input type="checkbox">
                                       </div>
                                    </li>
                                 </c:forEach> 
                              </ul>
                           </li>
                           <li class="c_content">
                              <!-- 자격증 시작 -->
                              <ul>
                                 <c:forEach items="${list}" var="item">
                                    <li>
                                       <p>${item.licenses}</p>
                                       <div>
                                          <input type="checkbox">
                                       </div>
                                    </li>
                                 </c:forEach> 
                              </ul>
                           </li>
                        </ul>
                     </div>
                     <div class="choose_content">
                        <p>선택한 항목</p>
                        <div>
                           <p>
                              JAVA <span class="material-symbols-outlined delete_choose">
                                 Close </span>
                           </p>
                           <p>
                              C <span class="material-symbols-outlined delete_choose">
                                 Close </span>
                           </p>
                           <p>
                              SPRING <span class="material-symbols-outlined delete_choose">
                                 Close </span>
                           </p>
                           <p>
                              TypeScript <span
                                 class="material-symbols-outlined delete_choose"> Close
                              </span>
                           </p>
                        </div>
                        <a href="#">선택한 조건<br>검색하기
                        </a>
                     </div>
                  </section>
               </div>
            </div>
            <div class="boardJob02">
               <ul>
                  <c:forEach items="${rlist}" var="item">
                     <li>
                        <div class="boardJob_listTop">
                           <div>
                              <!-- 사진구분 -->
                                 <c:choose> 
                                       <c:when test = "${item.picture ne null }">
                                          <img src="${item.picture}">
                                       </c:when>
                                       <c:otherwise>
                                          <span class="material-symbols-outlined person_icon">
                                          account_circle
                                       </span>
                                       </c:otherwise>
                                   </c:choose>
                           </div>
                           <c:set var="isCheckList" value="true" />
                           <c:forEach items="${jlist}" var="jjim">
                                 <c:choose>
                                 <c:when test="${item.resume_num eq jjim.resume_num}">
                                    <a href="jjimDelService.do?cmp_id=${cmpLogin_vo.cmp_id}&resume_num=${item.resume_num}">
                                       <img class="like" src="./img/star1.png" data-num="${item.resume_num}">
                                    </a>
                                    <c:set var="isCheckList" value="false" />
                                 </c:when>
                                 
                                 </c:choose>
                           </c:forEach>
                           
                           <c:if test="${isCheckList eq true}">
                              <a href="jjimService.do?cmp_id=${cmpLogin_vo.cmp_id}&resume_num=${item.resume_num}"> 
                                 <img class="like_off" src="./img/star0.png" data-num="${item.resume_num}">
                              </a>
                           </c:if>

                           <div>
                              <p>
                                 <span>${item.user_name}</span><span>(${item.gender}, <%=age %>세)</span>
                              </p>
                              <p>
                                 ${item.career_date}
                              </p>
                           </div>
                        </div>
                        <div class="boardJob_listBtm">
                           <h3>${item.resume_title}</h3>
                           <p>
                              ${item.school_name}
                              <!-- 학교구분 -->
                                 <c:choose> 
                                       <c:when test = "${item.school_division == '대학(4년)'}">
                                          (4년)
                                       </c:when>
                                       <c:when test = "${item.school_division == '대학(2,3년)'}">
                                          (2,3년)
                                       </c:when>
                                       <c:when test = "${item.school_division == '대입검정고시'}">
                                          대입검정고시(검정고시)<br>
                                          졸업
                                       </c:when>
                                       <c:otherwise>
                                          (${item.school_division})
                                       </c:otherwise>
                                   </c:choose>
                              <br> ${item.major} ${item.graduation_status}
                           </p>
                           <p>
                              희망지역 : ${item.hope_area} ${item.hope_area2} <br> 희망연봉 : ${item.hope_salary}
                           </p>
                           <p>
                              <c:forEach items="${Llist}" var="tech">
                                 <c:if test = "${item.resume_num eq tech.resume_num}"> 
                                       <span>${tech.language_name }</span>
                                  </c:if>
                              </c:forEach>
                              <c:forEach items="${Flist}" var="tech">
                                 <c:if test = "${item.resume_num eq tech.resume_num}"> 
                                       <span>${tech.framework_name }</span>
                                  </c:if>
                              </c:forEach>
                              <c:forEach items="${Olist}" var="tech">
                                 <c:if test = "${item.resume_num eq tech.resume_num}"> 
                                       <span>${tech.os_name }</span>
                                  </c:if>
                              </c:forEach>
                              <c:forEach items="${LIlist}" var="tech">
                                 <c:if test = "${item.resume_num eq tech.resume_num}"> 
                                       <span>${tech.license_name }</span>
                                  </c:if>
                              </c:forEach>
                           </p>
                        </div>
                     </li>
                  </c:forEach>
               </ul>
            </div>
            <ul class="board_list">
               <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
               <a href="#">5</a> <a href="#" class="end">></a>
            </ul>
         </div>
      </div>
   </div>
   <%@ include file="./include/footer.jsp"%>
   <script>
      // 개발기술스택 tab 처리
      //함수 호출 반복문
      for (let i = 0; i < $('.c_btn').length; i++) {
         tabOpen(i);
      }

      //함수에 보관
      function tabOpen(e) {
         $('.c_btn').eq(e)
               .click(
                     function() {
                        $(this).removeClass('choose_off').addClass(
                              'choose_on');
                        $('.c_btn').not(this).removeClass('choose_on')
                              .addClass('choose_off');
                        $('.c_content').eq(e).show();
                        $('.c_content').not($('.c_content').eq(e))
                              .hide();
                     });
      }
      
      //찜기능 Ajax처리
      const jjimAjax = (event)=>{
         
            event.preventDefault();
         
            console.log('jjimAjax')
            console.log(event.target.getAttribute("data-num"));

            let cmp_id = '<%=cmpLogin_vo.getCmp_id() %>';
            let resume_num = event.target.getAttribute("data-num");
            
              $.ajax({
                url : 'jjimService.do', 
                type : 'get',
                data : {cmp_id : cmp_id, resume_num : resume_num},
                datatype : 'JSON',
                success : (res)=>{
                    console.log('통신(찜추가)에 성공했습니다.', )
                    location.reload();
                },
                error : ()=>{
                    console.log('통신(찜추가)에 실패하셨습니다!')
                }
            })
        }
      
        $('.like_off').click(jjimAjax);
        
        
        
        const jjimDelAjax = (event)=>{
          
            event.preventDefault();
         
            console.log('jjimDelAjax')
            console.log(event.target.getAttribute("data-num"));

            let cmp_id = '<%=cmpLogin_vo.getCmp_id() %>';
            let resume_num = event.target.getAttribute("data-num");
            
              $.ajax({
                url : 'jjimDelService.do', 
                type : 'get',
                data : {cmp_id : cmp_id, resume_num : resume_num},
                datatype : 'JSON',
                success : (res)=>{
                    console.log('통신(찜추가)에 성공했습니다.', )
                    location.reload();
                },
                error : ()=>{
                    console.log('통신(찜추가)에 실패하셨습니다!')
                }
            })
        }
      
        $('.like').click(jjimDelAjax);

      
      
      
      
      
   </script>
</body>
</html>