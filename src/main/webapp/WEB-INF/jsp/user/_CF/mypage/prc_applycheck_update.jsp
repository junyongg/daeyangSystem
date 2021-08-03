<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<link href="/resources/common/css/calendar/TronixCalendar.css" rel="stylesheet" type="text/css" />
<link href="/resources/common/css/calendar/TronixCalendar2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" 	src="/resources/common/js/guide.js"></script>

<script src="/resources/smartadmin/js/plugin/moment/moment.min.js"></script>
<script src="/resources/api/fullcalendar/js/fullcalendar.js"></script>
<script src="/resources/api/fullcalendar/js/ko.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="/resources/api/fullcalendar/css/fullcalendar.css">
<link rel="stylesheet" type="text/css" href="/resources/common/css/program.css">

<style> 
	.blind{ display: none;}
	#receipt_pop_box{display: block;}
	.box_date_pick ul li.date_box { cursor:auto;}
	.receipt_pop_body1{width: 60%; margin: 0 auto;}
	.input_form input[type=text] {border: 1px solid #afafaf;}
</style>

<script>

var freePerson = parseInt("${remainCnt}");	//최대 참가인원
var minJoin = 10; 		//최소 참가인원

$(document).ready(function() {
	var join = parseInt($("#GP_HEADCOUNT").val());	 //참가 신청인원
	$("#freePerson").text(freePerson+join);
	/* 연락처 등록 처리 */
	$("#CT_BASIC_TEL_1").val("${userInfo.UI_PHONE}".split("-")[0]);
	$("#CT_BASIC_TEL_2").val("${userInfo.UI_PHONE}".split("-")[1]);
	$("#CT_BASIC_TEL_3").val("${userInfo.UI_PHONE}".split("-")[2]);
	
	/* 인솔자 정보 기본정보와 동일 처리*/
	var phone1 = $("#CT_BASIC_TEL_1").val()
	var phone2 = $("#CT_BASIC_TEL_2").val()
	var phone3 = $("#CT_BASIC_TEL_3").val()
	$("#basic_same").on("click", function() {
		if ($(this).is(":checked")) {
			$("#CT_LEADER_TEL_1").val(phone1);
			$("#CT_LEADER_TEL_2").val(phone2);
			$("#CT_LEADER_TEL_3").val(phone3);
			$("#GP_NAME").val($("#UI_NAME").val());
 		} else {
			$("#GP_NAME").val("");
			$(".CT_LEADER_TEL").val("");
		}
	});
	var phone = phone1 +"-"+ phone2 +"-"+ phone3;
	$("#GP_PHONE").val(phone);
	
	var traffic_checked = $("input[type=radio][name=GP_TRAFFIC]:checked").val();
	if(traffic_checked == 'C' || traffic_checked == 'E'){
		$(".subway_info").show();
		$(".bus_group_info").hide();
	}else if(traffic_checked == 'B'){
		$(".subway_info").hide();
		$(".bus_group_info").show();
	}
	/* 교통편 변경 */
	$("input[name=GP_TRAFFIC]").change(function(){
		$(".traffic_info").hide();
		var val = $(this).val();
		switch(val){
		case("C" || "E"):
			$(".subway_info").show();
			break;
		case "B":
			$(".bus_group_info").show();
			break;
		default:
			$(".subway_info").show();
			break;
		}
	});
});

/* ***********************************************************************************
 * 
 * ACC투어 신청
 * 
 *************************************************************************************/
 function pf_Update(){
	 layerPop = $(".online_regist");
	 
	 $("#confirm_notice_chk").removeAttr('checked');
	 
	//입력폼 체크 
	if ($("#CT_BASIC_TEL_1").val() == '' || $("#CT_BASIC_TEL_2").val() == '' || $("#CT_BASIC_TEL_3").val() == '') {
		alert("기본정보 연락처를 확인하세요.");
		$("#CT_BASIC_TEL_1").focus();
		return;
	}
	if ($("#GP_GROUPNAME").val() == '') {
		alert("단체명을 확인하세요.");
		$("#GP_GROUPNAME").focus();
		return;
	}
	if ($("#GP_NAME").val() == '') {
		alert("인솔자정보 인솔자명을 확인하세요.");
		$("#GP_NAME").focus();
		return;
	}
	if ($("#CT_LEADER_TEL_1").val() == '' || $("#CT_LEADER_TEL_2").val() == '' || $("#CT_LEADER_TEL_3").val() == '') {
		alert("인솔자정보 연락처를 확인하세요.");
		$("#CT_LEADER_TEL_1").focus();
		return;
	}
		
// 	var maxJoin = parseInt(freePerson); //최대 참가인원
	var maxJoin = parseInt($("#freePerson").text());
	var join = parseInt($("#GP_HEADCOUNT").val());	 //참가 신청인원
	
	if ($("#GP_HEADCOUNT").val() == "") {
		alert("참가인원을 확인하세요.");
		$("#GP_HEADCOUNT").focus();
		return;
	}

	if (join < minJoin) {
		alert("총 관람자수가 " + minJoin + "명 이하인 경우 전당투어 신청이 제한됩니다.");
		$("#GP_HEADCOUNT").focus();
		return;
	}
	
	if (maxJoin < join) {
		alert("참가인원은 " +  maxJoin + "명을 초과 할 수 없습니다.");
		$("#GP_HEADCOUNT").focus();
		return;
	}
	//등록 처리 시작  
	$.ajax({
		type : "POST",
		url : "/cf/function/Group/TourInsert.do",
		data : $("#Form").serialize(),
		async:false,
		success : function(result){
			// 인원 초과시
			if (result == '0') {
				alert("신청가능한 인원이 초과 되었습니다.");
				return;
				//성공
			} else if (result == '9') {
				alert("수정되었습니다.");
				opener.parent.location.reload();
	        	window.close();
			}
		},
		error: function(){
			alert('알수없는 에러 발생. 관리자한테 문의하세요.')
			return false;
		}
	});
}

//창닫기
function pf_close(){
	window.close();
}
</script>

<!-- 전당투어 온라인신청 팝업창 -->
		<div class="pop-conts">
		<div class="receipt_pop_header"> 
			<div class="contents_pop_title" >투어 온라인신청서 수정하기</div> 
		</div>
		<div class="receipt_pop_body1">  
			<form  method="post" name="Form" id="Form"> 
				<input type="hidden" name=Type value="U" />
				<input type="hidden" name=GP_KEYNO id="GP_KEYNO" value="${applyData.GP_KEYNO}" />
				<input type="hidden" name=GP_DATE id="GP_DATE" value="${applyData.GP_DATE}"/>
				<input type="hidden" name="GP_TIME" id="GP_TIME" value="${applyData.GP_TIME}"/>
				<input type="hidden" name="GP_GM_KEYNO" id="GP_GM_KEYNO" value="${applyData.GP_GM_KEYNO}" />
				<input type="hidden" name="GP_GSM_KEYNO" id="GP_GSM_KEYNO" value="${applyData.GP_GSM_KEYNO}" />
				<input type="hidden" name="GP_GSS_KEYNO" id="GP_GSS_KEYNO" value="${applyData.GP_GSS_KEYNO}"/>
				<input type="hidden" name="GSS_MAXIMUM" id="GSS_MAXIMUM"/>
				<input type="hidden" name="GP_UI_KEYNO" value="${userInfo.UI_KEYNO }" />
				<input type="hidden" name="UI_NAME" id="UI_NAME" value="${userInfo.UI_NAME }" />
				<input type="hidden" name="GP_PHONE" id="GP_PHONE" />
				<div class="agreement_next">
					<div class="tour_receipt_wrap">
						<div class="label_header">
							기본정보
						</div>
						<div class="tour_receipt_box">
							<div class="label_text">투어일정</div>
							<div class="input_form_4" id="tour_date">
								${applyData.GP_DATE } / ${applyData.GP_TIME }
							</div>
							<div class="label_text">이름</div>
							<div class="input_form_4" id="tour_name">
								${userInfo.UI_NAME }
					 		</div>
				 			<div class="label_text">이메일</div>  
							<div class="input_form_4" id="tour_email">
								${userInfo.UI_EMAIL }
					 		</div>
				 			<label for="CT_BASIC_TEL_1"> 
						 		<div class="label_text">연락처</div>
								<div class="input_form"> 
									<input type="text" class="tel" maxlength="3" id="CT_BASIC_TEL_1" onKeyDown="return cf_only_Num(event);"/> -
									<label for="CT_BASIC_TEL_2" class="blind">연락처 중간번호</label>
									<input type="text" class="tel" maxlength="4" id="CT_BASIC_TEL_2" onKeyDown="return cf_only_Num(event);"/> -
									<label for="CT_BASIC_TEL_3" class="blind">연락처 끝번호</label>
									<input type="text" class="tel" maxlength="4" id="CT_BASIC_TEL_3" onKeyDown="return cf_only_Num(event);"/>  
						 		</div> 
					 		</label>
					 		<label>
						 		<div class="label_text group_text">단체명</div>
								<div class="input_form">
									<label for="GP_GROUPNAME" class="blind">단체명</label>
									<input type="text" maxlength="50" name="GP_GROUPNAME" id="GP_GROUPNAME" value="${applyData.GP_GROUPNAME }"/> 
						 		</div>
					 		</label>
				 			<div class="clear"></div>
				 		</div>
				 	</div>
				 	<div class="tour_receipt_box">
				 		<label for="basic_same">
					 		<div> 
								<div style="float: left;" class="label_header">인솔자 정보</div>  
								<div class="clear"></div> 
							</div>
						</label>
						<div class="clear"></div>
						<div class="tour_receipt_wrap">
						<label for="GP_NAME">
						<div class="label_text">이름</div>
						<div class="input_form">
							<input type="text" maxlength="30" name="GP_NAME" id="GP_NAME" value="${applyData.GP_NAME }"/> 
				 		</div>
				 		</label>  
				 		<label for="CT_LEADER_TEL_1">
					 		<div class="label_text">연락처</div>
							<div class="input_form">
								<c:set value="${fn:split(applyData.GP_PHONE, '-') }" var="phone"/>
								<input type="text" class="tel CT_LEADER_TEL" id="CT_LEADER_TEL_1" maxlength="3" onKeyDown="return cf_only_Num(event);" value="${phone[0]}"/> -
								<label for="CT_BASIC_TEL_2" class="blind">인솔자 연락처 중간번호</label>
								<input type="text" class="tel CT_LEADER_TEL" id="CT_LEADER_TEL_2" maxlength="4" onKeyDown="return cf_only_Num(event);" value="${phone[1]}"/> -
								<label for="CT_BASIC_TEL_3" class="blind">인솔자 연락처 끝번호</label>
								<input type="text" class="tel CT_LEADER_TEL" id="CT_LEADER_TEL_3" maxlength="4" onKeyDown="return cf_only_Num(event);" value="${phone[2]}"/>  
					 		</div>
			 			</label>
		 				<div class="clear"></div>
		 				</div>
					</div>
		 		
			 		<div class="tour_receipt_wrap">
				 		<div class="label_header"> 
				 			관람 인원
						</div>
						<div class="tour_receipt_box">
						<label for="GP_YUMOCAR">
							<div class="label_text">유모차<br> 필요개수</div>
							<div class="input_form">
								<input class="w15" type="text" maxlength="2" id="GP_YUMOCAR" name="GP_YUMOCAR" value="${applyData.GP_YUMOCAR }" onKeyDown="return cf_only_Num(event);"/> 개
					 		</div>
				 		</label>
				 		<label for="GP_WHEELCHAIR">
							<div class="label_text">휠체어<br> 필요개수</div>
							<div class="input_form"> 
								<input class="w15" type="text" maxlength="2" id="GP_WHEELCHAIR" name="GP_WHEELCHAIR" value="${applyData.GP_WHEELCHAIR }" onKeyDown="return cf_only_Num(event);"/> 개
					 		</div>
				 		</label>
				 		<label for="GP_HEADCOUNT">  
							<div class="label_text">참가인원</div>
							<div class="input_form"> 
								<input class="w15" type="text" maxlength="4" id="GP_HEADCOUNT" name="GP_HEADCOUNT" onKeyDown="return cf_only_Num(event);" value="${applyData.GP_HEADCOUNT }"/> 명
					 		</div>    
				 		</label> 
				 		 
				 		<div class="clear"></div>
				 		<ul class="tour_person_notice">
				 			<li>현재  <b> <span id="freePerson"></span>명</b> 예약 가능합니다.</li> 
				 		<!-- 	<li> 
				 			인원 조정이 필요한 단체의 경우 아래의 칸에 총 인원을 기입하여 주시기 바랍니다. 담당자의 연락 후 예약이 확정됩니다.
				 			</li> 
				 			<li>문의사항: 1899-5566</li>
				 			 <li> 
				 			<label for="total_person">               
							<div class="label_text total_person_text"> 희망 총 인원</div>   
							<div class="input_form total_person_text">   
								<input class="w15" type="text"  maxlength="3" id="total_person" onKeyDown="return cf_only_Num(this);"/> 명
					 		</div>
					 		</label>
					 		</li> -->
				 		</ul> 
				 		
						</div>
						
				 		<div class="clear"></div>
			 		</div>
			 		
			 		<div class="tour_receipt_wrap">
				 		<div class="label_header"> 
				 			교통편
						</div>
						
						<div class="tour_receipt_box tour_traffic_wrap">
							<div class="input_form_4">
								<label for="GP_TRAFFIC_C">
									<input type="radio" id="GP_TRAFFIC_C" name="GP_TRAFFIC" value="C" ${applyData.GP_TRAFFIC eq 'C' ? 'checked' : ''}>대중교통
								</label>
								<label for="GP_TRAFFIC_B">
									<input type="radio" id="GP_TRAFFIC_B" name="GP_TRAFFIC" value="B" ${applyData.GP_TRAFFIC eq 'B' ? 'checked' : ''}>버스(단체)
								</label>
								<label for="GP_TRAFFIC_E">
									<input type="radio" id="GP_TRAFFIC_E" name="GP_TRAFFIC" value="E" ${applyData.GP_TRAFFIC eq 'E' ? 'checked' : ''}>기타
								</label>
								<label for="GP_TRAFFIC_EXP">
									<input type="text" id="GP_TRAFFIC_EXP" name="GP_TRAFFIC_EXP" value="${applyData.GP_TRAFFIC_EXP}" size="6" />
								</label>
					 		</div> 
					 		<div class="clear"></div>
					 		<div class="traffic_box">
					 			<div class="traffic_info subway_info">
					 				<ul>
					 					<li>지하철 오시는 길 : 문화전당역 하차</li>
					 					<li> 
					 						버스로 오시는 길 : 국립아시아문화전당 또는 문화전당역
					 						<ul class="guideMap_UL1">  
									    		<li style="background: none;">
									    			<div class="bus"><span class="label green" style="margin-rigth:20px;">지선</span>
									    			수완12, 1187, 518, 석곡87, 송정98, 풍암61, 첨단95, 금남55, 419, 금남57
									    			</div>
									    		</li>
												<li style="background: none;">
												<div class="bus"><span class="label red" style="margin-rigth:20px;">급행</span>
													첨단09, 순환01, 진월07, 풍암06</div>
												</li>
												<li style="background: none;"><div class="bus"><span class="label blue" style="margin-rigth:20px;">간선</span>
													지원45, 금호36, 봉선37, 봉선27, 일곡28, 지원15, 운림35, 진월17, 문흥39</div>
												</li>
												<li style="background: none;"><div class="bus"><span class="label sky" style="margin-rigth:20px;">공항</span>
													1000</div>
												</li> 
									    	</ul>
					 					</li>
					 				</ul>
					 			</div> 
					 			<div class="traffic_info bus_group_info"> 
					 				<div>
				 						<img style="width:100%; cursor: pointer;" src="/resources/img/calendar/tour_info_map2.jpg" onclick="gonyImgWin('/resources/img/calendar/tour_info_map2.jpg')" alt="단체버스 가이드 이미지" />
					 				</div> 
					 				<div>
					 					<div style="font-size:14px; margin-bottom:3px; margin-top:10px;">
					 						<b>ACC투어에 참여하는 단체 관람객 대형버스 주차 구역 안내(<span style="color:red;">유료 주차장</span>)</b>
					 					</div>
					 					<div style="font-size:13px;">
						 					<div>국립아시아문화전당 부설주차장(구. 광주여고)에 주차 하실 수 있습니다.</div>
						 					<ul>  
						 						<li>대상:16인승 이상 (미니버스, 대형버스 등)</li>
												<li>장소:상단의 사진 참고</li>
												<li>※전당 주변은 주정차 단속구역으로 주차 시 과태료가 부과될 수 있습니다.</li>
						 					</ul>
										</div>
					 				</div>
					 				<div class="clear"></div>
					 			</div>
					 		</div>
			 				<div class="clear"></div>
			 			</div>
			 		</div>
			 		<!-- 등록 박스 -->
					<div class="textR pdT15 " style="margin-bottom: 15px;">
						<button type="button" class="btn btnSmall_blue btn-default" onclick="pf_Update();">수정</button>
						<button type="button" class="btn btnSmall_write btn-default" onclick="pf_close();">닫기</button>
					</div>
				</div>   
				
			</form> 
			</div>  
		</div>
