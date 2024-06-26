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

<c:set var="colspan" value="9"/>

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
		        <input type="text" class="form-control search-control" data-searchindex="2" placeholder="타입 검색" />
			</th>
			<th class="hasinput">
		        <input type="text" class="form-control search-control" data-searchindex="3" placeholder="제목 검색" />
			</th>			
			<th class="hasinput">
				<input type="text" class="form-control search-control" data-searchindex="4" placeholder="작성자 검색" />
			</th>
			<th class="hasinput">
				<input type="text" class="form-control search-control" data-searchindex="5" placeholder="작성일 검색" />
			</th>
			<th class="hasinput">
				<input type="text" class="form-control search-control" data-searchindex="6" placeholder="수정자 검색" />
			</th>
			<th class="hasinput">
				<input type="text" class="form-control search-control" data-searchindex="7" placeholder="수정일 검색" />			
			</th>
			<th class="hasinput">
				<select class="form-control search-control" data-searchindex="8" onchange="pf_LinkPage()">
		            <option value="">선택하세요.</option>
	              	<option value="Y">O</option>
	              	<option value="N">X</option>
	            </select>
			</th>						
			<th class="hasinput">
			</th>
			<!-- <th class="hasinput">
				<select class="form-control search-control search-control" data-searchindex="7" style="width:100%;">
		            <option value="">사용여부</option>
		            <option value="사용">사용</option>
		            <option value="미사용">미사용</option>
		        </select>
			</th> -->
		</tr>
		<%-- 화살표 정렬 --%>
		<tr>
			<th class="arrow" data-index="1">번호</th>
			<th class="arrow" data-index="2">타입</th>
			<th class="arrow" data-index="3">제목</th>
			<th class="arrow" data-index="4">작성자</th>
			<th class="arrow" data-index="5">등록일</th>
			<th class="arrow" data-index="6">수정자</th>
			<th class="arrow" data-index="7">수정일</th>
			<th class="arrow" data-index="8">사용유무</th>
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
		<fmt:parseNumber value="${fn:substring(model.PIS_KEYNO, 4, 20)}" var="KEY" />
		<tr>
			<td>${model.COUNT}</td>
			<td>
				<c:choose>
					<c:when test="${model.PIS_DIVISION eq 'W'}">레이아웃</c:when>
					<c:otherwise>배너</c:otherwise>
				</c:choose>
			</td>
			<td><a href="javascript:pf_popupSkinUpdate('${model.PIS_KEYNO}','${model.PIS_DIVISION}')"><c:out value="${model.PIS_SUBJECT} "/></a></td>
			<td><c:out value="${model.PIS_UI_NAME} "/></td>
			<td>${model.PIS_REGDT }</td>
 			<c:choose>
				<c:when test="${not empty model.PIS_MODDT and not empty model.PIS_MODNM }">
				<td>${model.PIS_MODNM }</td>
				<td>${model.PIS_MODDT }</td>
				</c:when>
				<c:otherwise>
				<td colspan="2">수정기록 없음</td>			
				</c:otherwise>
			</c:choose>			
			<c:if test="${model.PIS_USE eq 'N'}">
			<td><font color="#FF0040"><b>X</b></font></td>
			</c:if>
			<c:if test="${model.PIS_USE eq 'Y'}">
			<td><font color="#29088A"><b>O</b></font></td>
			</c:if>							
			<td>
				<div class="btn btn-warning btn-xs" onclick="pf_PublishFile('${model.PIS_KEYNO}')">
					<i class="fa fa-file"></i> 배포하기
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

</script>
