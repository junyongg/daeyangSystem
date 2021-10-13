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
	<c:if test="${currentMenu.MN_URL eq '/dy/member/login.do' }">
        <tiles:insertAttribute name="body" />
    </c:if>
	<c:if test="${currentMenu.MN_URL ne '/dy/member/login.do' }">
	<c:set var="apart" value="${fn:contains(currentMenu.MN_URL,'/dy/member/regist')}" />
	   	  <div id="wrap">
         	<tiles:insertAttribute name="header" />
        	<tiles:insertAttribute name="subTop" />
       	 	<tiles:insertAttribute name="body" />
      	</div> 
	</c:if>
	
<%--     <tiles:insertAttribute name="footer" /> --%>
</body>

</html>