<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<form:form id="Form" name="Form" method="post" action="">
<section id="in-contents">
		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">

			<!-- 검색부분 -->
			<div class="row bgW drive-s-in-con">
				<div class="bnt-box">
					<div class="lb">
						<p class="in-tit">사용자 관리</p>
					</div>
					<div class="rb">
						<button type="button" class="btn-fuc1" onclick="location.href='/dyAdmin/person/view.do'">
							<span class="icon" style="background-image: url('/resources/img/icon/icon_t_board_modify.png');"></span>
							<span class="txt">회원관리 이동</span>
						</button>
					</div>
				</div>

				<div class="tbl-box table_wrap_mobile">
					<jsp:include page="/WEB-INF/jsp/dyAdmin/include/search/pra_search_header_paging.jsp" flush="true">
								<jsp:param value="/userAjax.do" name="pagingDataUrl" />
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
$("#gnb li:nth-child(5)").addClass('active');
</script>