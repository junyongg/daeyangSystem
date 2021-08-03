<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<section id="in-contents">
		<input type="hidden" id="inverter" name="inverter" value="${inverter }">
		<!-- 탑 컨텐츠 -->
		<div class="top-row">
			<div class="lb">
				<select class="tx-select" name="Inverter" onchange="ChangeView(this.value);" >
					<option value="main">종합현황</option>
					<option value="one" ${inverter eq 'one'?'selected':''}>1호기</option>
<%-- 					<option value="two" ${inverter eq 'two'?'selected':''}>2호기</option> --%>
				</select>
			</div>

			<!-- <div class="rb">
				<ul class="m-t-info-ul">
					<li>
						<div class="icon">
							<img src="/resources/img/icon/icon_main_top01.png" alt="소나무 아이콘">
						</div>
						<div class="txt-b">
							<p class="t-p">
								소나무 <span class="sm">(단위 : 만)</span>
							</p>
							<p class="b-p">
								<span class="lg bold">40.33</span> 그루
							</p>
						</div>
					</li>
					<li>
						<div class="icon">
							<img src="/resources/img/icon/icon_main_top02.png" alt="CO2 아이콘">
						</div>
						<div class="txt-b">
							<p class="t-p">
								CO2감소량 <span class="sm">(단위 : 천)</span>
							</p>
							<p class="b-p">
								<span class="lg bold">1.12</span> Ton
							</p>
						</div>
					</li>
					<li>
						<div class="icon">
							<img src="/resources/img/icon/icon_main_top03.png" alt="날씨 아이콘">
						</div>
						<div class="deg-b">26º</div>
						<div class="txt-b">
							<p class="t-p">
								구름많음
							</p>
							<p class="b-p">
								<span class="sm">어제보다 3높아요. 체감온도 29</span>
							</p>
						</div>
					</li>
				</ul>
			</div> -->
		</div>
		<!-- 탑 컨텐츠 끝 -->




		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">
			
			<!-- 종합현황 -->
			<div class="m-situation-w">
				
				
				<div class="row-one-left"> <!-- 기기별 left-row -->


					<!-- 첫번째 줄 -->
					<div class="col-1">
						
						<div class="m2-top-txt-box bgW">
							<ul class="clearfix">
								<li>
									<span class="tm">월 발전량</span>
									<span class="lm"><b>${MonAll.powers }</b>kW</span>
								</li>
								<li>
									<span class="tm">당일 최고발전량</span>
									<span class="lm"><b>${OneData.maxPower }</b>W</span>
								</li>
								<li>
									<span class="tm">당일 발전시간</span>
									<span class="lm"><b>${OneData.powerTime }</b>h</span>
								</li>
							</ul>
						</div>

						<div class="m2-left-graph-cir">
							
							<div class="one bgW"> <!-- one -->
								<div class="graph-b">
									<div class="g-in">
										<canvas class="canvasDoughnut" height="180" width="180" style="margin: 5px 10px 10px 0"></canvas>
										<span class="per">
											<fmt:formatNumber value="${ToSum.powers/10 }" type="percent"/>
										</span>
									</div>
									<div class="txt-b">
										<h2><b>${ToSum.powers}</b>kW</h2>
										<h5>당일 발전량</h5>
									</div>
								</div>
								
								<script>
								function init_chart_doughnut(){
									
									var a = parseInt('${(ToSum.powers/10)*100}');
									
									if( typeof (Chart) === 'undefined'){ return; }
									
									if ($('.canvasDoughnut').length){
									
									var chart_doughnut_settings = {
											type: 'doughnut',
											tooltipFillColor: "rgba(51, 51, 51, 0.55)",
											data: {
												labels: [
													"당일발전량",
													"other"
												],
												datasets: [{
													data: [a, 100-a],
													backgroundColor: [
														"#4981c2",
														"#dcddde",
													],
													hoverBackgroundColor: [
														"#4981c2",
														"#dcddde",
													]
												}]
											},
											options: { 
												legend: false, 
												responsive: false 
											}
										}
									
										$('.canvasDoughnut').each(function(){
											
											var chart_element = $(this);
											var chart_doughnut = new Chart( chart_element, chart_doughnut_settings);
											
										});
									
									}  	
								   
								}
								</script>

								<c:set var="percent" value="${(ToSum.powers/PreSum.powers)*100 - 100 }"/>
								<c:set var="srcurl" value="${percent < 0?'down':'up'}"/>
								<c:set var="color" value="${percent < 0?'blue':'red'}"/>
								<div class="letter-b">
									<p class="tit">
										<span class="num"><b>${empty PreSum.powers?'0':PreSum.powers}</b>kW</span>
										<span class="num2 ${color }-c">
											<fmt:formatNumber type="number" value="${percent }" maxIntegerDigits="1"/> %
											<i class="xi-angle-${srcurl }"></i></span>
									</p>
									<p class="sm-t">전일 발전량(증감율)</p>
								</div>
							</div> <!-- one END -->
							
							<div class="one bgW"> <!-- one -->
								<div class="graph-b">
									<div class="g-in"><iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; inset: 0px;"></iframe>
										<!-- 동그라미 2 차트 -->										
										<canvas class="canvasDoughnut2" height="180" width="180" style="margin: 5px 10px 10px 0px; width: 180px; height: 180px;"></canvas>
										<span class="per">${MonAll.percent }%</span>
									</div>
									<div class="txt-b">
										<h2><b>${MonAll.powers }</b>kW</h2>
										<h5>월 발전량</h5>
									</div>
								</div>
								<script>
								function init_chart_doughnut2(){
									var a = '${MonAll.percent}';
									
									if( typeof (Chart) === 'undefined'){ return; }
									
									if ($('.canvasDoughnut2').length){
									
									var chart_doughnut_settings = {
											type: 'doughnut',
											tooltipFillColor: "rgba(51, 51, 51, 0.55)",
											data: {
												labels: [
													"월발전량",
													"Other"
												],
												datasets: [{
													data: [a, 100-a],
													backgroundColor: [
														"#80b539",
														"#dcddde",
													],
													hoverBackgroundColor: [
														"#80b539",
														"#dcddde",
													]
												}]
											},
											options: { 
												legend: false, 
												responsive: false 
											}
										}
									
										$('.canvasDoughnut2').each(function(){
											
											var chart_element = $(this);
											var chart_doughnut = new Chart( chart_element, chart_doughnut_settings);
											
										});
									
									}  	
								   
								}
								</script>
								<div class="letter-b">
									<p class="tit">
										<c:set var="percent" value="${MonAll_Other.cashes - MonAll_Other_pre.cashes}"/>
										<c:set var="srcurl" value="${percent < 0?'down':'up'}"/>
										<c:set var="color" value="${percent < 0?'blue':'red'}"/>

										<span class="num"><b>
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${MonAll_Other.cashes }" />
											</b>원</span>
										<span class="num2 ${color }-c"><fmt:formatNumber type="number" maxFractionDigits="3" value="${MonAll_Other.cashes }" />원<i class="xi-angle-${srcurl }"></i></span>
									</p>
									<p class="sm-t">월누적 수익(원)</p>
								</div>
							</div> <!-- one END -->
							
							<div class="one bgW"> <!-- one -->
								<div class="graph-b">
									<div class="g-in"><iframe class="chartjs-hidden-iframe" style="width: 100%; display: block; border: 0px; height: 0px; margin: 0px; position: absolute; inset: 0px;"></iframe>
										<!-- 동그라미 3 차트 -->
										<canvas class="canvasDoughnut3" height="180" width="180" style="margin: 5px 10px 10px 0px; width: 180px; height: 180px;"></canvas>
										<span class="per"><fmt:formatNumber value="${All.percent }" pattern=".0"/>%</span>
									</div>
									<div class="txt-b">
										<h2><b>${All.powers }</b>kW</h2>
										<h5>누적 발전량</h5>
									</div>
								</div>
								<script>
								function init_chart_doughnut3(){
									var a = '${All.percent}';
									
									if( typeof (Chart) === 'undefined'){ return; }
									
									if ($('.canvasDoughnut3').length){
									
									var chart_doughnut_settings = {
											type: 'doughnut',
											tooltipFillColor: "rgba(51, 51, 51, 0.55)",
											data: {
												labels: [
													"누적 발전량",
													"Other"
												],
												datasets: [{
													data: [a, 100-a],
													backgroundColor: [
														"#faa61a",
														"#dcddde",
													],
													hoverBackgroundColor: [
														"#faa61a",
														"#dcddde",
													]
												}]
											},
											options: { 
												legend: false, 
												responsive: false 
											}
										}
									
										$('.canvasDoughnut3').each(function(){
											
											var chart_element = $(this);
											var chart_doughnut = new Chart( chart_element, chart_doughnut_settings);
											
										});
									
									}  	
								   
								}
								</script>
								<div class="letter-b">
									<p class="tit">
										<span class="num"><b>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${All_Other.cashes }" />
										</b>원</span>
									</p>
									<p class="sm-t">누적 절감수익(원)</p>
								</div>
							</div> <!-- one END -->

						</div>

					</div>



					<!-- 두번째 줄 -->
					<div class="col-2">
						
						<div class="m2-icon-print-box bgW">
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">계통도</p>
								</div>
							</div>

							<div class="m2-graph-icon-print-box">
								<div class="row">
									<div class="inBox">
										<h4>현재 출력</h4>
										<h2><b>${OneData.IO_POWER }</b>kW</h2>
										<div class="icon">
											<img src="/resources/img/icon/icon_m_r_solar.png" alt="태양아이콘">
										</div>
										<p class="name">SOLAR</p>
									</div>

									<div class="line">
										<img src="/resources/img/icon/icon_horiz_01.png" alt="가로선">
									</div>

									<div class="inBox">
										<!-- <h4>인버터 출력</h4>
										<h2><b>0.1</b>kW</h2> -->
										<div class="icon">
											<img src="/resources/img/icon/icon_m_r_inverter.png" alt="인버터">
										</div>
										<p class="name">INVERTER</p>
									</div>

									<div class="line">
										<img src="/resources/img/icon/icon_horiz_01.png" alt="가로선">
									</div>

									<div class="inBox alone">
										<div class="icon">
											<img src="/resources/img/icon/icon_m_r_bulii.png" alt="빌딩">
										</div>
									</div>
								</div>

								<div class="verti-line">
									<img src="/resources/img/icon/icon_verti_01.png" alt="세로선">
								</div>

								<div class="row">
									<div class="inBox bottom">
										<div class="icon">
											<img src="/resources/img/icon/icon_m_r_battery.png" alt="인버터">
										</div>
										<p class="name">BATTERY</p>
										<h4>ESS(BAT) (MW)</h4>
										<h2><b>${OneData.IO_CHARGE }</b>MW</h2>
									</div>
								</div>
							</div>
						</div>


					</div>
					

					<div class="clearfix"></div>



					<div class="row-100">
						
						<div class="r-3 bgW"> <!-- 세번째! -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit pdT5">에너지 발전현황</p>
								</div>
								<div class="rb">
									<ul class="graph-cate">
										<li>
											<span class="squre" style="background-color:#94ca54"></span>
											<span class="txt">사용량</span>
										</li>
										<li>
											<span class="squre" style="background-color:#28aee4"></span>
											<span class="txt">발전량</span>
										</li>
										<li>
											<span class="squre" style="background-color:#fec00f"></span>
											<span class="txt">절감수익</span>
										</li>
									</ul>
									<ul class="graph-day-tab-ul" id="inverterGraph">
										<li class="active"><a href="javascript:;" onclick="inverterDate('day',this)">일</a></li>
										<li><a href="javascript:;" onclick="inverterDate('week',this)">주</a></li>
										<li><a href="javascript:;" onclick="inverterDate('month',this)">월</a></li>
										<li><a href="javascript:;" onclick="inverterDate('year',this)">년</a></li>
									</ul>
								</div>
							</div>

							<div class="graph-c m2-graph-bt-box">
								
								<div class="info-left-box">
									<ul>
										<li>
											<h5>시간당 평균 발전량</h5>
											<h2><b>${ToSum.average }</b>kW</h2>
										</li>
										<li>
											<h5>누적 발전량</h5>
											<h2><b>${ToSum.powers }</b>kW</h2>
										</li>
										<li>
											<h5>월 누적수익(원)</h5>
											<h2><b>${MonAll_Other.cashes }원</b></h2>
										</li>
									</ul>
								</div>

								<div class="graph-right-box">
									<div id="mainb" style="width: 100%; height: 100%;"></div>
								</div>

							</div>
						</div> <!-- 세번째 END! -->
					</div>


				</div> <!-- 기기별 left-row 끝 -->





				<c:choose>
					<c:when test="${not empty OneData.IO_POWER }">
						<c:if test="${OneData.IO_POWER ne '0'}">
							<c:set var="src1" value="/resources/img/icon/icon_m_pv_blue.png" />
							<c:set var="src2" value="/resources/img/icon/icon_m_condi_gray.png" />
						</c:if>
						<c:if test="${OneData.IO_POWER eq '0'}">
							<c:set var="src1" value="/resources/img/icon/icon_m_pv_gray.png" />
							<c:set var="src2" value="/resources/img/icon/icon_m_condi_red.png" />
						</c:if>
						<c:if test="${OneData.IO_STATUS eq 'on'}">
							<c:set var="src11" value="/resources/img/icon/icon_m_essPCS_blue.png" />
							<c:set var="src22" value="/resources/img/icon/icon_m_condi_gray.png" />
						</c:if>
						<c:if test="${OneData.IO_STATUS eq 'off'}">
							<c:set var="src11" value="/resources/img/icon/icon_m_essPCS_gray.png" />
							<c:set var="src22" value="/resources/img/icon/icon_m_condi_red.png" />
						</c:if>
						<c:if test="${OneData.IO_CHARGE ne '0'}">
							<c:set var="src111" value="/resources/img/icon/icon_m_essBAT_blue.png" />
							<c:set var="src222" value="/resources/img/icon/icon_m_condi_gray.png" />
						</c:if>
						<c:if test="${OneData.IO_CHARGE eq '0'}">
							<c:set var="src111" value="/resources/img/icon/icon_m_essBAT_gray.png" />
							<c:set var="src222" value="/resources/img/icon/icon_m_condi_red.png" />
						</c:if>
					</c:when>
					<c:otherwise>
						<c:set var="src1" value="/resources/img/icon/icon_m_pv_gray.png" />
						<c:set var="src2" value="/resources/img/icon/icon_m_condi_gray.png" />
						<c:set var="src11" value="/resources/img/icon/icon_m_essPCS_gray.png" />
						<c:set var="src22" value="/resources/img/icon/icon_m_condi_gray.png" />
						<c:set var="src111" value="/resources/img/icon/icon_m_essBAT_gray.png" />
						<c:set var="src222" value="/resources/img/icon/icon_m_condi_gray.png" />
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${not empty TwoData.IO_POWER }">
						<c:if test="${TwoData.IO_POWER ne '0'}">
							<c:set var="src3" value="/resources/img/icon/icon_m_pv_blue.png" />
							<c:set var="src4" value="/resources/img/icon/icon_m_condi_gray.png" />
						</c:if>
						<c:if test="${TwoData.IO_POWER eq '0'}">
							<c:set var="src3" value="/resources/img/icon/icon_m_pv_gray.png" />
							<c:set var="src4" value="/resources/img/icon/icon_m_condi_red.png" />
						</c:if>
						<c:if test="${TwoData.IO_STATUS eq 'on'}">
							<c:set var="src33" value="/resources/img/icon/icon_m_essPCS_blue.png" />
							<c:set var="src44" value="/resources/img/icon/icon_m_condi_gray.png" />
						</c:if>
						<c:if test="${TwoData.IO_STATUS eq 'off'}">
							<c:set var="src33" value="/resources/img/icon/icon_m_essPCS_gray.png" />
							<c:set var="src44" value="/resources/img/icon/icon_m_condi_red.png" />
						</c:if>
						<c:if test="${TwoData.IO_CHARGE ne '0'}">
							<c:set var="src333" value="/resources/img/icon/icon_m_essBAT_blue.png" />
							<c:set var="src444" value="/resources/img/icon/icon_m_condi_gray.png" />
						</c:if>
						<c:if test="${TwoData.IO_CHARGE eq '0'}">
							<c:set var="src333" value="/resources/img/icon/icon_m_essBAT_gray.png" />
							<c:set var="src444" value="/resources/img/icon/icon_m_condi_red.png" />
						</c:if>
					</c:when>
					<c:otherwise>
						<c:set var="src3" value="/resources/img/icon/icon_m_pv_gray.png" />
						<c:set var="src4" value="/resources/img/icon/icon_m_condi_gray.png" />
						<c:set var="src33" value="/resources/img/icon/icon_m_essPCS_gray.png" />
						<c:set var="src44" value="/resources/img/icon/icon_m_condi_gray.png" />
						<c:set var="src333" value="/resources/img/icon/icon_m_essBAT_gray.png" />
						<c:set var="src444" value="/resources/img/icon/icon_m_condi_gray.png" />
					</c:otherwise>
				</c:choose>

				<!-- 세번째 줄 -->
				<div class="col-3 ma-condition-box">

					<div class="one"> <!-- one -->
						<p class="tit">PV 발전</p>
						<div class="icon-box">
							<div class="half-b">
								<div class="icon">
									<span>
										<img src="${src1}" alt="pv발전 아이콘">
									</span>
									<span>
										<img src="${src2}" alt="작동오류 아이콘">
									</span>
								</div>
								<div class="name">1호기</div>
							</div>
							<div class="half-b">
								<div class="icon">
									<span><img src="${src3}" alt="pv발전 아이콘"></span>
									<span><img src="${src4}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">2호기</div>
							</div>
						</div>
					</div> <!-- one END -->

					<div class="one"> <!-- one -->
						<p class="tit">ESS(PCS) 상태</p>
						<div class="icon-box">
							<div class="half-b">
								<div class="icon">
									<span><img src="${src11}" alt="ESS PCS 아이콘"></span>
									<span><img src="${src22}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">1호기</div>
							</div>
							<div class="half-b">
								<div class="icon">
									<span><img src="${src33}" alt="ESS PCS 아이콘"></span>
									<span><img src="${src44}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">2호기</div>
							</div>
						</div>
					</div> <!-- one END -->

					<div class="one"> <!-- one -->
						<p class="tit">ESS(BAT) 상태</p>
						<div class="icon-box">
							<div class="half-b">
								<div class="icon">
									<span><img src="${src111}" alt="ESS BAT 아이콘"></span>
									<span><img src="${src222}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">1호기</div>
							</div>
							<div class="half-b">
								<div class="icon">
									<span><img src="${src333}" alt="ESS BAT 아이콘"></span>
									<span><img src="${src444}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">2호기</div>
							</div>
						</div>
					</div> <!-- one END -->

				</div>

			</div>

		</div>
		<!-- 밑에 주요 컨텐츠 끝 -->


	</section>
	
	<script type="text/javascript">
		var ToPowers = []
		var ToUsages = []
		var ToCashes = []
	</script>
	
	<c:forEach items="${MonSum}" var="sum">
		<script>
			ToPowers.push('${sum.powers}')
			ToUsages.push('${sum.usages}')
			ToCashes.push('${sum.cashes}')
		</script>
	</c:forEach>
	
	<script>
		$("#gnb li:nth-child(1)").addClass('active');
	
		function ChangeView(type){
			if(type == 'one'){
				location.href='/cf/inverter.do?inverter='+type;
			}else if(type == 'two'){
				location.href='/cf/inverter.do?inverter='+type;
			}else{
				location.href='/';
			}
		}
		
		
		
		function inverterDate(type,obj){
			$("#inverterGraph li").removeClass();
			$(obj).closest("li").addClass('active');
			
			 //echart Line
			$.ajax({
				type:"post",
				url:"/cf/dateajax.do",
				data:{
					"type":type,
					"inverter" : $('#inverter').val()
				},
				success:function(data){
					var powers = []
					var usages = []
					var charges = []
					var cahses = []
					$.each(data,function(i){
						powers.push(data[i].powers);
						usages.push(data[i].usages);
						cahses.push(data[i].cashes);
					
						mainb(powers,usages,cahses);
					});
				},error:function(){
					alert("에러");
				}
			});
		}	
	</script>