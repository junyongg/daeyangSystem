<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<style>

.smart-form .inline-group .checkbox, .smart-form .inline-group .radio {margin-right: 10px;}

</style>


<form:form id="Form" name="Form" method="post" action="">
	<input type="hidden" name="TC_KEYNO" id="TC_KEYNO" value="">
	<input type="hidden" name="TC_TYPE" id="TC_TYPE" value="">
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
				data-widget-editbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i>
					</span>
					<h2>${currentMenu.MN_NAME} 리스트</h2>
				</header>
				<div class="widget-body " >
					<div class="widget-body-toolbar bg-color-white">
						<div class="alert alert-info no-margin fade in">
							<button type="button" class="close" data-dismiss="alert">×</button>
							${currentMenu.MN_NAME} 리스트를 확인합니다.
						</div> 
					</div>
					<div class="widget-body-toolbar bg-color-white smart-form">
						<div class="row">
							 <div class="col-sm-9">
								<div class="inline-group">
									<label class="radio">
										<input type="radio" name="TC_TYPE_ALL" value="Y" checked="checked" onclick="pf_checkBoxClick('all');">
										<i></i>모두</label>
									<c:forEach items="${tourInfoList }" var="tourInfo">
									<label class="checkbox">
										<input type="checkbox" name="TC_TYPE_UNIT" value="${tourInfo.SC_KEYNO }" onclick="pf_checkBoxClick();">
										<i></i>${tourInfo.SC_CODENM }</label>
									</c:forEach>
								</div>
							</div> 
							<div class="col col-sm-3 text-align-right pull-right">
								<div class="btn-group">
									<a class="btn btn-sm btn-primary" href="javascript:;" onclick="pf_moveDetail()">
										<i class="fa fa-plus"></i> 관광정보 등록
									</a>  
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<jsp:include page="/WEB-INF/jsp/txap/include/search/pra_search_header_paging.jsp" flush="true">
							<jsp:param value="/txap/tour/info/pagingAjax.do" name="pagingDataUrl" />
							<jsp:param value="/txap/tour/info/excelAjax.do" name="excelDataUrl" />
						</jsp:include>
						<fieldset id="tableWrap">
						</fieldset>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>
</form:form>

<script type="text/javascript">
$(function(){
	$('input[name=TC_TYPE_ALL]').on('change',function(){
		if($(this).is(':checked')){
			$('input[name=TC_TYPE_UNIT]').prop('checked',false);
		}
	});
	
	$('input[name=TC_TYPE_UNIT]').on('change',function(){
		
		var checkedLength = $('input[name=TC_TYPE_UNIT]:checked').length;

		if(checkedLength > 0){
			$('input[name=TC_TYPE_ALL]').prop('checked',false);
		}else{
			$('input[name=TC_TYPE_ALL]').prop('checked',true);			
		}
	});
});

function pf_checkBoxClick(type){
	var typeArray = new Array();
	if(type != 'all'){
		$('input[name=TC_TYPE_UNIT]:checked').each(function(){
			typeArray.push($(this).val());
		});	
	}
	$('#TC_TYPE').val(typeArray);
	pf_getList();
}

//수정화면 이동
function pf_moveDetail(key,type){
	$('#TC_KEYNO').val(key);
	$('#TC_TYPE').val(type);
	$('#Form').attr('action','/txap/tour/info/insertView.do');
	$('#Form').submit();
}

</script>