<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<div id="content">
	<form:form id="Form" name="Form" method="post" action="">
		<input type="hidden" name="BST_KEYNO" id="BST_KEYNO" value="" />
		<input type="hidden" name ="type" id="type" value="" />
		<section id="widget-grid" >
			<div class="row">
				<article class="col-sm-12 col-md-12 col-lg-12">
					<div class="jarviswidget jarviswidget-color-blueDark" id="BOARD_TYPE_LIST_1" data-widget-editbutton="false">
						<header>
							<span class="widget-icon"> <i class="fa fa-table"></i>
							</span>
							<h2>스킨 내역</h2>
						</header>
						<div class="widget-body " >
							<div class="widget-body-toolbar bg-color-white">
								<div class="alert alert-info no-margin fade in">
									<button type="button" class="close" data-dismiss="alert">×</button>
									스킨 목록입니다.
								</div> 
							</div>
							<div class="widget-body-toolbar bg-color-white">
								<div class="row"> 
									<div class="col-sm-12 col-md-4 text-align-right" style="float:right;">
										<!-- <div class="btn-group">  
											<button class="btn btn-sm btn-primary" type="button" onclick="pf_PublishFile()">
												<i class="fa fa-file"></i> 전체 배포
											</button> 
										</div> -->
										<!-- <div class="btn-group">  
											<button class="btn btn-sm btn-primary" type="button" onclick="pf_BoardTemplateRegist()">
												<i class="fa fa-plus"></i> 게시판 스킨 생성
											</button> 
										</div> -->
									</div>
								</div>
							</div>
							<div class="table-responsive">
								<jsp:include page="/WEB-INF/jsp/dyAdmin/include/search/pra_search_header_paging.jsp" flush="true">
									<jsp:param value="/dyAdmin/AllSkinAjax.do" name="pagingDataUrl" />
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
</div>