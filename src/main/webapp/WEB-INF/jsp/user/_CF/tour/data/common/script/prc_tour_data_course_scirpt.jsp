<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${sp:getString('DAUM_APPKEY')}&libraries=services"></script>
<script>
var LAT = '${courseList[0].TCS_LAT}';
var LNG = '${courseList[0].TCS_LNG}';
var course_map;
var lengths = [];
var lengths_str = [];
var markers = [];


$(function(){
	pf_settingMap();
	pf_totalStreet();
});


function pf_settingMap(){
	var positions = [];
	
	<c:forEach items="${courseList }" var="model">
		positions.push(makePositionInfo("${model.TCS_TITLE}", new daum.maps.LatLng("${model.TCS_LAT}", "${model.TCS_LNG}"), "${model.TCS_TITLE}"));
	</c:forEach>
	
	 var container = document.getElementById('course_map'),// 지도를 표시할 div  
		options = { 
		    center: new daum.maps.LatLng(LAT, LNG), // 지도의 중심좌표
		    level: 9 // 지도의 확대 레벨
		};
	
	 if(course_map == null || course_map == ""){
		 course_map = new daum.maps.Map(container, options);
	 }else{
		 $("#course_map").empty();
		 course_map = new daum.maps.Map(container, options);
	 }
	 
	 //마커 초기화
	 hideMarker(course_map);
	 markers = [];
	 for(var i in positions){
		 
		var count = parseInt(i) + 1;
		
		var imageSize = new daum.maps.Size(38, 47); 
		
		var imageSrc = "/resources/img/icon/marker/course/icon_course_inner_g"+count+".png"; 
		var Zindex = 1;
		if(count == 1){
			imageSrc = "/resources/img/icon/marker/course/icon_course_inner_"+count+".png"; 
			Zindex = 2;
		} 
		
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		
		var marker = new daum.maps.Marker({
			map: course_map,
			position: positions[i].latlng,
			title: positions[i].title,
			image: markerImage,
			clickable: true,
			zIndex:Zindex
		});
	    
		marker.setMap(course_map);
		
		markers.push(marker);
		
		//custom
	    var overlay = new daum.maps.CustomOverlay({
	    	content : '<div class="customoverlay2"><span class="title">' + positions[i].content + '</span></div>', 
	    	position : positions[i].latlng,
	    	yAnchor: 0
	    })
		
// 	    daum.maps.event.addListener(marker, 'click', makeOverListener(course_map, marker, overlay));
		
	 }
	 
	 markersGetLength(positions);
	
}

function makeOverListener(map, marker, overlay) {
    return function() {
    	if(overlay.getMap()){
    		overlay.setMap(null);
    	}else{
    		overlay.setMap(map);
    	}
    };
}


function pf_moveMap(obj,lat,lng){

	var strLat = lat.toFixed(5);
	var strLng = lng.toFixed(5);
	
	var moveLatLon = new daum.maps.LatLng(lat, lng);
    course_map.panTo(moveLatLon);
    
    $(".map-btn").removeClass("active");
    $(".name .txt").removeClass("active");
    
    $(obj).closest("div").addClass("active");
    $(obj).find('.txt').addClass('active');
   
    var imageSize = new daum.maps.Size(38, 47); 
    for(var i = 0; i < markers.length; i++){
    	var imageSrc = "/resources/img/icon/marker/course/icon_course_inner_g"+(i+1)+".png"; 
		var position = markers[i].getPosition();
		var currentLat = position.Ha.toFixed(5);
		var currentLng = position.Ga.toFixed(5);
		if(strLat == currentLat && strLng == currentLng){
			markers[i].setZIndex(2);
			imageSrc = "/resources/img/icon/marker/course/icon_course_inner_"+(i+1)+".png";
		}else{
			markers[i].setZIndex(1);
		}
    	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    	markers[i].setImage(markerImage)
	}
}

function hideMarker(map){
	for(var i = 0; i < markers.length; i++){
		markers[i].setMap(null);
	}
}

//마커를 표시할 위치와 title 객체 배열입니다 
function makePositionInfo(Title, LatLng, Content){
	var value = {
			title : Title,
			latlng : LatLng,
			content : Content,
	}
	return value;
}

function markersGetLength(positions){
	//초기화
	lengths = [];

	for(var i = 0; i < positions.length -1; i++){
		var paths = [];
		var polyline = new daum.maps.Polyline();
		
		paths.push(positions[i].latlng);
		paths.push(positions[i+1].latlng);
		
		polyline.setPath(paths);
		
		lengths[i] = Math.round(polyline.getLength());
		
	}
	
	for(var i in lengths){
		
	}
	
}

function pf_totalStreet(){
	var totalVal = 0;
	$('.distance').each(function(){
		var value = $(this).text();
		var lastNum = value.indexOf('km');
		var distance = Number(value.substr(0,lastNum));
		totalVal += distance
	});
	totalVal = totalVal.toFixed(2)
	$('.totalDistance').text('총 ' + totalVal+ 'km');
}

function pf_detailPage(url){
	location.href=url
}
</script>

