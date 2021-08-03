<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<c:if test="${empty resultList }">
<tr>
	<td colspan="3">데이터가 없습니다.</td>
</tr>
</c:if>

<c:forEach items="${resultList }" var="model">

<tr>
	<td>${model.TC_TYPE_NAME }</td>
	<td class="title">${model.TC_TITLE }</td>
	<td style="text-align: center;">
		<button class="btn btn-sm btn-success" type="button" onclick="pf_settingForm('${model.TC_TYPE}','update','${model.TC_KEYNO }')">수정</button>
		<button class="btn btn-sm btn-primary" type="button" onclick="pf_settingForm('${model.TC_TYPE}','copy','${model.TC_KEYNO }')">복사</button>
		<button class="btn btn-sm btn-danger" type="button" onclick="pf_deleteSimple('${model.MENUYN}','${model.TC_KEYNO }')">삭제</button>
		<input type="hidden" value="${model.TC_KEYNO }" class="thisKey">
	</td>
</tr>

</c:forEach>