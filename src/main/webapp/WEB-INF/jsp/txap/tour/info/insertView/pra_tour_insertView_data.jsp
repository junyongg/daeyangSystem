<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<%@ include file="common/pra_tour_insertView_common.jsp"%>

<c:if test="${categoryName != null && categoryName != ''}">
	<jsp:include page="pra_tour_insertView_${categoryName}.jsp"/>
</c:if>

<%@ include file="common/pra_tour_insertView_location.jsp"%>
<%@ include file="common/pra_tour_insertView_sns.jsp"%>
<%@ include file="common/pra_tour_insertView_route.jsp"%>

<c:if test="${categoryName ne 'restaurant' || categoryName ne 'lodgment'}">
<%@ include file="common/pra_tour_insertView_infomation.jsp"%>
</c:if>
