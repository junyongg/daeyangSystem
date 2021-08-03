<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<section id="in-contents">
<input type="hidden" id="inverter" name="inverter" value="${inverter }">
		<div class="top-row">
			<div class="lb">
				<select class="tx-select">
					<option value="">PV발전현황</option>
<!-- 					<option value="device_ess.html">ESS현황</option> -->
				</select>
				<select class="tx-select">
					<option>1호기</option>
<!-- 					<option>2호기</option> -->
				</select>
			</div>

			<!-- <div class="rb">
				<ul class="m-t-info-ul">
					<li>
						<div class="icon">
							<img src="resources/img/icon/icon_main_top01.png" alt="소나무 아이콘">
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
							<img src="resources/img/icon/icon_main_top02.png" alt="CO2 아이콘">
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
							<img src="resources/img/icon/icon_main_top03.png" alt="날씨 아이콘">
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
		
		
		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">
			
			<!-- PV발전현황 -->
			<div class="pv-content1">

				<div class="row"> <!-- row -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">발전운행상태</p>
								</div>
							</div>

							<div class="graph-in-c">

								<table class="tbl_hori1">
									<caption>발전운행상태</caption>
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tbody>
										<tr>
											<th>PV발전상태</th>
											<td><span class="blue-c lg bold">${empty OneData.maxPower || OneData.maxPower eq '0'?'미운전':'운전' }</span></td>
											<th>시스템 동작상태</th>
											<td><span class="blue-c lg bold">${empty OneData.IO_STATUS || OneData.IO_STATUS eq 'off'?'Waiting Time':'Running Time' }</span></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">실시간 운행 및 상태정보</p>
								</div>
							</div>

							<div class="graph-in-c">

								<ul class="s2-info-ul">
									<li>
										<span class="txt">운전</span>
										<span class="icon"><img src="${empty OneData.IO_STATUS || OneData.IO_STATUS eq 'off'?'/resources/img/icon/icon_m_pv_gray.png':'/resources/img/icon/icon_m_pv_blue.png' }" alt="아이콘"></span>
									</li>
									<li>
										<span class="txt">S/W오류</span>
										<span class="icon"><img src="${empty OneData.IO_POWER?'/resources/img/icon/icon_m_condi_gray.png':'/resources/img/icon/icon_m_condi_gray.png' }" alt="아이콘"></span>
									</li>
									<li>
										<span class="txt">H/W오류</span>
										<span class="icon"><img src="${empty OneData.IO_POWER?'/resources/img/icon/icon_m_condi_gray.png':'/resources/img/icon/icon_m_condi_gray.png' }" alt="아이콘"></span>
									</li>
								</ul>

							</div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->
					
				</div> <!-- row END -->


				<div class="row"> <!-- row -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">pv 발전현황</p>
								</div>
							</div>

							<div class="graph-in-c">

								<table class="tbl_hori1">
									<caption>pv발전현황</caption>
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tbody>
										<tr>
											<th>설치용량</th>
											<td>10.0 kW/h</td>
											<th>실시간 발전전력</th>
											<td>${OneData.IO_POWER/1000 } kW</td>
										</tr>
										<tr>
											<th>실시간 발전효율</th>
											<td>
												<fmt:formatNumber value="${(OneData.IO_POWER/19.8) }" type="percent"/>
											</td>
											<th>금일 발전량</th>
											<td>${ToSum.powers } kW</td>
										</tr>
										<tr>
											<th>금일 CO2 절감량</th>
											<td>${ToSum.co2es } kCO2</td>
											<th>금월 발전량</th>
											<td>${MonAll.powers } kW</td>
										</tr>
										<tr>
											<th>누적 발전량</th>
											<td>${All.powers } kW</td>
											<th>금월 CO2 절감량</th>
											<td>${MonAll_Other.co2es } kCO2</td>
										</tr>
										<!-- <tr>
											<th>변환효율</th>
											<td colspan="3">0 %</td>
										</tr> -->
									</tbody>
								</table>

							</div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">LVCD</p>
								</div>
							</div>

							<div class="graph-in-c">

								<table class="tbl_hori1">
									<caption>pv발전설비 상세정보</caption>
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tbody>
										<tr>
											<th>실시간 전압</th>
											<td>${LVDC.Total_V } V</td>
										</tr>
										<tr>
											<th>실시간 전류</th>
											<td>${LVDC.Total_A } A</td>
										</tr>
										<tr>
											<th>실시간 전력</th>
											<td>${LVDC.Total_Wh } W</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->
					
				</div> <!-- row END -->



				<div class="row"> <!-- row -->

					<div class="col-100"> <!-- col -->				
						<div class="one-b bgW"> <!-- one -->
							
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit pdT5">발전현황 그래프</p>
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
										<!-- <li>
											<span class="squre" style="background-color:#fec00f"></span>
											<span class="txt">절감수익</span>
										</li> -->
									</ul>
									<ul class="graph-day-tab-ul" id="linePv">
										<li class="active"><a href="javascript:;" onclick="line_pv('day',this)">일</a></li>
										<li><a href="javascript:;" onclick="line_pv('week',this)">주</a></li>
										<li><a href="javascript:;" onclick="line_pv('month',this)">월</a></li>
										<li><a href="javascript:;" onclick="line_pv('year',this)">년</a></li>
									</ul>
								</div>
							</div>


							<div class="graph-in-c">
								
								<div class="s2-wGraphicB">
									<div id="echart_line_pv" style="width:100%; height:100%;"></div>
								</div>

							</div>

						</div> <!-- oneEND -->						
					</div> <!-- col END -->
					
				</div> <!-- row END -->




				<div class="row"> <!-- row -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">운행로그</p>
								</div>
							</div>

							<div class="graph-in-c">
								<table class="tbl_verti1">
									<caption>운행로그</caption>
									<colgroup>
										<col width="30%">
										<col width="70%">
									</colgroup>
									<thead>
										<tr>
											<th>발생 시각량</th>
											<th>내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pcsSolar }" var="pcs">
											<tr>
												<td>${pcs.PSD_DATE }</td>
												<td class="textC">PCS_VALUE : ${pcs.PSD_VALUE}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">실시간 운행 및 상태정보</p>
								</div>
							</div>

							<div class="graph-in-c">
								<table class="tbl_verti1">
									<caption>운행로그</caption>
									<colgroup>
										<col width="30%">
										<col width="70%">
									</colgroup>
									<thead>
										<tr>
											<th>발생 시각량</th>
											<th>내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${emsData }" var="ems">
											<tr>
												<td>${ems.time }</td>
												<td class="textC">${ems.onoff eq '0' ? 'SYSTEM - OFF':'SYSTEM - ON' } &nbsp;&nbsp; | &nbsp; RaCk Voltage : ${ems.SystemV },&nbsp; Rack Current : ${ems.SystemC } ,&nbsp; SOC : ${ems.SOC },&nbsp; SOH : ${ems.SOH }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->
					
				</div> <!-- row END -->


			</div>

		</div>
		<!-- 밑에 주요 컨텐츠 끝 -->


	</section>
	
	<script type="text/javascript">
		var ToPowers = []
		var ToUsages = []
	</script>
	
	<c:forEach items="${MonSum}" var="sum">
		<script>
			ToPowers.push('${sum.powers}')
			ToUsages.push('${sum.usages}')
		</script>
	</c:forEach>
	
	<script>
		$("#gnb li:nth-child(2)").addClass('active');
		
		function line_pv(type,obj){
			$("#linePv li").removeClass();
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
					$.each(data,function(i){
						powers.push(data[i].powers);
						usages.push(data[i].usages);
					
						echart_line_pv(powers,usages);
					});
				},error:function(){
					alert("에러");
				}
			});
		}
		
	</script>