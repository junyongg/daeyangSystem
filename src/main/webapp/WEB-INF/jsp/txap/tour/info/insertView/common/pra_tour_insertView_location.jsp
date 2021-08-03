<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<fieldset>
	<legend>위치 및 연락처</legend>	
	<div class="form-group">
		<label class="col-md-2 control-label">주소</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_ADDR" 
										class="onoffswitch-checkbox" id="TC_ADDR_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_ADDR') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_ADDR_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group">
										<input type="text" class="form-control addrInput" placeholder="우편번호" name="TC_POST" id="TC_POST" readonly="readonly" value="${resultData.TC_POST }">
										<div class="input-group-btn">
											<button class="btn btn-primary" type="button" onclick="pf_execDaumPostcode()">
												<i class="fa fa-search"></i>
												검색
											</button>
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="input-group">
										<input type="text" class="form-control addrInput" placeholder="주소" name="TC_ADDR" id="TC_ADDR" readonly="readonly" value="${resultData.TC_ADDR }">
										<div class="input-group-btn">
											<button class="btn btn-default" type="button" onclick="pf_deleteAddr()">
												<i class="fa fa-eraser"></i>
												삭제
											</button>
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="input-group">
										<input type="text" class="form-control addrInput" placeholder="상세주소(관광지등은 상세주소만 적어도됨.)" 
												name="TC_ADDR2" id="TC_ADDR2" maxlength="100" onkeyup="pf_checkLength('TC_TAG',100)"
												value="${resultData.TC_ADDR2 }">
										<span class="input-group-addon length" id="TC_ADDR2_length">(0/100자)</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 위치</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group" style="width: 100%;">
						<div class="row">
							<div class="col-sm-6 inputWidth50">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="위도" name="TC_LAT" id="TC_LAT" maxlength="30" value="${resultData.TC_LAT }">
									<span class="input-group-addon">위도</span>
								</div>
							</div>
							<div class="col-sm-6 inputWidth50">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="경도" name="TC_LNG" id="TC_LNG" maxlength="30" value="${resultData.TC_LNG }">
									<span class="input-group-addon">경도</span>
								</div>
							</div>
						</div>
					</div>
					<div class="map">
						<div id="moveMapBtnBox">
							<button id="moveMapBtn" class="btn btn-primary" type="button" onclick="pf_moveMap();">주소 위치로 이동</button>
						</div>
						<div id="TC_LOCATION" style="width:100%;height:100%;"></div>
					</div>
					<p class="help-block">
						* 지도에서 클릭시 해당 위치의 위도/경도 값이 저장됩니다.
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">연락처</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_CONTACT" 
										class="onoffswitch-checkbox" id="TC_CONTACT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_CONTACT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_CONTACT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TC_CONTACT" id="TC_CONTACT" maxlength="100" onkeyup="pf_checkLength('TC_CONTACT',100)"
								value="${resultData.TC_CONTACT }">
						<span class="input-group-addon length" id="TC_CONTACT_length">(0/100자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">연락처2</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_CONTACT2" 
										class="onoffswitch-checkbox" id="TC_CONTACT2_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_CONTACT2') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_CONTACT2_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TC_CONTACT2" id="TC_CONTACT2" maxlength="100" onkeyup="pf_checkLength('TC_CONTACT2',100)"
								value="${resultData.TC_CONTACT2 }">
						<span class="input-group-addon length" id="TC_CONTACT2_length">(0/100자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</fieldset>

<script type="text/javascript">

$(function(){
	
	pf_setMap('${resultData.TC_LAT}','${resultData.TC_LNG}');
	
});

function pf_setMap(lat,lng){
	
	
	var isDefault = !(lat && lng);
	
	lat = lat || "${sp:getData('TOUR_DEFAULT_LAT')}";
	lng = lng || "${sp:getData('TOUR_DEFAULT_LNG')}";
	
	var container = document.getElementById('TC_LOCATION');
	var options = {
		center: new daum.maps.LatLng(lat, lng),
		level: 3
	};

	map = new daum.maps.Map(container, options);
	
	marker = new daum.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter() 
	}); 
	
	
	if(!isDefault){
		marker.setMap(map);
	}
	
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    pf_setMarker(latlng);
	  
	    
	});
}


function pf_setMarker(latLng){
	
	marker.setMap(map);
	// 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latLng);
    
    $('#TC_LAT').val(latLng.getLat());
    $('#TC_LNG').val(latLng.getLng());
}


function pf_moveMap(){
	var address = $('#TC_ADDR').val() + ' ' + $('#TC_ADDR2').val();
	address = address.trim();
	
	var geocoder = new daum.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	       	pf_setMarker(coords);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    }else{
	    	cf_smallBox('지도', '주소값이 없거나 주소로 해당 위치를 찾을 수 없습니다.', 3000,'gray');
	    }
	}); 
	
}

function pf_deleteAddr(){
	$('.addrInput').val('');
}

</script>

