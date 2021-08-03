<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<table class="tbl_verti1 log_tbl">
	<caption>실시간 로그</caption>
	<colgroup>
		<col width="25%">
		<col width="75%">
	</colgroup>
	<thead>
		<tr>
			<th>일시</th>
			<th>내용</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultlist }" var="l">
			<tr>
				<td>${l.IO_DATE }</td>
				<td><span class="log">STATUS - ${l.IO_STATUS } &nbsp;&nbsp; | &nbsp; Current_Power : ${l.IO_POWER } kWh &nbsp; , &nbsp; Current_Usage : ${l.IO_USAGE } kWh &nbsp; , &nbsp; 절감수익 : ${l.IO_CASH } 원 &nbsp; , &nbsp; Co2절감량 : ${l.IO_CO2 } kco2</span></td>
			</tr>
		</c:forEach>
	</tbody>
</table>


				<div class="b-btn-box">
					<%-- <button type="button" class="btn-list-bottom prev" onclick="PrePage('${CurrentPage}')">
						<span class="icon"><i class="xi-angle-left"></i></span>
						<span class="txt">이전글</span>
					</button>
					<button type="button" class="btn-list-bottom next" onclick="NextPage('${CurrentPage}','${MaxPage}')">
						<span class="txt">다음글</span>
						<span class="icon"><i class="xi-angle-right"></i></span>
					</button> --%>
					
					<ul class="page-ul">
						<ui:pagination paginationInfo="${PaginationInfo }"
								type="normal" jsFunction="pf_LinkPage" />
					</ul>
				</div>