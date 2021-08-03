<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
  
<style>
.unit{
	color: gray;
	font-size: 12px;
}


</style>
 
 
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
            decimals: 1,
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
					<option value="/" selected="selected">종합현황</option>
					<option value="/cf/inverter.do?inverter=one">1호기</option>
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
									<h2><b>${empty TodaySum.powers? '0': TodaySum.powers}</b> kW</h2>
									<h5>당일 발전량</h5>
									<span class="unit">(단위 : kw)</span>
								</div>
							</div>
							
							<c:set var="percent" value="${(TodaySum.powers/PredaySum.powers)*100 - 100}"/>
							<c:set var="srcurl" value="${percent < 0?'down':'up'}"/>
							<c:set var="color" value="${percent < 0?'blue':'red'}"/>
							<div class="number-box">
								<p class="n-t ${color }">
									<fmt:formatNumber type="number" value="${percent }" maxIntegerDigits="1"/> %
									<i class="xi-angle-${srcurl }"></i>
								</p>
								<div class="kwh-t">
									<h2><b>${empty PredaySum.powers? '0':PredaySum.powers}</b> kW</h2>
									<h5>전일 발전량 (증감율)</h5>
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
									<h5>현재 충전율(ESS)</h5>
									<span class="unit">(단위 : %)</span>
								</div>
							</div>

<%-- 							<fmt:formatNumber var="" type="number" value="${(TodaySum.charges)-(PredaySum.charges) }" maxIntegerDigits="3"/> --%>
							<c:set var="percent" value="${(TodaySum.charges)-(PredaySum.charges) }"/>
							
							<c:set var="srcurl" value="${percent < 0?'down':'up'}"/>
							<c:set var="color" value="${percent < 0?'blue':'red'}"/>
							<div class="number-box">
								<p class="n-t ${color }"><fmt:formatNumber value="${percent }" pattern=".0"/> %<i class="xi-angle-${srcurl }"></i></p>
								<div class="tt-b">
									<h2>${empty PredaySum.charges?'0.0':PredaySum.charges} %</h2>
									<h5>전일 충전률(ESS)(전일대비)</h5>
								</div>
								<div class="to-b">
									<p class="l-p">당일방전률</p>
									<p class="r-p"><b>${empty TodaySum.discharges?'0.0':TodaySum.discharges}</b> %</p>
								</div>
							</div>
						</div> <!-- col in END -->

						
						<div class="col-in"> <!-- col in -->
							<div class="gate-box">
								<div class="graph-b">
									<div id="jg3" class="gauge size-1"></div>
								</div>
								<div class="txt-b">
									<h2><b>${empty TodaySum.usages?'0':TodaySum.usages}</b> kW</h2>
									<h5>당일 사용량</h5>
									<span class="unit">(단위 : kW)</span>
								</div>
							</div>

							<c:set var="percent" value="${(TodaySum.usages/PredaySum.usages)*100 - 100 }"/>
							<c:set var="srcurl" value="${percent < 0?'down':'up'}"/>
							<c:set var="color" value="${percent < 0?'blue':'red'}"/>
							<div class="number-box">
								<p class="n-t ${color }">
									<%-- <fmt:formatNumber value="${percent }" type="percent"/> --%>
									<fmt:formatNumber type="number" value="${percent }" maxIntegerDigits="1"/> %
									<i class="xi-angle-${srcurl }"></i>
								</p>
								<div class="kwh-t">
									<h2><b>${empty PredaySum.usages?'0':PredaySum.usages}</b> kW</h2>
									<h5>전일 사용량 (증감율)</h5>
								</div>
							</div>
						</div> <!-- col in END -->

					</div> <!-- 첫번째 END! --> 


					<div class="r-2 wide-graph-box"> <!-- 두번째! -->
						<div class="graph-title-box">
							<div class="lb">
								<p class="tit">에너지 발전/사용량 추이 그래프</p>
							</div>
							<div class="rb">
								<ul class="graph-cate">
									<li>
										<span class="squre" style="background-color:#5b5b5b"></span>
										<span class="txt">전일발전량</span>
									</li>
									<li>
										<span class="squre" style="background-color:#bfbdbe"></span>
										<span class="txt">전일발전량</span>
									</li>
									<li>
										<span class="squre" style="background-color:#29ace4"></span>
										<span class="txt">당일발전량</span>
									</li>
									<li>
										<span class="squre" style="background-color:#94ccdb"></span>
										<span class="txt">당일사용량</span>
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
								<p class="tit pdT5">목표대비 (kW/시간)</p>
							</div>
							<div class="rb">
								<ul class="graph-cate">
									<li>
										<span class="squre" style="background-color:#29ace4"></span>
										<span class="txt">당일발전량</span>
									</li>
									<li>
										<span class="squre" style="background-color:#94ccdb"></span>
										<span class="txt">당일사용량</span>
									</li>
								</ul>
								<ul class="graph-day-tab-ul" id="oneGraph">
									<li class="active"><a href="javascript:;" onclick="echart_line('one','day',this)">일</a></li>
									<li><a href="javascript:;" onclick="echart_line('one','week',this)">주</a></li>
									<li><a href="javascript:;" onclick="echart_line('one','month',this)">월</a></li>
									<li><a href="javascript:;" onclick="echart_line('one','year',this)">년</a></li>
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
									<li class="active"><a href="javascript:;">발전량</a></li>
									<!-- <li><a href="javascript:;">CO2절감량</a></li> -->
								</ul>
							</div>

							<div class="rb">								
								<ul class="graph-day-tab-ul blue" id="twoGraph">
									<li class="active"><a href="javascript:;" onclick="echart_line('two','day',this)">일</a></li>
									<li><a href="javascript:;" onclick="echart_line('two','week',this)">주</a></li>
									<li><a href="javascript:;" onclick="echart_line('two','month',this)">월</a></li>
									<li><a href="javascript:;" onclick="echart_line('two','year',this)">년</a></li>
								</ul>
							</div>
						</div>

						<div class="graph-in">
							<div class="info-b blue">
								<div class="one">
									<h5>시간당 평균 발전량</h5>
									<h2><b>${TodaySum.average }</b> kW</h2>
								</div>
								<div class="one">
									<h5>일일 누적 발전량</h5>
									<h2><b>${TodaySum.powers }</b> kW</h2>
								</div>
								<div class="cate-b">
<!-- 									<p> -->
<!-- 										<span class="squre" style="background-color:#bbd7db"></span> 발전량 -->
<!-- 									</p> -->
									 <p>
										<span class="squre" style="background-color:#4b80c2"></span> 당일 사용량
									</p>
								</div>
							</div>

							<div class="graph-b">
								<p class="tit1">목표대비(kW/h)</p>
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
									<li class="active"><a href="javascript:;">충전량</a></li>
									<!-- <li><a href="javascript:;">방전량</a></li> -->
								</ul>
							</div>

							<div class="rb">								
								<ul class="graph-day-tab-ul green" id="threeGraph">
									<li class="active"><a href="javascript:;" onclick="echart_line('three','day',this)">일</a></li>
									<li><a href="javascript:;" onclick="echart_line('three','week',this)">주</a></li>
									<li><a href="javascript:;" onclick="echart_line('three','month',this)">월</a></li>
									<li><a href="javascript:;" onclick="echart_line('three','year',this)">년</a></li>
								</ul>
							</div>
						</div>

						<div class="graph-in">
							<div class="info-b green">
								<div class="one">
									<h5>시간당 평균 충전량</h5>
									<h2><b>${TodaySum.charges }</b>%</h2>
								</div>
								<!-- <div class="one">
									<h5>일일 누적 량</h5>
									<h2><b>1,370.00</b>Wh</h2>
								</div> -->
								<div class="cate-b">
									<!-- <p>
										<span class="squre" style="background-color:#e3e9c7"></span> 충전량
									</p> -->
									<p>
										<span class="squre" style="background-color:#7fb439"></span> 충전량
									</p>
								</div>
							</div>

							<div class="graph-b">
								<p class="tit1">ESS충전량(%)</p>
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
									<li class="active"><a href="javascript:;" onclick="echart_line('four','day',this)">일</a></li>
									<li><a href="javascript:;" onclick="echart_line('four','week',this)">주</a></li>
									<li><a href="javascript:;" onclick="echart_line('four','month',this)">월</a></li>
									<li><a href="javascript:;" onclick="echart_line('four','year',this)">년</a></li>
								</ul>
							</div>
						</div>

						<div class="graph-in">
							<div class="info-b orange">
								<div class="one">
									<h5>시간당 평균 사용량</h5>
									<h2><b>${TodaySum.usaverage }</b> kW</h2>
								</div>
								<div class="one">
									<h5>일일 누적 사용량</h5>
									<h2><b>${TodaySum.usages }</b> kW</h2>
								</div>
								<div class="cate-b">
									<!-- <p>
										<span class="squre" style="background-color:#fbd4b5"></span> 당일 발전량
									</p> -->
									<p>
										<span class="squre" style="background-color:#f9a51a"></span> 당일 사용량
									</p>
								</div>
							</div>

							<div class="graph-b">
								<p class="tit1">에너지 사용량(kW/시간)</p>
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
	
	<c:forEach items="${MonSum}" var="sum">
		<script>
			ToPowers.push('${sum.powers}')
			ToUsages.push('${sum.usages}')
			PrePowers.push('${sum.prepowers}')
			PreUsages.push('${sum.preusages}')
			Charges.push('${sum.charges}')
		</script>
	</c:forEach>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
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
	        data:['전일발전량','전일사용량','당일발전량','당일사용량']
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
	            name:'전일발전량',
	            type:'bar',
	            stack: '1',
	            barWidth : 5,
	            data: PrePowers,
				itemStyle: { normal: { color: '#5b5b5b' } },
	        },
	        {
	            name:'전일사용량',
	            type:'bar',
	            stack: '1',
	            barWidth : 5,
	            data:PreUsages,
				itemStyle: { normal: { color: '#bfbdbe' } },
	        },
	        {
	            name:'당일발전량',
	            type:'bar',
	            stack: '2',
	            barWidth : 5,
	            data:ToPowers,
				itemStyle: { normal: { color: '#29ace4' } },
	        },
	        {
	            name:'당일사용량',
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