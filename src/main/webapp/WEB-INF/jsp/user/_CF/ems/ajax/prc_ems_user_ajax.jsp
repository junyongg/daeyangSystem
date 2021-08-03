<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<table class="tbl_verti1">
						<caption>사용자관리</caption>
						<colgroup>
							<col width="16.66%">
							<col width="16.66%">
							<col width="16.66%">
							<col width="16.66%">
							<col width="16.66%">
							<col width="16.66%">
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
								<th>사용자 ID</th>
								<th>이름</th>
								<th>연락처</th>
								<th>E-mail</th>
								<th>권한</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${resultList }" var="l">
								<tr>
									<td>${l.COUNT}</td>
									<td>${l.UI_ID}</td>
									<td>${l.UI_NAME}</td>
									<td>${l.UI_PHONE}</td>
									<td>${l.UI_EMAIL}</td>
									<td>${l.UIA_NAME}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="b-btn-box">
						<ul class="page-ul">
							<ui:pagination paginationInfo="${paginationInfo }"
								type="normal" jsFunction="pf_LinkPage" /> 
						</ul>
					</div>
