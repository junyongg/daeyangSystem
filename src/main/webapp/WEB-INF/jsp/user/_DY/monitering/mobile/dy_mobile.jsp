<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<form:form action="/dy/mobile.do" method="POST" id="Form">

<input type="hidden" id="DaliyType" name="DaliyType" value="${not empty DaliyType? DaliyType:'1' }">
<input type="hidden" id="InverterType" name="InverterType" value="${not empty InverterType? InverterType:'0' }">
<input type="hidden" id="keyno" name="keyno" value="${ob.DDM_DPP_KEYNO }">

<div id="wrap">
    
    <!-- HEADER -->
    <header>
        <h1 class="mo_logo"><a href="/" title="대양산업 로고"><img src="/resources/img/sub/mo_logo_top.png" alt="DAEYANG"></a></h1>
    </header>
    <!-- HEADER END -->

    <!-- Mobile Title -->
    
    <!-- <section class="mobile_title">
        <button type="button" class="btn_moArr prev" title="이전"></button>
        <button type="button" class="btn_moArr next" title="다음"></button>
        <p class="tit">종합현황</p>
    </section> -->
    
    <!-- Mobile Title END -->

    
    <!-- COMTAINER -->
    <div id="container">
        
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
        </article> 

        <article class="artBoard mobile">
            <h2 class="circle mgSm"><p id="inverterName" style="float:right;">[인버터 1호]</p>총 발전량</h2>

            <div class="graph_b_gaue">

                <div class="g_gauge totalEP">
                    <div class="guage_area">
                        <div class="guage_container">
                            <div class="gauge-a"></div>
                            <div class="gauge-b"></div>
                            <div class="gauge-c" id="AllPower_g" style="background-color: #f13a3a; transform: rotate(0deg);"></div>
                        </div>
                    </div>

                    <div class="guage_txt">
                        <span>총 금일 발전량</span>
                        <p><b id="AllPower">0KW / 0h</b></p>
                    </div>
                </div>

            </div>
            

            <div class="gab30"></div>
            
            <h2 class="circle mgSm">현재 발전량</h2>
            
            <div class="graph_b_gaue">

                <div class="g_gauge n02 totalEP">
                    <div class="guage_area">
                        <div class="guage_container">
                            <div class="gauge-a"></div>
                            <div class="gauge-b"></div>
                            <div class="gauge-c" id="Active_g" style="background-color: #ff7d53; transform: rotate(0deg);"></div>
                        </div>
                    </div>

                    <div class="guage_txt">
                        <span>발전 전력</span>
                        <p><b id="Active">0</b>W</p>
                    </div>
                </div>

            </div>
        </article>

        <article class="artBoard mobile">
            <h2 class="circle mgSm">기상정보</h2>

            <div class="weather_infomation">
  						
  						<c:if test="${weatherToday.DWD_PTV eq '맑음'}">
  							<c:choose>
				        		<c:when test="${weatherToday.DWD_PTV eq '흐림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_5.png"/></c:when>
				        		<c:when test="${weatherToday.DWD_PTV eq '구름많음'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_4.png"/></c:when>
				        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
			        		</c:choose>
  						</c:if>
  						
  						<c:if test="${weatherToday.DWD_PTV ne '맑음'}">
  							<c:choose>
				        		<c:when test="${weatherToday.DWD_PTV eq '빗방울/눈날림' || weatherToday.DWD_PTV eq '비/눈'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_2.png"/></c:when>
				        		<c:when test="${weatherToday.DWD_PTV eq '비' || weatherToday.DWD_PTV eq '소나기' || weatherToday.DWD_PTV eq '빗방울'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_6.png"/></c:when>
				        		<c:when test="${weatherToday.DWD_PTV eq '눈' || weatherToday.DWD_PTV eq '눈날림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_7.png"/></c:when>
				        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
				        	</c:choose>
  						</c:if>
  						     	
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

</div>
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
        	
        	if(result.invertData == null){
        		$("#AllPower").text("0KW / 0h")
            	$("#AllPower_g").attr("style","background-color: #f13a3a; transform: rotate(0deg);")
        		$("#Active").text("0")
            	$("#Active_g").attr("style","background-color: #f13a3a; transform: rotate(0deg);")
        	}else{
        		var hour = result.invertData.Daily_Generation / volum;
        		
        		$("#AllPower").text(result.invertData.Daily_Generation+"KW / " + hour.toFixed(2) +"h")
            	var aDeg = result.invertData.Daily_Generation*0.2
            	$("#AllPower_g").attr("style","background-color: #f13a3a; transform: rotate("+aDeg+"deg);")
            	var bDeg = result.invertData.Active_Power*1.8
            	$("#Active").text(result.invertData.Active_Power)
            	$("#Active_g").attr("style","background-color: #ff7d53; transform: rotate("+bDeg+"deg);")	
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
</script>