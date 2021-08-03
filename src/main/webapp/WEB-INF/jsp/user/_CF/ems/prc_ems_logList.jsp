<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<form:form id="Form" name="Form" method="post" action="">
	<!-- 안에 컨텐츠 시작 -->
	<section id="in-contents">
		

		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">
			
			<!-- 운전현황 -->

			<!-- 검색부분 -->
			<div class="row bgW date-s-t-box box_in1">
                <div class="left_box">
                    <h2>실시간 로그관리</h2>
                </div>
                <div class="right_box">
                    <label id="s-date">시작일</label>
                    <input type="text" name="searchBeginDate" id="searchBeginDate" class="date-pic"  placeholder="시작일시" value="${search.searchBeginDate}">
                    <label id="e-date">종료일</label>
                    <input type="text" name="searchEndDate" id="searchEndDate" class="date-pic" placeholder="종료일시" value="${search.searchEndDate}">
                    <div class="gab-w-10"></div>
                    <button type="button" class="btn-search" onclick="pf_LinkPage();">검색</button>
                </div>
			</div>

			<div class="row bgW drive-s-in-con">
				<div class="bnt-box">
					<div class="rb">
						<button type="button" class="btn-exel-d" onclick="pf_excel()">
							<span class="icon"><img src="/resources/img/icon/icon_exel_1.jpg" alt="엑셀다운로드"></span>
							<span class="txt">DOWNLOAD</span>
						</button>
						<select class="tx-select sel-bt"  name="pageUnit2" id="pageUnit2" onchange="pf_LinkPage();">
							<option value="10">10개씩 보기</option>
							<option value="20">20개씩 보기</option>
							<option value="30">30개씩 보기</option>
						</select>
					</div>
				</div>

				<div class="tbl-box" id="ajaxResult">
					<jsp:include page="/WEB-INF/jsp/txap/include/search/pra_search_header_paging.jsp" flush="true">
								<jsp:param value="/loglistAjax.do" name="pagingDataUrl" />
								<jsp:param value="/excelAjax.do" name="excelDataUrl" />
					</jsp:include>
					<fieldset id="tableWrap">
					</fieldset>
				</div>
			</div>

		</div>
		<!-- 밑에 주요 컨텐츠 끝 -->


	</section>
	<!-- 안에 컨텐츠 끝 -->
	</form:form>
<script>
$("#gnb li:nth-child(4)").addClass('active');
$(function(){

	
});
/* function paging(num){
	$.ajax({
		type   	: "post",   
		url    	: "/loglistAjax.do",
		async  : false,
		data	:{
			"page" : num
		}
		,
		success : function(result){
			$('#ajaxResult').html(result);
		},
		error: function(jqXHR, exception) {
	       	alert('error')
		}
	});
}

function PrePage(cuPage){
	if(cuPage != 1){
		paging(cuPage-1);
	}else{
		paging(1);
	}
}

function NextPage(cuPage,MaPage){
	var c = parseInt(cuPage);
	var m = parseInt(MaPage);
	if(cuPage != MaPage){
		paging(c+ 1);
	}else{
		paging(m);
	}
} */

</script>