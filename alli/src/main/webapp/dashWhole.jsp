<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./include/metatag.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
</head>
<body>
	<%@ include file="./include/header.jsp"%>
	<div id="wrap" class="dashWhole_wrap">
		<div class="sub_top">
			<div>
				<p>
					<span>NEW</span>TREND
				</p>
			</div>
		</div>
		<div class="dashWhole_top">
			<ul class="dash_ad">
				<li>Now, Go with <img src="./img/logo.png"></li>
				<li>최신 개발 트렌드. ALL-IT에서 모두 한번에!</li>
				<li>2023.04.01기준</li>
			</ul>
			<div class="dash_link">
				<ul>
					<li><a><span class="fw800">국내</span> TREND</a></li>
				</ul>
			</div>
		</div>
		<div class="dash_content">
		    <!--  전국 -->
		    <div class="dashWhole">
		        <div class="dashWhole_01">
		            <p>
		               <!--  전국의 IT 프로그래밍 언어, 프레임워크, OS 워드클라우드로 보는 혁신적인 경험!--> 
		            </p>
					<img src="./img/dashWhole_word.png">
		        </div>
		        <div class="dashWhole_02">
		            <div class="dashbox">
		                <h2>01. 프로그래밍 언어</h2>
	                	<div class="box_chart">
							<canvas id="myChart"></canvas>
							<p>
			                    6. PHP<br>7. SQL<br>8. Swift<br>9. Kotlin<br>10. Objective-C
			                </p>
						</div>
						<div class="box_text">
			                <p>
			                	2023년 3월 국내 프로그래밍 언어 인기 순위입니다.<br><br>
			                    최근 4차 산업혁명의 영향으로 빅데이터, AI에 대한 관심도가 높아짐에 따라 이에 적합한 언어인 Python의 인기가 
			                    나날이 높아지고 있습니다. 하지만 그럼에도 불구하고 여전히 국내 인기 프로그래밍 언어 1위는 Java가 차지하였습니다.
			                    국가에서 지정한 프레임워크에서 가장 많이 사용되는 언어인 것이 그 이유로 꼽힙니다. Back-End에서 주로
			                    사용하는 Java와 Python을 제외하고 Front-End에서 가장 많이 사용하는 언어로는 역시 JavaScript가
			                    3위를 차지하였습니다. 이어서 4위, 5위는 디자인과 게임 개발쪽에서 자주 사용하는 C#, C++이 차지하였습니다.
			                </p>
		                </div>
		            </div>
		            <div class="dashbox">
		            	<h2>02. IDE/프레임워크</h2>
	                	<div class="box_chart">
							<canvas id="myChart2"></canvas>
							<p>
			                    6. PyCharm<br> 7. Atom<br> 8. Vim<br>
		                    	9. NetBeans<br> 10. Xcode<br>
			                </p>
						</div>
						<div class="box_text">
			                <p>
			                 	2023년 3월 국내 프로그래밍 IDE 인기 순위입니다.<br><br>
			                 	1위는 IntelliJ IDEA가 차지했습니다.<br>
			                 	IntelliJ IDEA는 JetBrains에서 개발한 자바 개발을 위한 통합
			                 	개발환경입니다. Java, Kotlin, Groovy, Scala, Android, JavaScript, TypeScript 및 기타 언어
			                 	를 지원하면서 코드 편집, 디버깅, 리팩토링, 빌드 및 테스트를 지원하는 풍부한 기능을 제공합니다. Java를 주로
			                 	사용하는 우리나라에서 이 IntelliJ IDEA가 1위를 차지한 것은 그리 이상하지 않은 일로 보입니다.<br>
			                 	2위는 Visual Studio Code입니다.<br>
			                 	Visual Studio Code는 마이크로소프트에서 개발한 무료 오픈 소스 텍스트 에디터로,
			                 	다양한 프로그래밍 언어를 지원합니다. 이 편집기는 매우 가벼우며 사용하기 쉽다는 특징을 가지고 있습니다.
			                 	한국에서 사용하는 거의 모든 OS라고 할 수 있는 Windows, macOS, Linux에서 모두 실행할 수 있기 때문에
			                 	빠른 속도를 겸비한 Visual Studio Code도 충분히 2위에 있을 자격이 있는 걸로 보입니다.<br>
			                 	3위는 Eclipse입니다.<br>
			                 	다양한 기능을 가진 Eclipse 또한 훌륭한 IDE이지만 코드 자유도가 낮으며 무거워 속도가 느린 단점 때문에
			                 	같은 기능을 제공하면서도 속도가 빠른 Visual Studio Code에 2위를 내어준 걸로 보입니다. 그러나 여전히
			                 	Git을 활용하여 다수의 개발자가 동시에 작업할 수 있는 환경을 만들기에는 이만한 IDE가 없으며 이는 3위를 차지할
			                 	만한 충분한 이유가 될 것입니다.<br>
			                 	이어서 4위는 Android 개발의 종합 툴이라고 할 수 있는 Andoid Studio가 차지했습니다.<br>
			                 	Android 개발에 있어서 가장 많이 사용하는 IDE입니다만 압도적인 차이로 4위에 머물렀다는 것은 역시 Android
			                 	시장보다 컴퓨터 프로그래밍 시장이 훨씬 크다는 것을 보여주는 증거라고 할 수 있겠습니다.<br>
			                 	5위는 예전에는 인기있었지만 현재는 다른 IDE에 자리를 내주고 뒤로 물러난 Sublime Text가 뒤따랐습니다.
			                </p>
		                </div>
		            </div>
		            <div class="dashbox" id="os">
		            	<h2>03. OS</h2>
	                	<div class="box_chart">
							<canvas id="myChart3"></canvas>
							<!-- <p>
			                    6. 0<br> 7. 0<br> 8. 0<br>
		                    	9. 0<br> 10. 0<br>
			                </p> -->
						</div>
						<div class="box_text">
			                <p>
				                □ Windows: Windows는 여전히 가장 인기있는 운영 체제 중 하나입니다. 이는 대부분의 개인용
			                    컴퓨터가 Windows를 사용하고, 대부분의 기업도 Windows를 선택하고 있기 때문입니다. 
			                    최근에는 서버용 Windows OS도 출시되어 서버용 OS인 Linux의 비율이 줄고 Windows의 비율이
			                    더욱 커질수도 있을 것으로 전망을 바라보고 있습니다. <br><br>
			                    □ Linux: Linux는 주로 개발자, 엔지니어 및 IT 전문가 등 기술적인 분야에서 사용되고 있습니다. 최근 몇 년
			                    동안 Linux의 인기가 상승하고 있으며, 특히 클라우드 컴퓨팅과 같은 분야에서는 Linux가 많이 사용됩니다. 또한,
			                    Android 운영 체제도 Linux 커널을 기반으로 하고 있습니다. 또한 서버용 OS로 적합하지만 Windows에
			                    이 자리를 내어준다면 다른 기능을 강화하는 것이 좋을 것으로 보입니다.  <br><br>
			                    □ macOS: macOS는 Apple의 운영 체제로,
			                    Mac이라고도 불립니다. Mac은 주로 창작적인 분야에서 사용되고 있습니다. 디자이너, 뮤지션, 영상 편집자 등이
			                    Mac을 선호하며, 또한 Mac은 보안성이 높은 운영 체제로도 알려져 있습니다. 최근에는 Apple의 M1 칩을 탑재한
			                    새로운 Mac 모델도 출시되었습니다. 다른 회사와는 달리 Apple사는 macOS로만 제품을 만들어 판매하기 때문에
			                    Apple을 찾는 사람이 존재하는 한 꾸준히 사용될 OS로 보입니다.
			                </p>
		                </div>
		            </div>
		            <div class="dashbox" id="card">
		            	<h2>04. 자격증</h2>
	                	<div class="box_chart">
							<canvas id="myChart4"></canvas>
							<p>
			                    6. SQL전문가<br> 7. 데이터분석 전문가<br>
			                    <!-- 8. <br> 9. 0<br> 10. 0<br> -->
			                </p>
						</div>
						<div class="box_text">
			                <p>
		                   		2023년 3월 잡코리아 기준 요구 자격증입니다.(존재하는 데이터만을 기준으로 작성된 그래프이기에
		                   		실제와는 차이가 있을 수 있습니다.)<br><br>
		                   		정보처리기사, SQL개발자, SQL전문가, 웹 디자인 기능사, 빅데이터분석기사, CCNA, 데이터분석 전문가 등
		                   		많은 자격증이 있습니다만, 공통 자격증으로 정보처리기사를 압도적으로 많이 요구하고 있었습니다. 정보처리기사
		                   		자격증은 '소프트웨어 설계', '소프트웨어 개발', '데이터베이스 구축', '네트워크 구축'의 4가지 과목으로
		                   		구성되어 있고 필기와 실기 시험으로 나뉘어져 있습니다. 따라서 이 자격증은 정보통신 분야에서 일하는 기술자들이
		                   		필요로 하는 종합적-기본적 지식과 기술력을 갖추고 있는지 판단할 수 있는 최적의 자격증인 것입니다.<br><br>
		                   		정보처리기사만큼은 아니지만, 다음으로 많이 요구하는 자격증은 웹디자인기능사입니다.
		                   		이는 정보처리기사만으로는 알 수 없는 웹디자인 실력을 판단할 수 있는 자격증이기에 요구하는 경우가
		                   		많은 것으로 볼 수 있습니다.<br><br>
		                   		다른 자격증으로 빅데이터분석기사, 데이터분석전문가, CCNA, SQL 개발자,SQL 전문가 등이 있으나 실제로 등록해둔
		                   		사례가 거의 없었습니다. 그러나 이는 이 자격증이 아무런 소용이 없다는 뜻이 아닙니다. 실무 환경에 이 자격증들은
		                   		많은 도움을 줄 수 있을 것이기에 모두 취득을 권장하는 자격증들입니다.
			                </p>
		                </div>
		            </div>
		            <div class="dashbox" id="area">
		            	<h2>05. 지원분야</h2>
	                	<div class="box_chart">
							<canvas id="myChart5"></canvas>
							<!-- <p>
			                    6. 0<br> 7. 0<br> 8. 0<br>
		                    	9. 0<br> 10. 0<br>
			                </p> -->
						</div>
						<div class="box_text">
			                <p>
		                    	2023년 3월 잡코리아 기준 각 분야별 채용건수입니다.(존재하는 데이터만을 기준으로 작성된 그래프이기
		                    	때문에 실제와는 다를 수 있습니다.)<br><br>
		                    	Front-End, Back-End, 서버-DB 분야에서 가장 많이 채용하고 있습니다. Front-End와 Back-End 사이의 간격은
		                    	대체로 줄어드는 추세로, Front-End 분야의 중요도를 점차 깨닫기 시작하고 채용 수가 많아지면서 Back-End와의
		                    	균형이 맞춰질 것으로 보입니다.<br><br>
		                    	게임 개발, SW 유지보수, 빅데이터/AI 분야는 상대적으로 채용 건이 적은 것으로 보이나 이 역시
		                    	총합 4000여 건으로 무시할 수 없는 분야이므로 아예 관심을 두지 않기보단 기회를 보고 있는 것이 취업에 유리할
		                    	것입니다.
			                </p>
			                <p>
			                
			                </p>
		                </div>
		            </div>
		            <div class="dashbox" id="edu">
		            	<h2>06. 학력</h2>
	                	<div class="box_chart">
							<canvas id="myChart6"></canvas>
							<!-- <p>
			                    6. 0<br> 7. 0<br> 8. 0<br>
		                    	9. 0<br> 10. 0<br>
			                </p> -->
						</div>
						<div class="box_text">
			                <p><br><br>
			                	2023년 3월 잡코리아 기준 기업의 요구 학력입니다.<br><br>
		                    	학력을 보는 기업들 중에는 초대졸 이상을 요구하는 곳이 가장 많습니다. 고졸을 요구하는 기업이 그 다음, 석사, 박사를 요구하는
		                    	곳도 있으나 대부분의 기업에서 요구하고 있지는 않습니다. 학력을 요구하는 기업 중 데이터는 이렇지만 대부분의 기업은 
		                    	학력 무관인 경우가 많습니다. 그러나 학력을 요구하지 않지만 이에 해당하는 역량을 요구하는 경우가 대부분이므로 학력무관이라고
		                    	할지라도 각종 자격증 등 역량은 갖추고 있어야 합니다.<br><br>
		                    	정확한 수치로는 초대졸 이상 4030건, 대졸 이상 2760건, 고졸 이상 909건, 석사 이상 132건, 박사 7건, 학력무관 10696건
		                    	이었습니다.
			                </p>
		                </div>
		            </div>
		            <div class="dashCareer dashbox">
		            	<h2>07. 경력</h2>
	                	<div class="box_chart">
							<canvas id="myChart7"></canvas>
							<!-- <p>
			                    6. 0<br> 7. 0<br> 8. 0<br>
		                    	9. 0<br> 10. 0<br>
			                </p> -->
						</div>
						<div class="box_text">
			                <p>
			                	2023년 잡코리아 기준 기업의 경력직 채용 건입니다.<br><br>
			                	신입 4723건, 경력 1~3년 10526건, 경력 4~6년 5610건, 경력 7~9년 3992건, 경력 10년 이상 3842건 입니다.
			                	대체로 경력 채용 비율이 높아지는 추세입니다. 이는  새로운 직원을 채용할 때, 경력이 있는 지원자를 선호하고 인재 경쟁력이
			                	높은 사람들을 선발하기 위해서 입니다. 또한, 기업들이 경력자에게는 높은 연봉과 급여를 지급하기 때문에, 기업 입장에서는
			                	경력 채용이 비즈니스적으로 이점이 있기 때문입니다. 하지만 최근에는 신입사원을 적극 채용하려는 기업도 늘어나고 있으며,
			                	신입사원과 경력사원을 모두 적극적으로 채용하는 추세도 보이고 있습니다. 따라서, 채용 경력 비율은 기업마다 차이가 있을 수
			                	있으며, 년도에 따라 변동성이 있을 수 있습니다.
			                </p>   
			            </div>             
		            </div>
		        </div>
		    </div>
		</div> 
	<%@ include file="./include/footer.jsp"%>
<<<<<<< HEAD
	<script>
        $('.dash_link > ul:nth-child(1)>li').click(function(){
            $(this).removeClass('off_dashWhole').addClass('on_dashWhole');
            $('.dash_link > ul:nth-child(1) >li').not(this).removeClass('on_dashWhole').addClass('off_dashWhole');
        });
        $('.dash_link > ul:nth-child(1)>li:nth-child(1)').click(function(){
            $('.dashCompare').hide();
            $('.dashWhole').show();
        });
        $('.dash_link > ul:nth-child(1)>li:nth-child(2)').click(function(){
            $('.dashWhole').hide();
            $('.dashCompare').show();
        });
        
        
    </script>
    

		<script>
			// 차트를 그럴 영역을 dom요소로 가져온다.
			var chartArea = document.getElementById('myChart').getContext('2d');
			// 차트를 생성한다. 
			var myChart = new Chart(chartArea, {
				// ①차트의 종류(String)
				type : 'bar',
				// ②차트의 데이터(Object)
				data : {
					// ③x축에 들어갈 이름들(Array)
					labels : [ 'Java', 'Python', 'JavaScript', 'C#', 'C++' ],
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets : [ {
						// ⑤dataset의 이름(String)
						label : '사용 비율',
						// ⑥dataset값(Array)
						data : [ 21.7, 20.1, 15.3, 7.2, 6.5],
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						backgroundColor : '#B2A4FF',
						// ⑧dataset의 선 색(rgba값을 String으로 표현)
						borderColor : '#B2A4FF',
						// ⑨dataset의 선 두께(Number)
						borderWidth : 1
					} ]
				},
				// ⑩차트의 설정(Object)
				options : {
					// ⑪축에 관한 설정(Object)
					scales : {
						// ⑫y축에 대한 설정(Object)
						y : {
							// ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
							beginAtZero : true
						}
					}
				}
			});
		</script>
		
		<script>
			// 차트를 그럴 영역을 dom요소로 가져온다.
			var chartArea = document.getElementById('myChart2').getContext('2d');
			// 차트를 생성한다. 
			var myChart2 = new Chart(chartArea, {
				// ①차트의 종류(String)
				type : 'line',
				// ②차트의 데이터(Object)
				data : {
					// ③x축에 들어갈 이름들(Array)
					labels : [ 'IntelliJ IDEA','Visual Studio Code', 'Eclipse',  'Android Studio', 'Sublime Text' ],
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets : [ {
						// ⑤dataset의 이름(String)
						label : '사용 비율',
						// ⑥dataset값(Array)
						data : [ 41.1, 27.9, 9.8, 6.3, 3.3],
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						backgroundColor : '#3A1078',
						// ⑧dataset의 선 색(rgba값을 String으로 표현)
						borderColor : '#3A1078',
						// ⑨dataset의 선 두께(Number)
						borderWidth : 1
					} ]
				},
				// ⑩차트의 설정(Object)
				options : {
					// ⑪축에 관한 설정(Object)
					scales : {
						// ⑫y축에 대한 설정(Object)
						y : {
							// ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
							beginAtZero : true
						}
					}
				}
			});
		</script>
		
		<script>
			// 차트를 그럴 영역을 dom요소로 가져온다.
			var chartArea = document.getElementById('myChart3').getContext('2d');
			// 차트를 생성한다. 
			var myChart3 = new Chart(chartArea, {
				// ①차트의 종류(String)
				type : 'doughnut',
				// ②차트의 데이터(Object)
				data : {
					// ③x축에 들어갈 이름들(Array)
					labels : [ 'Windows','macOS','Linux','ChromeOS'],
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets : [ {
						// ⑤dataset의 이름(String)
						label : '# of Votes',
						// ⑥dataset값(Array)
						data : [50,24,24,2],
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						backgroundColor : ['#B2A4FF', '#FFB4B4', '#FFDEB4','#FDF7C3'],
						// ⑧dataset의 선 색(rgba값을 String으로 표현)
						borderColor : 'rgba(255, 99, 132, 1)',
						// ⑨dataset의 선 두께(Number)
						borderWidth : 1
					} ]
				}
				// ⑩차트의 설정(Object)
				
			});
		</script>
		
		<script>
			// 차트를 그럴 영역을 dom요소로 가져온다.
			var chartArea = document.getElementById('myChart4').getContext('2d');
			// 차트를 생성한다. 
			var myChart4 = new Chart(chartArea, {
				// ①차트의 종류(String)
				type : 'radar',
				// ②차트의 데이터(Object)
				data : {
					// ③x축에 들어갈 이름들(Array)
					labels : [ '정보처리기사','웹디자인기능사', 'CCNA', '빅데이터분석기사', 'SQLD' ],
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets : [ {
						// ⑤dataset의 이름(String)
						label : '요구 건수',
						// ⑥dataset값(Array)
						data : [ 1322, 122, 49, 20, 10,0],
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						backgroundColor : '#3A1078',
						// ⑧dataset의 선 색(rgba값을 String으로 표현)
						borderColor : '#3A1078',
						// ⑨dataset의 선 두께(Number)
						borderWidth : 1
					} ]
				},
				// ⑩차트의 설정(Object)
				
			});
		</script>
		
		<script>
			// 차트를 그럴 영역을 dom요소로 가져온다.
			var chartArea = document.getElementById('myChart5').getContext('2d');
			// 차트를 생성한다. 
			var myChart5 = new Chart(chartArea, {
				// ①차트의 종류(String)
				type : 'bar',
				// ②차트의 데이터(Object)
				data : {
					// ③x축에 들어갈 이름들(Array)
					labels : [ 'Front', 'Back', '서버-DB', '게임', 'SW유지보수' ,'빅데이터/AI'],
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets : [ {
						// ⑤dataset의 이름(String)
						label : '채용 건수',
						// ⑥dataset값(Array)
						data : [ 3854, 6099, 5260, 987, 1761, 1624],
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						backgroundColor : '#B2A4FF',
						// ⑧dataset의 선 색(rgba값을 String으로 표현)
						borderColor : '#B2A4FF',
						// ⑨dataset의 선 두께(Number)
						borderWidth : 1
					} ]
				},
				// ⑩차트의 설정(Object)
				options : {
					// ⑪축에 관한 설정(Object)
					scales : {
						// ⑫y축에 대한 설정(Object)
						y : {
							// ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
							beginAtZero : true
						}
					}
				}
			});
		</script>

		<script>
			// 차트를 그럴 영역을 dom요소로 가져온다.
			var chartArea = document.getElementById('myChart6').getContext('2d');
			// 차트를 생성한다. 
			var myChart6 = new Chart(chartArea, {
				// ①차트의 종류(String)
				type : 'pie',
				// ②차트의 데이터(Object)
				data : {
					// ③x축에 들어갈 이름들(Array)
					labels : [ '고졸','초대졸','대졸','석사','박사','학력무관'],
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets : [ {
						// ⑤dataset의 이름(String)
						label : '요구 건수',
						// ⑥dataset값(Array)
						data : [909,4030,2760,132,7,10696],
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						backgroundColor : ['#B2A4FF', '#FFB4B4', '#FFDEB4','#7149C6','#FC2947','#37306B'],
						// ⑧dataset의 선 색(rgba값을 String으로 표현)
						borderColor : 'rgba(255, 99, 132, 1)',
						// ⑨dataset의 선 두께(Number)
						borderWidth : 1
					} ]
				}
				// ⑩차트의 설정(Object)
				
			});
		</script>
		
		<script>
			// 차트를 그럴 영역을 dom요소로 가져온다.
			var chartArea = document.getElementById('myChart7').getContext('2d');
			// 차트를 생성한다. 
			var myChart7 = new Chart(chartArea, {
				// ①차트의 종류(String)
				type : 'bar',
				// ②차트의 데이터(Object)
				data : {
					// ③x축에 들어갈 이름들(Array)
					labels : ['신입', '경력 1~3년', '경력 4~6년', '경력 7~9년', '경력 10년 이상'],
					// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
					datasets : [ {
						// ⑤dataset의 이름(String)
						label : '요구 건수',
						// ⑥dataset값(Array)
						data : [4723, 10526, 5610, 3992, 3842],
						// ⑦dataset의 배경색(rgba값을 String으로 표현)
						backgroundColor : '#B2A4FF',
						// ⑧dataset의 선 색(rgba값을 String으로 표현)
						borderColor : '#B2A4FF',
						// ⑨dataset의 선 두께(Number)
						borderWidth : 1
					} ]
				},
				// ⑩차트의 설정(Object)
				options : {
					// ⑪축에 관한 설정(Object)
					scales : {
						// ⑫y축에 대한 설정(Object)
						y : {
							// ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
							beginAtZero : true
						}
					}
				}
			});
		</script>
	</body>
</html>