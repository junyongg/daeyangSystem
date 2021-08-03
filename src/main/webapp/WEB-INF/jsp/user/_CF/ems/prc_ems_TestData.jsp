<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf" %>

<section id="in-contents">
		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">

			<!-- 검색부분 -->
			<div class="row bgW drive-s-in-con">
				<div id="bnt-box">
					<div class="">
						<div class="login_text">
							<h1>테스트 데이터 등록하기</h1>
						</div>
						<div class="Login_p_wrap">
							<label for="IO_POWER"><input type="number" style="font-size:14px;" name="IO_POWER" id="IO_POWER" class="txtlogin width100Per" placeholder="발전량"></label>   
							<label for="IO_USAGE"><input type="number" style="font-size:14px;" name="IO_USAGE" id="IO_USAGE" class="txtlogin width100Per" placeholder="사용량"></label>  
							<label for="IO_CHARGE"><input type="number" style="font-size:14px;" name="IO_CHARGE" id="IO_CHARGE" class="txtlogin width100Per" placeholder="충전량"></label>  
						</div>
						<button type="button" id="login_button" onclick="insertData()">데이터 등록</button>
				 	</div>
				</div>
			</div>
		</div>
		<!-- 밑에 주요 컨텐츠 끝 -->


	</section>
	<!-- 안에 컨텐츠 끝 -->

<script>
	function insertData(){
		
		if($("#IO_POWER").val() == ""){a
			alert("발전량을 입력해주세요.");
			return false;
		}
		if($("#IO_USAGE").val() == ""){
			alert("사용량을 입력해주세요.");
			return false;
		}
		if($("#IO_CHARGE").val() == ""){
			alert("충전량을 입력해주세요.");
			return false;
		}
		$.ajax({
			url : "/cf/DataInsert.do" ,
			data : {
				"IO_POWER" : $("#IO_POWER").val(),
				"IO_USAGE" : $("#IO_USAGE").val(),
				"IO_CHARGE" : $("#IO_CHARGE").val()
			},
			type : "post",
			success: function(data){
				alert(data);
			},
			error : function(){
				alert("에러");
			}
		})
	}
</script>
