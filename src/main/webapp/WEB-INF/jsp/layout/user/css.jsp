<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf" %>

<!-- FAVICONS -->
<c:choose>
	<c:when test="${not empty homeData.HM_FAVICON }">
		<c:choose>
			<c:when test="${fn:indexOf(homeData.HM_FAVICON,'http') eq -1 }">
		<c:set var="homeIcon" value="${domain }${homeData.HM_FAVICON }"/>	
			</c:when>
			<c:otherwise>
		<c:set var="homeIcon" value="${homeData.HM_FAVICON }"/>			
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<c:set var="homeIcon" value="${domain }/resources/favicon.ico"/>
	</c:otherwise>
</c:choose>

<link rel="shortcut icon" href="${homeIcon }" type="image/x-icon">
<link rel="icon" href="${homeIcon }" type="image/x-icon">


<!-- CSS적용 -->
<c:forEach items="${ResourcesList }" var="cssCommon">
	
	<c:if test="${cssCommon.RM_TYPE eq 'css' }">
        <c:if test="${cssCommon.RM_FILE_NAME ne 'customCodeBlocks' }">
            <link href="${cssCommon.RM_PATH }?${cssCommon.VERSION}" type="text/css" rel="stylesheet"> 
        </c:if>
        <c:if test="${cssCommon.RM_FILE_NAME eq 'customCodeBlocks' }">
            <c:if test="${BoardType.BT_HTMLMAKER_PLUS_YN eq 'S'}">
                <link href="${cssCommon.RM_PATH }?${cssCommon.VERSION}" type="text/css" rel="stylesheet"> 
            </c:if>
        </c:if>
   	</c:if>
</c:forEach> 

<link type="text/css" rel="stylesheet" href="/resources/user/css/default.css">

<c:if test="${not empty currentPath }">
	<jsp:include page="/WEB-INF/jsp/publish/${currentPath }/include/css.jsp"/>
</c:if>


