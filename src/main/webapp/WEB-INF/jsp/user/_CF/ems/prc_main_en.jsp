<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
  
  
 
<script type="text/javascript">
	var ToPowers = []
	var ToUsages = []
	var PrePowers = []
	var PreUsages = []
	var Charges = []
	
	//게이트 그래프
    document.addEventListener("DOMContentLoaded", function(event) {
        var jg1, jg2, jg3;

        var defs1 = {

            value: '${ TodaySum.powers}',
            min: 0,
            max: 10,
            decimals: 3,
            gaugeWidthScale: 0.6,
            pointer: true,
            pointerOptions: {
                toplength: 10,
                bottomlength: 10,
                bottomwidth: 2
            },
            counter: true,
			levelColors: [
				"#4a80c1",
				"#4a80c1",
				"#4a80c1"
			] ,
            relativeGaugeSize: true
        }
          var defs2 = {
            // label: "Weight Right",
            value: '${ TodaySum.charges}',
            min: 0,
            max: 100,
            decimals: 3,
            gaugeWidthScale: 0.6,
            pointer: true,
            pointerOptions: {
                toplength: 10,
                bottomlength: 10,
                bottomwidth: 2
            },
            counter: true,
			levelColors: [
				"#7fb439",
				"#7fb439",
				"#7fb439"
			] ,
            relativeGaugeSize: true
        }

          var defs3 = {
            // label: "Total Weight",
            value: '${ TodaySum.usages}',
            min: 0,
            max: 10,
            decimals: 3,
            gaugeWidthScale: 0.6,
            pointer: true,
            pointerOptions: {
                toplength: 10,
                bottomlength: 10,
                bottomwidth: 2

            },
            counter: true,
			levelColors: [
				"#f9a51a",
				"#f9a51a",
				"#f9a51a"
			] ,
            relativeGaugeSize: true
        }



        jg1 = new JustGage({
            id: "jg1",
            defaults: defs1
        });

        jg2 = new JustGage({
            id: "jg2",
            defaults: defs2
        });

        jg3 = new JustGage({
            id: "jg3",
            defaults: defs3

        });

    });
</script> 
  
<section id="in-contents">
		
		<!-- 탑 컨텐츠 -->
		<div class="top-row">
			<div class="lb">
				<select class="tx-select" name="Inverter" onchange="if(this.value) location.href=(this.value);">
					<option value="/" selected="selected">comprehensive status</option>
					<option value="/cf/inverter.do?inverter=one">Unit 1</option>
<!-- 					<option value="/cf/inverter.doinverter=two">2호기</option> -->
				</select>
			</div>

			<%-- <div class="rb">
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
						<div class="deg-b">${Today.TEMPERATUREAM }º</div>
						<div class="txt-b">
							<p class="t-p">
								${Today.SKYAM }
							</p>
							<p class="b-p">
								<span class="sm">어제보다 3높아요. 체감온도 29</span>
							</p>
						</div>
					</li>
				</ul>
			</div> --%>
		</div>
		<!-- 탑 컨텐츠 끝 -->




		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">
			
			<!-- 종합현황 -->
			<div class="m-situation-w">
				
				<!-- 첫번째 줄 -->
				<div class="col-1">
						
						<div class="r-1 gate-graph-box"> <!-- 첫번째! -->
						
						<div class="col-in"> <!-- col in -->
							<div class="gate-box">
								<div class="graph-b">
									<div id="jg1" class="gauge size-1"></div>
								</div>
								<div class="txt-b">
									<h2><b>${ TodaySum.powers}</b>kWh</h2>
									<h5>Power Generation on the same day</h5>
								</div>
							</div>
							
							<c:set var="percent" value="${(TodaySum.powers/10)-(PredaySum.powers/10) }"/>
							<c:set var="srcurl" value="${percent < 0?'down':'up'}"/>
							<c:set var="color" value="${percent < 0?'blue':'red'}"/>
							<div class="number-box">
								<p class="n-t ${color }">
									<fmt:formatNumber value="${percent }" type="percent"/><i class="xi-angle-${srcurl }"></i>
								</p>
								<div class="kwh-t">
									<h2><b>${ PredaySum.powers}</b>kWh</h2>
									<h5>Power Generation for the previous day</h5>
								</div>
							</div>
						</div>
						
						<div class="col-in"> <!-- col in -->
							<div class="gate-box">
								<div class="graph-b">
									<div id="jg2" class="gauge size-1"></div>
								</div>
								<div class="txt-b">
									<h2><b>0</b>%</h2>
									<h5>Current Charging Rate(ESS)</h5>
								</div>
							</div>


							<c:set var="percent" value="${(TodaySum.charges)-(PredaySum.charges) }"/>
							<c:set var="srcurl" value="${percent < 0?'down':'up'}"/>
							<c:set var="color" value="${percent < 0?'blue':'red'}"/>
							<div class="number-box">
								<p class="n-t ${color }">${percent }% <i class="xi-angle-${srcurl }"></i></p>
								<div class="tt-b">
									<h2>${ PredaySum.charges}%</h2>
									<h5>Full-day charge rate(ESS)</h5>
								</div>
								<div class="to-b">
									<p class="l-p">Same-day discharge rate</p>
									<p class="r-p"><b>${ TodaySum.discharges}</b>%</p>
								</div>
							</div>
						</div> <!-- col in END -->

						
						<div class="col-in"> <!-- col in -->
							<div class="gate-box">
								<div class="graph-b">
									<div id="jg3" class="gauge size-1"></div>
								</div>
								<div class="txt-b">
									<h2><b>${ TodaySum.usages}</b>kWh</h2>
									<h5>Same Day Usage</h5>
								</div>
							</div>

							<c:set var="percent" value="${(TodaySum.usages/10)-(PredaySum.usages/10) }"/>
							<c:set var="srcurl" value="${percent < 0?'down':'up'}"/>
							<c:set var="color" value="${percent < 0?'blue':'red'}"/>
							<div class="number-box">
								<p class="n-t ${color }">
									<fmt:formatNumber value="${percent }" type="percent"/><i class="xi-angle-${srcurl }"></i>
								</p>
								<div class="kwh-t">
									<h2><b>${ PredaySum.usages}</b>kWh</h2>
									<h5>Previous Day Usage</h5>
								</div>
							</div>
						</div> <!-- col in END -->

					</div> <!-- 첫번째 END! --> 


					<div class="r-2 wide-graph-box"> <!-- 두번째! -->
						<div class="graph-title-box">
							<div class="lb">
								<p class="tit">Energy Generation / Usage Trend Graph</p>
							</div>
							<div class="rb">
								<ul class="graph-cate">
									<li>
										<span class="squre" style="background-color:#5b5b5b"></span>
										<span class="txt">Power Generation for the previous day</span>
									</li>
									<li>
										<span class="squre" style="background-color:#bfbdbe"></span>
										<span class="txt">Previous Day Usage</span>
									</li>
									<li>
										<span class="squre" style="background-color:#29ace4"></span>
										<span class="txt">Power Generation on the same day</span>
									</li>
									<li>
										<span class="squre" style="background-color:#94ccdb"></span>
										<span class="txt">Same Day Usage</span>
									</li>
								</ul>
							</div>
						</div>

						<div class="graph-con">
							<div id="container" style="width: 100%; height: 100%;"></div>
						</div>
					</div> <!-- 두번째 END! -->


					<div class="r-3 wide-graph-box"> <!-- 세번째! -->
						<div class="graph-title-box">
							<div class="lb">
								<p class="tit pdT5">Compared to target (kWh/Time)</p>
							</div>
							<div class="rb">
								<ul class="graph-cate">
									<li>
										<span class="squre" style="background-color:#29ace4"></span>
										<span class="txt">Power generation volume on the same day</span>
									</li>
									<li>
										<span class="squre" style="background-color:#94ccdb"></span>
										<span class="txt">Same Day Usage</span>
									</li>
								</ul>
								<ul class="graph-day-tab-ul" id="oneGraph">
									<li class="active"><a href="javascript:;" onclick="echart_line('one','day',this)">Day</a></li>
									<li><a href="javascript:;" onclick="echart_line('one','week',this)">Week</a></li>
									<li><a href="javascript:;" onclick="echart_line('one','month',this)">Month</a></li>
									<li><a href="javascript:;" onclick="echart_line('one','year',this)">Year</a></li>
								</ul>
							</div>
						</div>

						<div class="graph-con">
							<div id="echart_line" style="width:100%; height:100%;"></div>
						</div>
					</div> <!-- 세번째 END! -->

				</div>



				<!-- 두번째 줄 -->
				<div class="col-2">
					
					<div class="r-1 half-graph-box"> <!-- 첫번째 -->
						<div class="title-box">
							<div class="lb">
								<ul class="tab-title-b blue">
									<li class="active"><a href="javascript:;">Power generation volume</a></li>
									<!-- <li><a href="javascript:;">CO2절감량</a></li> -->
								</ul>
							</div>

							<div class="rb">								
								<ul class="graph-day-tab-ul blue" id="twoGraph">
									<li class="active"><a href="javascript:;" onclick="echart_line('two','day',this)">Day</a></li>
									<li><a href="javascript:;" onclick="echart_line('two','week',this)">Week</a></li>
									<li><a href="javascript:;" onclick="echart_line('two','month',this)">Month</a></li>
									<li><a href="javascript:;" onclick="echart_line('two','year',this)">Year</a></li>
								</ul>
							</div>
						</div>

						<div class="graph-in">
							<div class="info-b blue">
								<div class="one">
									<h5>Average hourly power generation</h5>
									<h2><b>${TodaySum.average }</b>kWh</h2>
								</div>
								<div class="one">
									<h5>Cumulative Daily Power Generation</h5>
									<h2><b>${TodaySum.powers }</b>kWh</h2>
								</div>
								<div class="cate-b">
<!-- 									<p> -->
<!-- 										<span class="squre" style="background-color:#bbd7db"></span> 발전량 -->
<!-- 									</p> -->
									 <p>
										<span class="squre" style="background-color:#4b80c2"></span> Same Day Usage
									</p>
								</div>
							</div>

							<div class="graph-b">
								<p class="tit1">Compared to target(kWh/Time)</p>
								<div class="in">
									<div id="echart_line2" style="width: 100%; height: 100%;"></div>
								</div>
							</div>

						</div>
					</div> <!-- 첫번째 끝 -->
					

					<div class="r-1 half-graph-box"> <!-- 두번째 -->
						<div class="title-box">
							<div class="lb">
								<ul class="tab-title-b green">
									<li class="active"><a href="javascript:;">Power generation volume</a></li>
									<!-- <li><a href="javascript:;">방전량</a></li> -->
								</ul>
							</div>

							<div class="rb">								
								<ul class="graph-day-tab-ul green" id="threeGraph">
									<li class="active"><a href="javascript:;" onclick="echart_line('three','day',this)">Day</a></li>
									<li><a href="javascript:;" onclick="echart_line('three','week',this)">Week</a></li>
									<li><a href="javascript:;" onclick="echart_line('three','month',this)">Month</a></li>
									<li><a href="javascript:;" onclick="echart_line('three','year',this)">Year</a></li>
								</ul>
							</div>
						</div>

						<div class="graph-in">
							<div class="info-b green">
								<div class="one">
									<h5>Average hourly charge</h5>
									<h2><b>${TodaySum.charges }</b>%</h2>
								</div>
								<!-- <div class="one">
									<h5>일일 누적 량</h5>
									<h2><b>1,370.00</b>kWh</h2>
								</div> -->
								<div class="cate-b">
									<!-- <p>
										<span class="squre" style="background-color:#e3e9c7"></span> 충전량
									</p> -->
									<p>
										<span class="squre" style="background-color:#7fb439"></span> Charging Volume
									</p>
								</div>
							</div>

							<div class="graph-b">
								<p class="tit1">ESS Charge(kWh/Time)</p>
								<div class="in">									
									<div id="echart_line3" style="width: 100%; height: 100%;"></div>
								</div>
							</div>

						</div>
					</div> <!-- 두번째 끝 -->
					

					<div class="r-1 half-graph-box"> <!-- 세번째 -->
						<div class="title-box">

							<div class="rb">								
								<ul class="graph-day-tab-ul orange" id="fourGraph">
									<li class="active"><a href="javascript:;" onclick="echart_line('four','day',this)">Day</a></li>
									<li><a href="javascript:;" onclick="echart_line('four','week',this)">Week</a></li>
									<li><a href="javascript:;" onclick="echart_line('four','month',this)">Month</a></li>
									<li><a href="javascript:;" onclick="echart_line('four','year',this)">Year</a></li>
								</ul>
							</div>
						</div>

						<div class="graph-in">
							<div class="info-b orange">
								<div class="one">
									<h5>Average usage per hour</h5>
									<h2><b>${TodaySum.usaverage }</b>kWh</h2>
								</div>
								<div class="one">
									<h5>Cumulative Daily Usage</h5>
									<h2><b>${TodaySum.usages }</b>kWh</h2>
								</div>
								<div class="cate-b">
									<!-- <p>
										<span class="squre" style="background-color:#fbd4b5"></span> 당일 발전량
									</p> -->
									<p>
										<span class="squre" style="background-color:#f9a51a"></span> Same Day Usage
									</p>
								</div>
							</div>

							<div class="graph-b">
								<p class="tit1">Energy Usage(kWh/Time)</p>
								<div class="in">
									<div id="echart_line4" style="width: 100%; height: 100%;"></div>
								</div>
							</div>

						</div>
					</div> <!-- 세번째 끝 -->

				</div>

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
						<p class="tit">PV Power Generation</p>
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
								<div class="name">Unit 1</div>
							</div>
							<div class="half-b">
								<div class="icon">
									<span><img src="${src3}" alt="pv발전 아이콘"></span>
									<span><img src="${src4}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">Unit 2</div>
							</div>
						</div>
					</div> <!-- one END -->

					<div class="one"> <!-- one -->
						<p class="tit">ESS(PCS) State</p>
						<div class="icon-box">
							<div class="half-b">
								<div class="icon">
									<span><img src="${src11}" alt="ESS PCS 아이콘"></span>
									<span><img src="${src22}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">Unit 1</div>
							</div>
							<div class="half-b">
								<div class="icon">
									<span><img src="${src33}" alt="ESS PCS 아이콘"></span>
									<span><img src="${src44}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">Unit 2</div>
							</div>
						</div>
					</div> <!-- one END -->

					<div class="one"> <!-- one -->
						<p class="tit">ESS(BAT) State</p>
						<div class="icon-box">
							<div class="half-b">
								<div class="icon">
									<span><img src="${src111}" alt="ESS BAT 아이콘"></span>
									<span><img src="${src222}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">Unit 1</div>
							</div>
							<div class="half-b">
								<div class="icon">
									<span><img src="${src333}" alt="ESS BAT 아이콘"></span>
									<span><img src="${src444}" alt="작동오류 아이콘"></span>
								</div>
								<div class="name">Unit 2</div>
							</div>
						</div>
					</div> <!-- one END -->

				</div>

			</div>

		</div>
		<!-- 밑에 주요 컨텐츠 끝 -->


	</section>
	
	<c:forEach items="${MonSum}" var="sum">
		<script>
			ToPowers.push('${sum.powers}')
			ToUsages.push('${sum.usages}')
			PrePowers.push('${sum.prepowers}')
			PreUsages.push('${sum.preusages}')
			Charges.push('${sum.charges}')
		</script>
	</c:forEach>
	
<script type="text/javascript">

	$("#gnb li:nth-child(1)").addClass('active');
	
	var dom = document.getElementById("container");
	var myChart = echarts.init(dom);
	var app = {};
	option = null;
	option = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            
	            type : 'shadow'        
	        }
	    },
	    legend: {
	    	show : false,
	        data:['Power Generation for the previous day','Previous day usage','Power generation volume on the same day','Same day usage']
	    },
	    grid: {
	    	top:'15%',
	        left: '4%',
	        right: '4%',
	        bottom: '15%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data : [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31],
    			axisLine: { lineStyle: { color: '#aaa' }},
    			splitLine: { show: false },
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : [
	        {
	            name:'Power Generation for the previous day',
	            type:'bar',
	            stack: '1',
	            barWidth : 5,
	            data: PrePowers,
				itemStyle: { normal: { color: '#5b5b5b' } },
	        },
	        {
	            name:'Previous day usage',
	            type:'bar',
	            stack: '1',
	            barWidth : 5,
	            data:PreUsages,
				itemStyle: { normal: { color: '#bfbdbe' } },
	        },
	        {
	            name:'Power generation volume on the same day',
	            type:'bar',
	            stack: '2',
	            barWidth : 5,
	            data:ToPowers,
				itemStyle: { normal: { color: '#29ace4' } },
	        },
	        {
	            name:'Same day usage',
	            type:'bar',
	            stack: '2',
	            barWidth : 5,
	            data:ToUsages,
				itemStyle: { normal: { color: '#94ccdb' } },
	        },
	    ]
	};
	if (option && typeof option === "object") {
	    myChart.setOption(option, true);
	}
	
	
	function ChangeView(type){
		if(type == 'one'){
			location.href='/cf/inverter.do?inverter='+type;
		}else if(type == 'two'){
			location.href='/cf/inverter.do?inverter='+type;
		}else{
			location.href='/';
		}
	}
	
	
	
	
	function echart_line(choice,type,obj){
		var id = "";
		if(choice == 'one'){
			id = "#oneGraph li";
		}else if(choice == 'two'){
			id = "#twoGraph li"
		}else if(choice == 'three'){
			id = "#threeGraph li"
		}else if(choice == 'four'){
			id = "#fourGraph li"
		}
		
		$(id).removeClass();
		$(obj).closest("li").addClass('active');
		
		 //echart Line
		$.ajax({
			type:"post",
			url:"/cf/dateajax.do",
			data:{
				"type":type
			},
			success:function(data){
				var powers = []
				var usages = []
				var charges = []
				$.each(data,function(i){
					powers.push(data[i].powers);
					usages.push(data[i].usages);
					charges.push(data[i].charges);
					
					if(choice == 'one'){
						echarts_line_other(powers,usages);
					}else if(choice == 'two'){
						echarts_line_other1(powers);
					}else if(choice == 'three'){
						echarts_line_other2(charges);
					}else if(choice == 'four'){
						echarts_line_other3(usages);
					}
				});
			},error:function(){
				alert("에러");
			}
		});
	}	
</script>