<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<link type="text/css" rel="stylesheet" href="/resources/common/css/map/tourmap.css">

      	<jsp:include page="prc_tour_data_${category}.jsp" flush="false" />

		<c:if test="${category ne 'course'}">
		<%@ include file="common/prc_tour_data_map.jsp"%>
		</c:if>

	<form id="Form">
		<input type="hidden" id="TC_LAT" name="TC_LAT" value="${resultData.TC_LAT}" >
		<input type="hidden" id="TC_LNG" name="TC_LNG" value="${resultData.TC_LNG}" >
		<input type="hidden" id="TC_TYPE" name="TC_TYPE" value="${sp:getData('TOUR_DESTINATION')}" >
		<input type="hidden" id="TC_KEYNO" name="TC_KEYNO" value="${resultData.TC_KEYNO}" >
		<input type="hidden" id="distance" name="distance" value="0.5" >
	</form>

<%@ include file="../images/prc_tour_img_view.jsp"%>

<script type="text/javascript" src="/resources/common/js/common/tour_function.js"></script>
<script type="text/javascript">
function pf_location(key,type){
	if(type == 'MenuPage'){
		location.href='/tour/tour/'+key+'/view.do'
	}else if(type == 'VirtruePage'){
	}else{
		location.href='/tour/tour/page/'+key+'/view.do?typeInfo='+type
	}
}
</script>

