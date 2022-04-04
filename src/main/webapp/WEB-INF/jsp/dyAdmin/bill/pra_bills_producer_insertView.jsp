<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<%@ include file="/WEB-INF/jsp/dyAdmin/include/CodeMirror_Include.jsp"%>
<script type="text/javascript" src="/resources/common/js/common/diff_match_patch.js"></script>

<style>
.columnTitle {
	text-align: center;
	word-break: keep-all;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ccc;
	padding: 5px 0
}

.columnTitle section {
	margin-bottom: 0
}

.option_dp, .selectCodeWrap, .column_size_dp {
	display: none;
}

.column_ul .column_li label {
	width: 20%;
}

.column_ul .column_li input {
	padding-left: 10px;
	width: 50%;
}

.column_ul .column_li div {
	margin-left: 20px;
}
</style>

<script type="text/javascript">

</script>

<div id="content">

	<section id="widget-grid">
		<div class="row">
			<article class="col-sm-12 col-md-12 col-lg-12">
				<div class="jarviswidget jarviswidget-color-blueDark" id="" data-widget-editbutton="false">
					<header>
						<span class="widget-icon"> <i class="fa fa-table"></i>
						</span>
					    <h2>공급자 등록</h2>
					</header>

					<div class="widget-body">

						<form:form id="Form" class="form-horizontal" name="Form"  method="post">
							<legend>
								<div class="widget-body-toolbar bg-color-white">
									<div class="alert alert-info no-margin fade in">
										<button type="button" class="close" data-dismiss="alert">×</button>
										세금계산서 공급자 등록 
									</div>
								</div>
							</legend>

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
											<col style="width: 10%;">
										</colgroup>
										<tbody>
											<tr>
												<td>회사코드(아이디)</td>
												<td><input type="text" class="" id="hometaxbill_id" name="hometaxbill_id"></td>
												<td>패스워드</td>
												<td><input type="text" class="" id="spass" name="spass"></td>
												<td>인증키</td>
												<td><input type="text" class="" id="apikey" name="apikey"></td>
												<td>고유번호(자동생성)</td>
												<td><input type="text" class="" id="homemunseo_id" name="homemunseo_id"></td>
											</tr>
											<tr>
												<td>사업자등록번호</td>
												<td><input type="text" class="" id="ir_companynumber" name="ir_companynumber"></td>
												<td>업태</td>
												<td><input type="text" class="" id="ir_biztype" name="ir_biztype"></td>
												<td>상호</td>
												<td><input type="text" class="" id="ir_companyname" name="ir_companyname"></td>
												<td>업종</td>
												<td><input type="text" class="" id="ir_bizclassification" name="ir_bizclassification"></td>
											</tr>
											<tr>
												<td>대표자성명</td>
												<td><input type="text" class="" id="ir_ceoname" name="ir_ceoname"></td>
												<td>담당부서명</td>
												<td><input type="text" class="" id="ir_busename" name="ir_busename"></td>
												<td>담당자명</td>
												<td><input type="text" class="" id="ir_name" name="ir_name"></td>
												<td>담장자전화번호</td>
												<td><input type="text" class="" id="ir_cell" name="ir_cell"></td>
											</tr>
											<tr>
												<td><span class="nessSpan">*</span>스킨 이름</td>
												<td colspan="3"><input type="text" 	class="form-control checkTrim" id="PIS_SUBJECT" name="PIS_SUBJECT" value="${PIS_DATA.PIS_SUBJECT }" maxlength="100">
											</tr>
											<tr>
												<td><span class="nessSpan">*</span>코멘트</td>
												<td colspan="3"><input type="text" class="form-control" name="PISH_COMMENT" id="PISH_COMMENT" data-bv-field="fullName" maxlength="500" placeholder="no message"></td>
											</tr>										
											<tr>
												<td colspan="4">
													<fieldset class="padding-10 text-right">
														<button class="btn btn-sm btn-primary" type="button" onclick="pf_popupSkinInsert()">저장</button>
														<button class="btn btn-sm btn-default" id="Board_Delete" type="button" onclick="pf_back()">취소</button>
													</fieldset>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</article>
		</div>
	</section>
</div>