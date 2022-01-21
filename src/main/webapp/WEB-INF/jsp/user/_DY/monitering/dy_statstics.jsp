<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<form:form action="" method="POST" id="Form">
<input type="hidden" value="${ob.DPP_KEYNO }" id="n_keyno" name="n_keyno">

<div id="container" class="heightFix">
    <div class="flex_wrapper">
        <section class="one_row left2">
            <article class="artBoard top2">
                <h2 class="circle">발전소</h2>

                <p class="power_tit">[${ob.DPP_AREA }] ${ob.DPP_NAME }</p>

				<div class="power_select">
                    <select class="select_nor sm3 w100" id="DPP_KEYNO" name="DPP_KEYNO" value="${DPP_KEYNO }" onchange="DPPDataAjax();">
                        <c:forEach items="${list }" var="list">
                        	<option value="${list.DPP_KEYNO }" ${list.DPP_KEYNO eq DPP_KEYNO ? 'selected' : '' } >${list.DPP_NAME }</option>
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
                        <p class="rb"><span class="check_c ${statusT }"></span> ${empty ob.DDM_STATUS? '기타':ob.DDM_STATUS }</p>
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
                            <span class="gb_txt" id="Conndate">${empty ob.DDM_DATE? '현재 통신 없음': ob.DDM_DATE }</span>
                        </p>
                    </li>
                </ul>

            </article>  
        </section>


        <section class="one_row right2" id="statics_ajax">

        </section>

        
    </div>
    
</div>
</form:form>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${sp:getString('DAUM_APPKEY')}&libraries=services"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">

$(function(){
	pf_setMap();
	statics_ajax();
});

function DPPDataAjax(){
	$('#Form').attr('action','/dy/moniter/stastics.do');
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

function statics_ajax(){
	$.ajax({
        url: '/dy/moniter/stasticsAjax.do',
        type: 'POST',
        data: {
        	keyno : $("#n_keyno").val(),
        	DaliyType : "${DaliyType}",
        	InverterType : "${InverterType}",
        	searchBeginDate : "${searchBeginDate}",
        	searchEndDate : "${searchEndDate}"
        },
        async: false,  
        success: function(result) {
        	$("#statics_ajax").html(result);
        },
        error: function(){
        	alert("에러 관리자에 문의해주세요.");
        }
	});
}


//엑셀 버튼
function pf_excel(url){
	$('#Form').attr('action',url);
	$('#Form').submit();
}
</script>