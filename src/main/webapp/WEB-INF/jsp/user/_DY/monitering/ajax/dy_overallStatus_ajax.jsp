<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>



<article class="artBoard lb">
    <h2 class="circle mgSm">기상정보</h2>

    <div class="weather_infomation">
        <div class="icons">
        	
        	<c:choose>
        		<c:when test="${Weather.DWD_PTV eq '맑음'}">
        			<c:choose>
		        		<c:when test="${Weather.DWD_SKY eq '흐림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_5.png"/></c:when>
		        		<c:when test="${Weather.DWD_SKY eq '구름많음'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_4.png"/></c:when>
		        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
		       		</c:choose>
        		</c:when>
        		<c:otherwise>
        			<c:choose>
		        		<c:when test="${Weather.DWD_PTV eq '빗방울/눈날림' || Weather.DWD_PTV eq '비/눈'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_2.png"/></c:when>
		        		<c:when test="${Weather.DWD_PTV eq '비' || Weather.DWD_PTV eq '소나기' || Weather.DWD_PTV eq '빗방울'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_6.png"/></c:when>
		        		<c:when test="${Weather.DWD_PTV eq '눈' || Weather.DWD_PTV eq '눈날림'}"><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_7.png"/></c:when>
		        		<c:otherwise><c:set var="weatherIMG" value="/resources/img/sub/ic_weather_1.png"/></c:otherwise>
		        	</c:choose>
        		</c:otherwise>
        	</c:choose>
        	<c:if test="">
				
			</c:if>
					
			<c:if test="${Weather.DWD_PTV ne '맑음'}">
				
			</c:if>
        
        	<img src="${weatherIMG }" alt="">
        </div>
        <div class="dgree">
            <p class="number"><b>${Weather.DWD_T1H }</b>℃</p>
            <span class="rain">${Weather.DWD_RN1 }</span>
            <span class="rain_per">${Weather.DWD_REH }%</span>
        </div>
        <div class="infos">
            <ul>
                <li class="sunrise">${fn:substring(Weather.DWD_SUNRISE,0,2)}:${fn:substring(Weather.DWD_SUNRISE,2,4) }</li>
                <li class="sunset">${fn:substring(Weather.DWD_SUNSET,0,2)}:${fn:substring(Weather.DWD_SUNSET,2,4) }</li>
                <li class="wind">${Weather.DWD_WSD }m/s</li>
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
                    <td class="txtR">${detail_Data.DPP_NAME }</td>
                </tr>
                <tr>
                    <th class="txtL">인버터</th>
                    <td class="txtR">${detail_Data.DPP_INVER_COUNT }대</td>
                </tr>
                <tr>
                    <th class="txtL">인버터장비</th>
                    <td class="txtR">${detail_Data.DPP_INVER }</td>
                </tr>
                <tr>
                    <th class="txtL">총용량</th>
                    <td class="txtR">${detail_Data.DPP_VOLUM }kW</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_wrapper n2 mgT">
        <table class="tbl_normal sm">
            <colgroup>
                <col style="width: 20%;">
                <col style="width: 30%;">
                <col style="width: 20%;">
                <col style="width: 30%;">
            </colgroup>
            <thead>
                <tr>
                    <th colspan="4" class="txtL">[ ${detail_Data.DPP_AREA } ] ${detail_Data.DPP_NAME }</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th class="txtL">현재발전</th>
                    <td class="txtR"><b><fmt:formatNumber value="${empty detail_Data.DDM_ACTIVE_P? 0:detail_Data.DDM_ACTIVE_P  }" pattern="0.00"/></b>kW</td>
                    <th class="txtL"></th>
                    <td class="txtR"><b></b></td>
                </tr>
                <tr>
                    <th class="txtL">금일</th>
                    <td class="txtR"><b><fmt:formatNumber value="${empty detail_Data.DDM_D_DATA ? 0 : detail_Data.DDM_D_DATA  }" pattern="0.00"/></b>kWh</td>
                    <th class="txtL">발전시간</th>
                    <td class="txtR"><b><fmt:formatNumber value="${empty detail_Data.DDM_T_HOUR ? 0 : detail_Data.DDM_T_HOUR  }" pattern="0.00"/></b>h</td>
                </tr>
                <tr>
                    <th class="txtL">전일</th>
                    <td class="txtR"><b><fmt:formatNumber value="${empty detail_Data.DDM_P_DATA ? 0 : detail_Data.DDM_P_DATA  }" pattern="0.00"/></b>kWh</td>
                    <th class="txtL"></th>
                    <td class="txtR"><b><fmt:formatNumber value="${detail_Data.DDM_P_DATA/detail_Data.DPP_VOLUM  }" pattern="0.00"/></b>h</td>
                </tr>
                <tr>
                    <th class="txtL">금월</th>
                    <td class="txtR"><b><fmt:formatNumber value="${month1 }" pattern="0.00"/></b>kWh</td>
                    <th class="txtL" style="font-size:11px;">발전시간(평균)</th>
                    <%-- <td class="txtR"><b>
                    	<c:if test="${month.CNT ne '0'}">
                    		<fmt:formatNumber value="${((month.DATA/detail_Data.DPP_VOLUM) + detail_Data.DDM_T_HOUR)/month.CNT }" pattern="0.00"/>
                    	</c:if>
                    	<c:if test="${month.CNT eq '0'}">
                       		<fmt:formatNumber value="${empty detail_Data.DDM_T_HOUR ? 0 : detail_Data.DDM_T_HOUR  }" pattern="0.00"/>
                       	</c:if>
                    </b>h</td> --%>
                    <td class="txtR"><b>
                    	<c:if test="${month1Cnt ne '0'}">
                    		<fmt:formatNumber value="${(month1/detail_Data.DPP_VOLUM)/month1Cnt }" pattern="0.00"/>
                    	</c:if>
                    	<c:if test="${month1Cnt eq '0'}">
                       		<fmt:formatNumber value="${empty detail_Data.DDM_T_HOUR ? 0 : detail_Data.DDM_T_HOUR  }" pattern="0.00"/>
                       	</c:if>
                    </b>h</td>
                </tr>
                <tr>
                    <th class="txtL">금년</th>
                    <td class="txtR"><b><fmt:formatNumber value="${year1 }" pattern="0.00"/></b>kWh</td>
                    <th class="txtL">발전시간</th>
                    <td class="txtR"><b>
                    	<%-- <c:if test="${year.CNT ne '0'}">
                    		<fmt:formatNumber value="${((year.DATA/detail_Data.DPP_VOLUM) + detail_Data.DDM_T_HOUR)/year.CNT }" pattern="0.00"/>
                    	</c:if>
                    	<c:if test="${year.CNT eq '0'}">
                       		<fmt:formatNumber value="${empty detail_Data.DDM_T_HOUR ? 0 : detail_Data.DDM_T_HOUR  }" pattern="0.00"/>
                       	</c:if> --%>
                    	<fmt:formatNumber value="${year1/detail_Data.DPP_VOLUM }" pattern="0.00"/>
                    	</b>h</td>
                </tr>
                <tr>
                    <th class="txtL">누적</th>
                    <td class="txtR"><b><fmt:formatNumber value="${detail_Data.DDM_CUL_DATA }" pattern="0.00"/></b>kWh</td>
                    <th class="txtL">발전시간</th>
                    <td class="txtR"><b>
                    	<%-- <c:if test="${all.CNT ne '0'}">
                    		<fmt:formatNumber value="${((all.DATA/detail_Data.DPP_VOLUM) + detail_Data.DDM_T_HOUR)/all.CNT }" pattern="0.00"/>
                    	</c:if>
                    	<c:if test="${year.CNT eq '0'}">
                       		<fmt:formatNumber value="${empty detail_Data.DDM_T_HOUR ? 0 : detail_Data.DDM_T_HOUR  }" pattern="0.00"/>
                       	</c:if> --%>
                       	<fmt:formatNumber value="${detail_Data.DDM_CUL_DATA/detail_Data.DPP_VOLUM }" pattern="0.00"/>
                    	</b>h
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</article>



<article class="artBoard rb half">
    <h2 class="location" id="map_name">[ ${detail_Data.DPP_AREA } ] ${detail_Data.DPP_NAME }</h2>

    <div class="map_box_c" id="map">
    </div>
</article>


<article class="artBoard rb half">
	<h2 class="circle">알림</h2>
	
	<div class="table_wrapper con_h" style = "overflow-x : auto ">
	    <table class="tbl_normal">
	        <colgroup>
	            <col style="width: 20%;">
	            <col style="width: 10%;">
	            <col style="width: 22%;">
	            <col style="width: 10%;">
	            <col style="width: 20%;">
	            <col style="width: 25%;">
	        </colgroup>
            <thead>
                <tr>
                    <th>현장명</th>
                    <th>인버터명</th>
                    <th>시간</th>
                    <th>인버터</th>
                    <th>DSP 에러</th>
                    <th>DSP 에러 <br>(Slave)</th>
                </tr>
            </thead>
	        <tr>
	            <tbody>
	            	<c:forEach items="${ResultList }" var="list">
						<tr>
		                    <td style ="white-space: nowrap;">[ ${list.DPP_AREA } ] ${list.DPP_NAME }</td>
		                    <td style ="white-space: nowrap;">${list.DIE_INVERTER_NAME }</td>
		                    <td style ="white-space: nowrap;">${list.DIE_DATE }</td>
		                    <td style ="white-space: nowrap;">${list.DPP_INVER }</td>
		                    <td style ="white-space: nowrap;">${list.DIE_DSP_ERROR eq 'Normal' ? '정상' : list.DIE_DSP_ERROR }</td>
		                    <td style ="white-space: nowrap;">${list.DIE_DSP_S_ERROR eq 'Normal' ? '정상' : list.DIE_DSP_S_ERROR  }</td>
	              	  	</tr>            	
	            	</c:forEach>
	            </tbody>
	        </tr>
	    </table>
	</div>
</article>


<script>
$(function(){
	pf_setMap();
});


function pf_setMap(){
	lat = "${detail_Data.DPP_X_LOCATION}"
	lng = "${detail_Data.DPP_Y_LOCATION}"
	
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
</script>