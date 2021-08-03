<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<style>
.mapTop1, .mapTop2{float:left;}
.mapTop1 ul, .mapTop2 ul{list-style:none;margin:0;padding:0;}
.mapTop1 ul li{float:left;padding: 30px 69px;border: 1px solid; background-color: #ddd;}
.mapTop2 ul li{float:left;padding: 30px 43px;border: 1px solid; background-color: #ddd;}

#b_map .node {
    position: absolute;
    background-repeat: no-repeat;
    cursor: pointer;
    width: 32px;
    height: 43px;
}

#b_map .tracker {
    position: absolute;
    margin: -35px 0 0 -30px;
    display: none;
    cursor: pointer;
    z-index: 3;
}

#b_map .icon {
    position: absolute;
    left: 14px;
    top: 13px;
    width: 33px;
    height: 44px;
   	background-repeat: no-repeat;
}

#b_map .balloon {
    position: absolute;
    width: 60px;
    height: 60px;
    background-repeat: no-repeat;
    background-image: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/balloon.png);
    -ms-transform-origin: 50% 34px;
    -webkit-transform-origin: 50% 34px;
    transform-origin: 50% 34px;
}
</style>

		<form id="bus_naver" method="get" name="bus_naver_search " action="http://map.naver.com/index.nhn" target="_blank" onsubmit="return beforeSearchBusRoute();">
			<fieldset class="srch">
				<legend>버스길찾기 검색</legend>        
				<input type="hidden" id="slng_pf" name="slng" value="${sp:getString('TOUR_START_LNG') }">
				<input type="hidden" id="slat_pf" name="slat" value="${sp:getString('TOUR_START_LAT') }">
				<input type="hidden" id="sText_pf" name="sText" value="${sp:getString('TOUR_START_TEXT') }">
				<input type="hidden" id="elng_pf" name="elng" value="${resultData.TC_LNG }">
				<input type="hidden" id="elat_pf" name="elat" value="${resultData.TC_LAT }">
				<input type="hidden" id="eText_pf" name="eText" value="${resultData.TC_TITLE }">
				<input type="hidden" id="menu_pf" name="menu" value="route">
				<input type="hidden" id="pathType_pf" name="pathType" value="1">
				<input type="hidden" id="dlevel_pf" name="dlevel" value="9">
			</fieldset>
		</form>

        <!-- 교통정보 -->
        <p class="sightsee-title-2" id="Around">교통정보</p>
        <div class="sigthsee-iner-traffic">
        	<div class="map-box">
                <div class="map-in-top-tab-box">
                    <ul class="map-in-tab-1">
                        <li class="TypeDivision active">
                            <a href="javascript:;" onclick="pf_around(this,'TC_TYPE')">
                                <span class="txt map1" data-val="${sp:getData('TOUR_DESTINATION') }">관광지</span>
                            </a>
                        </li>
                        <li class="TypeDivision">
                            <a href="javascript:;" onclick="pf_around(this,'TC_TYPE')">
                                <span class="txt map2" data-val="${sp:getData('TOUR_RESTAURANT') }">음식점</span>
                            </a>
                        </li>
                        <li class="TypeDivision">
                            <a href="javascript:;" onclick="pf_around(this,'TC_TYPE')">
                                <span class="txt map3" data-val="${sp:getData('TOUR_LODGMENT') }">숙박</span>
                            </a>
                        </li>
                        <li class="DistanceDivision active2">
                            <a href="javascript:;" onclick="pf_around(this,'distance')">
                                <span class="txt" data-val="0.5">500m이내</span>
                            </a>
                        </li>
                        <li class="DistanceDivision">
                            <a href="javascript:;" onclick="pf_around(this,'distance')">
                                <span class="txt" data-val="1">1km이내</span>
                            </a>
                        </li>
                        <li class="DistanceDivision">
                            <a href="javascript:;" onclick="pf_around(this,'distance')">
                                <span class="txt" data-val="2">2km이내</span>
                            </a>
                        </li>
                        <li class="DistanceDivision">
                            <a href="javascript:;" onclick="pf_around(this,'distance')">
                                <span class="txt" data-val="3">3km이내</span>
                            </a>
                        </li>
                    </ul>
                </div>
                
                
                
                <div class="mapWrap">
                <div id="b_map" style="width:100%;height:433px;"></div>
                </div>
            </div>
            
            <c:if test="${category ne 'culturalheritage' && category ne 'lodgment' && category ne 'restaurant'}">
	            <div class="letter-box">
	                <h3>오시는방법</h3>
	                <div class="detail-box">
	                    <div class="table-box table_wrap_mobile">
	                        <table class="tbl_traffic">
	                            <caption>오시는방법</caption>
	                            <colgroup>
	                                <col width="20%">
	                                <col width="80%">
	                            </colgroup>
	                            <tbody>
	                                <tr>
	                                    <th>대중교통</th>
	                                    <td>
	                                       <pre>${resultData.TC_WAY_PUBLIC }</pre>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <th>자가용</th>
	                                    <td>
	                                       <pre>${resultData.TC_WAY_JAGA }</pre>
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                    <div class="btn-box">
	                        <button type="button" class="btn-traffic-go" onclick="$('#bus_naver').submit();">
	                            <span class="icon"><img src="/resources/img/icon/marker/map/icon_traffic_01.png" alt="아이콘"></span>
	                            <span class="text">
	                                교통정보 >
	                            </span>
	                        </button>
	                    </div>
	                </div>
	            </div>
            </c:if>
            
        </div>

		 <!-- 주변정보 -->
        <p class="sightsee-title-2">주변정보</p>
        <div class="sigthsee-iner-around" id="AroundInfo">
        </div>
		

		<%@ include file="script/prc_tour_data_map_script.jsp"%>