<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<div class="pageNumberBox">
	<c:if test="${not empty resultList }">
		<div class="col-sm-6 col-xs-12" style="line-height: 35px; text-align: left;">
			<span class="pagetext">총 ${paginationInfo.totalRecordCount }건  / 총 ${paginationInfo.totalPageCount} 페이지 중 ${paginationInfo.currentPageNo} 페이지 </span>
		</div>
		<div class="col-sm-6 col-xs-12 middlePage" style="text-align: right;">
				<ul class="pageNumberUl" >
					<ui:pagination paginationInfo="${paginationInfo }" type="normal_board" jsFunction="pf_LinkPage" />
			    </ul>
		</div>
    </c:if>
    <c:if test="${empty resultList }">
		<div class="col-sm-6 col-xs-12" style="line-height: 35px; text-align: left;">
		<span class="pagetext">0건 중 0~0번째 결과(총  ${paginationInfo.totalRecordCount }건중 매칭된 데이터)</span>
		</div>
    </c:if>
    <div style="clear: both"></div>
</div>

<c:set var="colspan" value="6"/>

<div class="tableMobileWrap">
<table id="dt_basic" class="pagingTable table table-striped table-bordered table-hover" width="100%">
	<thead>
		<%-- 모든필드 , 게시글 갯수 시작  --%>
		<tr>
			<th colspan="${colspan}">
				<div style="float:left;">
					<input type="text" class="form-control search-control" data-searchindex="all" placeholder="모든필드 검색" style="width:200px;display: inline-block;" />
					<button class="btn btn-sm btn-primary smallBtn" type="button" onclick="pf_LinkPage()" style="margin-right:10px;">
						<i class="fa fa-plus"></i> 검색
					</button>
				</div>
				<div style="float:right;">
					<!-- <button type="button" class="btn btn-sm btn-primary" onclick="pf_excel()">
						<i class="fa fa-file-excel-o"></i> 엑셀
					</button> -->
					<select name="pageUnit" id="pageUnit" style="width:50px;display:inline-block; vertical-align: top;height: 31px;" onchange="pf_LinkPage();">
				    	<option value="10" ${10 eq search.pageUnit ? 'selected' : '' }>10</option>
				    	<option value="25" ${25 eq search.pageUnit ? 'selected' : '' }>25</option>
				    	<option value="50" ${50 eq search.pageUnit ? 'selected' : '' }>50</option>
				    	<option value="75" ${75 eq search.pageUnit ? 'selected' : '' }>75</option>
				    	<option value="100" ${100 eq search.pageUnit ? 'selected' : '' }>100</option>
				    </select>
			    </div>
			</th>
		</tr>
		<%-- 모든필드  ,  엑셀다운, 게시글 갯수 끝  --%>
		<tr>
			<th class="hasinput">
				<input type="text" class="form-control search-control" data-searchindex="1" placeholder="번호 검색" />
			</th>
			<th class="hasinput">
		        <input type="text" class="form-control search-control" data-searchindex="2" placeholder="제목 검색" />
			</th>
			<th class="hasinput">
				<input type="text" class="form-control search-control" data-searchindex="3" placeholder="리스트 검색" />
			</th>
			<th class="hasinput">
				<input type="text" class="form-control search-control" data-searchindex="4" placeholder="상세페이지 검색" />
			</th>
			<th class="hasinput">
				<input type="text" class="form-control search-control" data-searchindex="5" placeholder="등록 및 수정페이지 검색" />
			</th>
			<th class="hasinput">
			</th>
		</tr>
		<%-- 화살표 정렬 --%>
		<tr>
			<th class="arrow" data-index="1">번호</th>
			<th class="arrow" data-index="2">제목</th>
			<th class="arrow" data-index="3">리스트</th>
			<th class="arrow" data-index="4">상세페이지</th>
			<th class="arrow" data-index="5">등록 및 수정 페이지</th>
			<th class="arrow">파일 배포</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty resultList }">
			<tr>
				<td colspan="${colspan}">검색된 데이터가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${resultList }" var="model">
		<fmt:parseNumber value="${model.BSP_KEYNO}" var="KEY" />
		<tr>
			<td><c:out value="${model.COUNT}"/></td>
			<td><a href="javascript:pf_boardTemplatePackageUpdate('${model.BSP_KEYNO}')"><c:out value="${model.BSP_TITLE} "/></a></td>
			<td><c:out value="${model.LIST_TITLE} "/></td>
			<td><c:out value="${model.DETAIL_TITLE }"/></td>
			<td><c:out value="${model.INSERT_TITLE }"/></td>
			<td>
				<div class="btn btn-warning btn-xs" onclick="pf_PublishFile('${model.BSP_KEYNO}')">
					<i class="fa fa-file"></i> 전체 배포하기
				</div>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<%-- 하단 페이징 --%>
<div class="pageNumberBox dt-toolbar-footer">
	<c:if test="${not empty resultList }">
		<div class="col-sm-6 col-xs-12" style="line-height: 35px; text-align: left;">
			<span class="pagetext">총 ${paginationInfo.totalRecordCount }건  / 총 ${paginationInfo.totalPageCount} 페이지 중 ${paginationInfo.currentPageNo} 페이지</span>
		</div>
		<div class="col-sm-6 col-xs-12" style="text-align: right;">
				<ul class="pageNumberUl" >
					<ui:pagination paginationInfo="${paginationInfo }" type="normal_board" jsFunction="pf_LinkPage" />
			    </ul>
		</div>
    </c:if>
    <c:if test="${empty resultList }">
    	<div class="col-sm-6 col-xs-12" style="line-height: 35px; text-align: left;">
		<span class="pagetext">0건 중 0~0번째 결과(총  ${paginationInfo.totalRecordCount }건중 매칭된 데이터)</span>
		</div>
    </c:if>
</div>

<script type="text/javascript">

$(function(){

	pf_defaultPagingSetting('${search.orderBy}','${search.sortDirect}');

})


function pf_PublishFile(key){
	var	msg = "배포 하시겠습니까?";
	
		if(confirm(msg)) {
			cf_loading();
			
			$.ajax({
			    type   : "post",
			    url    : "/txap/homepage/board/skin/boardSkinPackageAjax.do",
			    data   : {"BSP_KEYNO" : key},
			    async  : false ,
			    success:function(data){
			    	if(data) {
			    		cf_smallBox('ajax', "파일을 배포하였습니다.", 3000);
			    	} else {
			    		cf_smallBox('error', "파일 배포 실패", 3000,'#d24158');
			    	}
			    },
			    error: function(jqXHR, textStatus, exception) {
			    	cf_smallBox('error', "알수없는 에러, 관리자에게 문의하세요.", 3000,'#d24158');
			    }
			  }).done(function(){
					cf_loading_out();
				})
		}
}

</script>
