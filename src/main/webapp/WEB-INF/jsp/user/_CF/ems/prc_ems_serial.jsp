<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<section id="in-contents">
		
			<!-- <div class="lb">
				<select id="datatype" class="tx-select" onchange="ViewData(this.value)">
					<option value="ems">EMS데이터</option>
					<option value="pcs">PCS데이터</option>
				</select>
			</div> -->
		<!-- 탑 컨텐츠 -->

		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">
			
			<div class="row bgW drive-s-in-con">
				<!-- <div class="bnt-box">
					<div class="rb">
						<button type="button" class="btn-exel-d">
							<span class="icon"><img src="resources/img/icon/icon_exel_1.jpg" alt="엑셀다운로드"></span>
							<span class="txt">DOWNLOAD</span>
						</button>
						<select class="tx-select sel-bt">
							<option>10개씩 보기</option>
							<option>10개씩 보기</option>
							<option>10개씩 보기</option>
						</select>
					</div>
				</div> -->

				<div class="tbl-box">
					<form id="form" action="/serialWrite.do" method="post" >
				 	 	<input id="checking" name="onoff" value="" type="hidden">
				   </form>
				   
				   	<!-- <button type="button" class="btn-exel-d" onclick="OnOff('on')">Relay ON</button>
				   	<button type="button" class="btn-exel-d" onclick="OnOff('off')">Relay OFF</button>
				   	<button type="button" class="btn-exel-d" onclick="OnOff('de')">Default Value</button> -->
					
					<fieldset id="tableWrap" style="margin:18px;">
					</fieldset>
				</div>

			</div>


		</div>
		<!-- 밑에 주요 컨텐츠 끝 -->


	</section>
	
	

<script type="text/javascript">
$("#gnb li:nth-child(3)").addClass('active');

$(function(){
	DataShow("/serialAjax.do");
});

function OnOff(state){
	$("#checking").val(state);
	$("#form").submit();
}

// function ViewData(obj){
// 	if(obj == 'pcs'){	
// 		test("/serialAjax.do");
// 	}else{
// 		test("/serialAjax.do");	
// 	}
// }

function DataShow(url){
	$.ajax({
		type   	: "post",   
		url    	: "/serialAjax.do",
		data	:{
			"type" : "pcs"
		},
		async  : false,
		success : function(result){
			$('#tableWrap').html(result);
		},
		error: function(jqXHR, exception) {
	       	alert('error')
		}
	});
}

</script>
