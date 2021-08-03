<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${sp:getString('DAUM_APPKEY')}&libraries=services"></script>
<script type="text/javascript">
var LAT = '${resultData.TC_LAT}';
var LNG = '${resultData.TC_LNG}';

//지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];
var markerTracker = [];


$(function(){
	pf_around();
});


/**
 * AbstractOverlay를 상속받을 객체를 선언합니다.
 */
var clickCk = false;
function TooltipMarker(position, tooltipText, clickCk,imageSrc) {

    this.position = position;
    var node = this.node = document.createElement('div');
    node.className = 'node';

    var tooltip = document.createElement('div');
    tooltip.className = 'customoverlay',
	
    tooltip.appendChild(document.createTextNode(tooltipText));
    node.appendChild(tooltip);
    
    var newAttribute = document.createAttribute("style"); // 새로운 style 속성 노드를 생성함.
    newAttribute.value = "background-image: url("+imageSrc+")";
    node.setAttributeNode(newAttribute);   
    
    // 툴팁 엘리먼트에 마우스 인터렉션에 따라 보임/숨김 기능을 하도록 이벤트를 등록합니다.
    	node.onclick = function() {
	    	if(!clickCk){
		    	tooltip.style.display = 'block';
		    	clickCk = true;
		    }else{
		    	tooltip.style.display = 'none';
		    	clickCk = false;
		    }
	    };
}

// AbstractOverlay 상속. 프로토타입 체인을 연결합니다.
TooltipMarker.prototype = new daum.maps.AbstractOverlay;

// AbstractOverlay의 필수 구현 메소드.
// setMap(map)을 호출했을 경우에 수행됩니다.
// AbstractOverlay의 getPanels() 메소드로 MapPanel 객체를 가져오고
// 거기에서 오버레이 레이어를 얻어 생성자에서 만든 엘리먼트를 자식 노드로 넣어줍니다.
TooltipMarker.prototype.onAdd = function() {
    var panel = this.getPanels().overlayLayer;
    panel.appendChild(this.node);
};

// AbstractOverlay의 필수 구현 메소드.
// setMap(null)을 호출했을 경우에 수행됩니다.
// 생성자에서 만든 엘리먼트를 오버레이 레이어에서 제거합니다.
TooltipMarker.prototype.onRemove = function() {
    this.node.parentNode.removeChild(this.node);
};

// AbstractOverlay의 필수 구현 메소드.
// 지도의 속성 값들이 변화할 때마다 호출됩니다. (zoom, center, mapType)
// 엘리먼트의 위치를 재조정 해 주어야 합니다.
TooltipMarker.prototype.draw = function() {
    // 화면 좌표와 지도의 좌표를 매핑시켜주는 projection객체
    var projection = this.getProjection();
    
    // overlayLayer는 지도와 함께 움직이는 layer이므로
    // 지도 내부의 위치를 반영해주는 pointFromCoords를 사용합니다.
    var point = projection.pointFromCoords(this.position);

    // 내부 엘리먼트의 크기를 얻어서
    var width = this.node.offsetWidth;
    var height = this.node.offsetHeight;

    // 해당 위치의 정중앙에 위치하도록 top, left를 지정합니다.
    this.node.style.left = (point.x - width/2) + "px";
    this.node.style.top = (point.y - height/2) + "px";
};

// 좌표를 반환하는 메소드
TooltipMarker.prototype.getPosition = function() {
    return this.position;
};

/**
 * 지도 영역 외부에 존재하는 마커를 추적하는 기능을 가진 객체입니다.
 * 클리핑 알고리즘을 사용하여 tracker의 좌표를 구하고 있습니다.
 */
function MarkerTracker(map, target,imageSrc) {
    // 클리핑을 위한 outcode
    var OUTCODE = {
        INSIDE: 0, // 0b0000
        TOP: 8, //0b1000
        RIGHT: 2, // 0b0010
        BOTTOM: 4, // 0b0100
        LEFT: 1 // 0b0001
    };
    
    // viewport 영역을 구하기 위한 buffer값
    // target의 크기가 60x60 이므로 
    // 여기서는 지도 bounds에서 상하좌우 30px의 여분을 가진 bounds를 구하기 위해 사용합니다.
    var BOUNDS_BUFFER = 30;
    
    // 클리핑 알고리즘으로 tracker의 좌표를 구하기 위한 buffer값
    // 지도 bounds를 기준으로 상하좌우 buffer값 만큼 축소한 내부 사각형을 구하게 됩니다.
    // 그리고 그 사각형으로 target위치와 지도 중심 사이의 선을 클리핑 합니다.
    // 여기서는 tracker의 크기를 고려하여 40px로 잡습니다.
    var CLIP_BUFFER = 40;

    // trakcer 엘리먼트
    var tracker = document.createElement('div');
    tracker.className = 'tracker';

    // 내부 아이콘
    var icon = document.createElement('div');
    icon.className = 'icon';
    var newAttribute = document.createAttribute("style"); // 새로운 style 속성 노드를 생성함.
    newAttribute.value = "background-image: url("+imageSrc+")";
    icon.setAttributeNode(newAttribute);   

    // 외부에 있는 target의 위치에 따라 회전하는 말풍선 모양의 엘리먼트
    var balloon = document.createElement('div');
    balloon.className = 'balloon';

    tracker.appendChild(balloon);
    tracker.appendChild(icon);

    map.getNode().appendChild(tracker);

    // traker를 클릭하면 target의 위치를 지도 중심으로 지정합니다.
    tracker.onclick = function() {
        map.setCenter(target.getPosition());
        setVisible(false);
    };

    // target의 위치를 추적하는 함수
    function tracking() {
        var proj = map.getProjection();
        
        // 지도의 영역을 구합니다.
        var bounds = map.getBounds();
        
        // 지도의 영역을 기준으로 확장된 영역을 구합니다.
        var extBounds = extendBounds(bounds, proj);

        // target이 확장된 영역에 속하는지 판단하고
        if (extBounds.contain(target.getPosition())) {
            // 속하면 tracker를 숨깁니다.
            setVisible(false);
        } else {
            // target이 영역 밖에 있으면 계산을 시작합니다.
            

            // 지도 bounds를 기준으로 클리핑할 top, right, bottom, left를 재계산합니다.
            //
            //  +-------------------------+
            //  | Map Bounds              |
            //  |   +-----------------+   |
            //  |   | Clipping Rect   |   |
            //  |   |                 |   |
            //  |   |        *       (A)  |     A
            //  |   |                 |   |
            //  |   |                 |   |
            //  |   +----(B)---------(C)  |
            //  |                         |
            //  +-------------------------+
            //
            //        B
            //
            //                                       C
            // * 은 지도의 중심,
            // A, B, C가 TooltipMarker의 위치,
            // (A), (B), (C)는 각 TooltipMarker에 대응하는 tracker입니다.
            // 지도 중심과 각 TooltipMarker를 연결하는 선분이 있다고 가정할 때,
            // 그 선분과 Clipping Rect와 만나는 지점의 좌표를 구해서
            // tracker의 위치(top, left)값을 지정해주려고 합니다.
            // tracker 자체의 크기가 있기 때문에 원래 지도 영역보다 안쪽의 가상 영역을 그려
            // 클리핑된 지점을 tracker의 위치로 사용합니다.
            // 실제 tracker의 position은 화면 좌표가 될 것이므로 
            // 계산을 위해 좌표 변환 메소드를 사용하여 모두 화면 좌표로 변환시킵니다.
            
            // TooltipMarker의 위치
            var pos = proj.containerPointFromCoords(target.getPosition());
            
            // 지도 중심의 위치
            var center = proj.containerPointFromCoords(map.getCenter());

            // 현재 보이는 지도의 영역의 남서쪽 화면 좌표
            var sw = proj.containerPointFromCoords(bounds.getSouthWest());
            
            // 현재 보이는 지도의 영역의 북동쪽 화면 좌표
            var ne = proj.containerPointFromCoords(bounds.getNorthEast());
            
            // 클리핑할 가상의 내부 영역을 만듭니다.
            var top = ne.y + CLIP_BUFFER;
            var right = ne.x - CLIP_BUFFER;
            var bottom = sw.y - CLIP_BUFFER;
            var left = sw.x + CLIP_BUFFER;

            // 계산된 모든 좌표를 클리핑 로직에 넣어 좌표를 얻습니다.
            var clipPosition = getClipPosition(top, right, bottom, left, center, pos);
            
            // 클리핑된 좌표를 tracker의 위치로 사용합니다.
            tracker.style.top = clipPosition.y + 'px';
            tracker.style.left = clipPosition.x + 'px';

            // 말풍선의 회전각을 얻습니다.
            var angle = getAngle(center, pos);
            
            // 회전각을 CSS transform을 사용하여 지정합니다.
            // 브라우저 종류에따라 표현되지 않을 수도 있습니다.
            // http://caniuse.com/#feat=transforms2d
            balloon.style.cssText +=
                '-ms-transform: rotate(' + angle + 'deg);' +
                '-webkit-transform: rotate(' + angle + 'deg);' +
                'transform: rotate(' + angle + 'deg);';

            // target이 영역 밖에 있을 경우 tracker를 노출합니다.
            setVisible(true);
        }
    }

    // 상하좌우로 BOUNDS_BUFFER(30px)만큼 bounds를 확장 하는 함수
    //
    //  +-----------------------------+
    //  |              ^              |
    //  |              |              |
    //  |     +-----------------+     |
    //  |     |                 |     |
    //  |     |                 |     |
    //  |  <- |    Map Bounds   | ->  |
    //  |     |                 |     |
    //  |     |                 |     |
    //  |     +-----------------+     |
    //  |              |              |
    //  |              v              |
    //  +-----------------------------+
    //  
    // 여기서는 TooltipMaker가 완전히 안보이게 되는 시점의 영역을 구하기 위해서 사용됩니다.
    // TooltipMarker는 60x60 의 크기를 가지고 있기 때문에 
    // 지도에서 완전히 사라지려면 지도 영역을 상하좌우 30px만큼 더 드래그해야 합니다.
    // 이 함수는 현재 보이는 지도 bounds에서 상하좌우 30px만큼 확장한 bounds를 리턴합니다.
    // 이 확장된 영역은 TooltipMarker가 화면에서 보이는지를 판단하는 영역으로 사용됩니다.
    function extendBounds(bounds, proj) {
        // 주어진 bounds는 지도 좌표 정보로 표현되어 있습니다.
        // 이것을 BOUNDS_BUFFER 픽셀 만큼 확장하기 위해서는
        // 픽셀 단위인 화면 좌표로 변환해야 합니다.
        var sw = proj.pointFromCoords(bounds.getSouthWest());
        var ne = proj.pointFromCoords(bounds.getNorthEast());

        // 확장을 위해 각 좌표에 BOUNDS_BUFFER가 가진 수치만큼 더하거나 빼줍니다.
        sw.x -= BOUNDS_BUFFER;
        sw.y += BOUNDS_BUFFER;

        ne.x += BOUNDS_BUFFER;
        ne.y -= BOUNDS_BUFFER;

        // 그리고나서 다시 지도 좌표로 변환한 extBounds를 리턴합니다.
        // extBounds는 기존의 bounds에서 상하좌우 30px만큼 확장된 영역 객체입니다.  
        return new daum.maps.LatLngBounds(
                        proj.coordsFromPoint(sw),proj.coordsFromPoint(ne));
        
    }


    // Cohen–Sutherland clipping algorithm
    // 자세한 내용은 아래 위키에서...
    // https://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland_algorithm
    function getClipPosition(top, right, bottom, left, inner, outer) {
        function calcOutcode(x, y) {
            var outcode = OUTCODE.INSIDE;

            if (x < left) {
                outcode |= OUTCODE.LEFT;
            } else if (x > right) {
                outcode |= OUTCODE.RIGHT;
            }

            if (y < top) {
                outcode |= OUTCODE.TOP;
            } else if (y > bottom) {
                outcode |= OUTCODE.BOTTOM;
            }

            return outcode;
        }

        var ix = inner.x;
        var iy = inner.y;
        var ox = outer.x;
        var oy = outer.y;

        var code = calcOutcode(ox, oy);

        while(true) {
            if (!code) {
                break;
            }

            if (code & OUTCODE.TOP) {
                ox = ox + (ix - ox) / (iy - oy) * (top - oy);
                oy = top;
            } else if (code & OUTCODE.RIGHT) {
                oy = oy + (iy - oy) / (ix - ox) * (right - ox);        
                ox = right;
            } else if (code & OUTCODE.BOTTOM) {
                ox = ox + (ix - ox) / (iy - oy) * (bottom - oy);
                oy = bottom;
            } else if (code & OUTCODE.LEFT) {
                oy = oy + (iy - oy) / (ix - ox) * (left - ox);     
                ox = left;
            }

            code = calcOutcode(ox, oy);
        }

        return {x: ox, y: oy};
    }

    // 말풍선의 회전각을 구하기 위한 함수
    // 말풍선의 anchor가 TooltipMarker가 있는 방향을 바라보도록 회전시킬 각을 구합니다.
    function getAngle(center, target) {
        var dx = target.x - center.x;
        var dy = center.y - target.y ;
        var deg = Math.atan2( dy , dx ) * 180 / Math.PI; 

        return ((-deg + 360) % 360 | 0) + 90;
    }
    
    // tracker의 보임/숨김을 지정하는 함수
    function setVisible(visible) {
        tracker.style.display = visible ? 'block' : 'none';
    }
    
    // Map 객체의 'zoom_start' 이벤트 핸들러
    function hideTracker() {
        setVisible(false);
    }
    
    // target의 추적을 실행합니다.
    this.run = function() {
        daum.maps.event.addListener(map, 'zoom_start', hideTracker);
        daum.maps.event.addListener(map, 'zoom_changed', tracking);
        daum.maps.event.addListener(map, 'center_changed', tracking);
        tracking();
    };
    
    // target의 추적을 중지합니다.
    this.stop = function() {
        daum.maps.event.removeListener(map, 'zoom_start', hideTracker);
        daum.maps.event.removeListener(map, 'zoom_changed', tracking);
        daum.maps.event.removeListener(map, 'center_changed', tracking);
        setVisible(false);
    };
}

var b_map;
function pf_setMap2(lat,lng,positions){

	var level_val = 2;
	var distance_val = $("#distance").val();
	
	if(distance_val == 0.5){
		level_val = 2;
	}else if(distance_val == 1){
		level_val = 3;
	}else if(distance_val == 2){
		level_val = 4;
	}else if(distance_val == 3){
		level_val = 5;
	}
	
	 var container = document.getElementById('b_map'),// 지도를 표시할 div  
		options = { 
		    center: new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
		    level: level_val // 지도의 확대 레벨
		};
	
	 if(b_map == null || b_map == ""){
		 b_map = new daum.maps.Map(container, options);
	 }else{
		 $("#b_map").empty();
		 b_map = new daum.maps.Map(container, options);
	 }
	 //마커 초기화
	 hideMarker(b_map);
	 markers = [];
	 markerTracker = [];
	 
	 // 마커 이미지의 이미지 주소입니다
// 	 var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	
	 for(var i in positions){
		// 마커 이미지의 이미지 크기 입니다
	    var imageSize = new daum.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
// 	    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
	    var markerImage = new daum.maps.MarkerImage(positions[i].imageSrc, imageSize); 
	    
	    clickCk = false;
	    marker = new TooltipMarker(positions[i].latlng, positions[i].title, clickCk,positions[i].imageSrc);
	    marker.setMap(b_map);
	    var markerTracker = new MarkerTracker(b_map, marker,positions[i].imageSrc);

	    markerTracker.run();
	    
// 	    markers.push(marker);
	    
	 	//custom
// 	    var overlay = new daum.maps.CustomOverlay({
// 	    	content : '<div class="customoverlay"><span class="title">' + positions[i].content + '</span></div>', // 인포윈도우에 표시할 내용
// 	    	position : positions[i].latlng,
// 	    	yAnchor: 0
// 	    })
	    
	 	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	   
// 	    daum.maps.event.addListener(marker, 'click', makeOverListener(b_map, marker, overlay));
	    
     }
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, overlay) {
    return function() {
    	if(overlay.getMap()){
    		overlay.setMap(null);
    	}else{
    		overlay.setMap(map);
    	}
    };
}

function hideMarker(map){
	for(var i = 0; i < markers.length; i++){
		markers[i].setMap(null);
	}
}

function pf_around(obj,type){
	var positions = [];
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	positions.push(makePositionInfo('${resultData.TC_TITLE}', new daum.maps.LatLng(LAT, LNG),'${resultData.TC_TITLE}',imageSrc));
	if(type){
		$('#'+type).val($(obj).find('.txt').data('val'));
	}
	//distance, TC_TYPE active 주기
	if(type == 'TC_TYPE'){
		$('.map-in-tab-1 li.TypeDivision').removeClass().addClass('TypeDivision');
		$(obj).closest('li').addClass('active');
	}else if(type == 'distance'){
		$('.map-in-tab-1 li.DistanceDivision').removeClass().addClass('DistanceDivision');
		$(obj).closest('li').addClass('active2');
	}
	$.ajax({
		type: "POST",
		url:"/tour/around/searchAjax.do",
		data:$("#Form").serializeArray(),
		success: function(datas){
			var data = datas.list;
			var MenuType = datas.MenuType;
			var temp = '';
			if(data != null){
				$.each(data,function(i){
					var type = "MenuPage";
					if(data[i].MN_KEYNO == null || data[i].MN_KEYNO == ""){
						if(MenuType){
							type = MenuType;
						}else{
							type = "VirtruePage";
						}
					}
					var key = cf_setKeyno(data[i].KEYNO);
					temp +=	'<div class="item">';
			        temp += '  <div class="img-box">';
		        	temp += '<img src="'+data[i].FS_PATH+'">';
			        temp += '  </div>';
			        temp += '      <div class="letter-box">';
			        temp += '          <h2>'+data[i].TC_TITLE+'</h2>';
			        temp += '          <div class="loca-txt">';
			        if(data[i].TC_ADDR != null && data[i].TC_ADDR != ""){
			        	temp += '              <div class="one">';
				        temp += '                  <span class="icon"><i class="material-icons">location_on</i></span>';
				        temp += '                  <span class="txt">'+data[i].TC_ADDR+'</span>';
				        temp += '              </div>';
			        }
			        if(data[i].TC_CONTACTS != null && data[i].TC_CONTACTS != ""){
			        	temp += '              <div class="one">';
				        temp += '                  <span class="icon"><i class="material-icons">local_phone</i></span>';
				        temp += '                  <span class="txt">'+data[i].TC_CONTACTS+'</span>';
				        temp += '              </div>';
			        }
			        temp += '          </div>';
			        if(type != 'VirtruePage'){
				        temp += '          <div class="btn-box">';
				        temp += '              <button type="button" class="btn-more-insi" onclick="pf_location(\''+key+'\',\''+type+'\')">자세히 보기</button>';
				        temp += '          </div>';
			        }
			        temp += '     </div>';
			        temp += '</div>';
			        
			        if(data[i].TC_TYPE == '${TOUR_DESTINATION}'){
			        	imageSrc = "/resources/tour/img/marker/travel_marker_1.png";
			        }else if(data[i].TC_TYPE == '${TOUR_RESTAURANT}'){
			        	imageSrc = "/resources/tour/img/marker/travel_marker_2.png";
			        }else if(data[i].TC_TYPE == '${TOUR_LODGMENT}'){
			        	imageSrc = "/resources/tour/img/marker/travel_marker_3.png";
			        }
			        positions.push(makePositionInfo(data[i].TC_TITLE, new daum.maps.LatLng(data[i].TC_LAT, data[i].TC_LNG),data[i].TC_TITLE,imageSrc));
				});
			}
			pf_setMap2(LAT,LNG,positions);
			
			$('#AroundInfo').html(temp);
		},
		error: function(){
			alert("에러 발생. 관리자한테 문의하세요.");
			return false;
		}
	});
}

//마커를 표시할 위치와 title 객체 배열입니다 
function makePositionInfo(Title, LatLng, Content,imageSrc){
	var value = {
			title : Title,
			latlng : LatLng,
			content : Content,
			imageSrc : imageSrc
	}
	return value;
}
</script>

