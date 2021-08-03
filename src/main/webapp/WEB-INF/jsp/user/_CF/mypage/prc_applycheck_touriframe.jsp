<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<link rel="stylesheet" type="text/css" href="/resources/common/css/program.css">
<style>
/* 페이지 넘버 */
.pageNumberBox {width:100%; margin-bottom:20px; text-align:center;}
.pageNumberUl {display:inline-block; text-align:center;}
.pageNumberUl:after { visibility: hidden; display:block;font-size: 0;content:".";clear: both;height: 0;*zoom:1;}
.pageNumberUl li { float:left; margin:0 2px; padding:3px; border:1px solid #e5e6e5; vertical-align:middle;min-width:30px;}
.pageNumberUl li a { font-size:13px; color:#58595b; display:inline-block; width:100%; height:100%; padding:2px 5px 3px; text-align:center;}
.pageNumberUl li.active {background-color:#58595b;}
.pageNumberUl li.active a {color:#fff;}
.pagetext{font-size: 16px;}
@media all and (max-width:850px){	
	.pageNumberUl {margin-top:10px;}
}
</style>
<div class="subTableBox table_wrap_mobile">
	<table class="tbl_01 tbl_last_txtL" id="groupTourTable">
		<colgroup>
			<col width="10%">
			<col width="25%">
			<col width="40%">
			<col width="20%">
		</colgroup>
		<caption>투어안내</caption>
		<thead>
			<tr>
				<th id="tdDiv">구분</th>
				<th id="tdGroupname">단체명</th>
				<th id="tdtourDate">투어일정</th>
				<th id="tdCondition">상태</th>
			</tr>
		</thead>
		<tbody id="GroupTourList">
			<c:if test="${not empty applyList }">
				<c:forEach items="${applyList }" var="model">
					<tr id="applyTr" onclick="pf_ApplyDetailView('${model.GP_KEYNO}');">
						<td>${model.GM_DIVISION}</td>
						<td>${model.GP_GROUPNAME}</td>
						<td><span class="gpDate">${model.GP_DATE}</span> / ${model.GP_TIME }</td>
						<td class="tdState">예약완료</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty applyList }">
				<tr>
					<td id="tdBlank" colspan="4">투어 신청 내역이 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
<div class="pageNumberBox dt-toolbar-footer">
	<c:if test="${not empty applyList }">
		<div class="col-sm-6 col-xs-12" style="line-height: 35px; text-align: left;">
			<span class="pagetext">총 ${pageInfo.totalRecordCount }건  / 총 ${pageInfo.totalPageCount} 페이지 중 ${pageInfo.currentPageNo} 페이지</span>
		</div>
		<div class="col-sm-6 col-xs-12">
				<ul class="pageNumberUl" >
					<ui:pagination paginationInfo="${pageInfo }" type="normal_board" jsFunction="pf_LinkPage" />
			    </ul>
		</div>
    </c:if>
    <c:if test="${empty applyList }">
    	<div class="col-sm-6 col-xs-12" style="line-height: 35px; text-align: left;">
		<span class="pagetext">0건 중 0~0번째 결과(총  ${pageInfo.totalRecordCount }건중 매칭된 데이터)</span>
		</div>
    </c:if>
</div>
<!-- end widget grid -->
<form:form id="Form" method="post">
	<input type="hidden" id="GP_KEYNO" name="GP_KEYNO">
	<input type="hidden" name="pageIndex" id="pageIndex" value="${search.pageIndex}">
</form:form>
      
<script>


//페이지 넘기기
function pf_LinkPage(num){
	$('#pageIndex').val(num);
	$("#Form").attr("target", "");
	$('#Form').attr('action','/cf/mypage/applycheck/tour/iframe.do');
	$('#Form').submit();
}

//단체예약 상세보기
function pf_ApplyDetailView(key){	//세션만료됐을때 처리?
	$('#pageIndex').val(1);
	$("#GP_KEYNO").val(key);
	$("#Form").attr("action", "/cf/mypage/applycheck/applypopup.do");
	$("#Form").attr("target", "popup_window");
	window.open("", "popup_window", "width=1000, height=600, scrollbars=no");
	$("#Form").submit();
}

document.body.scrollIntoView(true);
parent.document.all.tuorFrame.height = document.body.scrollHeight; 
</script>