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
<input type="hidden" name="ir_keyno" id="ir_keyno">
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
							<div class="alert alert-info no-margin fade in">
								<button type="button" class="close" data-dismiss="alert">×</button>
								발전소 리스트를 확인합니다.
							</div>
						</div>
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
											<th style="width: 50px;"><input type="checkbox" id="cbx_chkAll" onclick="seletAll()"></td>
											<th class="arrow" data-index="1">사업자 번호</th>
											<th class="arrow" data-index="2">발전소 명</th>
											<th class="arrow" data-index="3">주소</th>
											<th class="arrow" data-index="4">이메일</th>
											<th class="arrow" data-index="6">날짜</th>
											<th class="arrow" data-index="5" style="width: 50px;">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty billList }">
											<tr>
												<td colspan="7">검색된 데이터가 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach items="${billList }" var="b">
											<tr>
												<td><input type="checkbox" name="chk"></td>
												<td>${b.dbp_co_num}</td>
												<td><a href="javascript:;"
													onclick="detailData('${b.dbp_keyno}')">${b.dbp_name}</a></td>
												<td>${b.dbp_address}</td>
												<td>${b.dbp_email}</td>
												<td>${b.dbp_date}</td>
												<td>완료</td>
										</c:forEach>
											</tr>
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
						<h2>공급 받는자 정보</h2>
					</header>
					<div class="widget-body ">
<!-- 						<div class="widget-body-toolbar bg-color-white"> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-sm-6 col-md-6 text-align-right" -->
<!-- 									style="float: right;"> -->
<!-- 									<div class="btn-group"> -->
<!-- 										<button class="btn btn-sm btn-primary" id="insertButton" -->
<!-- 											type="button" onclick="Inver_Insert();">저장</button> -->
<!-- 										<button class="btn btn-sm btn-danger" type="button" -->
<!-- 											onclick="cancle()">취소</button> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
						<div class="table-responsive">
							<!-- insert -->
							<!-- 발전소 리스트 -->
							<div id="power-insert" title="발전소 등록" style="width: 100%; margin-left: 20px;">
								<div class="widget-body ">
									<fieldset>
										<div class="form-horizontal">
											<fieldset style="padding-top: 40px; padding-bottom: 30px;">
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 선택</label>
													<div class="col-md-6">
														<select style="height: 100px;"
															class="form-control input-sm select2 ir_keyno" id="ir_keyno"
															name="ir_keyno" placeholder="발전소를 선택하세요" onchange = "providerSelect(this.value)">
															<option>선택하세요</option>
															<c:forEach items="${billList}" var="b">
																<option value="${b.dbp_keyno}">${b.dbp_name}</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 사업자 번호</label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_companynumber"
															name="ie_companynumber" id="ie_companynumber" value="" maxlength="30">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 종 사업장 번호</label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_taxnumber"
															id="ie_taxnumber" name="ie_taxnumber" value="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 사업체명</label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_companyname"
															id="ie_companyname" name="ie_companyname" value="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 관리자 성명</label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_name"
															id="ie_name" name="ie_name" value="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 사업체 주소</label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_companyaddress"
															id="ie_companyaddress" name="ie_companyaddress" value="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 업태 </label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_biztype"
															id="ie_biztype" name="ie_biztype" value="">
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 종목 </label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_bizclassification"
															id="ie_bizclassification" name="ie_bizclassification" value="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 이메일 </label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_email"
															id="ie_email" name="ie_email" value="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 금액</label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_price"
															id="ie_price" name="ie_price" value="">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label"><span
														class="nessSpan"></span> 품목 </label>
													<div class="col-md-6">
														<input type="text" class="form-control ie_itemname"
															id="ie_itemname" name=ie_itemname value="">
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

function providerSelect(value){
	 $.ajax({
       url: '/dyAdmin/bills/providerSelectAjax.do',
       type: 'POST',
       data: {
          	"dbp_keyno":value
          },
       async: false,  
       success: function(result) {
    	   
    	   
       	$("#ie_keyno").val(result.dbp_keyno)
       	$("#ie_companynumber").val(result.dbp_co_num)
//      $("#ie_taxnumber").val(result.dbp_pass) //종 사업장 번호
       	$("#ie_companyname").val(result.dbp_name)
       	$("#ie_name").val(result.dbp_ir_name)
       	$("#ie_companyaddress").val(result.dbp_address)
       	$("#ie_biztype").val(result.dbp_biztype)
       	$("#ie_bizclassification").val(result.dbp_bizclassification)
       	$("#ie_email").val(result.dbp_email)
//      $("#ie_price").val(result.dbp_ceoname)   //금액
//      $("#ie_itemname").val(result.dbp_busename) // 품목

       	
       },
       error: function(){
       	alert("공급받는자 정보 불러오기 에러");
       }
	}); 
}


function seletAll(){
	
	if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
	else $("input[name=chk]").prop("checked", false);
}

// $(document).ready(function() {
// 	$("#cbx_chkAll").click(function() {
// 		if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
// 		else $("input[name=chk]").prop("checked", false);
// 	});
// });

</script>