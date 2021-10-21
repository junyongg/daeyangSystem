<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<!-- COMTAINER -->
<div id="container" class="heightFix2">
    
    <div class="flex_wrapper">
        
        <section class="one_row left2">
            <article class="artBoard top2">
                <h2 class="circle">발전소</h2>

                <p class="power_tit">[${ob.DPP_AREA }] ${ob.DPP_NAME }</p>

				<div class="power_select">
                    <select class="select_nor sm3 w100">
                        <option value="">발전소 선택</option> 
                    </select>
                </div>
				
                <div class="power_select">
                    <select class="select_nor sm3 w100">
                        <c:forEach varStatus="status" begin="1" end="${ob.DPP_INVER_COUNT }">
                        	<option value="${status.count }">인버터 ${status.count }호</option>
                        </c:forEach>
                    </select>
                </div>
                
                <h2 class="location">발전소 현장정보</h2>

                <div class="power_preview">
                    <div class="imgs" id="map" style="height: 200px"></div> <!-- 카카오맵 -->
                </div>

                <p class="power_addr">${fn:substringAfter(ob.DPP_LOCATION,'//')} </p>

                <ul class="power_info">
                    <li>
                        <p class="lb battery">발전소 설비용량</p>
                        <p class="rb"><span class="num">${ob.DPP_VOLUM }</span>kW</p>
                    </li>
                    <li>
                        <p class="lb invert">인버터상태</p>
                        <p class="rb"><span class="check_c green"></span> ${ob.DDM_STATUS }</p>
                    </li>
                    <li>
                        <p class="lb time">발전소등록 날짜 / 시간</p>
                        <p class="rb w100">
                            <span class="gb_txt">${ob.DPP_DATE }</span>
                        </p>
                    </li>
                    <li>
                        <p class="lb time">최종수신 날짜 / 시간</p>
                        <p class="rb w100">
                            <span class="gb_txt" id="Conndate">${ob.DDM_DATE }</span>
                        </p>
                    </li>
                </ul>

                <div class="power_btns">
                    <button type="button" class="btn_calcu" onclick="$('.base_pop_wrapper').addClass('on')">수익계산</button>
                </div>

            </article>  
        </section>


        <!-- 수익계산 팝업 - 클래스 on 추가시 나타남 -->
        <section class="base_pop_wrapper">
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
                                    <span class="number"><b><fmt:formatNumber value="${Prmonth.DATA}" pattern="0.00"/></b>kWh</span>
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
                                    <span class="number"><b><fmt:formatNumber value="${year.DATA+ob.DDM_D_DATA}" pattern="0.00"/></b>kWh</span>
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
                                    <span class="number"><b><fmt:formatNumber value="${all.DATA + ob.DDM_D_DATA }" pattern="0.00"/></b>kWh</span>
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
        </section>
        <!-- // 수익계산 팝업 -->


        <section class="one_row right3">

            <div class="col n01">

                <article class="artBoard top">
                    <h2 class="circle mgSm">기상정보</h2>

                    <div class="weather_infomation">
                    
                    	<c:choose>
			        		<c:when test="${weatherToday.DWD_PTV eq '흐림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_5.png"/></c:when>
			        		<c:when test="${weatherToday.DWD_PTV eq '구름많음'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_4.png"/></c:when>
			        		<c:when test="${weatherToday.DWD_PTV eq '구름조금'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_3.png"/></c:when>
			        		<c:when test="${weatherToday.DWD_PTV eq '빗방울/눈날림' || weatherToday.DWD_PTV eq '비/눈'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_2.png"/></c:when>
			        		<c:when test="${weatherToday.DWD_PTV eq '비' || weatherToday.DWD_PTV eq '소나기' || weatherToday.DWD_PTV eq '빗방울'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_6.png"/></c:when>
			        		<c:when test="${weatherToday.DWD_PTV eq '눈' || weatherToday.DWD_PTV eq '눈날림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_7.png"/></c:when>
			        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
			        	</c:choose>
                    
                    
                        <div class="icons"><img src="${weatherIMG }" alt=""></div>
                        <div class="dgree">
                            <p class="number"><b>${weatherToday.DWD_T1H }</b>℃</p>
                            <span class="rain">${weatherToday.DWD_RN1 }mm</span>
                            <span class="rain_per">${weatherToday.DWD_REH }%</span>
                        </div>
                        <div class="infos">
                            <ul>
                                <li class="sunrise">${fn:substring(weatherToday.DWD_SUNRISE,0,2)} : ${fn:substring(weatherToday.DWD_SUNRISE,2,4) }</li>
                                <li class="sunset">${fn:substring(weatherToday.DWD_SUNSET,0,2)} : ${fn:substring(weatherToday.DWD_SUNSET,2,4) }</li>
                                <li class="wind">${weatherToday.DWD_WSD }m/s</li>
                            </ul>
                        </div>
                    </div>

                    <div class="weather_information2">
                        <div class="lb">
                            <p class="now">${fn:substring(weather[0],0,2) }시 현재</p>
                            <p class="cate">${weatherToday.DWD_PTV}</p>
                        </div>
                        <ul class="list">
                            <c:if test="${fn:length(weather) == 20}">
	                            <c:forEach varStatus="status" begin="0" end="4">
									<c:if test="${weather[status.index+15] eq '0'}">
										<c:choose>
											<c:when test="${weather[status.index+5] eq '3'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_4.png"/></c:when>
											<c:when test="${weather[status.index+5] eq '4'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_5.png"/></c:when>
											<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${weather[status.index+15] ne '0'}">
										<c:choose>
							        		<c:when test="${weather[status.index+5] eq '1' || weather[status.index+5] eq '4' || weather[status.index+5] eq '5'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_6.png"/></c:when>
							        		<c:when test="${weather[status.index+5] eq '2' || weather[status.index+5] eq '6'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_2.png"/></c:when>
							        		<c:when test="${weather[status.index+5] eq '3' || weather[status.index+5] eq '7'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_7.png"/></c:when>
							        	</c:choose>
									</c:if>
	                            	
	                            	<li>
	                                	<p class="time">${fn:substring(weather[status.index],0,2) }</p>
	                                	<div class="icon">
	                                		<img src="${weatherIMG }" alt="">
	                                	</div>
	                                	<p class="degree">${weather[status.index+10] }℃</p>
	                            	</li> 
	                            </c:forEach>
                            </c:if>
                            <c:if test="${fn:length(weather) == 16}">
	                            <c:forEach varStatus="status" begin="0" end="3">
									<c:if test="${weather[status.index+12] eq '0'}">
										<c:choose>
											<c:when test="${weather[status.index+4] eq '3'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_4.png"/></c:when>
											<c:when test="${weather[status.index+4] eq '4'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_5.png"/></c:when>
											<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${weather[status.index+12] ne '0'}">
										<c:choose>
							        		<c:when test="${weather[status.index+4] eq '1' || weather[status.index+4] eq '4' || weather[status.index+4] eq '5'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_6.png"/></c:when>
							        		<c:when test="${weather[status.index+4] eq '2' || weather[status.index+4] eq '6'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_2.png"/></c:when>
							        		<c:when test="${weather[status.index+4] eq '3' || weather[status.index+4] eq '7'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_7.png"/></c:when>
							        	</c:choose>
									</c:if>
	                            	
	                            	<li>
	                                	<p class="time">${fn:substring(weather[status.index],0,2) }</p>
	                                	<div class="icon">
	                                		<img src="${weatherIMG }" alt="">
	                                	</div>
	                                	<p class="degree">${weather[status.index+8] }℃</p>
	                            	</li> 
	                            </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </article>  

                <article class="artBoard bott">
                    <h2 class="circle mgSm">금일 발전량</h2>

                    <div class="graph_b_gaue">

                        <div class="g_gauge totalEP">
                            <div class="guage_area">
                                <div class="guage_container">
                                    <div class="gauge-a"></div>
                                    <div class="gauge-b"></div>
                                    <div class="gauge-c"  id="AllPower_g" style="background-color: #f13a3a; transform: rotate(100deg);"></div>
                                </div>
                            </div>

                            <div class="guage_txt">
                                <span>총 금일 발전량</span>
                                <p><b id="AllPower">0</b>kW</p>
                            </div>
                        </div>

                    </div>
                    

                    <div class="gab30"></div>
                    
                    <h2 class="circle mgSm">현재 발전량</h2>
                    
                    <div class="graph_b_gaue">

                        <div class="g_gauge totalEP">
                            <div class="guage_area">
                                <div class="guage_container">
                                    <div class="gauge-a"></div>
                                    <div class="gauge-b"></div>
                                    <div class="gauge-c" id="Active_g" style="background-color: #ff7d53; transform: rotate(40deg);"></div>
                                </div>
                            </div>

                            <div class="guage_txt">
                                <span>발전 전력</span>
                                <p><b id="Active">0</b>W</p>
                            </div>
                        </div>

                    </div>
                </article>  
            </div>

            <div class="col n02">
                <article class="artBoard top">
                    <h2 class="circle">인버터별 상태</h2>

                    <span class="state_b pos">${ob.DPP_INVER }</span>

                    <div class="table_wrapper con_h">
                        <table class="tbl_normal fixed">
                            <colgroup>
                                <col width="55%">
                                <col width="25%">
                                <col width="20%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>인버터명</th>
                                    <th>AC전력(kW)</th>
                                    <th>발전상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${invertDataList }" var="model" varStatus="status">
                            		<c:choose>
                            			<c:when test="${model.Work_Mode eq 'Normal'}">
                            				<c:set var="type" value="green"/>
                            			</c:when>
                            			<c:when test="${model.Work_Mode eq 'Fault'}">
                            				<c:set var="type" value="red"/>
                            			</c:when>
                            			<c:when test="${model.Work_Mode eq 'Wati'}">
                            				<c:set var="type" value="blue"/>
                            			</c:when>
                            			<c:otherwise>
                            				<c:set var="type" value="black"/>
                            			</c:otherwise>
                            		</c:choose>
                            		<tr>
    	                                <td>[${ob.DPP_AREA }] ${ob.DPP_NAME } | 인버터 ${status.count }호</td>
        	                            <td>${model.Active_Power }</td>
            	                        <td><span class="check_c ${type }"></span></td>
	                                </tr>
                            	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </article>  

                <article class="artBoard bott">
                    <h2 class="circle">게시판</h2>

                    <div class="tab_inner_01_wrap">
                        <ul class="tab_inner_01 tab_board_1">
                            <li class="active"><a href="javascript:;">안전관리</a></li>
                            <li><a href="javascript:;">유지관리</a></li>
                        </ul>
                    </div>

                    <div class="tab_board_1_con">
                        <div class="table_wrapper"> <!-- 안전관리 -->
                            <table class="tbl_normal fixed">
                                <colgroup>
                                    <col width="10%">
                                    <col width="65%">
                                    <col width="25%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>제목</th> 
                                        <th>날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>[고창]베데르 태양광발전소 #1</td>
                                        <td>2021-09-06</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div> <!-- // 안전관리 -->


                        <div class="table_wrapper"> <!-- 유지관리 -->
                            <table class="tbl_normal fixed">
                                <colgroup>
                                    <col width="10%">
                                    <col width="65%">
                                    <col width="25%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>제목</th> 
                                        <th>날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>유지관리1</td>
                                        <td>2021-09-06</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div> <!-- // 유지관리 -->

                        <script>
                            tab('.tab_board_1', 0)
                        </script>
                    </div>

                </article>  
            </div>

            <div class="col n03">
                <article class="artBoard long">
                    <h2 class="circle">인버터 종합 발전실적</h2>
                    
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
                                        <span class="sbj">발전시간</span>
                                        <span class="num"><b><fmt:formatNumber value="${(month.DATA/ob.DPP_VOLUM) + ob.DDM_T_HOUR }" pattern="0.00"/></b>h</span>
                                    </li>
                                    <li>
                                        <span class="sbj">발전량</span>
                                        <span class="num"><b><fmt:formatNumber value="${month.DATA + ob.DDM_D_DATA }" pattern="0.00"/></b>kWh</span>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span class="state orange">금년</span>
                                <ul class="info">
                                    <li>
                                        <span class="sbj">발전시간</span>
                                        <span class="num"><b><fmt:formatNumber value="${(year.DATA/ob.DPP_VOLUM) + ob.DDM_T_HOUR }" pattern="0.00"/></b>h</span>
                                    </li>
                                    <li>
                                        <span class="sbj">발전량</span>
                                        <span class="num"><b><fmt:formatNumber value="${year.DATA + ob.DDM_D_DATA }" pattern="0.00"/></b>kWh</span>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <span class="state gray">누적</span>
                                <ul class="info">
                                    <li>
                                        <span class="sbj">발전시간</span>
                                        <span class="num"><b><fmt:formatNumber value="${(all.DATA/ob.DPP_VOLUM) + ob.DDM_T_HOUR }" pattern="0.00"/></b>h</span>
                                    </li>
                                    <li>
                                        <span class="sbj">발전량</span>
                                        <span class="num"><b><fmt:formatNumber value="${all.DATA + ob.DDM_D_DATA }" pattern="0.00"/></b>kWh</span>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </article>  
            </div>

        </section>

        
    </div>
    
</div>
<!-- COMTAINER END -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${sp:getString('DAUM_APPKEY')}&libraries=services"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
$(function(){
	pf_setMap();
	ajaxData();
});

function ajaxData(keyno){
	$.ajax({
        url: '/dy/moniter/generalAjax.do',
        type: 'POST',
        data: {
        	keyno : keyno
        },
        async: false,  
        success: function(result) {
        	$("#AllPower").text(result.invertData.Daily_Generation)
        	var aDeg = result.invertData.Daily_Generation*0.2
        	$("#AllPower_g").attr("style","background-color: #f13a3a; transform: rotate("+aDeg+"deg);")
        	var bDeg = result.invertData.Active_Power*1.8
        	$("#Active").text(result.invertData.Active_Power)
        	$("#Active_g").attr("style","background-color: #ff7d53; transform: rotate("+bDeg+"deg);")
        },
        error: function(){
        	alert("에러 관리자에 문의해주세요.");
        }
	});
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

function calculation(){
	$('.calculation_result').addClass('on')
	var val = "${ob.DDM_D_DATA}";	//금일
	var Dm_val = "${month.DATA+ob.DDM_D_DATA}";	//금월
	var P_val = "${ob.DDM_P_DATA}";	//전일
	var Pm_val = "${Prmonth.DATA}";//전월
	var y_val = "${year.DATA+ob.DDM_D_DATA}";	//금년
	var n_val = "${all.DATA+ob.DDM_D_DATA}";	//누적
	var smp = $("#smp1").val();	
	var rec = $("#rec1").val();
	var plus = $("#plus").text();
	$("#pre_benefit").text(((P_val*(smp + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원");
	$("#benefit").text(((val*(smp + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
	$("#Pm_benefit").text(((Pm_val*(smp + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
	$("#y_benefit").text(((y_val*(smp + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
	$("#n_benefit").text(((n_val*(smp + (rec*plus))).toFixed(0)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
}

function plusValue(value){
	var a = "${(ob.DPP_INVER_COUNT + 0.2)/ob.DPP_INVER_COUNT}"
	if(value == 'b'){
		$("#plus").text("1.5")
	}else{
		$("#plus").text(a)
	}
}

function clean(){
	$("#rec1").val("");
	$("#smp1").val("");
}
</script>