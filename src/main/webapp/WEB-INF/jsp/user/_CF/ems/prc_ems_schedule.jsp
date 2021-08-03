<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

	<!-- 안에 컨텐츠 시작 -->
	<section id="in-contents">
		
		<!-- 탑 컨텐츠 -->
		<!-- <div class="top-row">

			<div class="rb">
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
			</div>
		</div> -->
		<!-- 탑 컨텐츠 끝 -->




		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">
			
			<!-- 스케쥴링 -->
			<div class="pv-content1">

				<div class="row flex_row"> <!-- row -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">스케줄 설정</p>
                                </div>
							</div>

							<div class="graph-in-c">

								<table class="tbl_hori1 pdSche">
									<caption>스케줄 설정</caption>
									<colgroup>
										<col width="35%">
										<col width="65%">
									</colgroup>
									<tbody>
										<tr>
											<th>BMS 최대저장용량</th>
											<td><span class="fore">10 kW</span></td>
										</tr>
										<tr>
											<th>BMS 현재저장용량</th>
											<td><span class="fore">5.3 kW</span></td>
										</tr>
										<tr>
											<th>계통 가동 기준</th>
											<td class="txt_left">
                                                <input type="text" class="txt_Sche w100px"> 
                                                ~ 
                                                <input type="text" class="txt_Sche w100px">
                                            </td>
										</tr>
										<tr>
											<th>최적화 스케쥴링 사용여부</th>
											<td class="txt_left">
                                                <select class="sel_Sche tx-select w30">
                                                    <option value="">사용</option>
                                                    <option value="">중지</option>
                                                </select>
                                            </td>
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
									<p class="tit">날씨정보 (광주광역시 북구 월출동)</p>
								</div>
							</div>

                            <div class="graph-in-c">
                                <div class="inner_weather_box">
                                    <div class="ro-b">
                                        <div class="lb">
                                            <h3>시간대별 날씨</h3>
                                        </div>
                                        <div class="rb" id="rb_box">
                                        </div>
                                    </div>
                                    <div class="ro-b">
                                        <div class="lb">
                                            <h3>주간날씨</h3>
                                        </div>
                                        <div class="rb">
                                            <div class="inner_weather_sub2_w">
                                                <c:forEach items="${resultDate }" var="date" varStatus="varStatus">
                                                	<c:choose>
                                                		<c:when test="${date.SKYAM eq '구름많음'}"><c:set var="srcAm" value="/resources/img/icon/icon_weather_cloud.jpg"/></c:when>
                                                		<c:when test="${date.SKYAM eq '흐림'}"><c:set var="srcAm" value="/resources/img/icon/icon_weather_cloud2.jpg"/></c:when>
                                                		<c:when test="${date.SKYAM eq '비'  or date.SKYAM eq '비/눈' or date.SKYAM eq '소나기' or date.SKYAM eq '빗방울'or date.SKYAM eq '빗방울/눈날림'}"><c:set var="srcAm" value="/resources/img/icon/icon_weather_rainy.jpg"/></c:when>
                                                		<c:when test="${date.SKYAM eq '눈' or date.SKYAM eq '눈날림' }"><c:set var="srcAm" value="/resources/img/icon/icon_weather_rainy.jpg"/></c:when>
                                                		<c:otherwise>
                                                			<c:set var="srcAm" value="/resources/img/icon/icon_weather_sun.jpg"/>
                                                		</c:otherwise>
                                                	</c:choose>
                                                	
                                                	<c:choose>
                                                		<c:when test="${date.SKYPM eq '구름많음'}"><c:set var="srcPm" value="/resources/img/icon/icon_weather_cloud.jpg"/></c:when>
                                                		<c:when test="${date.SKYPM eq '흐림'}"><c:set var="srcPm" value="/resources/img/icon/icon_weather_cloud2.jpg"/></c:when>
                                                		<c:when test="${date.SKYPM eq '비'  or date.SKYPM eq '비/눈' or date.SKYPM eq '소나기' or date.SKYPM eq '빗방울'or date.SKYPM eq '빗방울/눈날림'}"><c:set var="srcPm" value="/resources/img/icon/icon_weather_rainy.jpg"/></c:when>
                                                		<c:when test="${date.SKYPM eq '눈' or date.SKYPM eq '눈날림' }"><c:set var="srcPm" value="/resources/img/icon/icon_weather_rainy.jpg"/></c:when>
                                                		<c:otherwise>
                                                			<c:set var="srcPm" value="/resources/img/icon/icon_weather_sun.jpg"/>
                                                		</c:otherwise>
                                                	</c:choose>
                                                	
                                                	
                                                	
                                                	<div class="co-b">
	                                                    <div class="date">
	                                                        <span class="day">${fn:substring(date.NOWDATE,4,6) } /${fn:substring(date.NOWDATE,6,8) }</span>
	                                                        <span class="${varStatus.index eq '0' ? 'num on':'num'}">${varStatus.index eq '0' ? '오늘':''} </span>
	                                                    </div>
	                                                    <ul class="wea_ul">
	                                                        <li>
	                                                            <span class="icon">
	                                                            	<img src='${srcAm }' alt="날씨">
	                                                            </span>
	                                                            <span class="txt">${date.RAINRATEAM }%</span>
	                                                        </li>
	                                                        <li>
	                                                            <span class="icon"><img src='${srcPm }' alt="날씨"></span>
	                                                            <span class="txt">${date.RAINRATEPM }%</span>
	                                                        </li>
	                                                    </ul>
	                                                    <div class="degree">${date.TEMPERATUREMIN }º / ${date.TEMPERATUREMAX }º</div>
	                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->
					
				</div> <!-- row END -->




                <div class="row"> <!-- row -->

					<div class="col-100"> <!-- col -->				
						<div class="one-b bgW"> <!-- one -->
							
							<div class="graph-title-box">
                                <div class="date-s-t-box inside">
                                    <label id="s-date">시작일</label>
                                    <input type="text" id="datepicker1" class="date-pic hasDatepicker" placeholder="2019-08-10">
                                    <label id="e-date">종료일</label>
                                    <input type="text" id="datepicker2" class="date-pic hasDatepicker" placeholder="2019-08-10">
                                </div>
							</div>


							<div class="graph-in-c">
                                <!-- 스케쥴 설정 -->
                                <div class="tbl_schedul_box">
                                    <table class="tbl_schedul">
                                        <caption>스케쥴 설정</caption>
                                        <thead>
                                            <tr>
                                                <th class="tit">요일</th>
                                                <th>0</th>
                                                <th>1</th>
                                                <th>2</th>
                                                <th>3</th>
                                                <th>4</th>
                                                <th>5</th>
                                                <th>6</th>
                                                <th>7</th>
                                                <th>8</th>
                                                <th>9</th>
                                                <th>10</th>
                                                <th>11</th>
                                                <th>12</th>
                                                <th>13</th>
                                                <th>14</th>
                                                <th>15</th>
                                                <th>16</th>
                                                <th>17</th>
                                                <th>18</th>
                                                <th>19</th>
                                                <th>20</th>
                                                <th>21</th>
                                                <th>22</th>
                                                <th>23</th>
                                            </tr>
                                        </thead>
                                        <tbody class="ui-selectable">
                                            <tr class="ui-selectee">
                                                <td class="tit td ui-selectee">월요일</td>
                                                <!-- <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td>
                                                <td>
                                                    <p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p>
                                                </td> -->
                                            <td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td></tr>
                                            <tr class="ui-selectee">
                                                <td class="tit td ui-selectee">화요일</td>
                                                
                                            <td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td></tr>
                                            <tr class="ui-selectee">
                                                <td class="tit td ui-selectee">수요일</td>
                                                
                                            <td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td></tr>
                                            <tr class="ui-selectee">
                                                <td class="tit td ui-selectee">목요일</td>
                                                
                                            <td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td></tr>
                                            <tr class="ui-selectee">
                                                <td class="tit td ui-selectee">금요일</td>
                                                
                                            <td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td></tr>
                                            <tr class="ui-selectee">
                                                <td class="tit td ui-selectee">토요일</td>
                                                
                                            <td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td><td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td></tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="schel_btn_box">
                                    <button class="btn_sch select" onclick="btn_sch_sele();" title="모두선택하기">모두선택</button>
                                    <button class="btn_sch save" title="저장하기">저장</button>
                                </div>

                                <script>
                                    $(function(){
                                        $('.tbl_schedul tbody').selectable({
                                            cancle:"tbody, tr, th, td.tit",
                                            fileter : "span.blank",
                                            stop : function(){
                                                console.log($('.ui-selected').text());
                                            }
                                        });

                                        // 모두선택
                                        $('.btn_sch.select').on('click',function(){
                                            $('.tbl_schedul span.blank').addClass('ui-selected');
                                        })

                                        //테이블 html 넣기
                                        for (var i = 1; i <= 24; i++) {
                                            $('.tbl_schedul tbody tr').append('<td><p class="wr"><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span><span class="blank"></span></p></td>');
                                        }
                                    })
                                </script>

							</div>

						</div> <!-- oneEND -->						
					</div> <!-- col END -->
					
				</div> <!-- row END -->

			</div>

		</div>
		<!-- 밑에 주요 컨텐츠 끝 -->


	</section>
	<!-- 안에 컨텐츠 끝 -->
	<script type="text/javascript">
	$("#gnb li:nth-child(5)").addClass('active');
	
$.ajax({
    type: "GET",
    url: "/forest_ajax.do",
    async: false,
    success: function(data) {
    	console.log(data);  
	var html = ""
   	var size = data.length/4;
    html = '<div class="inner_weather_sub1_w">';
    for(var i=0;i<size;i++){
    	html += '<div class="co-b">'
    		 + '<p class="num">'+data[i+(size*2)]+'º</p>'
    		 +   '<div class="icon_b">';
    	 if(data[i+(size*3)] == '0'){
        	 if(data[i+size] == '3'){
        		html +=		 '<img src="/resources/img/icon/icon_weather_cloud.jpg" alt="날씨">'	 ;
        	 }else if(data[i+size]== '4'){
        		 html +=		 '<img src="/resources/img/icon/icon_weather_cloud2.jpg" alt="날씨">';
        	 }else{
        		 var cu = parseInt(data[i].substring(0,2))
        		 if(cu > 19 || cu < 06){
        			 html +='<img src="resources/img/icon/icon_weather_night.jpg" alt="밤 아이콘">'
        		 }else{
	        		 html +='<img src="/resources/img/icon/icon_weather_sun.jpg" alt="맑음 아이콘">';
        		 }
        	 }
         }else{
        	 html +='<img src="/resources/img/icon/icon_weather_rainy.jpg" alt="날씨">';
         } 
    	 html +=  '</div>'
	          +   '<div class="txt';
    	 	if(i == 0){
    	 		html     += ' on';
    	 	}
    	 	html    += '">'+data[i].substring(0,2)+'시</div>'
	                + '</div>';
    }
 $("#rb_box").append(html);  
}
});  


</script>