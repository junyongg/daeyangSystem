<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<style>
.artBoard{margin-top:2.5%;}

</style>

<form:form action="/dy/mobile.do" method="POST" id="Form">

<input type="hidden" id="DaliyType" name="DaliyType" value="${not empty DaliyType? DaliyType:'1' }">
<input type="hidden" id="InverterType" name="InverterType" value="${not empty InverterType? InverterType:'0' }">
<input type="hidden" id="keyno" name="keyno" value="${ob.DDM_DPP_KEYNO }">

    
    <!-- COMTAINER -->
    <div id="container">
        <section class="one_row left2">
	        <article class="artBoard mobile">
	            <h2 class="circle">설치현장선택</h2>
	
	            <p class="power_tit">[${ob.DPP_AREA }] ${ob.DPP_NAME }</p>
	
	            <div class="power_select">
	                <select class="select_nor sm3 w100" id="DPP_KEYNO" name="DPP_KEYNO" value="${DPP_KEYNO }" onchange="DPPDataAjax(this.value);">
	                    <c:forEach items="${list }" var="list">
	                    	<option value="${list.DPP_KEYNO }" ${list.DPP_KEYNO eq DPP_KEYNO ? 'selected' : '' } >${list.DPP_NAME }</option>
	                    </c:forEach>
	                </select>
	            </div>
				
				<div class="power_select">
	                <select class="select_nor sm3 w100" id="InverterNum" name="InverterNum" value="${InverterNum }" onchange="ajaxData();" >
	                    <c:forEach varStatus="status" begin="1" end="${ob.DPP_INVER_COUNT }">
	                    	<option value="인버터 ${status.count }호">인버터 ${status.count }호</option>
	                    </c:forEach>
	                </select>
	            </div>
				
	            <h2 class="location">발전소 현장정보</h2>
	
	            <div class="power_preview">
	                <!-- <div class="imgs" id="map" style="height: 200px"></div> -->
	            </div>
	
	            <p class="power_addr">${fn:substringAfter(ob.DPP_LOCATION,'//')}</p>
	
	            <ul class="power_info">
	                <li>
	                    <p class="lb battery">발전소 설비용량</p>
	                    <p class="rb"><span class="num">${ob.DPP_VOLUM }</span>kW</p>
	                </li>
	                
	                <c:choose>
	          			<c:when test="${ob.DDM_STATUS eq '정상' }">
	          				<c:set var="statusT" value="green"/>
	          			</c:when>
	          			<c:when test="${ob.DDM_STATUS eq '장애' }">
	          				<c:set var="statusT" value="red"/>
	          			</c:when>
	          			<c:otherwise>
	          				<c:set var="statusT" value="black"/>
	          			</c:otherwise>
	          		</c:choose>
	                
	                <li>
	                    <p class="lb invert">인버터상태</p>
	                    <p class="rb"><span class="check_c ${statusT }"></span>${empty ob.DDM_STATUS? '기타':ob.DDM_STATUS  }</p>
	                </li>
	                <li>
	                    <p class="lb time">최종수신 날짜 / 시간</p>
	                    <p class="rb w100">
	                        <span class="gb_txt">${empty ob.DDM_DATE? '현재 통신 없음': ob.DDM_DATE }</span>
	                    </p>
	                </li>
	            </ul>
	            
	            <!-- <div class="power_btns">
	                 <button type="button" class="btn_calcu" onclick="$('.base_pop_wrapper').addClass('on')">수익계산</button>
	            </div> -->
	            
	        </article> 
		</section>

		<!-- 수익계산 팝업 - 클래스 on 추가시 나타남 -->
        <%-- <section class="base_pop_wrapper">
            <div class="pop_base_calculation">
                <button type="button" class="btn_close" title="닫기"  onclick="$('.base_pop_wrapper').removeClass('on')"><i class="xi-close"></i></button>

                <div class="warning_box">
                    SMP 또는 REC 중 한가지만 입력하고 계산이 가능합니다.<br>
                    SMP,  REC 둘다 입력하고 계산하면 예상수익을 볼 수 있습니다.
                </div>

                <div class="form_box">
                    <dl class="bo">
                        <dt>
                            <b>SMP</b>
                            <label for="smp1">SMP 단가</label>
                        </dt>
                        <dd>
                            <p class="money_inp">
                                <input type="text" class="in_txt2" id="smp1">
                                <span>원</span>
                            </p>
                        </dd>
                    </dl>
                    <dl class="bo">
                        <dt>
                            <b>REC</b>
                            <label for="rec1">REC 단가</label>
                        </dt>
                        <dd>
                            <p class="money_inp">
                                <input type="text" class="in_txt2" id="rec1">
                                <span>원</span>
                            </p>
                        </dd>
                    </dl>
                    <dl>
                        <dt><label for="set">설치유형</label></dt>
                        <dd>
                            <select id="set" class="select_in02" onchange="plusValue(this.value)">
                                <option value="a">일반부지</option>
                                <option value="b">축사</option>
                            </select>
                        </dd>
                    </dl>
                    <dl>
                        <dt>가중치</dt>
                        <dd id="plus">${(ob.DPP_INVER_COUNT + 0.2)/ob.DPP_INVER_COUNT}</dd>
                    </dl>
                </div>

                <div class="btn_mid">
                    <button type="button" class="btn_round_1 blue" onclick="calculation();">계산</button>
                    <button type="button" class="btn_round_1 line" onclick="clean();">초기화</button>
                </div>

                <!-- 계산 버튼 누를시 나타남 - 클래스 on 추가시 나타남 -->
                <div class="calculation_result">
                    <ul class="list">
                        <li>
                            <span class="state black">전일</span>
                            <ul class="mid">
                                <li>
                                    <span class="tit">발전량</span>
                                    <span class="number" ><b><fmt:formatNumber value="${ob.DDM_P_DATA}" pattern="0.00"/></b>kWh</span>
                                </li>
                            </ul>
                            <div class="result">
                                <span class="blue">예상수익</span>
                                <div class="re" id="pre_benefit">0원</div>
                            </div>
                        </li>
						<li>
                            <span class="state red">전월</span>
                            <ul class="mid">
                                <li>
                                    <span class="tit">발전량</span>
                                    <span class="number"><b><fmt:formatNumber value="${Prmonth}" pattern="0.00"/></b>kWh</span>
                                </li>
                            </ul>
                            <div class="result">
                                <span class="blue">예상수익</span>
                                <div class="re" id="Pm_benefit">0원</div>
                            </div>
                        </li>
                        <li>
                            <span class="state green">금일</span>
                            <ul class="mid">
                                <li>
                                    <span class="tit">발전량</span>
                                    <span class="number"><b><fmt:formatNumber value="${ob.DDM_D_DATA}" pattern="0.00"/></b>kWh</span>
                                </li>
                            </ul>
                            <div class="result">
                                <span class="blue">예상수익</span>
                                <div class="re" id="benefit">0원</div>
                            </div>
                        </li>
                        <li>
                            <span class="state orange">금년</span>
                            <ul class="mid">
                                <li>
                                    <span class="tit">발전량</span>
                                    <span class="number"><b><fmt:formatNumber value="${year1}" pattern="0.00"/></b>kWh</span>
                                </li>
                            </ul>
                            <div class="result">
                                <span class="blue">예상수익</span>
                                <div class="re" id="y_benefit">0원</div>
                            </div>
                        </li>
                        <li>
                            <span class="state gray">누적</span>
                            <ul class="mid">
                                <li>
                                    <span class="tit">발전량</span>
                                    <span class="number"><b><fmt:formatNumber value="${ob.DDM_CUL_DATA }" pattern="0.00"/></b>kWh</span>
                                </li>
                            </ul>
                            <div class="result">
                                <span class="blue">예상수익</span>
                                <div class="re" id="n_benefit">0원</div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section> --%>
        <!-- // 수익계산 팝업 -->


		<section class="one_row right3">

            <div class="col n01">
				
                <article class="artBoard top">
                    <h2 class="circle mgSm">기상정보</h2>

                    <div class="weather_infomation">
						<c:if test="${fn:length(weather) > 0 }">
  						<c:choose>
  							<c:when test="${weatherToday.DWD_PTV eq '맑음'}">
  								<c:choose>
					        		<c:when test="${weatherToday.DWD_SKY eq '흐림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_5.png"/></c:when>
					        		<c:when test="${weatherToday.DWD_SKY eq '구름많음'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_4.png"/></c:when>
					        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
				        		</c:choose>
  							</c:when>
  							<c:otherwise>
  								<c:choose>
					        		<c:when test="${weatherToday.DWD_PTV eq '빗방울/눈날림' || weatherToday.DWD_PTV eq '비/눈'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_2.png"/></c:when>
					        		<c:when test="${weatherToday.DWD_PTV eq '비' || weatherToday.DWD_PTV eq '소나기' || weatherToday.DWD_PTV eq '빗방울'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_6.png"/></c:when>
					        		<c:when test="${weatherToday.DWD_PTV eq '눈' || weatherToday.DWD_PTV eq '눈날림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_7.png"/></c:when>
					        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
					        	</c:choose>
  							</c:otherwise>
  						</c:choose>
  						     	
                        <div class="icons"><img src="${weatherIMG }" alt=""></div>
                        <div class="dgree">
                            <p class="number"><b>${weatherToday.DWD_T1H }</b>℃</p>
                            <span class="rain">${weatherToday.DWD_RN1 }</span>
                            <span class="rain_per">${weatherToday.DWD_REH }%</span>
                        </div>
                        <div class="infos">
                            <ul>
                                <li class="sunrise">${fn:substring(weatherToday.DWD_SUNRISE,0,2)}:${fn:substring(weatherToday.DWD_SUNRISE,2,4) }</li>
                                <li class="sunset">${fn:substring(weatherToday.DWD_SUNSET,0,2)}:${fn:substring(weatherToday.DWD_SUNSET,2,4) }</li>
                                <li class="wind">${weatherToday.DWD_WSD }m/s</li>
                            </ul>
                        </div>
                        </c:if>
                    </div>

                    <div class="weather_information2">
                        <c:if test="${fn:length(weather) > 0 }">
                        <div class="lb">
<%--                             <p class="now">${fn:substring(weatherToday.DWD_DATE,0,2) }시 현재</p> --%>
                           <c:choose>
								<c:when test="${weatherToday.DWD_PTV eq '맑음'}">
									<c:choose>
						        		<c:when test="${weatherToday.DWD_SKY eq '흐림'}"><c:set var="wea_status" value="${weatherToday.DWD_SKY}"/></c:when>
						        		<c:when test="${weatherToday.DWD_SKY eq '구름많음'}"><c:set var="wea_status" value="${weatherToday.DWD_SKY}"/></c:when>
						        		<c:otherwise><c:set var="wea_status" value="맑음"/></c:otherwise>
					        		</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose>
						        		<c:when test="${weatherToday.DWD_PTV eq '빗방울/눈날림' || weatherToday.DWD_PTV eq '비/눈'}"><c:set var="wea_status" value="${weatherToday.DWD_PTV }"/></c:when>
						        		<c:when test="${weatherToday.DWD_PTV eq '비' || weatherToday.DWD_PTV eq '소나기' || weatherToday.DWD_PTV eq '빗방울'}"><c:set var="wea_status" value="${weatherToday.DWD_PTV }"/></c:when>
						        		<c:when test="${weatherToday.DWD_PTV eq '눈' || weatherToday.DWD_PTV eq '눈날림'}"><c:set var="wea_status" value="눈"/></c:when>
						        		<c:otherwise><c:set var="wea_status" value="맑음"/></c:otherwise>
						        	</c:choose>
								</c:otherwise>
							</c:choose>
                            
                            <p class="cate">${wea_status}</p>
                        </div>
                        <ul class="list">
                            <c:forEach begin="1" end="${fn:length(weather)-1 }" var="i">
								
								<c:choose>
									<c:when test="${weather[i].DWD_PTV eq '맑음'}">
										<c:choose>
							        		<c:when test="${weather[i].DWD_SKY eq '흐림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_5.png"/></c:when>
							        		<c:when test="${weather[i].DWD_SKY eq '구름많음'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_4.png"/></c:when>
							        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
						        		</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
							        		<c:when test="${weather[i].DWD_PTV eq '빗방울/눈날림' || weather[i].DWD_PTV eq '비/눈'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_2.png"/></c:when>
							        		<c:when test="${weather[i].DWD_PTV eq '비' || weather[i].DWD_PTV eq '소나기' || weather[i].DWD_PTV eq '빗방울'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_6.png"/></c:when>
							        		<c:when test="${weather[i].DWD_PTV eq '눈' || weather[i].DWD_PTV eq '눈날림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_7.png"/></c:when>
							        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
							        	</c:choose>
									</c:otherwise>
								</c:choose>
		  						
								<li>
	                                <p class="time">${fn:substring(weather[i].DWD_DATE,0,2) }시</p>
	                                <div class="icon"><img src="${weatherIMG }" alt=""></div>
	                                <p class="degree">${weather[i].DWD_T1H}℃</p>
	                            </li>                            
                            </c:forEach>
                        </ul>
                        </c:if>
                    </div>
                    
                    
                    
					<h2 class="circle">현장정보</h2>

		            <div class="table_wrapper n2">
		                <table class="tbl_normal sm">
		                    <colgroup>
		                        <col style="width: 30%;">
		                        <col style="width: 70%;">
		                    </colgroup>
		                    <tbody>
		                        <tr>
				                    <th class="txtL">현장명</th>
				                    <td class="txtR">${ob.DPP_NAME }</td>
				                </tr>
				                <tr>
				                    <th class="txtL">인버터</th>
				                    <td class="txtR">${ob.DPP_INVER_COUNT }대</td>
				                </tr>
				                <tr>
				                    <th class="txtL">인버터장비</th>
				                    <td class="txtR">${ob.DPP_INVER }</td>
				                </tr>
				                <tr>
				                    <th class="txtL">총용량</th>
				                    <td class="txtR">${ob.DPP_VOLUM }kW</td>
				                </tr>
		                    </tbody>
		                </table>
		            </div>
                    
                </article>  
				
                <article class="artBoard bott">
                     <h2 class="circle mgSm"><p id="inverterName" style="float:right;">[인버터 1호]</p>금일 발전량 | ${ob.DPP_NAME } </h2>
                    
                     <div class="graph_b_gaue">
                         <div id="gauge_1" style="display: inline-block; width: 300px; height: 300px;"></div>
                         <div class="guage_txt" style="padding-bottom: 0px;">
                             <span>총 금일 발전량(%)</span>
                             <p><b id="AllPower" style="font-size: 1.1em;">0.0KW / 0h</b></p>
                             <p style="text-align:center; color: gray;font-size: 5px;">* 발전량은 8시간 기준 <br> 100% 입니다.</p>
                         </div>
                     </div>
                     
                     <h2 class="circle mgSm">현재 발전량</h2>
                     
                     <div class="graph_b_gaue">
                         <div id="gauge_2" style="display: inline-block; width: 300px; height: 300px;"></div>
                         <div class="guage_txt">
                             <span>발전 전력</span>
                             <p><b id="Active">0.0</b></p>
                         </div>
                     </div>
                 </article>  
            </div>

            <div class="col n03">
                <article class="artBoard long">
                    <h2 class="circle">인버터 종합 발전실적 | ${ob.DPP_NAME } </h2>
                    
                    <div class="inverter_all_develope">
                        <ul class="list">
                            <li>
                                <span class="state black">전일</span>
                                <ul class="info">
                                    <li>
                                        <span class="sbj">발전시간</span>
                                        <span class="num"><b><fmt:formatNumber value="${ob.DDM_P_DATA/ob.DPP_VOLUM }" pattern="0.00"/></b>h</span>
                                    </li>
                                    <li>
                                        <span class="sbj">발전량</span>
                                        <span class="num"><b><fmt:formatNumber value="${ob.DDM_P_DATA}" pattern="0.00"/></b>kWh</span>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span class="state red">금일</span>
                                <ul class="info">
                                    <li>
                                        <span class="sbj">발전시간</span>
                                        <span class="num"><b><fmt:formatNumber value="${ob.DDM_D_DATA/ob.DPP_VOLUM }" pattern="0.00"/></b>h</span>
                                    </li>
                                    <li>
                                        <span class="sbj">발전량</span>
                                        <span class="num"><b><fmt:formatNumber value="${ob.DDM_D_DATA }" pattern="0.00"/></b>kWh</span>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span class="state green">금월</span>
                                <ul class="info">
                                    <li>
                                        <span class="sbj">발전시간(평균)</span>
                                        <span class="num"><b>
                                        	<c:if test="${month1Cnt ne '0'}">
                                        		<fmt:formatNumber value="${(month1/ob.DPP_VOLUM)/month1Cnt }" pattern="0.00"/>
                                        	</c:if>
                                        	<c:if test="${month1Cnt eq '0'}">
                                        		<fmt:formatNumber value="${ob.DDM_D_DATA/ob.DPP_VOLUM }" pattern="0.00"/>
                                        	</c:if>
                                        	</b>h
                                        </span>
                                    </li>
                                    <li>
                                        <span class="sbj">발전량</span>
                                        <span class="num"><b><fmt:formatNumber value="${month1 }" pattern="0.00"/></b>kWh</span>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span class="state orange">금년</span>
                                <ul class="info">
                                    <li>
                                        <span class="sbj">발전시간</span>
                                        <span class="num"><b>
                                        	<fmt:formatNumber value="${year1/ob.DPP_VOLUM }" pattern="0.00"/>
                                        	</b>h
                                        </span>
                                    </li>
                                    <li>
                                        <span class="sbj">발전량</span>
                                        <span class="num"><b><fmt:formatNumber value="${year1 }" pattern="0.00"/></b>kWh</span>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span class="state gray">누적</span>
                                <ul class="info">
                                    <li>
                                        <span class="sbj">발전시간</span>
                                        <span class="num"><b>
                                        	<fmt:formatNumber value="${ob.DDM_CUL_DATA/ob.DPP_VOLUM }" pattern="0.00"/>
                                        	</b>h
                                        </span>
                                    </li>
                                    <li>
                                        <span class="sbj">발전량</span>
                                        <span class="num"><b><fmt:formatNumber value="${ob.DDM_CUL_DATA }" pattern="0.00"/></b>kWh</span>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </article>  
            </div>

        </section>



        <article class="artBoard mobile">
            <h2 class="circle">종합</h2>

            <div class="all_static_b">
                <dl class="st_dl">
                    <dt>최저: ${mindata.Conn_date }</dt>
                    <dd>
                        <div class="table_wrapper auto">
                            <table class="tbl_normal auto">
                                <tbody>
                                    <tr>
                                        <th class="txtL" style="width: 50%;">발전 출력</th>
                                        <td class="txtR" style="width: 50%;"><b>${empty mindata.Active_Power ? 0 : mindata.Active_Power}</b>W</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </dd>
                </dl>

                <dl class="st_dl">
                    <dt>최고: ${maxdata.Conn_date }</dt>
                    <dd>
                        <div class="table_wrapper auto">
                            <table class="tbl_normal auto">
                                <tbody>
                                    <tr>
                                        <th class="txtL" style="width: 50%;">발전 출력</th>
	                                   <td class="txtR" style="width: 50%;"><b>${empty maxdata.Active_Power? 0: maxdata.Active_Power}</b>W</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </dd>
                </dl>
                
                <dl class="st_dl">
	               <dt>당일</dt>
	               <dd>
	                   <div class="table_wrapper auto">
	                       <table class="tbl_normal auto">
	                           <tbody>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전량</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${empty ob.DDM_D_DATA ? 0 : ob.DDM_D_DATA }" pattern="0.00"/>KWh</td>
	                               </tr>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전시간</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${ob.DDM_D_DATA/ob.DPP_VOLUM }" pattern="0.00"/>h</td>
	                               </tr>
	                           </tbody>
	                       </table>
	                   </div>
	               </dd>
	           </dl>
	           
	           <dl class="st_dl">
	               <dt>누적</dt>
	               <dd>
	                   <div class="table_wrapper auto">
	                       <table class="tbl_normal auto">
	                           <tbody>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전량</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${empty ob.DDM_CUL_DATA ? 0 : ob.DDM_CUL_DATA}" pattern="0.00"/>KWh</td>
	                               </tr>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전시간</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${ob.DDM_CUL_DATA/ob.DPP_VOLUM }" pattern="0.00"/>h</td>
	                               </tr>
	                           </tbody>
	                       </table>
	                   </div>
	               </dd>
	           </dl>
	           
            </div>
        </article>


        <article class="artBoard mobile">
            <h2 class="circle">발전량분석</h2>

            <div class="con_h fix">
                <div class="line_graph_w">
                    <div id="line_graph" style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1634621548504"><div style="position: relative; width: 823px; height: 258px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="823" height="258" style="position: absolute; left: 0px; top: 0px; width: 823px; height: 258px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class=""></div></div>
                </div>
            </div>
        </article>

        
    </div>
    <!-- COMTAINER END -->

</form:form>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${sp:getString('DAUM_APPKEY')}&libraries=services"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script>
$(function(){
// 	pf_setMap();
 	ajaxData();
 	
 	var aJsonArray = new Array();
	//당일 그래프 분기 처리
	var list = new Array;
	
	var inverternum = "${InverterType}";
	<c:forEach begin="0" end="${fn:length(MainList)}" varStatus="status">
		var list_sub = new Array;
		<c:forEach items="${MainList[status.index]}" var="v">
			list_sub.push("${v}")
		</c:forEach>
		list.push(list_sub.reverse())
	</c:forEach>
	
	if(inverternum == '0'){
		for(var i=1;i<list.length-1;i++){
			var aJson = new Object();
			aJson.name = "인버터"+i+"호";
			aJson.type = "line";
			aJson.stack = "a"+i;
			aJson.data = list[i];
			
			aJsonArray.push(aJson);
		}
	}else{
		for(var i=1;i<list.length-1;i++){
			var aJson = new Object();
			aJson.name = "인버터"+inverternum+"호";
			aJson.type = "line";
			aJson.stack = "a"+i;
			aJson.data = list[i];
			
			aJsonArray.push(aJson);
		}
	}
	
	chartGraph1(list,aJsonArray);
 	
});

function inputInverterNum(value){
	$("#InverterType").val(value)
}


function DPPDataAjax(keyno){
	$("#keyno").val(keyno);
	$("#Form").submit();
}

function pf_setMap(){
	lat = "${ob.DPP_X_LOCATION}"
	lng = "${ob.DPP_Y_LOCATION}"
	
	$("#map").html("")
	
	var container = document.getElementById("map");
	var options = {
		center: new kakao.maps.LatLng(lat, lng),
		level: 3
	};
	map = new daum.maps.Map(container, options);
	
	map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 
	
	marker = new daum.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	marker.setMap(map);
}


function ajaxData(){
	$.ajax({
        url: '/dy/moniter/generalAjax.do',
        type: 'POST',
        data: {
        	keyno : $("#DPP_KEYNO").val(),
        	name : $("#InverterNum").val()
        },
        async: false,  
        success: function(result) {
        	//인버터 이름 추가
        	$("#inverterName").text("<"+result.name+">")
        	
        	var volum = "${ob.DPP_VOLUM}";
        	var count = "${ob.DPP_INVER_COUNT}";
        	
        	if(result.invertData == null){
        		$("#AllPower").text("0.0KW / 0.00h")
        		$("#Active").text("0.0KW")
        		chartOption(0.0,0.0,volum/count);
        	}else{
        		var hour = result.invertData.Daily_Generation / (volum/count);
        		$("#AllPower").text(result.invertData.Daily_Generation+"KW / " + hour.toFixed(2) +"h")
            	$("#Active").text(result.invertData.Active_Power+"KW")
        		
            	var aDeg = (result.invertData.Daily_Generation/((volum/count)*8))*100

             	chartOption(aDeg,result.invertData.Active_Power,volum/count);
        	}
        },
        error: function(){
        	alert("에러 관리자에 문의해주세요.");
        }
	});
}

function chartGraph1(list,aJsonArray){
	
	var dom = document.getElementById("line_graph");
    var myChart = echarts.init(dom);
    var app = {};

    var option;


    option = {
        color: ['#F31614', '#38C146', '#3A37FF','#ffeb3b','#ff9800'],
        tooltip: {
            show: true,
        },
        legend: {
            show: true,
        },
        legend: {
            show: true,
        },
        grid: {
            top: '4%',
            left: '4%',
            right: '4%',
            bottom: '2%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: list[0]
        },
        yAxis: {
            type: 'value'
        },
        series: aJsonArray
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }
}


function chartOption(v1, v2, s1){
	  var chartDom = document.getElementById('gauge_1');
	  var myChart = echarts.init(chartDom);
	  var chartDom2 = document.getElementById('gauge_2');
	  var myChart2 = echarts.init(chartDom2);
	  
	  var option;
	  var option2;
	
	option = {
		       series: [
		           {
		               type: 'gauge',
		               center: ['50%', '50%'],
		               startAngle: 180,
		               endAngle: 0,
		               min: 0,
		               max: 100,
		               splitNumber: 10,
		               itemStyle: {
		                   color: '#f13a3a'
		               },
		               progress: {
		                   show: true,
		                   width: 30
		               },
		               pointer: {
		                   show: false
		               },
		               axisLine: {
		                   lineStyle: {
		                       width: 30
		                   }
		               },
		               axisTick: {
		                   distance: -40,
		                   splitNumber: 3,
		                   lineStyle: {
		                       width: 1,
		                       color: '#eee'
		                   }
		               },
		               splitLine: {
		                   distance: -43,
		                   length: 5,
		                   lineStyle: {
		                       width: 1,
		                       color: '#eee'
		                   }
		               },
		               axisLabel: {
		                   distance: 7,
		                   color: '#ddd',
		                   fontSize: 11
		               },
		               anchor: {
		                   show: false
		               },
		               title: {
		                   show: false
		               },
		               detail: {
		                   valueAnimation: true,
		                   width: '100%',
		                   lineHeight: 40,
		                   borderRadius: 8,
		                   offsetCenter: [0, '-15%'],
		                   fontSize: 0,
		                   fontWeight: 'bolder',
		                   formatter: '',
		                   color: 'white',
		                   show : 'false'
		               },
		               data: [
		                   {
		                       value: v1
		                       
		                   }
		               ]
		           }
		       ]
		   };
		   
		   option2 = {
		       series: [
		           {
		               type: 'gauge',
		               center: ['50%', '50%'],
		               startAngle: 180,
		               endAngle: 0,
		               min: 0,
		               max: s1,
		               splitNumber: 10,
		               itemStyle: {
		                   color: '#ff7d53'
		               },
		               progress: {
		                   show: true,
		                   width: 30
		               },
		               pointer: {
		                   show: false
		               },
		               axisLine: {
		                   lineStyle: {
		                       width: 30
		                   }
		               },
		               axisTick: {
		                   distance: -40,
		                   splitNumber: 3,
		                   lineStyle: {
		                       width: 1,
		                       color: '#eee'
		                   }
		               },
		               splitLine: {
		                   distance: -43,
		                   length: 5,
		                   lineStyle: {
		                       width: 1,
		                       color: '#eee'
		                   }
		               },
		               axisLabel: {
		                   distance: 7,
		                   color: '#ddd',
		                   fontSize: 11
		               },
		               anchor: {
		                   show: false
		               },
		               title: {
		                   show: false
		               },
		               detail: {
		                   valueAnimation: true,
		                   width: '60%',
		                   lineHeight: 40,
		                   borderRadius: 8,
		                   offsetCenter: [0, '-15%'],
		                   fontSize: 0,
		                   fontWeight: 'bolder',
		                   formatter: '',
		                   color: 'white',
		                   show : 'false'
		               },
		               data: [
		                   {
		                       value: v2
		                   }
		               ]
		           }
		       ]
		   };

		   option && myChart.setOption(option);
		   option2 && myChart2.setOption(option2);
		 	
}


/* function calculation(){
	$('.calculation_result').addClass('on')
// 	var Dm_val = "${month.DATA+ob.DDM_D_DATA}";	//금월
// 	var y_val = "${year.DATA+ob.DDM_D_DATA}";	//금년
// 	var n_val = "${all.DATA+ob.DDM_D_DATA}";	//누적
	var val = "${ob.DDM_D_DATA}";	//금일
	var Dm_val = "${month1}";	//금월
	var P_val = "${ob.DDM_P_DATA}";	//전일
	var Pm_val = "${Prmonth}";//전월
	var y_val = "${year1}";	//금년
	var n_val = "${ob.DDM_CUL_DATA}";	//누적
	var smp = $("#smp1").val();	
	var rec = $("#rec1").val();
	var plus = $("#plus").text();
	
	$("#pre_benefit").text(((P_val*(parseFloat(smp) + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원");
	$("#benefit").text(((val*(parseFloat(smp) + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
	$("#Pm_benefit").text(((Pm_val*(parseFloat(smp) + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
	$("#y_benefit").text(((y_val*(parseFloat(smp) + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
	$("#n_benefit").text(((n_val*(parseFloat(smp) + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
} */


function clean(){
	$("#rec1").val("");
	$("#smp1").val("");
}

</script>