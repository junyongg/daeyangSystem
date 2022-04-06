<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/i18n/defaults-*.min.js"></script>

<style>

.checksize{
 width: 20% !important;
 margin-bottom: 5px !important;
}
#dt_basic tbody tr {cursor:pointer;}
form .error {color:red}

.checkbox-inline+.checkbox-inline, .radio-inline+.radio-inline {margin-left:0;}
.checkbox-inline, .radio-inline {margin-right:10px;}

.map {position:relative; width:100%;height:400px;border:1px solid #eee;padding:5px;}
.map #moveMapBtnBox {position:absolute;right:5px;top:5px;z-index: 10 }

</style>

<form:form id="Form" name="Form" method="post" action="">
<input type="hidden" name="DPP_KEYNO" id="DPP_KEYNO">
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6" id="menu_1" style="width: 70%;">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
				data-widget-editbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i>
					</span>
					<h2>공급자(발전소) 리스트</h2>
				</header>
				<div class="widget-body " >
					<div class="widget-body-toolbar bg-color-white">
							<div class="pageNumberBox">
								<c:if test="${not empty resultList }">
<!-- 									<div class="col-sm-6 col-xs-12" -->
<!-- 										style="line-height: 35px; text-align: left;"> -->
<!-- 										<span class="pagetext">총 -->
<%-- 											${paginationInfo.totalRecordCount }건 / 총 --%>
<%-- 											${paginationInfo.totalPageCount} 페이지 중 --%>
<%-- 											${paginationInfo.currentPageNo} 페이지 </span> --%>
<!-- 									</div> -->
									<div class="col-sm-6 col-xs-12 middlePage"
										style="text-align: right;">
										<ul class="pageNumberUl">
											<ui:pagination paginationInfo="${paginationInfo }"
												type="normal_board" jsFunction="pf_LinkPage" />
										</ul>
									</div>
								</c:if>
<%-- 								<c:if test="${empty resultList }"> --%>
<!-- 									<div class="col-sm-6 col-xs-12" -->
<!-- 										style="line-height: 35px; text-align: left;"> -->
<!-- 										<span class="pagetext">0건 중 0~0번째 결과(총 -->
<%-- 											${paginationInfo.totalRecordCount }건중 매칭된 데이터)</span> --%>
<!-- 									</div> -->
<%-- 								</c:if> --%>
								<div style="clear: both"></div>
							</div>

							<div class="tableMobileWrap">
								<table id="dt_basic"
									class="pagingTable table table-striped table-bordered table-hover"
									width="100%">
									<thead>
										<%-- 모든필드 , 게시글 갯수 시작  --%>
										<tr>
											<th colspan="10">
												<div style="float: left;">
													<input type="text" class="form-control search-control"
														data-searchindex="all" placeholder="모든필드 검색"
														style="width: 200px; display: inline-block;" />
													<button class="btn btn-sm btn-primary smallBtn"
														type="button" onclick="pf_LinkPage()"
														style="margin-right: 10px;">
														<i class="fa fa-plus"></i> 검색
													</button>
												</div>
											</th>
										</tr>
										<%-- 모든필드  ,  엑셀다운, 게시글 갯수 끝  --%>
										<tr>
											<th>선택</th>
											<th class="hasinput"><input type="text"
												class="form-control search-control" data-searchindex="1"
												placeholder="번호 검색" /></th>
											<th class="hasinput"><input type="text"
												class="form-control search-control" data-searchindex="2"
												placeholder="발전소 검색" /></th>
											<th class="hasinput"><input type="text"
												class="form-control search-control" data-searchindex="3"
												placeholder="주소 검색" /></th>
											<th class="hasinput" ><input type="text"
												class="form-control search-control" data-searchindex="4"
												placeholder="이메일 검색" /></th>
											<th class="hasinput" ><input type="text"
												class="form-control search-control" data-searchindex="5"
												placeholder="날짜 검색" /></th>
											<th class="hasinput" data-searchindex="6"></th>
										</tr>
										<%-- 화살표 정렬 --%>
										<tr>
											<th style="width: 50px;"><input type="checkbox" name="" value=""></td>
											<th class="arrow" data-index="1">사업자 번호</th>
											<th class="arrow" data-index="2">발전소 명</th>
											<th class="arrow" data-index="3">주소</th>
											<th class="arrow" data-index="4">이메일</th>
											<th class="arrow" data-index="6">날짜</th>
											<th class="arrow" data-index="5" style="width: 50px;">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty resultList }">
											<tr>
												<td colspan="7">검색된 데이터가 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach items="${resultList }" var="model">
											<tr>
												<td><input type="checkbox" name="color" value="blue"></td>
												<td>${model.COUNT}</td>
												<td>${model.DPP_AREA}</td>
												<td><a href="javascript:;"
													onclick="detailData('${model.DPP_KEYNO}')">${model.DPP_NAME}</a></td>
												<td>${model.DPP_INVER_COUNT}</td>
												<td>${model.DPP_DATE}</td>
												<td>${model.DPP_DATE}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<%-- 하단 페이징 --%>
<!-- 							<div class="pageNumberBox dt-toolbar-footer"> -->
<%-- 								<c:if test="${not empty resultList }"> --%>
<!-- 									<div class="col-sm-6 col-xs-12" -->
<!-- 										style="line-height: 35px; text-align: left;"> -->
<!-- 										<span class="pagetext">총 -->
<%-- 											${paginationInfo.totalRecordCount }건 / 총 --%>
<%-- 											${paginationInfo.totalPageCount} 페이지 중 --%>
<%-- 											${paginationInfo.currentPageNo} 페이지</span> --%>
<!-- 									</div> -->
<!-- 									<div class="col-sm-6 col-xs-12" style="text-align: right;"> -->
<!-- 										<ul class="pageNumberUl"> -->
<%-- 											<ui:pagination paginationInfo="${paginationInfo }" --%>
<%-- 												type="normal_board" jsFunction="pf_LinkPage" /> --%>
<!-- 										</ul> -->
<!-- 									</div> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${empty resultList }"> --%>
<!-- 									<div class="col-sm-6 col-xs-12" -->
<!-- 										style="line-height: 35px; text-align: left;"> -->
<!-- 										<span class="pagetext">0건 중 0~0번째 결과(총 -->
<%-- 											${paginationInfo.totalRecordCount }건중 매칭된 데이터)</span> --%>
<!-- 									</div> -->
<%-- 								</c:if> --%>
<!-- 							</div> -->
							<div style="text-align: center;">
							<button class="btn btn-sm btn-primary" id="insertButton"
								type="button" onclick="" style="width : 100px;">국세청 전송</button>
							</div>
							<!-- <div class="widget-body-toolbar bg-color-white">
						<div class="row"> 
							<div class="col-sm-12 col-md-2 text-align-right" style="float:right;">
								<div class="btn-group">
									<button class="btn btn-sm btn-primary" type="button" onclick="pf_openInsertPopup();">
										<i class="fa fa-plus"></i> 발전소 등록
									</button> 
								</div>
							</div>
						</div>
					</div> -->
<!-- 					<div class="table-responsive"> -->
<%-- 						<jsp:include page="/WEB-INF/jsp/dyAdmin/include/search/pra_search_header_paging.jsp" flush="true"> --%>
<%-- 							<jsp:param value="/dyAdmin/bills/clientpagingAjax.do" name="pagingDataUrl" /> --%>
<%-- 							<jsp:param value="/dyAdmin/person/view/excelAjax.do" name="excelDataUrl" /> --%>
<%-- 						</jsp:include> --%>
<!-- 						<fieldset id="tableWrap"> -->
<!-- 						</fieldset> -->
<!-- 					</div> -->
				
			</div>
		</article>
		
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6" id="menu_2" style="width: 30%; left:0px;" >
				<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
					data-widget-editbutton="false" >
					<header>
						<span class="widget-icon"> <i class="fa fa-table"></i>
						</span>
						<h2>공급 받는자 등록/수정</h2>
					</header>
					<div class="widget-body ">
						<div class="widget-body-toolbar bg-color-white">
							<div class="row">
								<div class="col-sm-6 col-md-6 text-align-right"
									style="float: right;">
									<div class="btn-group">
										<button class="btn btn-sm btn-primary" id="insertButton"
											type="button" onclick="Inver_Insert();">저장</button>
										<button class="btn btn-sm btn-danger" type="button"
											onclick="cancle()">취소</button>
									</div>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<!-- insert -->
							<!-- 발전소 리스트 -->
							<div id="power-insert" title="발전소 등록" style="width: 100%; margin-left: 20px;">
								<div class="widget-body ">
									<fieldset>
										<div class="form-horizontal">
											<div class="bs-example necessT" style="text-align: center;">
												<span class="colorR fs12">*표시는 필수 입력 항목입니다.</span>
											</div>
											<fieldset>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 선택</label>
													<div class="col-md-6">
														<select class="form-control DPP_NAME" name="DPP_NAME" id="DPP_NAME" value="" maxlength="30">
														<option>1</option>
														<option>2</option>
														<option>3</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 사업자 번호</label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_NAME"
															name="DPP_NAME" id="DPP_NAME" value="" maxlength="30">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 종 사업장 번호</label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_VOLUM"
															id="DPP_VOLUM" name="DPP_VOLUM" value="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 상호명</label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_AREA"
															id="DPP_AREA" name="DPP_AREA" value="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 관리자 성명</label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_AREA"
															id="DPP_AREA" name="DPP_AREA" value="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 사업장</label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_AREA"
															id="DPP_AREA" name="DPP_AREA" value="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 업태 </label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_LOCATION"
															id="DPP_LOCATION" name="DPP_LOCATION" value="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 종목 </label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_LOCATION"
															id="DPP_LOCATION" name="DPP_LOCATION" value="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 이메일 </label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_INVER"
															id="DPP_INVER" name="DPP_INVER" value="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 금액</label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_INVER"
															id="DPP_INVER" name="DPP_INVER" value="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan">*</span> 품목 </label>
													<div class="col-md-6">
														<input type="text" class="form-control DPP_INVER"
															id="DPP_INVER" name="DPP_INVER" value="">
													</div>
												</div>
											</fieldset>
										</div>
									</fieldset>
								</div>
							</div>
							<!-- endInsert -->

						</div>
					</div>
				</div>
			</article>
		
	</div>
</section>
</form:form>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${sp:getString('DAUM_APPKEY')}&libraries=services"></script>

<script type="text/javascript">
// var map;

// $(document).ready(function() {
// 	pf_setMap('${resultData.DDP_X_LOCATION}','${resultData.DDP_Y_LOCATION}');
// 	SerialNumber("1");
// });

// function validation(){
// 	if($("#DPP_NAME").val() == ''){alert("발전소 이름을 입력하세요!"); return false}
// 	if($("#DPP_STATUS").val() == ''){alert("발전소 개통 상태를 확인하세요!"); return false}
// 	if($("#DPP_USER").val() == ''){alert("유저를 등록해주세요!"); return false}
// 	if($("#DPP_VOLUM").val() == ''){alert("발전소 용량을 입력하세요!"); return false}
// 	if($("#DPP_AREA").val() == ''){alert("발전소 지역을 입력하세요!"); return false}
// 	if($("#DPP_LOCATION").val() == ''){alert("발전소 주소를 검색해주세요!"); return false}
// 	if($("#DPP_X_LOCATION").val() == ''){alert("지도에서 주소 위로 이동을 클릭해주세요!"); return false}
// 	if($("#INVER_COUNTN").val() == ''){alert("인버터 갯수를 입력하세요!"); return false}
// 	if($("input[name='DPP_SN']").val() == ''){alert("인버터 s/n를 입력하세요!"); return false}
	
// 	return true;
// 	}


// function noSpaceForm(obj) { // 공백사용못하게
//     var str_space = /\s/;  // 공백체크
//     if(str_space.exec(obj.value)) { //공백 체크
//         alert("비밀 번호에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
//         obj.focus();
//         obj.value = obj.value.replace(' ',''); // 공백제거
//         return false;
//     }
// }

// //주소 찾기
// function pf_execDaumPostcode() {
//   new daum.Postcode({
//       oncomplete: function(data) {
//           // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
//           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
//           var roadAddr = data.roadAddress || data.jibunAddress; // 도로명 주소 변수
//           // 우편번호와 주소 정보를 해당 필드에 넣는다.
//           document.getElementById('DPP_LOCATION').value = data.zonecode +'//'+roadAddr;
// //           document.getElementById("TC_ADDR").value = roadAddr;
//       }
//   }).open();
// }


// //발전소 등록
// function Inver_Insert(){
// 	 if(validation()){
// 		 $.ajax({
// 				type: "POST",
// 				url: "/dyAdmin/powerPlant/Inverter_insert.do",
// 				async: false,
// 				data: $('#Form').serializeArray(),
// 				success : function(){
//  					cf_smallBox('수정 완료', "발전소 등록 완료", 3000,);
// 				}, 
// 				error: function(){
// 					cf_smallBox('error', "발전소 등록 에러", 3000,'#d24158');
// 				}
// 		}); 
// 	 }
// }
// //발전소 수정
// function Inver_Update(){
// 	 if(validation()){
// 		 $.ajax({
// 				type: "POST",
// 				url: "/dyAdmin/powerPlant/Inverter_update.do",
// 				async: false,
// 				data: $('#Form').serializeArray(),
// 				success : function(){
// 					cf_smallBox('수정 완료', "발전소 수정 완료", 3000,);
// 				}, 
// 				error: function(){
// 					cf_smallBox('error', "발전소 등록 에러", 3000,'#d24158');
// 				}
// 		}); 
// 	 }
// }

// function pf_setMap(lat,lng){
// 	$("#DDP_Map").html("")
// 	var isDefault = !(lat && lng);
	
// 	lat = lat || "${sp:getData('defaultX_Location')}";
// 	lng = lng || "${sp:getData('defaultY_Location')}";
	
// 	var container = document.getElementById("DDP_Map");
// 	var options = {
// 		center: new kakao.maps.LatLng(lat, lng),
// 		level: 3
// 	};

// 	map = new daum.maps.Map(container, options);
	
// 	map.setMapTypeId(kakao.maps.MapTypeId.HYBRID); 
	
// 	marker = new daum.maps.Marker({ 
// 	    // 지도 중심좌표에 마커를 생성합니다 
// 	    position: map.getCenter() 
// 	}); 
	
	
// 	if(!isDefault){
// 		marker.setMap(map);
// 	}
	
// 	daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
// 	    // 클릭한 위도, 경도 정보를 가져옵니다 
// 	    var latlng = mouseEvent.latLng; 
// 	    pf_setMarker(latlng);
// 	});
// }


// function pf_setMarker(latLng){
	
// 	marker.setMap(map);
// 	// 마커 위치를 클릭한 위치로 옮깁니다
//   	marker.setPosition(latLng);
  
//   $('#DPP_X_LOCATION').val(latLng.getLat());
//   $('#DPP_Y_LOCATION').val(latLng.getLng());
// }


// function pf_moveMap(){
// 	var address = $('#DPP_LOCATION').val();
// 	arr = address.split("//")
// 	address = arr[1].trim();
	
// 	var geocoder = new daum.maps.services.Geocoder();
// 	// 주소로 좌표를 검색합니다
// 	geocoder.addressSearch(address, function(result, status) {

// 	    // 정상적으로 검색이 완료됐으면 
// 	     if (status === daum.maps.services.Status.OK) {

// 	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

// 	        // 결과값으로 받은 위치를 마커로 표시합니다
// 	       	pf_setMarker(coords);
// 	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
// 	        map.setCenter(coords);
// 	    }else{
// 	    	cf_smallBox('지도', '주소값이 없거나 주소로 해당 위치를 찾을 수 없습니다.', 3000,'gray');
// 	    }
// 	}); 
	
// }

// function detailData(keyno){
// 	$.ajax({
// 		type: "POST",
// 		url: "/dyAdmin/powerPlant/Inverter_data.do",
// 		async: false,
// 		data: {
// 			DPP_KEYNO : keyno
// 		},
// 		success : function(data){
			
// 			SN_Detail(data.DPP_INVER_COUNT,data.DPP_SN)
			
// 			$("#DPP_KEYNO").val(data.DPP_KEYNO)
// 			$("#DPP_NAME").val(data.DPP_NAME)
// 			$("#DPP_AREA").val(data.DPP_AREA)
// 			$("#DPP_STATUS").val(data.DPP_STATUS)
// 			$("#DPP_USER").val(data.DPP_USER)
// 			$("#DPP_VOLUM").val(data.DPP_VOLUM)
// 			$("#DPP_LOCATION").val(data.DPP_LOCATION)
// 			$("#DPP_X_LOCATION").val(data.DPP_X_LOCATION)
// 			$("#DPP_Y_LOCATION").val(data.DPP_Y_LOCATION)
// 			$("#DPP_INVER").val(data.DPP_INVER)
// 			$("#DPP_INVER_COUNT").val(data.DPP_INVER_COUNT)
			
						
// // 			var coords = new daum.maps.LatLng(data.DPP_Y_LOCATION, data.DPP_X_LOCATION);
// 			pf_setMap(data.DPP_X_LOCATION,data.DPP_Y_LOCATION );
			
// 			$("#insertButton").text("수정");
// 			$("#insertButton").attr("onclick","Inver_Update()");
// 		}, 
// 		error: function(){
// 			cf_smallBox('error', "발전소 등록 에러", 3000,'#d24158');
// 		}
// 	}); 
// }

// function cancle(){
// 	$("#DPP_NAME").val('')
// 	$("#DPP_AREA").val('')
// 	$("#DPP_STATUS").val('')
// 	$("#DPP_USER").val('')
// 	$("#DPP_VOLUM").val('')
// 	$("#DPP_LOCATION").val('')
// 	$("#DPP_X_LOCATION").val('')
// 	$("#DPP_Y_LOCATION").val('')
// 	$("#DPP_INVER").val('')
// 	$("#DPP_INVER_COUNT").val('')
// 	$("input[name='DPP_SN']").val('')
// }

// function SerialNumber(number,snlist){
// 	var num = Number(number)
// 	input = ''
// 	if(num > 0){
// 		for(var i=1;i<=num;i++){
// 			if(snlist !=null ){
// 				input += '<input type="text" class="form-control Serial_num" name="DPP_SN"  value="'+snlist[i-1]+'" placeholder="'+i+'호" style="margin-bottom: 5px;">'
// 			}else{
// 				input += '<input type="text" class="form-control Serial_num" name="DPP_SN"  value="" placeholder="'+i+'호" style="margin-bottom: 5px;">'
// 			}
// 		}	
// 	}
	
// 	$("#sn_insert").html(input)
// }

// function SN_Detail(num,list){
// 	var snlist = []
// 	if(list != null){
//     	snlist = list.split(",")	
//     }
//     SerialNumber(num,snlist)
// }

</script>