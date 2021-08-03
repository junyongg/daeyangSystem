<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<c:forEach items="${resultList }" var="model">
	${model.columnName } // ${model.columnKey } // ${model.value }
</c:forEach>
