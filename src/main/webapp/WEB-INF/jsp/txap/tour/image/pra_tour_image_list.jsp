<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<style>

.smart-form .inline-group .checkbox, .smart-form .inline-group .radio {margin-right: 10px;}

#viewImg {display:none;position: fixed;top:0;left:0;width:100%;height:100%;z-index: 1000000;background: rgba(0,0,0,0.7)}
#viewImg img {cursor: pointer;}
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
					<h2>관광사진 리스트</h2>
				</header>
				<div class="widget-body " >
					<div class="widget-body-toolbar bg-color-white">
						<div class="alert alert-info no-margin fade in">
							<button type="button" class="close" data-dismiss="alert">×</button>
							관광사진 리스트를 확인합니다.
						</div> 
					</div>
					<div class="widget-body-toolbar bg-color-white smart-form">
						<div class="row">
							<!-- <div class="col col-sm-3 text-align-right pull-right">
								<div class="btn-group">
									<a class="btn btn-sm btn-primary" href="javascript:;" onclick="pf_moveDetail()">
										<i class="fa fa-plus"></i> 관광정보 등록
									</a>  
								</div>
							</div> -->
						</div>
					</div>
					<div class="table-responsive">
						<jsp:include page="/WEB-INF/jsp/txap/include/search/pra_search_header_paging.jsp" flush="true">
							<jsp:param value="/txap/tour/image/pagingAjax.do" name="pagingDataUrl" />
							<jsp:param value="/txap/tour/image/excelAjax.do" name="excelDataUrl" />
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

<div id="viewImg">

</div>


<script type="text/javascript">


function pf_viewImage(path){
	
	var temp = '<img src="'+path+'" onload="pf_viewImageSetPosition()">';
	$('#viewImg').append(temp);
	
}

function pf_viewImageSetPosition(){
	
	
	$('#viewImg').show('300');
	
	var windowWidth = $(window).width();
	var windowHeight = $(window).height();
	var imgWidth = $('#viewImg img').width();
	
	if(windowWidth > imgWidth){
		$('#viewImg img').css({
			'margin-left':(windowWidth-imgWidth)/2+'px'	
		});
	}else{
		$('#viewImg img').css({
			'width'			:	'90%',
			'margin-left'	:	'5%'
		});
	}
	
	var imgHeight = $('#viewImg img').height();
	
	if(windowHeight > imgHeight){
		$('#viewImg img').css({
			'margin-top':(windowHeight-imgHeight)/2+'px'	
		});
	}else{
		$('#viewImg img').css({
			'height'		:	windowHeight * 0.9 + 'px',
			'margin-top'	:	windowHeight * 0.05 + 'px'
		});
	}
	
	
	
	$('#viewImg img').on('click',function(){
		
		$('#viewImg').hide('300');	
		$('#viewImg img').remove();
	})
}

//관광정보 상세화면으로 이동
function pf_moveDetail(key,type){
	$('#TC_KEYNO').val(key);
	$('#TC_TYPE').val(type);
	$('#Form').attr('action','/txap/tour/info/insertView.do');
	$('#Form').submit();
}


</script>