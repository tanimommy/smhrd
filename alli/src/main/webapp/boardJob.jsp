<%@page import="com.smhrd.model.LicenseDAO"%>
<%@page import="com.smhrd.model.LicenseVO"%>
<%@page import="com.smhrd.model.OsVO"%>
<%@page import="com.smhrd.model.FrameworkVO"%>
<%@page import="java.util.LinkedHashSet"%>
<%@page import="com.smhrd.model.cmpRecomVO"%>
<%@page import="com.smhrd.model.cmpRecomDAO"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.smhrd.model.OsDAO"%>
<%@page import="com.smhrd.model.FrameworkDAO"%>
<%@page import="com.smhrd.model.LanguageDAO"%>
<%@page import="com.smhrd.model.LanguageVO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.resumeDAO"%>
<%@page import="com.smhrd.model.resumeVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./include/metatag.jsp" %>  
</head>
<body>
   <%@ include file="./include/header.jsp" %>
   <!-- 생년월일 나이 변환 스크립틀릿 -->
   <%  
      // 사용자의 생년월일 정보를 세션의 login_vo에서 가져옴
      String birth = (String)login_vo.getDate_birth();
      // 현재 날짜를 초기화
      Date date = new Date(); // 날짜형 데이터임
      SimpleDateFormat format = new SimpleDateFormat("yymmdd"); // yymmdd형으로 전환
      String str = format.format(date); // yymmdd형의 문자형으로 전환
      String birth_y = birth.substring(0,2); // 문자형 앞의 두글자만 잘라서 연도 추출
      String date_y = str.substring(0,2); // 문자형 앞의 두글자만 잘라서 연도 추출
      int birth_y_int = Integer.parseInt(birth_y); // 문자열을 정수형으로 바꾼다.
      int date_y_int = Integer.parseInt(date_y); // 문자열을 정수형으로 바꾼다.
      
      // 생년월일의 연도가 현재 연도보다 작으면 2000을 더하고 크면 1900을 더해서
      // 생년월일 연도 추출
      if(birth_y_int>date_y_int){
         birth_y_int += 1900;
      }else{
         birth_y_int += 2000;
      };
      
      date_y_int += 2000 ; // 2000을 더해서 2023의 형태로
      int age = date_y_int - birth_y_int + 1 ; // 현재 연도에서 생년 연도를 빼서 나이 계산
   %>
   
   <!-- 내 아이디의 이력서 리스트 받아오는 스크립클릿 -->
   <% 
      resumeDAO dao = new resumeDAO();
      List<resumeVO> resumes = dao.selectResumeList(login_vo.getUser_id());
      BigDecimal resumeNum = new BigDecimal(0);
   %>
   
   <%
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
   
   <!-- 언어 가져오는 스크립틀릿 -->
   <%
      LanguageVO lanVO = new LanguageVO();
      LanguageDAO lanDAO = new LanguageDAO();
      List<String> lanList = lanDAO.selectUserLanguage(login_vo.getUser_id());
      Set<String> lanList2 = new HashSet<String>(lanList);
      List<String> lanList3 = new ArrayList<String>(lanList2);
   %>

   <!-- 프레임워크 가져오는 스크립틀릿 -->
   <%
      FrameworkDAO frameDAO = new FrameworkDAO();
      List<String> frameList = frameDAO.selectUserFrameWork(login_vo.getUser_id());
      Set<String> frameList2 = new HashSet<String>(frameList);
      List<String> frameList3 = new ArrayList<String>(frameList2);
   %>
   
   <!-- OS 가져오는 스크립틀릿 -->
   <%
      OsDAO osDAO = new OsDAO();
      List<String> osList = osDAO.selectUserOS(login_vo.getUser_id());
      Set<String> osList2 = new HashSet<String>(osList);
      List<String> osList3 = new ArrayList<String>(osList2);
   %>
   
   <!-- 추천 기업정보 가져오는 스크립틀릿 -->
   <%
      cmpRecomDAO cmpRecomDAO = new cmpRecomDAO();
      List<cmpRecomVO> cmpRecomList = cmpRecomDAO.selectCmpInfo(); // 기업 리스트를 받아옴
      
      ArrayList<String[]> cmpRecomList1 = new ArrayList<String[]>(); // 기술스택 담을 리스트 생성
      for(int i = 0 ; i < cmpRecomList.size() ; i++){
         cmpRecomList1.add(cmpRecomList.get(i).getStac().replace(" ","").split(","));
      }; // 기술 스택 담기
      
      
   %>
   
   <!-- 언어로 추천기업 가져오는 스크립틀릿 -->
   <% 
      // 기업의 기술스택과 나의 언어를 비교해서 있으면 담고 없으면 안 담는 ArrayList cmpRecomList4
      ArrayList<cmpRecomVO> lancmpRecomList = new ArrayList<cmpRecomVO>();
      for(int i = 0 ; i < lanList3.size() ; i++){
         for(int j = 0 ; j < cmpRecomList.size() ; j++){
            for(int z = 0 ; z < cmpRecomList1.get(j).length ; z++){
               if(lanList3.get(i).equals(cmpRecomList1.get(j)[z])){
                  lancmpRecomList.add(cmpRecomList.get(j));
               }
            }
         }
      };
      
      // lancmpRecomList2의 중복제거
      LinkedHashSet<cmpRecomVO> lancmpRecomList1 = new LinkedHashSet<cmpRecomVO>(lancmpRecomList);
      List<cmpRecomVO> lancmpRecomList2 = new ArrayList<cmpRecomVO>(lancmpRecomList1);
      
   %>
   
   <!-- 프레임워크로 추천기업 가져오는 스크립틀릿 -->
   <%
      // 기업의 기술스택과 나의 언어를 비교해서 있으면 담고 없으면 안 담는 ArrayList cmpRecomList4
         ArrayList<cmpRecomVO> framecmpRecomList = new ArrayList<cmpRecomVO>();
         for(int i = 0 ; i < frameList3.size() ; i++){
            for(int j = 0 ; j < cmpRecomList.size() ; j++){
               for(int z = 0 ; z < cmpRecomList1.get(j).length ; z++){
                  if(frameList3.get(i).equals(cmpRecomList1.get(j)[z])){
                     framecmpRecomList.add(cmpRecomList.get(j));
                  }
               }
            }
         };
         
         // lancmpRecomList2의 중복제거
         LinkedHashSet<cmpRecomVO> framecmpRecomList1 = new LinkedHashSet<cmpRecomVO>(framecmpRecomList);
         List<cmpRecomVO> framecmpRecomList2 = new ArrayList<cmpRecomVO>(framecmpRecomList1);
   %>
   
   <!-- OS로 추천기업 가져오는 스크립틀릿 -->
   <%
      // 기업의 기술스택과 나의 언어를 비교해서 있으면 담고 없으면 안 담는 ArrayList cmpRecomList4
            ArrayList<cmpRecomVO> oscmpRecomList = new ArrayList<cmpRecomVO>();
            for(int i = 0 ; i < osList3.size() ; i++){
               for(int j = 0 ; j < cmpRecomList.size() ; j++){
                  for(int z = 0 ; z < cmpRecomList1.get(j).length ; z++){
                     if(osList3.get(i).equals(cmpRecomList1.get(j)[z])){
                        oscmpRecomList.add(cmpRecomList.get(j));
                     }
                  }
               }
            };
            
            // lancmpRecomList2의 중복제거
            LinkedHashSet<cmpRecomVO> oscmpRecomList1 = new LinkedHashSet<cmpRecomVO>(oscmpRecomList);
            List<cmpRecomVO> oscmpRecomList2 = new ArrayList<cmpRecomVO>(oscmpRecomList1);
   %>

   
    <input type="hidden" value="<%= resumes.size() %>" id="resumesSize">
    <input type="hidden" value="<%= lanList %>" id="lanList">
    <input type="hidden" value="<%= frameList %>" id="frameList">
    <input type="hidden" value="<%= osList %>" id="osList">
   
   <div id="wrap" class="boardJob_wrap">
       <div class="sub_top sub_top_a">
            <div>
                <p>구직을 위한, <img src="./img/logo_w.png"></p>
            </div>
       </div>          
       <div class="resumeReg">
            <div class="member_inform">
                <div>개인<br>회원</div>
                <p><%=login_vo.getUser_name() %>님, 반갑습니다.</p>
            </div>
            
            <!-- 기업추천 시작 -->
            <div class="sub_box">
                <h2 class="sub_title">맞춤기업 추천 서비스</h2>
                <p class="sub_title_text">이력서에 기재한 기술스택을 바탕으로 맞춤기업을 추천해드립니다. 나와 맞는 기업을 확인해보세요. 공개이력서 기준으로 추천되며, 이력서가 없거나 모두 비공개하는 경우 추천되지 않습니다.</p>
             <div class="boardJob01">
                   <div class="chooseJob">
                       <ul>
                           <li class="c_btn" id="pro_lan">
                              <div id="prolanDiv">프로그래밍 언어</div>
                              <div></div>
                           </li>
                           <li class="c_btn" id="frameWork">
                              <div id="frameWorkDiv">프레임워크</div>
                              <div></div>
                           </li>
                           <li class="c_btn" id="OS">
                              <div id="OSDiv">OS</div>
                              <div></div>
                           </li>
                       </ul>
                       <ul>
                          <!-- 프로그래밍언어 시작 -->
                           <li class="c_content" id="prolan_li">
                               <ul>
                                  
                                  <%for(int j = 0 ; j < lanList3.size() ; j++){ %>
                                  <li class="chooseBtn">
                                     <%if(lanList3.size()>0){ %>
                                     <input type="button" value="<%=lanList3.get(j) %>" id="<%=lanList3.get(j) %>">
                                     <%}else{ %>
                                     <%} %>
                                  </li>
                                  <%} %>
                               </ul>
                               <div class="chooseCon">
                                  <ul>
                                     <%try{ %>
                                     <%for(int i = 0 ; i < 3 ; i++){ %>
                                     <li>
                                        <%if(lancmpRecomList2.size()>0){ %>
                                        <div><%=i+1 %></div>
                                        <div><%=lancmpRecomList2.get(i).getCmp_name() %></div>
                                                <div>
                                                   <p><%=lancmpRecomList2.get(i).getCmp_title() %></p>
                                                   <p><%=lancmpRecomList2.get(i).getCareer() %> ｜ <%=lancmpRecomList2.get(i).getEducation() %> ｜ <%=lancmpRecomList2.get(i).getArea() %> ｜ <%=lancmpRecomList2.get(i).getEmployment() %></p>
                                                   <p>
                                                      <%=lancmpRecomList2.get(i).getStac() %>
                                                   </p>
                                                </div>
                                                <div>
                                                   <a href="<%=lancmpRecomList2.get(i).getCmp_link() %>" target="_blank">상세보기</a>
                                                </div>
                                        <%}else{ %>
                                        <div class="nope">해당 프로그래밍 언어를 모집하는 회사가 없습니다</div>
                                        <% break;
                                         } %>
                                                
                                     </li>
                                     <%} %>
                                     <%}catch(Exception e){ %>
                                     <%} %>
                                  </ul>
                              </div>
                           </li>
                           <!-- 프레임워크 시작 -->
                           <li class="c_content" id="frameWork_li">
                               <ul>
                                  <%for(int j = 0 ; j < frameList3.size() ; j++){ %>
                                  <li class="chooseBtn">
                                     <%if(frameList3.size()>0){ %>
                                     <input type="button" value="<%=frameList3.get(j) %>" id="<%=frameList3.get(j)%>">
                                     <%}else{ %>
                                     <%} %>
                                  </li>
                                  <%} %>
                                  
                               </ul>
                               <div class="chooseCon">
                                  <ul>
                                     <%try { %>
                                     	<%for(int i = 0 ; i < 3 ; i++){ %>
	                                        <%if(framecmpRecomList2.size()>0 && framecmpRecomList2.get(i).getCmp_name() != null){ %>
                                     	<li>
		                                        <div><%=i+1 %></div>
		                                        <div><%=framecmpRecomList2.get(i).getCmp_name() %></div>
		                                        <div>
		                                           <p><%=framecmpRecomList2.get(i).getCmp_title() %></p>
		                                           <p><%=framecmpRecomList2.get(i).getCareer() %> ｜ <%=framecmpRecomList2.get(i).getEducation() %> ｜ <%=framecmpRecomList2.get(i).getArea() %> ｜ <%=framecmpRecomList2.get(i).getEmployment() %></p>
		                                           <p>
		                                              <%=framecmpRecomList2.get(i).getStac() %>
		                                           </p>
		                                        </div>
		                                        <div>
		                                           <a href="<%=framecmpRecomList2.get(i).getCmp_link() %>" target="_blank">상세보기</a>
		                                        </div>  
		                                       
	                                        <%} %>
                                     	</li>
	                                        <%} %>
	                                     <%--   else{ %>
	                                        	<% System.out.println("else문 실행"); %>
	                                        	<div class="nope">해당 프레임워크를 모집하는 회사가 없습니다</div>
	                                        <%  break;} %>
                                     	<%} %> --%>
                                     <%}catch(Exception e){ %>
                                     <%} %>
                                  </ul>
                              </div>
                           </li>
                           <!-- OS 시작 -->
                           <li class="c_content" id="OS_li">
                               <ul>
                                  <%for(int j = 0 ; j < osList3.size() ; j++){ %>
                                  <li class="chooseBtn">
                                     <%if(osList3.size()>0){ %>
                                     <input type="button" value="<%=osList3.get(j) %>" id="<%=osList3.get(j)%>">
                                     <%}else{ %>
                                     <%} %>
                                  </li>
                                  <%} %>
                               </ul>
                               <div class="chooseCon">
                                  <ul>
                                     <%try{ %>
                                     <%for(int i = 0 ; i < 3 ; i++){ %>
                                     <li>
                                        <%if(oscmpRecomList2.size()>i){ %>
                                        <div><%=i+1 %></div>
                                        <div><%=oscmpRecomList2.get(i).getCmp_name() %></div>
                                        <div>
                                           <p><%=oscmpRecomList2.get(i).getCmp_title() %></p>
                                           <p><%=oscmpRecomList2.get(i).getCareer() %> ｜ <%=oscmpRecomList2.get(i).getEducation() %> ｜ <%=oscmpRecomList2.get(i).getArea() %> ｜ <%=oscmpRecomList2.get(i).getEmployment() %></p>
                                           <p>
                                              <%=oscmpRecomList2.get(i).getStac() %>
                                           </p>
                                        </div>
                                        <div>
                                           <a href="<%=oscmpRecomList2.get(i).getCmp_link() %>" target="_blank">상세보기</a>
                                        </div>
                                        <%}else{ %>
                                        <div class="nope">해당 OS를 모집하는 회사가 없습니다</div>
                                        <% break;
                                         } %>
                                     </li>
                                     <%} %>
                                     <%}catch(Exception e){ %>
                                     <%} %>
                                  </ul>
                              </div>
                           </li>
                       </ul>
                   </div>
            </div>
            </div>
            
            
            
            <!-- 이력서 시작 -->
            <div class="sub_box">
                <h2 class="sub_title">구직자를 위한 '특별한' IT전문이력서</h2>
                <p class="sub_title_text">프로그래밍 언어부터 프레임워크, OS .. 개발관련 자격증까지. 나의 기술스택을 한장으로 깔끔하게 정리합니다. 1차 서류통과의 확률을 높여주는 나만의 IT전문이력서!</p>
             <a href="resumeReg.jsp" id="resumeReg_btn">이력서 등록</a>
             <div class="boardJob02">
               <ul>
                  <%if(resumes.size()==0){ %>
                     <%System.out.println("등록된 이력서 없음"); %>
                  <%}else{ %>
                     <%for(int i = 0 ; i<resumes.size();i++){ %>

                     <% resumeNum = resumes.get(i).getResume_num();%>

                     <%if(resumes.get(i).getOn_off() != null){ %>
                        <% if(resumes.get(i).getOn_off().equals("on")){%>
                           <li class='open'>
                        <%}else{ %>
                           <li>
                        <%} %>
                     <%}else{ %>
                        <li>
                     <%} %>
                        <div class="boardJob_listTop">
                           <div>
                              <%if(resumes.get(i).getPicture().equals("no_picture.png")){ %>
                              <span style="cursor: pointer;"  onclick="location.href='resumePrint.jsp?resume_num=<%=resumes.get(i).getResume_num() %>'"  class="material-symbols-outlined person_icon">
                                 account_circle
                              </span>
                              <%}else { %>
                              <img style="cursor: pointer;"  onclick="location.href='resumePrint.jsp?resume_num=<%=resumes.get(i).getResume_num() %>'" src="./file/<%= resumes.get(i).getPicture() %>">
                              <%} %>
                           </div>
                           <a href="javascript:void(0);" class="optionBtn"><img src="./img/boardJob_icon.png"></a>
                           <div>
                              <p>
                                 <span><%= login_vo.getUser_name() %></span><span>(<%=resumes.get(i).getGender() %>,<%=age %>세)</span>
                              </p>
                              <p>
                                 <%=resumes.get(i).getCareer_date() %>
                              </p>
                           </div>
                        </div>
                        <div class="boardJob_listBtm">
                           <h3><%=resumes.get(i).getResume_title() %></h3>
                           <p>
                              <%=resumes.get(i).getSchool_name() %> 
                              <%if(resumes.get(i).getSchool_division().equals("고등학교")){ %>
                              <%}else if(resumes.get(i).getSchool_division().equals("대학(2,3년)")){ %>
                                 (2,3년)
                              <%}else if(resumes.get(i).getSchool_division().equals("대학(4년)")){%>
                                 (4년)
                              <%}else if(resumes.get(i).getSchool_division().equals("대학원")){ %>
                                 대학원
                              <%}else if(resumes.get(i).getSchool_division().equals("대입검정고시")){ %>
                                 대입검정고시(검정고시)
                              <%} %><br>
                              <%if(resumes.get(i).getMajor()==null){ %>
                              
                              <%}else{ %>
                             	<%=resumes.get(i).getMajor() %> 
                              <%} %>
                              
                              <%if(resumes.get(i).getGraduation_status()==null){ %>
                              
                              <%}else{ %>
                              	<%=resumes.get(i).getGraduation_status() %>
                              <%} %>
                           </p>
                           <p>
                              희망지역 : <%=resumes.get(i).getHope_area() %>
                              
                              <%if(resumes.get(i).getHope_area2() == null){ %>

                              <%}else{ %>
                              		 <%=resumes.get(i).getHope_area2() %>
                              <%} %>
                              
                              <br>
                              <%if(resumes.get(i).getHope_salary() == null){ %>

                              <%}else{ %>
                              희망연봉 : <%=resumes.get(i).getHope_salary() %>
                              <%} %>
                           </p>
                           <p>
								<%for(int j = 0 ; j < Llist.size() ; j++){ %>
									<%if(resumes.get(i).getResume_num().equals(Llist.get(j).getResume_num())){ %>
										<span><%=Llist.get(j).getLanguage_name() %></span>
									<%} %>
								<%} %>
								
								<%for(int j = 0 ; j < Flist.size() ; j++){ %>
									<%if(resumes.get(i).getResume_num().equals(Flist.get(j).getResume_num())){ %>
										<span><%=Flist.get(j).getFramework_name() %></span>
									<%} %>
								<%} %>
								
								<%for(int j = 0 ; j < Olist.size() ; j++){ %>
									<%if(resumes.get(i).getResume_num().equals(Olist.get(j).getResume_num())){ %>
										<span><%=Olist.get(j).getOs_name() %></span>
									<%} %>
								<%} %>
								
							</p>                           
							<p class="boardJob_date"><%=resumes.get(i).getCre_date() %></p>
                        </div>
                        
                        <div class="boardJob_add" id="option">
                           <a href="javascript:void(0);" class="closeBtn">
                              <span class="material-symbols-outlined delete">
                                         Close
                                     </span>
                           </a>
                           <ul>
                              <%if(resumes.get(i).getOn_off() != null){ %>
                                 <%if(resumes.get(i).getOn_off().equals("on")){ %>
                                 <!-- 공개로 되어있을 때 -->
                                    <li class="closeBoard"><a href="CloseUpdateService.do?resume_num=<%=resumeNum%>">공개이력서 해제</a></li>
                                 <%}else{ %>
                                 <!-- 비공개일 때 -->
                                    <li class="openBoard"><a href="OpenUpdateService.do?resume_num=<%=resumeNum%>&user_id=<%=login_vo.getUser_id() %>">공개이력서로 설정</a></li>
                                 <%} %>
                              <%}else{ %>
                                 <li class="openBoard"><a href="OpenUpdateService.do?resume_num=<%=resumeNum%>&user_id=<%=login_vo.getUser_id() %>">공개이력서로 설정</a></li>
                              <%} %>
                              <li><a href="resumeModify.jsp?resume_num=<%=resumeNum %>">수정</a></li>
                              <li class="resumeDelBtn"><a href="resumeDeleteService.do?delIndex=<%=resumeNum%>">삭제</a></li>
                           </ul>
                        </div>
                     </li>
                     <%} %>
                  <%} %>
               </ul>
            </div>
            </div>
       </div>
    </div>
   <%@ include file="./include/footer.jsp" %>
   
   <!-- 맞춤기업 영역 스크립트 -->
   <script>
      let lanList = $('#lanList').val();
      let lanList1 = lanList.substr(1,lanList.length-2);
      let lanList2 = lanList1.split(', ');
      
      let frameList = $('#frameList').val();
      let frameList1 = frameList.substr(1,frameList.length-2);
      let frameList2 = frameList1.split(', ');
      
      let osList = $('#osList').val();
      let osList1 = osList.substr(1,osList.length-2);
      let osList2 = osList1.split(', ');
      
      let pro_lan = document.getElementById('pro_lan')
      let frameWork = document.getElementById('frameWork')
      let OS = document.getElementById('OS')
      
      let prolan_li = document.getElementById('prolan_li')
      let frameWork_li = document.getElementById('frameWork_li')
      let OS_li = document.getElementById('OS_li')
      
      let prolanDiv = document.getElementById('prolanDiv')
      let frameWorkDiv = document.getElementById('frameWorkDiv')
      let OSDiv = document.getElementById('OSDiv')
      
      /* let Java_ul = document.getElementById('Java_ul')
      let Python_ul = document.getElementById('Python_ul') */
      
      /* let Spring_ul = document.getElementById('Spring_ul')
      let Eclipse_ul = document.getElementById('Eclipse_ul') */
      
      /* let Window_ul = document.getElementById('Window_ul')
      let Mac_ul = document.getElementById('Mac_ul') */
      
      /* let SpringBtn = document.getElementById('Spring')
      let EclipseBtn = document.getElementById('Eclipse') */
      
   /*    let WindowBtn = document.getElementById('Window')
      let MacBtn = document.getElementById('Mac') */
      
      /* 프로그래밍 언어 영역 */
      
      /* 측면 탭 */
      document.getElementById('pro_lan').onclick=()=>{
         prolan_li.style.display ='block'
         frameWork_li.style.display='none'
         OS_li.style.display = 'none'
         
         pro_lan.classList.add('choose_on')
         pro_lan.classList.remove('choose_off')
            
         frameWork.classList.add('choose_off')
         frameWork.classList.remove('choose_on')
            
         OS.classList.add('choose_off')
         OS.classList.remove('choose_on')
         
      }
      
      /* 상단 탭 */
      /* try {
         for(let i = 0 ; i < lanList2.length ; i++){
             document.getElementById(lanList2[i]).onclick=()=>{
               for(let j = 0 ; j < lanList2.length ; j ++) {
                  document.getElementById(lanList2[j]).style.border ='1px solid #d3d3d3'
                  document.getElementById(lanList2[j]).style.background ='#fff'
               }
               document.getElementById(lanList2[i]).style.border = '2px solid #6c00ff'
               document.getElementById(lanList2[i]).style.background = '#f5f1fb'
            }
         }
         
      } catch(err){
      } */
      
      
      /* 프레임워크 영역 */
      
      /* 측면 탭 */
      document.getElementById('frameWork').onclick=()=>{
         prolan_li.style.display ='none'
         frameWork_li.style.display='block'
         OS_li.style.display = 'none'
         
         pro_lan.classList.add('choose_off')
         pro_lan.classList.remove('choose_on')
         
         frameWork.classList.add('choose_on')
         frameWork.classList.remove('choose_off')
         
         OS.classList.add('choose_off')
         OS.classList.remove('choose_on')
      }
      
      /* 상단 탭 */
      /* try {
         for(let i = 0 ; i < frameList2.length ; i++){
             document.getElementById(frameList2[i]).onclick=()=>{
               for(let j = 0 ; j < frameList2.length ; j ++) {
                  document.getElementById(frameList2[j]).style.border ='1px solid #d3d3d3'
                  document.getElementById(frameList2[j]).style.background ='#fff'
               }
               document.getElementById(frameList2[i]).style.border = '2px solid #6c00ff'
               document.getElementById(frameList2[i]).style.background = '#f5f1fb'
            }
         }
         
      } catch(err){
      } */
      
      /* OS 영역 */
      
      /* 측면 탭 */
      document.getElementById('OS').onclick=()=>{
         prolan_li.style.display ='none'
         frameWork_li.style.display='none'
         OS_li.style.display = 'block'
         
         pro_lan.classList.add('choose_off')
         pro_lan.classList.remove('choose_on')
               
         frameWork.classList.add('choose_off')
         frameWork.classList.remove('choose_on')
               
         OS.classList.add('choose_on')
         OS.classList.remove('choose_off')
      }
      
      /* 상단 탭 */
      /* try{
         for(let i = 0 ; i < osList2.length ; i++){
             document.getElementById(osList2[i]).onclick=()=>{
               for(let j = 0 ; j < osList2.length ; j ++) {
                  document.getElementById(osList2[j]).style.border ='1px solid #d3d3d3'
                  document.getElementById(osList2[j]).style.background ='#fff'
               }
               document.getElementById(osList2[i]).style.border = '2px solid #6c00ff'
               document.getElementById(osList2[i]).style.background = '#f5f1fb'
            }
         }
         
      } catch(err){
      } */
      
      </script>
   
   <!-- 이력서 스크립트 -->
   <script>
      
      var resumesSize = $('#resumesSize').val();
      let delIndex = null;
   
   
      let optionBtn = document.getElementsByClassName('optionBtn')
      let boardJob_add = document.getElementsByClassName('boardJob_add')
      let closeBtn = document.getElementsByClassName('closeBtn')
      let openBoard = document.getElementsByClassName('openBoard')
      let closeBoard = document.getElementsByClassName('closeBoard')
      let boardJob_listTop = document.getElementsByClassName('boardJob_listTop')
      let boardJob_li = document.querySelectorAll('div.boardJob02>ul>li')
      let resumeDelBtn = document.getElementsByClassName('resumeDelBtn')
      
      // 더보기 창 꺼두는 for문
      for(let i = 0 ; i < resumesSize ; i++){
         boardJob_add[i].style.display = 'none'
      }
      
      // 더보기 닫기 클릭 시 닫히는 for문
      for(let i = 0 ; i < resumesSize ; i++){
         closeBtn[i].onclick=()=>{
            boardJob_add[i].style.display= 'none'
         }
      }
      
      
      // 더보기 버튼 클릭시 더보기 창이 열리고 다른 곳에 열려 있던 더보기 창은 닫히는 for문
      for(let i = 0 ; i < resumesSize ; i++){
         optionBtn[i].onclick=()=>{
            console.log("optionBtn["+i+"] click")
            boardJob_add[i].style.display = 'block'
            for(let j = 0 ; j < resumesSize ; j++){
               if(j!=i){
               boardJob_add[j].style.display='none'
               }
            }
         }
      }
      
   </script>
   
</body>
</html>