<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.OsVO"%>
<%@page import="com.smhrd.model.FrameworkVO"%>
<%@page import="com.smhrd.model.LanguageVO"%>
<%@page import="com.smhrd.model.LicenseVO"%>
<%@page import="com.smhrd.model.LicenseDAO"%>
<%@page import="com.smhrd.model.OsDAO"%>
<%@page import="com.smhrd.model.FrameworkDAO"%>
<%@page import="com.smhrd.model.LanguageDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.smhrd.model.resumeDAO"%>
<%@page import="com.smhrd.model.resumeVO"%>
<%@page import=" java.time.LocalDate"%>
<%@page import=" java.math.BigDecimal"%>
<%@ include file="./include/metatag.jsp" %>  
<link href="./css/dashKO.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
</head>
<body>


	<%
		BigDecimal resume_num = new BigDecimal(request.getParameter("resume_num"));
		resumeDAO dao = new resumeDAO();
		resumeVO print_vo = dao.resume_Print(resume_num);
		LocalDate now = LocalDate.now();
		
		System.out.println(resume_num);


		int year = now.getYear(); // 현재 년도
	    String year_temp = Integer.toString(year).substring(2, 3); // 년도 끝 2자리
	    int year_temp1 = Integer.parseInt(year_temp);
	    int month = now.getDayOfYear(); // 현재 월
	    int date = now.getDayOfMonth(); // 현재 일
	    String birth = print_vo.getDate_birth(); // 태어난 년,월,일
	    int birth_temp1 = Integer.parseInt(birth.substring(0,2)); // 태어난 년도
	    int birth_temp2 = Integer.parseInt(birth.substring(2,4)); // 태어난 월
	    int birth_temp3 = Integer.parseInt(birth.substring(4)); // 태어난 일
	    int age = 0;
      
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

   %>
   
   <!-- 만 나이 계산 -->
   <%if(birth_temp1 > year_temp1){ %>
          <% int temp_b = birth_temp1+ 1900;%>
          <% age = year - temp_b;%>
          <%if(birth_temp2 * 100 + birth_temp3 > month * 100 + date){ %>
               <%age--; %>
         <%} %>
   <%}else{ %>
          <% int temp_b = birth_temp1 + 2000; %>
          <% age = year - temp_b;%>
          <%if(birth_temp2 * 100 + birth_temp3 > month * 100 + date){ %>
               <%age--; %>
          <%} %>
   <%} %>

   <%@ include file="./include/header.jsp" %>
   <div id="wrap" class="resumeReg_wrap">
      <div class="sub_top sub_top_a">
         <div>
            <p>
               구직을 위한, <img src="./img/logo_w.png">
            </p>
         </div>
      </div>
      <div class="resumeReg">
         <div class="member_inform">
            <div>
               개인<br>회원
            </div>
            <p><%=print_vo.getUser_name()%>님, 반갑습니다.
            </p>
         </div>
         <div class="sub_box">
            <form>
               <div id="resumePDF">
                  <div class="print_box" id="pbox1">
                     <p><%=print_vo.getResume_title() %></p>
                  </div>
                  <div class="print_box" id="pbox2">
                     <div class="w_box">
                        <div>
                           <img src=<%=print_vo.getPicture()%>>
                        </div>
                        <div>
                           <p><%=print_vo.getUser_name()%>
                              <span><%=print_vo.getGender()%> <%=print_vo.getDate_birth()%>
                                 (만 <%=age%>세)</span>
                           </p>
                           <ul>
                              <li><span>연락처</span> <span>｜</span> <span><%=print_vo.getUser_tel()%></span>
                              </li>
                              <li><span>추가연락처</span> <span>｜</span> <span> <%if(print_vo.getUser_tel2() == null){%>
                                    <span>-</span> <%}else{%> <%=print_vo.getUser_tel2() %> <%}%>
                              </span></li>
                              <li><span>Email</span> <span>｜</span> <span><%=print_vo.getUser_email()%></span>
                              </li>
                              <li><span>주소</span> <span>｜</span> <span><%=print_vo.getAddress()%></span>
                              </li>
                              <li><span>최종학력</span> <span>｜</span> <span><%=print_vo.getSchool_division()%>
                                    <%=print_vo.getGraduation_status()%></span></li>
                              <li><span>희망근무지</span> <span>｜</span> <span><%=print_vo.getHope_area()%>
                                    <%if(print_vo.getHope_area2() == null){%> <span> </span> <%}else{%>
                                    , <%=print_vo.getHope_area2()%> <%}%> </span></li>
                              <li><span>희망연봉</span> <span>｜</span> <span> <%if(print_vo.getHope_salary() == null){%>
                                    <span>-</span> <%}else{%> <%=print_vo.getHope_salary()%> 만원 <%}%>
                              </span></li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="print_box" id="pbox3">
                     <h3>개발기술스택</h3>
                     <div class="w_box">
                        <ul>
                           <li><span>프로그래밍 언어</span> <span>｜</span>
                              <div>
                                      <%for(LanguageVO l : Llist){ %>
                                       <%BigDecimal lresume_num = new BigDecimal(243); %>
                                       <%if( l.getResume_num() == lresume_num) {%>
                                          <span>
                                             <%=l.getLanguage_name()%> [<%=l.getLanguage_level() %>]
                                          </span>
                                       <%} %>   
                                    <%} %>

                              </div>
                           </li>
                           <li><span>프레임워크</span> <span>｜</span>
                              <div>
                                      <%for(FrameworkVO F : Flist){ %>
                                       <%BigDecimal fresume_num = new BigDecimal(243); %>
                                       <%if( F.getResume_num() == fresume_num) {%>
                                          <span>
                                             <%=F.getFramework_name()%> [<%=F.getFramework_level() %>]
                                          </span>
                                       <%} %>   
                                    <%} %>
                              </div>
                           </li>
                           <li><span>OS</span> <span>｜</span>
                              <div>
                                      <%for(OsVO O : Olist){ %>
                                      <%BigDecimal oresume_num = new BigDecimal(243); %>
                                       <%if( O.getResume_num() == oresume_num) {%>
                                          <span>
                                             <%=O.getOs_name()%> [<%=O.getOs_level() %>]
                                          </span>
                                       <%} %>   
                                    <%} %>
                              </div>
                           </li>
                           <li><span>자격증</span> <span>｜</span>
                              <div>
                                      <%for(LicenseVO LI : LIlist){ %>
                                      <%BigDecimal Liresume_num = new BigDecimal(243); %>
                                       <%if( LI.getResume_num() == Liresume_num) {%>
                                          <span>
                                             <%=LI.getLicense_name()%>
                                          </span>
                                       <%} %>   
                                    <%} %>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <%if(print_vo.getFile_name()!= null && print_vo.getUrl() != null){%>
                     <div class="print_box" id="pbox4">
                        <h3>포트폴리오</h3>
                        <div class="w_box">
                           <ul>
                              <li><span>URL</span> <span>｜</span> <span> <a
                                    href="<%=print_vo.getUrl()%>" class="URL" target="_blank"><%=print_vo.getUrl()%></a>
                              </span></li>
                              <li><span>파일</span> <span>｜</span> <span> 
                                    <a href="./img/logo_w.png" class="download" download> 다운로드</a>
                              </span></li>
                           </ul>
                        </div>
                     </div>
                  <%}else if(print_vo.getFile_name()!= null || print_vo.getUrl() != null){%>
                     <%if(print_vo.getFile_name() != null){ %>
                     <div class="print_box" id="pbox4">
                        <h3>포트폴리오</h3>
                        <div class="w_box">
                           <ul>
                              <li>
                                 <span>파일</span> <span>｜</span> <span> 
                                 <a href="./img/logo_w.png" class="download" download>다운로드</a>
                              </span></li>
                           </ul>
                        </div>
                     </div>
                     <%}else{%>
                     <div class="print_box" id="pbox4">
                        <h3>포트폴리오</h3>
                        <div class="w_box">
                           <ul>
                              <li><span>URL</span> <span>｜</span> <span> <a
                                    href="<%=print_vo.getUrl()%>" class="URL" target="_blank"><%=print_vo.getUrl()%></a>
                              </span></li>
                           </ul>
                        </div>
                     </div>
                     <%}%>
                  <%}%>
                  <%if(print_vo.getOther_license() != null){%>
                  <div class="print_box" id="pbox5">
                     <h3>기타자격증</h3>
                     <div class="w_box">
                        <p>- <%=print_vo.getOther_license()%></p>
                     </div>
                  </div>
                  <%}%>                  
                  <%if(print_vo.getCareer() != null){%>
                  <div class="print_box" id="pbox5">
                     <h3>경력</h3>
                     <div class="w_box">
                        <p>- <%=print_vo.getCareer()%></p>
                     </div>
                  </div>
                  <%}%>
                  <%if(print_vo.getAward() != null){%>
                  <div class="print_box" id="pbox5">
                     <h3>수상</h3>
                     <div class="w_box">
                        <p>- <%=print_vo.getAward()%></p>
                     </div>
                  </div>
                  <%}%>
                  <div class="print_box" id="pbox6">
                     <h3>자기소개서</h3>
                     <div class="w_box">
                        <p>
                           <%=print_vo.getSelf_introduction()%>
                        </p>
                     </div>
                  </div>
               </div>
               <ul class="print_btns">
                  <li><a href="boardJob.jsp">목록</a></li>
                  <li><a href="#" id="pdf">PDF 변환</a></li>
                  <li><a href="resumeModify.jsp?resume_num=<%=resume_num%>">수정하기</a></li>
                  <li><a href="printDeleteService.do?resume_num=<%=resume_num%>" onclick="alert('이력서가 삭제 되었습니다.')"><%=resume_num%>삭제</a></li>
               </ul>
            </form>
         </div>
      </div>
   </div>   
   <%@ include file="./include/footer.jsp" %>
   <script>
      // 개발기술스택 tab 처리
      //함수 호출 반복문
      for (let i = 0; i < $('.c_btn').length; i++) {
         tabOpen(i);
      }

   <%@ include file="./include/footer.jsp" %>
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

      // 이력서사진
      $(document).on("click", "i.del", function() {
         //    to remove card
         $(this).parent().remove();
         // to clear image
         // $(this).parent().find('.imagePreview').css("background-image","url('')");
      });
      $(function() {
         $(document).on(
               "change",
               ".uploadFile",
               function() {
                  var uploadFile = $(this);
                  var files = !!this.files ? this.files : [];
                  if (!files.length || !window.FileReader)
                     return; // no file selected, or no FileReader support

                  if (/^image/.test(files[0].type)) { // only image file
                     var reader = new FileReader(); // instance of the FileReader
                     reader.readAsDataURL(files[0]); // read the local file

                     reader.onloadend = function() { // set image data as background of div
                        //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
                        uploadFile.closest(".imgUp").find(
                              '.imagePreview').css(
                              "background-image",
                              "url(" + this.result + ")");
                     }
                  }

               });
      });

      //삭제추가..
      $('.delete').click(function() {
         $(this).parent('li').hide();
      });

      var input = $("<li><div class='input'><label>자격증명</label><input type='text' placeholder=''></div><span class='material-symbols-outlined delete'>Close</span></li>");
      $('.add > div').click(function() {
         $(this).parent().siblings('ul').append(input);
      });      
      
   </script>
   
   <!--pdf 변환  -->
   <script type="text/javascript">
       let all_area_array = ['#a','#b','#c','#d']; //전체영역 area
       let area_array = ['#a','#c','#d']; //pdf 다운 영역
   
       $('#pdf').on("click", function () {
         let difference = all_area_array.filter(x => !area_array.includes(x));
   
         $.each(difference,function(index, item){
           $(item).attr('data-html2canvas-ignore', true);
         });
         setTimeout(pdfMake(),500);
       });
   
       const pdfMake = () => {
         html2canvas($('#resumePDF')[0]).then(function(canvas) {
           let imgData = canvas.toDataURL('image/png');
   
           let imgWidth = 200; // 이미지 가로 길이(mm) A4 기준
           let pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
           let imgHeight = canvas.height * imgWidth / canvas.width;
           let heightLeft = imgHeight;
            
           let doc = new jsPDF('p', 'mm');
           let position = 0;
           
           // 첫 페이지 출력
           doc.addImage(imgData, 'PNG', 10,10 , position, imgWidth, imgHeight);
           heightLeft -= pageHeight;
   
           // 한 페이지 이상일 경우 루프 돌면서 출력
           while (heightLeft >= 20) {
               position = heightLeft - imgHeight;
               doc.addPage();
               doc.addImage(imgData, 'PNG',10,10, position, imgWidth, imgHeight);
               heightLeft -= pageHeight;
           }
   
           let today = new Date();
           let year = today.getFullYear();
           let month = ('0' + (today.getMonth() + 1)).slice(-2);
           let day = ('0' + today.getDate()).slice(-2);
           let hours = ('0' + today.getHours()).slice(-2);
           let minutes = ('0' + today.getMinutes()).slice(-2);
   
           let dateString = year + month + day + hours + minutes;
   
           // 파일 저장
           doc.save("Report"+dateString+'.pdf');
         });
       }
   </script>

</body>
</html>