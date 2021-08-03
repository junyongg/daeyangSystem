<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf" %>
<%@ taglib prefix="tiles" 	uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="${homeData.HM_LANG }">

<head>

    <tiles:insertAttribute name="meta" />
    <tiles:insertAttribute name="css" />
    <tiles:insertAttribute name="script" />

</head>

<body>
	<c:if test="${currentMenu.MN_URL eq '/cf/member/login.do' }">
        <!-- 메인화면 -->
        <tiles:insertAttribute name="body" />
    </c:if>
	<c:if test="${currentMenu.MN_URL ne '/cf/member/login.do' }">
	<!-- 구분 회원가입 페이지 vs 일반 페이지 true 면, 회원가입페이지 false 면 일반페이지 -->
	<c:set var="apart" value="${fn:contains(currentMenu.MN_URL,'/cf/member/regist')}" />
	<div id="wrap" class="${apart ? 'bgWhite' : ''}">
	    <tiles:insertAttribute name="header" />
	 	 <div id="${apart ? 'J_Wapper' : 'bt_contents' }">
	   
	    <c:if test="${!apart}">
	         <tiles:insertAttribute name="subTop" />
	    </c:if>
	   
	    <c:if test="${currentMenu.MN_LEV eq 0 }">
	        <!-- 메인화면 -->
	        <tiles:insertAttribute name="body" />
	    </c:if>
	
	    <c:if test="${currentMenu.MN_LEV ne 0 }">
	      
	        <!-- 서브 페이지  -->
	        	<tiles:insertAttribute name="body" />
	       
	        <%-- <div id="subContentsWrap_01">
	            <div class="subBottomWrap">
	                <tiles:insertAttribute name="leftmenu" />
	                <div class="subRightContentsWrap" id="contents_start">
	                    <tiles:insertAttribute name="rightTop" />
	                    <div class="subRightContentsBottomWrap">
	                        
	                    </div>
	
	                    <c:if test="${currentMenu.MN_GONGNULI_YN eq 'Y' && currentMenu.MN_PAGEDIV_C ne sp:getData('MENU_TYPE_BOARD') }">
	                        <div style="margin-top: 100px;">
	                            <%@ include file="/WEB-INF/jsp/user/_common/prc_gong_nuli.jsp" %>
	                        </div>
	                    </c:if>
	                  <c:if test="${currentMenu.MN_RESEARCH eq 'Y' }">
	                      <div style="margin-top: 100px;">
	                      	<jsp:include page="${researchPath}"/>
	                      </div>
	                    </c:if>
	                </div>
	            </div>
	        </div> --%>
	
	    </c:if>
	    </div>
	</div>
	</c:if>
	
<%--     <tiles:insertAttribute name="footer" /> --%>

<%--     <c:if test="${not empty popupList_W }">
       <jsp:include page="${popupLayoutPath}"/>
    </c:if>

    <div class="loading_box">
        <div class="bg"></div>
        <img src="/resources/img/loading/loading.gif" title="Loading.." alt="로딩중" />
    </div> --%>
</body>

</html>