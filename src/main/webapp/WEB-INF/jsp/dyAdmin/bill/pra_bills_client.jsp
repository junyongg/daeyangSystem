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
<input type="hidden" name="hometaxbill_id" id="hometaxbill_id">
<input type="hidden" name="spass" id="spass">
<input type="hidden" name="apikey" id="apikey">
<input type="hidden" name="homemunseo_id" id="homemunseo_id">
<input type="hidden" name="signature" id="signature">
<input type="hidden" name="issueid" id="issueid">
<input type="hidden" name="typecode1" id="typecode1" value = "01">
<input type="hidden" name="typecode2" id="typecode2" value = "01">
<input type="hidden" name="ir_keyno" id="ir_keyno">
<input type="hidden" name="ie_keyno" id="ie_keyno">
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6" id="menu_1" style="width: 100%;">
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
									<div class="col-sm-6 col-xs-12 middlePage"
										style="text-align: right;">
										<ul class="pageNumberUl">
											<ui:pagination paginationInfo="${paginationInfo }"
												type="normal_board" jsFunction="pf_LinkPage" />
										</ul>
									</div>
								</c:if>
								<div style="clear: both"></div>
							</div>

							<div class="tableMobileWrap">
								<table id="dt_basic"
									class="pagingTable table table-striped table-bordered table-hover"
									width="100%">
									<thead>
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
<!-- 							<div style="text-align: center;"> -->
<!-- 							<button class="btn btn-sm btn-primary" id="insertButton" -->
<!-- 								type="button" onclick="" style="width : 100px;">국세청 전송</button> -->
<!-- 							</div>	 -->
				</div>
			</article>
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-6" id="menu_2" style="width: 80%; left:0px;" >
				<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
					data-widget-editbutton="false" >
					<header>
						<span class="widget-icon"> <i class="fa fa-table"></i>
						</span>
						<h2>세금계산서 정보</h2>
					</header>
					<div>
					<h1 style="float: left; margin-top: 0px; font-size: 15px">공급 받는자 구분</h1>
					<label style="float: left;">
					<input type = "radio" style="margin-left: 13px; margin-top: 5px;" name = "partytypecode" value = "01" title = "기업" checked>
					<span>기업</span> 
					</label>
					<label style="float: left;">
					<input type = "radio" style="margin-left: 13px; margin-top: 5px;" name = "partytypecode" value = "02" title = "개인" checked>
					<span>개인</span> 
					</label>
					<label style="float: left;">
					<input type = "radio" style="margin-left: 13px; margin-top: 5px;" name = "partytypecode" value = "03" title = "외국인" checked>
					<span>외국인</span> 
					</label>
					</div>
					<div class="widget-body ">
								<div class="form-group">
									<label class="col-md-3 control-label"  style ="height: 30px; background-color: #f7b1b1;"><span class="nessSpan"></span> 공급자 선택</label>
									
									<div class="col-md-6" style="padding-bottom: 20px;">
								<select class="form-control input-sm select2 ir_keyno" id="ir_keyno" name="ir_keyno" onchange="providerSelect(this.value)">
									<option>선택하세요</option>
									<c:forEach items="${billList}" var="b">
										<option value="${b.dbp_keyno}">${b.dbp_name}</option>
									</c:forEach>
								</select>
									</div>
								</div>
							<div id="myTabContent1"
								class="tab-content padding-10 form-horizontal bv-form">
								<div>
									<table id="" class="table table-bordered table-striped">
										<colgroup>
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 15%;">
										</colgroup>
										<tbody>
											<tr>
												<td style="background-color: #f7b1b1;" >사업자등록번호</td>
												<td><input type="text" class="form-control check2" id="ir_companynumber" name="ir_companynumber"></td>
												<td style="background-color: #f7b1b1;">업태</td>
												<td><input type="text" class="form-control check2" id="ir_biztype" name="ir_biztype"></td>											
												<td style="background-color: #f7b1b1;">사업체명</td>
												<td><input type="text" class="form-control check2" id="ir_companyname" name="ir_companyname"></td>
												<td style="background-color: #f7b1b1;">업종</td>
												<td><input type="text" class="form-control check2" id="ir_bizclassificatio" name="ir_bizclassification"></td>
											</tr>
											<tr>
												<td style="background-color: #f7b1b1;">종사업장번호</td>
												<td><input type="text" class="form-control check2" id="ir_taxnumber" name="ir_taxnumber"></td>
												<td style="background-color: #f7b1b1;">대표자명</td>
												<td><input type="text" class="form-control check2" id="ir_ceoname" name="ir_ceoname"></td>
												<td style="background-color: #f7b1b1;">회사주소</td>
												<td colspan="3"><input type="text" class="form-control" id="ir_companyaddress" name="ir_companyaddress"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
                     <!-- ----------------------------------------------   공급받는자 DIV  ----------------------------------------------------------->
						<div class="form-group">
									<label class="col-md-3 control-label" style= "height: 30px; background-color: #b0ccfe;"><span class="nessSpan"></span> 공급받는자 선택</label>
									
									<div class="col-md-6" style="padding-bottom: 20px;">
								<select class="form-control input-sm select2 ir_keyno" id="ie_keyno" name="ie_keyno" onchange="supliedSelect(this.value)">
									<option>선택하세요</option>
									<c:forEach items="${billList2}" var="b">
										<option value="${b.dbs_keyno}">${b.dbs_name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
							<div id="myTabContent1"
								class="tab-content padding-10 form-horizontal bv-form">
								<div>
									<table id="" class="table table-bordered table-striped">
										<colgroup>
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 15%;">
										</colgroup>
										<tbody>
											<tr>
												<td style="background-color: #b0ccfe;">사업자등록번호</td>
												<td><input type="text" class="form-control check2" id="ie_companynumber" name="ie_companynumber"></td>
												<td style="background-color: #b0ccfe;">업태</td>
												<td><input type="text" class="form-control check2" id="ie_biztype" name="ie_biztype"></td>
												<td style="background-color: #b0ccfe;">사업체명</td>
												<td><input type="text" class="form-control check2" id="ie_companyname" name="ie_companyname"></td>
												<td style="background-color: #b0ccfe;">업종</td>
												<td><input type="text" class="form-control check2" id="ie_bizclassification" name="ie_bizclassification"></td>
											</tr>
											<tr>
												<td style="background-color: #b0ccfe;">종사업장번호</td>
												<td><input type="text" class="form-control check2" id="ie_taxnumber" name="ie_taxnumber"></td>
												<td style="background-color: #b0ccfe;">대표자명</td>
												<td><input type="text" class="form-control check2" id="ie_ceoname" name="ie_ceoname"></td>
												<td style="background-color: #b0ccfe;">회사주소</td>
												<td colspan="3"><input type="text" class="form-control" id="ie_companyaddress" name="ie_companyaddress"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>	
						 <!-- ----------------------------------------------   부가사항 DIV  ----------------------------------------------------------->
						 	<div id="myTabContent1" class="tab-content padding-10 form-horizontal bv-form" style="margin-top: -40px; text-align: center;">
								<div>
									<table id="" class="table table-bordered table-striped">
										<colgroup>
											<col style="width: 25%;">
											<col style="width: 25%;">
											<col style="width: 25%;">
											<col style="width: 25%;">
											<col style="width: 10%;">
											<col style="width: 15%;">
										</colgroup>
										<tbody>
											<tr>
												<td>작성일자</td>
												<td>공급가격</td>				
												<td>세액</td>			
												<td>비고</td>		
											</tr>
											<tr>	
												<td><input type="text" class="form-control check2" id="issuedate" name="issuedate"></td>
												<td><input type="text" class="form-control check2" id="chargetotal" name="chargetotal" style = "background-color:#e8e8e8" value="0"></td>	
												<td><input type="text" class="form-control" id="taxtotal" name="taxtotal" style = "background-color:#e8e8e8" value="0"></td>
												<td><input type="text" class="form-control" id="description" name="description"></td>
											</tr>
										</tbody>
									</table>
									<table id="" class="table table-bordered table-striped" style="margin-top: -20px; text-align: center;">
										<colgroup>
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
										</colgroup>
										<tbody>
											<tr>
												<td>월/일</td>
												<td>품목</td>				
												<td>규격</td>			
												<td>수량</td>		
												<td>단가</td>		
												<td>공급가액</td>		
												<td>세액</td>		
												<td>비고</td>		
												<td><button>+</button></td>		
											</tr>
											<tr>	
<!-- 											<td><input type="text" class="form-control" id="ie_companyaddress" name="ie_companyaddress" style = "width: 30%; float: left;" >/<input type="text" class="form-control" id="ie_companyaddress" name="ie_companyaddress" style = "width: 30%;"></td> -->
												<td><input type="text" class="form-control check2" id="conn_date" name="conn_date"></td>
												<td><input type="text" class="form-control check2" id="subject" name="subject"></td>	
												<td><input type="text" class="form-control" id="unit" name="unit"></td>
												<td><input type="text" class="form-control" id="quantity" name="quantity"></td>
												<td><input type="text" class="form-control" id="unitprice" name="unitprice"></td>
												<td><input type="text" class="form-control" id="supplyprice" name="supplyprice"></td>
												<td><input type="text" class="form-control" id="tax" name="tax"></td>
												<td><input type="text" class="form-control" id="sub_description" name="sub_description"></td>
												<td><input type="text" class="form-control" id="inputplus" name="inputplus"></td>
											</tr>
										</tbody>
									</table>
									<table id="" class="table table-bordered table-striped" style="margin-top: -20px; text-align: center!important;">
										<colgroup>
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
											<col style="width: 10%;">
										</colgroup>
										<tbody>
											<tr>
												<td>합계금액</td>
												<td>현금</td>				
												<td>수표</td>			
												<td>어음</td>		
												<td>외상미수금</td>	
												<td rowspan = "2" style="text-align: center;">
												<span>
												<label>
												<input type="radio" class="form-control" name="purposetype" title = "영수" value = "01">영수
												</label>
												<br>
												<label>
												<input type="radio" class="form-control" name="purposetype" title = "청구" value = "02">청구
												</label>
												</span>
												</td>
											</tr>
											<tr>	
												<td><input type="text" class="form-control check2" id="grandtotal" name="grandtotal"></td>
												<td><input type="text" class="form-control check2" id="cash" name="cash"></td>	
												<td><input type="text" class="form-control" id="scheck" name="scheck"></td>
												<td><input type="text" class="form-control" id="draft" name="draft"></td>
												<td><input type="text" class="form-control" id="uncollected" name="uncollected"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>	
						     <!-- ----------------------------------------------   발급,수신 담장자 DIV  ----------------------------------------------------------->
						     <div style = "margin-top: 30px">
						     <table id="" class="table table-bordered table-striped" style="text-align: center;">
										<colgroup>
											<col style="width: 10%;">
											<col style="width: 25%;">
											<col style="width: 25%;">
											<col style="width: 25%;">
										</colgroup>
										<tbody>
											<tr>
												<td></td>
												<td>발급 담당자</td>				
												<td>수신 담당자1</td>			
												<td>수신 담당자2</td>		
											</tr>
											<tr>	
												<td>담당자 부서명</td>
												<td><input type="text" class="form-control check2" id="ir_busename" name="ir_busename"></td>	
												<td><input type="text" class="form-control" id="ie_busename1" name="ie_busename1"></td>
												<td><input type="text" class="form-control" id="ie_busename2" name="ie_busename2"></td>
											</tr>
											<tr style = "background-color: #FFFFFF;">
												<td>담당자 명 *</td>
												<td><input type="text" class="form-control check2" id="ir_name" name="ir_name"></td>	
												<td><input type="text" class="form-control" id="ie_name1" name="ie_name1"></td>
												<td><input type="text" class="form-control" id="ie_name2" name="ie_name2"></td>
											</tr>
											<tr>	
												<td>이메일 주소 *</td>
												<td><input type="text" class="form-control check2" id="ir_email" name="ir_email"></td>	
												<td><input type="text" class="form-control" id="ie_email1" name="ie_email1"></td>
												<td><input type="text" class="form-control" id="ie_email2" name="ie_email2"></td>
											</tr>
											<tr style = "background-color: #FFFFFF;">
												<td>연락처</td>
												<td><input type="text" class="form-control check2" id="ir_cell" name="ir_cell"></td>
												<td><input type="text" class="form-control" id="ie_cell1" name="ie_cell1"></td>
												<td><input type="text" class="form-control" id="ie_cell2" name="ie_cell2"></td>
											</tr>
										</tbody>
									</table>
									</div>
						<div style="text-align: center;">
							<button class="btn btn-sm btn-primary" id="sendButton"
								type="button" onclick="sendNts()" style="width: 100px;">국세청 전송</button>
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
       data: $("#Form").serialize(),
       async: false,
       success: function(result) {
    	   
    	   
       	$("#hometaxbill_id").val(result.dbp_id)
       	$("#spass").val(result.dbp_pass)
       	$("#apikey").val(result.dbp_apikey)
       	$("#homemunseo_id").val()
       	$("#issueid").val()
       	$("#ir_keyno").val(result.dbp_keyno)
       	$("#ir_companynumber").val(result.dbp_co_num)
//      	$("#ir_taxnumber").val() //종 사업장 번호
       	$("#ir_companyname").val(result.dbp_name)
       	$("#ir_ceoname").val(result.dbp_ceoname)
       	$("#ir_companyaddress").val(result.dbp_address)
       	$("#ir_biztype").val(result.dbp_biztype)
       	$("#ir_bizclassification").val(result.dbp_bizclassification)
       	$("#ir_email").val(result.dbp_email)
       	$("#ir_busename").val(result.dbp_busename)
       	$("#ir_name").val(result.dbp_name)
       	$("#ir_email").val(result.dbp_email)
       	$("#ir_cell").val(result.dbp_cell)
       	
       },
       error: function(){
       	alert("공급받는자 정보 불러오기 에러");
       }
	}); 
}


// ---------------------------- 공급 받는자 --------------------------------------------------------

function supliedSelect(value){
	 $.ajax({
       url: '/dyAdmin/bills/supliedSelectAjax.do',
       type: 'POST',
       data: $("#Form").serialize(),
       async: false,  
       success: function(result) {
    	   
    	console.log(result);
       	$("#ie_keyno").val(result.dbs_keyno)
       	$("#ie_companynumber").val(result.dbs_co_num)
     	$("#ie_taxnumber").val(result.dbs_taxnum) //종 사업장 번호
       	$("#ie_companyname").val(result.dbs_name)
       	$("#ie_ceoname").val(result.dbs_ceoname)
       	$("#ie_companyaddress").val(result.dbs_address)
       	$("#ie_biztype").val(result.dbs_biztype)
       	$("#ie_bizclassification").val(result.dbs_bizclassification)
       	$("#ie_email").val(result.dbs_email1)
       	$("#ie_busename1").val(result.dbs_busename1)
       	$("#ie_name1").val(result.dbs_name1)
       	$("#ie_email1").val(result.dbs_email1)
       	$("#ie_cell1").val(result.dbs_cell1)

       	
       },
       error: function(){
       	alert("공급받는자 정보 불러오기 에러");
       }
	}); 
}

function sendNts(){
	
// 	if(!validationCheck()) return false
	
	 $.ajax({
        url: '/dyAdmin/bills/sendNtsAjax.do',
        type: 'POST',
        data: $("#Form").serialize(),
        async: false,  
        success: function(result) {
        	
        	cf_smallBox('전송 완료', "세금 계산서 발행 완료", 3000,);
        },
        error: function(){
        	alert("전송 실패");
        }
	}); 
}

function seletAll(){
	
	if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
	else $("input[name=chk]").prop("checked", false);
}


</script>