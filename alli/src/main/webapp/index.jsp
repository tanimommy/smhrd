<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/metatag.jsp" %>
</head>

<body>
    <%@ include file="./include/header.jsp" %>
   	<%if(login_vo == null && cmpLogin_vo == null) {%>
	    <div id="wrap">
	        <div id="banner01">
	           <!-- Swiper -->
	            <div class="swiper mySwiper">
	                <div class="swiper-wrapper">
	                <div class="swiper-slide">
	                    <img src="./img/banner01_01.png">
	                    <a href="#" class="btn_bora" id="banner01_btn01" onclick="alert('로그인 후 이용 가능합니다.'); return false;">IT이력서 필터링 서비스<img src="./img/banner01_btn.png"></a>
	                </div>
	                <div class="swiper-slide">
	                    <img src="./img/banner01_02.png">
	                    <a href="#" class="btn_bora" id="banner01_btn02" onclick="alert('로그인 후 이용 가능합니다.'); return false;">IT이력서 제작 서비스<img src="./img/banner01_btn.png"></a>
	                </div>
	                </div>
	                <div class="swiper-pagination"></div>
	            </div>
	        </div>
	        <div id="banner02">
	            <ul>
	                <li data-aos="fade-up" data-aos-duration="1000" data-aos-delay="300">
	                    Now, Go with <img src="./img/logo.png">
	                </li>
	                <li>
	                    최신 개발 트렌드의 끝
	                </li>
	                <li>
	                    웹/HTTP서버, 데이터베이스등을 포함한 프로그래밍언어, 프레임워크, 운영체제(OS), 인기자격증까지<br>
	                    빠르게 변화하는 개발시장의 다양한 기술 스택을 상위 기술 순으로 대시보드를 통해 한눈에 파악할 수 있습니다.
	                </li>
	                <li>
	                    2023.04.01 기준
	                </li>
	            </ul>
	            <div class="flow_banner">
	                <ul class="list">
	                    <li>
	                        <img src="./img/banner02_slide01.png">
	                        <p><span>HOT</span>프로그래밍 언어</p>
						</li>
						 <li>
	                        <img src="./img/banner02_slide02.png">
	                        <p><span>HOT</span>IDE(프레임워크)</p>
						</li>
						 <li>
	                        <img src="./img/banner02_slide03.png">
	                        <p><span>HOT</span>개발시장 요구 학력</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide04.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                </ul>
	            </div>
	            <input type="button" value="개발트렌드 자세히보기" onclick="location.href='./dashWhole.jsp'" data-aos="fade-up" data-aos-duration="4000">
	        </div>
	        <div id="banner03">
	            <ul>
	                <li data-aos="fade-right"data-aos-duration="800" >
	                    <span class="material-symbols-outlined flu_green">
	                        domain
	                    </span>
	                    <p>기업을 위한 <span class="flu_green">'인재 찜하기'</span></p>
	                    <a href="#" class="btn_bora" onclick="alert('로그인 후 이용 가능합니다.'); return false;">인재 찜하기 서비스<img src="./img/banner01_btn.png"></a>
	                </li>
	                <li>
	                    <p>We<br><span class="flu_green">support</span><br>you.</p>
	                </li>
	                <li data-aos="fade-left"data-aos-duration="800" >
	                    <span class="material-symbols-outlined flu_green">
	                        groups
	                    </span>
	                    <p>구직자를 위한 <span class="flu_green">'맞춤 기업'</span></p>
	                    <a href="#" class="btn_bora" onclick="alert('로그인 후 이용 가능합니다.'); return false;">맞춤 기업 추천 서비스<img src="./img/banner01_btn.png"></a>
	                </li>
	            </ul>
	        </div>
	    </div>
    <%} else if(login_vo != null){ %>
	    <div id="wrap">
	        <div id="banner01">
	           <!-- Swiper -->
	            <div class="swiper mySwiper">
	                <div class="swiper-wrapper">
	                <div class="swiper-slide">
	                    <img src="./img/banner01_01.png">
	                    <a href="#" class="btn_bora" id="banner01_btn01" onclick="alert('기업으로 로그인 후 이용 가능합니다.'); return false;">IT이력서 필터링 서비스<img src="./img/banner01_btn.png"></a>
	                </div>
	                <div class="swiper-slide">
	                    <img src="./img/banner01_02.png">
	                    <a href="./resumeReg.jsp" class="btn_bora" id="banner01_btn02">IT이력서 제작 서비스<img src="./img/banner01_btn.png"></a>
	                </div>
	                </div>
	                <div class="swiper-pagination"></div>
	            </div>
	        </div>
	        <div id="banner02">
	            <ul>
	                <li data-aos="fade-up" data-aos-duration="1000" data-aos-delay="300">
	                    Now, Go with <img src="./img/logo.png">
	                </li>
	                <li>
	                    최신 개발 트렌드의 끝
	                </li>
	                <li>
	                    웹/HTTP서버, 데이터베이스등을 포함한 프로그래밍언어, 프레임워크, 운영체제(OS), 인기자격증까지<br>
	                    빠르게 변화하는 개발시장의 다양한 기술 스택을 상위 기술 순으로 대시보드를 통해 한눈에 파악할 수 있습니다.
	                </li>
	                <li>
	                    2023.04.01 기준
	                </li>
	            </ul>
	            <div class="flow_banner">
	                <ul class="list">
	                    <li>
	                        <img src="./img/banner02_slide01.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide01.png">
	                        <p>수도권 인기 개발언어</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide02.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide02.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide01.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                </ul>
	            </div>
	            <input type="button" value="개발트렌드 자세히보기" onclick="location.href='./dashWhole.jsp'" data-aos="fade-up" data-aos-duration="4000">
	        </div>
	        <div id="banner03">
	            <ul>
	                <li data-aos="fade-right"data-aos-duration="800" >
	                    <span class="material-symbols-outlined flu_green">
	                        domain
	                    </span>
	                    <p>기업을 위한 <span class="flu_green">'인재 찜하기'</span></p>
	                    <a href="#" class="btn_bora" onclick="alert('기업으로 로그인 후 이용 가능합니다.'); return false;">인재 찜하기 서비스<img src="./img/banner01_btn.png"></a>
	                </li>
	                <li>
	                    <p>We<br><span class="flu_green">support</span><br>you.</p>
	                </li>
	                <li data-aos="fade-left"data-aos-duration="800" >
	                    <span class="material-symbols-outlined flu_green">
	                        groups
	                    </span>
	                    <p>구직자를 위한 <span class="flu_green">'맞춤 기업'</span></p>
	                    <a href="./boardJob.jsp" class="btn_bora">맞춤 기업 추천 서비스<img src="./img/banner01_btn.png"></a>
	                </li>
	            </ul>
	        </div>
	    </div>
    <%} else if(cmpLogin_vo != null){%>
    		    <div id="wrap">
	        <div id="banner01">
	           <!-- Swiper -->
	            <div class="swiper mySwiper">
	                <div class="swiper-wrapper">
	                <div class="swiper-slide">
	                    <img src="./img/banner01_01.png">
	                    <a href="./boardEmp.jsp" class="btn_bora" id="banner01_btn01">IT이력서 필터링 서비스<img src="./img/banner01_btn.png"></a>
	                </div>
	                <div class="swiper-slide">
	                    <img src="./img/banner01_02.png">
	                    <a href="#" class="btn_bora" id="banner01_btn02"  onclick="alert('구직자로 로그인 후 이용 가능합니다.'); return false;">IT이력서 제작 서비스<img src="./img/banner01_btn.png"></a>
	                </div>
	                </div>
	                <div class="swiper-pagination"></div>
	            </div>
	        </div>
	        <div id="banner02">
	            <ul>
	                <li data-aos="fade-up" data-aos-duration="1000" data-aos-delay="300">
	                    Now, Go with <img src="./img/logo.png">
	                </li>
	                <li>
	                    최신 개발 트렌드의 끝
	                </li>
	                <li>
	                    웹/HTTP서버, 데이터베이스등을 포함한 프로그래밍언어, 프레임워크, 운영체제(OS), 인기자격증까지<br>
	                    빠르게 변화하는 개발시장의 다양한 기술 스택을 상위 기술 순으로 대시보드를 통해 한눈에 파악할 수 있습니다.
	                </li>
	                <li>
	                    2023.04.01 기준
	                </li>
	            </ul>
	            <div class="flow_banner">
	                <ul class="list">
	                    <li>
	                        <img src="./img/wordc.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide01.png">
	                        <p>수도권 인기 개발언어</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide02.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide02.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                    <li>
	                        <img src="./img/banner02_slide01.png">
	                        <p><span>HOT</span>국내 인기 기술 스택</p>
	                    </li>
	                </ul>
	            </div>
	            <input type="button" value="개발트렌드 자세히보기" onclick="location.href='./dashWhole.jsp'" data-aos="fade-up" data-aos-duration="4000">
	        </div>
	        <div id="banner03">
	            <ul>
	                <li data-aos="fade-right"data-aos-duration="800" >
	                    <span class="material-symbols-outlined flu_green">
	                        domain
	                    </span>
	                    <p>기업을 위한 <span class="flu_green">'인재 찜하기'</span></p>
	                    <a href="boardEmp.jsp" class="btn_bora">인재 찜하기 서비스<img src="./img/banner01_btn.png"></a>
	                </li>
	                <li>
	                    <p>We<br><span class="flu_green">support</span><br>you.</p>
	                </li>
	                <li data-aos="fade-left"data-aos-duration="800" >
	                    <span class="material-symbols-outlined flu_green">
	                        groups
	                    </span>
	                    <p>구직자를 위한 <span class="flu_green">'맞춤 기업'</span></p>
	                    <a href="#" class="btn_bora" onclick="alert('구직자로 로그인 후 이용 가능합니다.'); return false;">맞춤 기업 추천 서비스<img src="./img/banner01_btn.png"></a>
	                </li>
	            </ul>
	        </div>
	    </div>
    <%} %>
            <div id="banner04">
            <div class="itYoutube">
                <ul>
                    <li data-aos="fade-up" data-aos-delay="300">
                        <a href="https://youtu.be/1BOvKMaSU-8" target="_blank">
                            <img src ="./img/banner04_youtube01.png">
                            <p>[스마트인재개발원] 수료부터 취업까지 이렇게 빨라도 되나요?</p>
                            <p>오늘은 얼마전 IoT융합 SW전문가 과정을 수료한
                                김다애, 선영표 수료생을 인터뷰 해 보았습니다💛
                                .
                                입담 터지는 그녀들의 리얼 생생 후기..!
                                너무 솔직해서 당황했습니닿ㅎ💦💦
                                
                                놓칠 내용 하나도 없는 인터뷰! 
                                지금 바로 확인하러 꼬고~
                            </p>
                            <p>
                                <img src="./img/banner04_youtube01_01.jpg">
                                <span>스마트인재개발원 인쌤TV</span>
                            </p>
                        </a>
                    </li>
                    <li data-aos="fade-up" data-aos-delay="500">
                        <a href="https://youtu.be/Rj0qw9nkT84" target="_blank">
                            <img src ="./img/banner04_youtube02.png">
                            <p>시니어개발자가 말하는 실무에서 가장 중요한 능력, 이베이코리아 현직자에게 물었습니다</p>
                            <p>인싸담당자에 나오는 다양한 선배들의 방법과 이야기를 듣고
							   자신에게 꼭 맞는, 취업의 길을 찾으시길 바랍니다.
							   나를 만들어가는 과정, 어쩌면 고단하고 외로울 수 있는 그 길에
							   저희 인싸담당자가 함께 하겠습니다.
                            </p>
                            <p>
                                <img src="./img/banner04_youtube01_02.jpg">
                                <span>AND(ft.인싸담당자)</span>
                            </p>
                        </a>
                    </li>
                    <li data-aos="fade-up" data-aos-delay="900">
                        <a href="https://youtu.be/3H4umWD5bwI" target="_blank">
                            <img src ="./img/banner04_youtube03.png">
                            <p>배달의민족 CEO에게 뽑고 싶은 개발자를 물어보았다</p>
                            <p>오늘 영상의 주인공은 배달의민족을 운영하는 우아한형제들 김범준 대표입니다. 

							   2001년 신입 개발자로 커리어를 시작한 그는, 2015년에 우아한형제들의 CTO로 합류하게 됩니다. 그리고 2020년에는 창업자 김봉진 의장의 뒤를 이어 CEO의 자리에 오르게 되죠. 

							   경력 20년차 개발자이기도 한 김범준 대표가 생각하는 좋은 개발자란 어떤 사람인지, 그리고 기술전문가가 이끄는 회사는 어떤 곳인지 궁금하신 분이라면 이 영상을 시청해주세요 :)
                            </p>
                            <p>
                                <img src="./img/banner04_youtube01_03.jpg">
                                <span>EO 이오</span>
                            </p>
                        </a>
                    </li>
                </ul>
            </div>
            <ul class="itNews"  data-aos="fade-up" data-aos-delay="700">
                <li>
                    <a href="https://n.news.naver.com/mnews/article/047/0002387582?sid=105" target="_blank">
                        <img src ="./img/banner04_01.jpg">
                        <p>인천시, 챗GPT 활용 소프트웨어 기업 육성 지원</p>
                        <p>오마이뉴스</p>
                        <p>2023.04.04</p>
                    </a>
                </li>
                <li>
                    <a href="https://n.news.naver.com/mnews/article/003/0011781630?sid=105" target="_blank">
                        <img src ="./img/banner04_02.jpg">
                        <p>드디어 단톡방 초대 거절 기능…근데 부장 단톡방은 거절 못한다고?</p>
                        <p>뉴시스</p>
                        <p>2023.04.04</p>
                    </a>
                </li>
                <li>
                    <a href="https://n.news.naver.com/mnews/article/016/0002125524?sid=105" target="_blank">
                        <img src ="./img/banner04_03.jpg">
                        <p>“수백대 드론 충돌위험 없앤다” ETRI, 드론통신 국제표준화 성공</p>
                        <p>헤럴드경제</p>
                        <p>2023.04.04</p>
                    </a>
                </li>
                <li>
                    <a href="https://n.news.naver.com/mnews/article/138/0002145683?sid=105" target="_blank">
                        <img src ="./img/banner04_04.png">
                        <p>셀바스AI-로보티즈, 손잡고 대화형 AI 로봇 사업 추진</p>
                        <p>디지털데일리</p>
                        <p>2023.04.04</p>
                    </a>
                </li>
                <li>
                    <a href="https://n.news.naver.com/mnews/article/421/0006723719?sid=105" target="_blank">
                        <img src ="./img/banner04_05.jpg">
                        <p>과기정통부, 직원 대상 '챗GPT' 교육…"우리부터 배워야"</p>
                        <p>뉴스1</p>
                        <p>2023.04.04</p>
                    </a>
                </li>
            </ul>
        </div>
    <%@ include file="./include/footer.jsp" %>

  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    /*banner01 slide*/
    var swiper = new Swiper(".mySwiper", {
      pagination: {
        el: ".swiper-pagination",
        type: "progressbar",
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

    /*banner02 slide*/
    $(window).on('load', function () {
        setFlowBanner();  
    })

    function setFlowBanner(){
        const $wrap = $('.flow_banner');
        const $list = $('.flow_banner .list');
        let wrapWidth = $wrap.width();
        let listWidth = $list.width();
        const speed = 50; //1초에 몇픽셀 이동하는지 설정

        //리스트 복제
        let $clone = $list.clone();
        $wrap.append($clone);
        flowBannerAct()

        //배너 실행 함수
        function flowBannerAct() {
            //무한 반복을 위해 리스트를 복제 후 배너에 추가
            if (listWidth < wrapWidth) {
                const listCount = Math.ceil(wrapWidth * 2 / listWidth);
                for (let i = 2; i < listCount; i++) {
                    $clone = $clone.clone();
                    $wrap.append($clone);
                }
            }
            $wrap.find('.list').css({ 'animation': `${listWidth / speed}s linear infinite flowRolling` }); 
            } 
        }
    /*aos*/
    AOS.init();
</script>

</body>
</html>