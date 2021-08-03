<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>




<style>

#courseList li .distance-contents {margin-top: 10px;margin-bottom: 10px;padding-left: 26px;padding-right: 0;}
#courseList li:last-child .distance-contents {display:none;}

</style>

<input type="hidden" name="TCM_KEYNO" id="TCM_KEYNO" value="${resultData.TCM_KEYNO }">


<fieldset>
	<legend>코스 정보</legend>		
	
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 구분</label>
		<div class="col-md-10">
			<c:forEach items="${courseTypeList }" var="courseType" varStatus="status">
			<c:choose>
				<c:when test="${(status.first && empty resultData) || resultData.TCM_TYPE eq courseType.SC_KEYNO }">
					<c:set var="courseTypeChecked" value="Y"/>
				</c:when>
				<c:otherwise>
					<c:set var="courseTypeChecked" value="N"/>
				</c:otherwise>
			</c:choose>
			<label class="radio radio-inline">
				<input type="radio" class="radiobox" name="TCM_TYPE" value="${courseType.SC_KEYNO }" ${courseTypeChecked eq 'Y' ? 'checked="checked"':'' }>
				<span>${courseType.SC_CODENM }</span> 
			</label>
			</c:forEach>
		</div>
	</div>
	
	
	<div class="form-group">
		<label class="col-md-2 control-label">관광소요시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCM_TIME" 
										class="onoffswitch-checkbox" id="TCM_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCM_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCM_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TCM_TIME" id="TCM_TIME" class="hiddenTimeForm" data-hour="TCM_HOUR" data-min="TCM_MIN" value="${resultData.TCM_TIME }">
							<c:if test="${not empty resultData.TCM_TIME }">
								<c:set var="TCM_HOUR" value="${fn:split(resultData.TCM_TIME,':')[0] }"/>
								<c:set var="TCM_MIN" value="${fn:split(resultData.TCM_TIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control" 
												id="TCM_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TCM_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TCM_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TCM_MIN }">
										<span class="input-group-addon number">분</span>
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
		<label class="col-md-2 control-label">추천계절</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCM_SEASON" 
										class="onoffswitch-checkbox" id="TCM_SEASON_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCM_SEASON') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCM_SEASON_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCM_SEASON" id="TCM_SEASON" maxlength="50" onkeyup="pf_checkLength('TCM_SEASON',50)"
								value="${resultData.TCM_SEASON }">
						<span class="input-group-addon number" id="TCM_SEASON_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 경로</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-4">
					<select class="form-control" id="TCM_TYPE1">
						<option value="">선택하세요.</option>
						<c:forEach items="${tourInfoList }" var="tourInfo">
						<option value="${tourInfo.SC_KEYNO }">${tourInfo.SC_CODENM }</option>
						</c:forEach>
						<option value="etc">기타</option>
					</select>
				</div>
				<div class="col-md-4">
					<select class="form-control" id="TCM_TYPE2" style="display:none;">
						<option value="">선택하세요.</option>
						<c:forEach items="${destinationTypeList }" var="destinationType">
						<option value="${destinationType.SC_KEYNO }" ${resultData.TA_DIVISION eq destinationType.SC_KEYNO ? 'selected':'' }>${destinationType.SC_CODENM }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4 text-align-right">
					<button class="btn btn-success" type="button" onclick="pf_addCourseInfo();"><i class="fa fa-plus"></i> 추가</button>
				</div>
			</div>
			<div class="map" style="margin-top:10px;">
				<div id="courseMap" style="width:100%;height:100%;"></div>
			</div>
			<ul id="courseList">
				<c:forEach items="${courseList }" var="model" varStatus="courseStatus">
				<li>
					<div class="input-group">
						<span class="input-group-addon"><font class="courseIndex"></font>.</span>
						<input class="form-control" name="TCS_TITLE" value="${model.TCS_TITLE}" type="text" readonly="readonly">
						<div class="input-group-btn">
							<button class="btn btn-default" type="button" onclick="pf_openUpdateCourse(this)">
								수정
							</button>
							<button class="btn btn-default" type="button" onclick="pf_deleteCourse(this)">
								삭제
							</button>
						</div>
					</div>
					<div class="col-md-12 distance-contents">
					    <div class="input-group">
							<span class="input-group-addon">
								<span class="onoffswitch">
									<input type="checkbox" name="AUTO_DISTANCE" id="TCS_AUTO_DISTANCE${courseStatus.count }" value="TCS_AUTO_DISTANCE${courseStatus.count }" class="onoffswitch-checkbox" ${model.TCS_AUTO_DISTANCE eq 'Y' ? 'checked':'' }>
									<label class="onoffswitch-label" for="TCS_AUTO_DISTANCE${courseStatus.count }"> 
										<span class="onoffswitch-inner" data-swchon-text="자동" data-swchoff-text="직접입력"></span> 
										<span class="onoffswitch-switch"></span> 
									</label> 
								</span>
							</span>
							<div class="input-group" style="width: 100%;">
								<div class="row">
									<div class="col-sm-6 inputWidth50">
										<div class="input-group">
											<input type="text" name="TCS_TIME" class="form-control" maxlength="50" value="${model.TCS_TIME }">
											<span class="input-group-addon number">시간</span>
										</div>
									</div>
									<div class="col-sm-6 inputWidth50">
										<div class="input-group">
											<input type="text" name="TCS_DISTANCE" class="form-control" maxlength="50" value="${model.TCS_DISTANCE }">
											<span class="input-group-addon number">거리</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					 <input type="hidden" name="TCS_POSITON_TYPE" value="${model.TCS_POSITON_TYPE }">
					 <input type="hidden" name="TCS_AUTO_DISTANCE" value="${model.TCS_AUTO_DISTANCE }">
					 <input type="hidden" name="TCS_LAT" value="${model.TCS_LAT}">
					 <input type="hidden" name="TCS_LNG" value="${model.TCS_LNG}">
					 <input type="hidden" name="TCS_TYPE_NAME" value="${model.TCS_TYPE_NAME}">
					 <input type="hidden" name="TCS_TYPE" value="${model.TCS_TYPE}">
					 <input type="hidden" name="TCS_TYPE_KEYNO" value="${model.TCS_TYPE_KEYNO}">
					 <input type="hidden" name="defaultLat" value="${model.TC_LAT}">
					 <input type="hidden" name="defaultLng" value="${model.TC_LNG}">
					 <textarea name="TCS_COMMENT" style="display:none;">${model.TCS_COMMENT}</textarea>
				</li>
				</c:forEach>
			</ul>
			
		</div>
	</div>
	
</fieldset>

<div id="courseInfoDialog">
	<div class="widget-body ">
		<fieldset>
			<div class="form-horizontal">
				<fieldset>
					<div class="form-group">
						<label class="col-md-2 control-label">구분</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="courseType" value="" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">명칭</label>
						<div class="col-md-10">
							<div class="input-group">
								<input type="text" class="form-control" id="courseName" maxlength="50" onkeyup="pf_checkLength('courseName',50)" value="">
								<span class="input-group-addon length" id="courseName_length">(0/50자)</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">추가 코멘트</label>
						<div class="col-md-10">
							<textarea class="form-control" placeholder="입력하여주세요." rows="3" id="courseComment" maxlength="300" onkeyup="pf_checkLength('courseComment',300)" ></textarea>
							<p class="help-block length" id="courseComment_length">(0/300자)</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label"></label>
						<div class="col-md-10">
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" name="positionType" value="C">
								<span>직접 설정</span> 
							</label>
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" name="positionType" value="D">
								<span>기본 위치</span>  
							</label>
						</div>
						<input type="hidden" id="courseDefaultLat" value="">
						<input type="hidden" id="courseDefaultLng" value="">
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">위도</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="courseLat" maxlength="20" value="" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">경도</label>
						<div class="col-md-10">
							<input type="text" class="form-control" id="courseLng" maxlength="20" value="" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">지도</label>
						<div class="col-md-10">
							<div class="map" style="height:350px;">
								<div id="updateCourseMap" style="width:100%;height:100%;"></div>
								* 지도에서 클릭시 해당 위치의 위도/경도 값이 저장됩니다.
							</div>
						</div>
					</div>
					
				</fieldset>
			</div>
		</fieldset>
	</div>
</div>






<script>

var courseMap;
var courseMarkers = new Array();
var courseCustomOverlays = new Array();

var updateCourseMap = '';
var updateCourseMarker;

var selectedCourseObj;

var courseCount = ${fn:length(courseList)};

$(function(){
	
	//ajax로 다시 불렀을때 dialog 중복되는 현상 fix
	$('#courseInfoDialog.ui-dialog-content').dialog('destroy').remove();
	
	pf_setCourseMap();
	
	$( "#courseList" ).sortable({
		update: function(event, ui) {
			pf_setCourseIndex()
        }
	});
	
	$('#TCM_TYPE1').on('change',function(){
		
		pf_getTourInfoListForCourse($(this).val());
		
	})
	
	pf_setttingCourseDialog();
	
	
	var courseListCnt = '${fn:length(courseList)}';
	
	if(courseListCnt > 0){
		pf_setCourseIndex();
	}
	
	$('input[name=AUTO_DISTANCE]').on('change',function(){
		$(this).closest('li').find('input[name=TCS_AUTO_DISTANCE]').val($(this).is(':checked') ? 'Y':'N')
	})
	
	$('input[name=positionType]').on('change',function(){
		var value = $(this).val();
		if(value == 'D'){
			$('#courseLat').val($('#courseDefaultLat').val());
			$('#courseLng').val($('#courseDefaultLng').val());
			var tempPosition = new daum.maps.LatLng($('#courseDefaultLat').val(), $('#courseDefaultLng').val());
			updateCourseMarker.setPosition(tempPosition);
			updateCourseMap.setCenter(tempPosition)
		}else{
			
		}
	})
	
});


function pf_setttingCourseDialog(obj,title,successText,successFnc,cancelText){
	
	var data = {
			autoOpen : false,
			width : 800,
			resizable : false,
			modal : true,
			title : '코스정보 수정',
			buttons : [{
				html : "<i class='fa fa-times'></i>&nbsp; 확인",
				"class" : "btn btn-primary",
				click : function() {
					pf_updateCourse();
				}
			}]
		}
	$('#courseInfoDialog').dialog(data);
}


//관광정보 가져오기
function pf_getTourInfoListForCourse(value){
	var temp = '<option value="">선택하세요.</option>';
	if(!value || value == "etc"){
		$('#TCM_TYPE2').hide();		
	}else{
		
		$.ajax({
			type: "POST",
			url: "/txap/tour/info/list2Ajax.do",
			data: {
				"TC_TYPE" : value,
				"TC_USE"	: 'Y'
			},
			async :false,
			success : function(data){
				if(data.length > 0){
					$.each(data,function(i){
						temp += '<option value="'+data[i].TC_KEYNO+'" data-lat="'+data[i].TC_LAT+'" data-lng="'+data[i].TC_LNG+'" >'+data[i].TC_TITLE+'</option>'
					})
				}else{
					temp = '<option value="">데이터 없음</option>'
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				cf_smallBox('ajax', '알수없는 에러 발생. 관리자한테 문의하세요.', 3000,'gray');
			}
	   });
		
		
		$('#TCM_TYPE2').show();
	}
	
	$('#TCM_TYPE2').html(temp);
}

function pf_setCourseMap(){
	
	var lat = '${resultData.TC_LAT}' || "${sp:getData('TOUR_DEFAULT_LAT')}";
	var lng = '${resultData.TC_LNG}' || "${sp:getData('TOUR_DEFAULT_LNG')}";
	
	var container = document.getElementById('courseMap');
	var options = {
		center: new daum.maps.LatLng(lat, lng),
		level: 4
	};
	
	courseMap = new daum.maps.Map(container, options);
	
}

function pf_setUpdateCourseMap(lat,lng){
	
	var container = document.getElementById('updateCourseMap');
	var options = {
		center: new daum.maps.LatLng(lat, lng),
		level: 4
	};

	updateCourseMap = new daum.maps.Map(container, options);
	
	updateCourseMarker = new daum.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: updateCourseMap.getCenter(),
	    map : updateCourseMap
	}); 
	
	
	
	daum.maps.event.addListener(updateCourseMap, 'click', function(mouseEvent) {        
	    
		if($('input[name=positionType]:checked').val() == 'C'){
			// 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    updateCourseMarker.setPosition(latlng);
		    
		    $('#courseLat').val(latlng.getLat());
		    $('#courseLng').val(latlng.getLng());
		}
		
	    
	});
}

function pf_addCourseInfo(){
	
	var name = "";
	var type = $('#TCM_TYPE1').val();
	var typeName = "";
	var typeKey = "";
	var lat = "${sp:getData('TOUR_DEFAULT_LAT')}";
	var lng = "${sp:getData('TOUR_DEFAULT_LNG')}";
	var positionType = "";
	if(type){
		if(type == 'etc'){
			name = '직접 입력';
			typeName = "직접 입력";
			positionType = "C";
		}else{
			typeKey = $('#TCM_TYPE2').val();
			if(typeKey){
				
				name = $('#TCM_TYPE2 option:selected').text();
				typeName = $('#TCM_TYPE1 option:selected').text() + " - " + name;
				positionType = "D";
				
				lat = $('#TCM_TYPE2 option:selected').data('lat');
				lng = $('#TCM_TYPE2 option:selected').data('lng');
			}else{
				cf_smallBox('코스', '코스를 선택하여주세요.', 3000,'#d24158');
				$('#TCM_TYPE2').focus();
				return false;
			}
		}
	}else{
		cf_smallBox('코스', '코스를 선택하여주세요.', 3000,'#d24158');
		$('#TCM_TYPE1').focus();
		return false;
	}
	
	var param = {
			"name" : name,
			"type" : type,
			"typeKey" : typeKey,
			"typeName" : typeName,
			"lat" : lat,
			"lng" : lng ,
			"positionType" : positionType
	}
	$('#courseList').append(pf_getCourseHtml(param))
	
	pf_setCourseIndex();
	cf_smallBox('코스', '경로가 추가되었습니다.', 3000);
	
	
	
}

function pf_getCourseHtml(param){
	
	return	  '<li>'
			+ '	<div class="input-group">'
			+ '		<span class="input-group-addon"><font class="courseIndex"></font>.</span>'
			+ '		<input class="form-control" name="TCS_TITLE" value="'+param.name+'" type="text" readonly="readonly">'
			+ '		<div class="input-group-btn">'
			+ '			<button class="btn btn-default" type="button" onclick="pf_openUpdateCourse(this)">'
			+ '				수정'
			+ '			</button>'
			+ '			<button class="btn btn-default" type="button" onclick="pf_deleteCourse(this)">'
			+ '				삭제'
			+ '			</button>'
			+ '		</div>'
			+ '	</div>'
			+ '	<div class="col-md-12 distance-contents">'
			+ '	    <div class="input-group">'
			+ '			<span class="input-group-addon">'
			+ '				<span class="onoffswitch">'
			+ '					<input type="checkbox" name="AUTO_DISTANCE" id="TCS_AUTO_DISTANCE'+(++courseCount)+'" class="onoffswitch-checkbox">'
			+ '					<label class="onoffswitch-label" for="TCS_AUTO_DISTANCE'+ courseCount + '"> '
			+ '						<span class="onoffswitch-inner" data-swchon-text="자동" data-swchoff-text="직접입력"></span> '
			+ '						<span class="onoffswitch-switch"></span> '
			+ '					</label> '
			+ '				</span>'
			+ '			</span>'
			+ '			<div class="input-group" style="width: 100%;">'
			+ '				<div class="row">'
			+ '					<div class="col-sm-6 inputWidth50">'
			+ '						<div class="input-group">'
			+ '							<input type="text" name="TCS_TIME" class="form-control" maxlength="50" value="">'
			+ '							<span class="input-group-addon number">시간</span>'
			+ '						</div>'
			+ '					</div>'
			+ '					<div class="col-sm-6 inputWidth50">'
			+ '						<div class="input-group">'
			+ '							<input type="text" name="TCS_DISTANCE" class="form-control" maxlength="50" value="">'
			+ '							<span class="input-group-addon number">거리</span>'
			+ '						</div>'
			+ '					</div>'
			+ '				</div>'
			+ '			</div>'
			+ '		</div>'
			+ '	</div>'
			+ ' <input type="hidden" name="TCS_AUTO_DISTANCE" value="N">'
			+ ' <input type="hidden" name="TCS_POSITON_TYPE" value="'+param.positionType+'">'
			+ ' <input type="hidden" name="TCS_LAT" value="'+param.lat+'">'
			+ ' <input type="hidden" name="TCS_LNG" value="'+param.lng+'">'
			+ ' <input type="hidden" name="TCS_TYPE_NAME" value="'+param.typeName+'">'
			+ ' <input type="hidden" name="TCS_TYPE" value="'+param.type+'">'
			+ ' <input type="hidden" name="TCS_TYPE_KEYNO" value="'+param.typeKey+'">'
			+ ' <input type="hidden" name="defaultLat" value="'+param.lat+'">'
			+ ' <input type="hidden" name="defaultLng" value="'+param.lng+'">'
			+ ' <textarea name="TCS_COMMENT" style="display:none;"></textarea>'
			+ '</li>';
}


function pf_updateCourse(){
	
	if(!$('#courseName').val()){
		cf_smallBox('Form', '명칭을 입력하여주세요.', 3000,'#d24158');
		$('#courseName').focus();
		return false;
	}
	
	
	var wrap = $(selectedCourseObj).closest('li');
	
	$(wrap).find('input[name=TCS_TITLE]').val($('#courseName').val());
	$(wrap).find('input[name=TCS_LAT]').val($('#courseLat').val());
	$(wrap).find('input[name=TCS_LNG]').val($('#courseLng').val());
	$(wrap).find('textarea[name=TCS_COMMENT]').val($('#courseComment').val());
	$(wrap).find('input[name=TCS_POSITON_TYPE]').val($('input[name=positionType]:checked').val());
	
	selectedCourseObj = '';
	
	$('#courseInfoDialog').dialog("close");
	cf_smallBox('코스', '경로가 수정되었습니다.', 3000);
	
	pf_setCourseIndex();
}

function pf_openUpdateCourse(obj){
	$('#courseInfoDialog').dialog('open');
	
	
	selectedCourseObj = obj;
	
	var wrap = $(obj).closest('li');
	var lat = $(wrap).find('input[name=TCS_LAT]').val();
	var lng = $(wrap).find('input[name=TCS_LNG]').val();
	
	if(!updateCourseMap){
		pf_setUpdateCourseMap(lat,lng);
	}else{
		var position = new daum.maps.LatLng(lat, lng);
		updateCourseMap.setCenter(position);
		updateCourseMarker.setPosition(position);
	}
	$('input[name=positionType][value='+$(wrap).find('input[name=TCS_POSITON_TYPE]').val()+']').prop('checked',true);
	$('#courseType').val($(wrap).find('input[name=TCS_TYPE_NAME]').val())
	$('#courseName').val($(wrap).find('input[name=TCS_TITLE]').val())
	$('#courseLat').val(lat);
	$('#courseLng').val(lng);
	$('#courseDefaultLat').val($(wrap).find('input[name=defaultLat]').val());
	$('#courseDefaultLng').val($(wrap).find('input[name=defaultLng]').val());
	$('#courseComment').val($(wrap).find('textarea[name=TCS_COMMENT]').val())
	
	$('#courseInfoDialog .input-group-addon.length,#courseInfoDialog .help-block.length').each(function(){
		
		var id = $(this).attr('id').replace('_length','');
		
		var maxLength = $('#'+id).attr('maxlength');
		pf_checkLength(id,maxLength);
		
	})
	
}

function pf_deleteCourse(obj){
	$(obj).closest('li').remove();
	
	pf_setCourseIndex();
	cf_smallBox('코스', '경로가 삭제되었습니다.', 3000);
}

function pf_setCourseIndex(){
	
	for (var i = 0; i < courseMarkers.length; i++) {
		courseMarkers[i].setMap(null);
		courseCustomOverlays[i].setMap(null);
    }
	courseMarkers.length = 0;
	courseCustomOverlays.length = 0;
	
	
	if($('#courseList li').length > 0){
		var bounds = new daum.maps.LatLngBounds();
		
		$('#courseList li').each(function(i){
			
			var courseIndex = i+1;
			
			$(this).find('.courseIndex').text(courseIndex);
			var lat = $(this).find('input[name=TCS_LAT]').val();
			var lng = $(this).find('input[name=TCS_LNG]').val();
			var title = $(this).find('input[name=TCS_TITLE]').val();
			var position = new daum.maps.LatLng(lat, lng);
			
			var courseMarker = new daum.maps.Marker({ 
			    position: position,
			    map : courseMap,
			    draggable : true
			});
			
			var content = 	'<div class="customoverlay">' +
						    '  <a href="javascript:;">' +
						    '    <span class="title">'+title+'</span>' +
						    '    <span class="number">'+courseIndex+'</span>' +
						    '  </a>' +
						    '</div>';
			var courseCustomOverlay = new daum.maps.CustomOverlay({
			    map: courseMap,
			    position: position,
			    content: content,
			    yAnchor: 1 
			});
			
			courseMarkers.push(courseMarker);
			courseCustomOverlays.push(courseCustomOverlay);
			
			daum.maps.event.addListener(courseMarker, 'dragend', function() {        
			    
			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = courseMarker.getPosition(); 
			    
			    courseCustomOverlay.setPosition(latlng);
			    
			    var index = courseMarkers.map(function (marker) { return marker; }).indexOf(courseMarker);
			    
			    $('input[name=TCS_LAT]').eq(index).val(latlng.getLat());
			    $('input[name=TCS_LNG]').eq(index).val(latlng.getLng());
			    
			});
			
			
			
			bounds.extend(position);
			
		})
		
		courseMap.setBounds(bounds);
		
		//바운드 하면 화면이 너무 꽉차서 지도 레벨을 1 올린다
	    courseMap.setLevel(courseMap.getLevel() + 1);
		
	}
	
}






</script>

