<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.net.URLEncoder,com.tx.common.dto.Common" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type content="text/html; charset=UTF-8"> 
<%

String fileName = request.getParameter("MN_NAME") +  " 게시물 내역.xls";

String header = request.getHeader("User-Agent");
   if (header.contains("Trident")) {
   	header = "MSIE";
   } else if(header.contains("Chrome")) {
   	header = "Chrome";
   } else if(header.contains("Opera")) {
   	header = "Opera";
   }else{
   	header = "Firefox"; 
   }

if (header.contains("MSIE")) {
       String docName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20"); 
       response.setHeader("Content-Disposition", "attachment;filename=" + docName + ";");
} else if (header.contains("Firefox")) {
       String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
       response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
} else if (header.contains("Opera")) {
       String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
       response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
} else if (header.contains("Chrome")) {
       String docName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
       response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
}

response.setHeader("Content-Description", "JSP Generated Data");


%>

<style>
#dt_basic {
	border:3pt solid #000;
	border-bottom:3pt solid #000;
	border-right:3pt solid #000;
	border-left:3pt solid #000;
}

.thsize{
	border: 1px solid #000;
	font-family:돋움;
	font-size:11pt;
	font-weight:bold;
}
.tdNum, .tdName, .xl24, .tdsize, .tdsizeSlim, .tdsize2, .tdsizetext{
	border-top: 0.5pt dotted #000;
	border-bottom: 0.5pt dotted #000;
	border-right: 1pt solid #000;
	border-left: 1pt solid #000;
	font-family:돋움;
	font-size:9pt;
	font-weight:bold;
    mso-pattern:auto none; 
    white-space:normal;
}
.tdsizeSlim{
	border-right: 0.5pt solid #000;
	border-left: 0.5pt solid #000;
}
.tdsize2{
	border-left: 0.5pt solid #000;
}

.tdNum, .tdName, .xl24, .tdsizetext{
	text-align:center;
	mso-number-format: "@";
}

.tdsizeSlim, .tdsize2, .tdsize{
 	mso-number-format:"\#\,\#\#0\ "; 
    text-align:right; 
}

.title{
    background-color : #c6e0b4;
    font-size: 22px;
    font-weight: bold;
    border: 3pt solid black;
    height: 37.5pt;
    font-family: 맑은 고딕;
}
.background{
	 background-color : #c6e0b4;
	 mso-height-source:userset;
	 height:37.5pt;
	 font-size:50pt;
	 font-weight:bold;
}
.background2{
 	background-color : #e2efda;
}
.Subdate{
    height: 18.75pt;
    text-align: right;
    height: 30pt;
}
.xl24   {mso-number-format:"\@";}   
br      {mso-data-placement:same-cell;}   
.plus {
	color : #2278e2;
}
.foot {
	background-color:#8c8b94; 
	color:#ffffff;
	font-weight: bold;
	border:1px solid #ddd;
	border-top:1px solid #000;
	mso-number-format:"\#\,\#\#0\ "; 
    text-align:right; 
    mso-pattern:auto none; 
    white-space:normal;
}

</style>
</head>
<body>
<c:set var="colspan" value="${fn:length(BoardColumnList)+5 }"/>
<table>
	<thead>
		<tr></tr>
		<tr class="background">
			<th colspan="${colspan}" class="title"><%=fileName%></th>
		</tr>
		<tr></tr>
		<tr>
			<th colspan="${colspan}" class="Subdate" style="text-align:left;">
				검색결과 : ${fn:length(resultList)}건
			</th>
			
		</tr>
	</thead>
</table>		

<table id="dt_basic">
	<thead>
		<tr class="background2">
			<th class="thsize">번호</th>
			<c:forEach items="${BoardColumnList }" var="model">
			<th class="thsize">${model.BL_COLUMN_NAME }</th>
			</c:forEach>
			<th class="thsize">작성자</th>
			<th class="thsize">작성일</th>
			<th class="thsize">최근 작업 IP</th>
			<th class="thsize">사용여부</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${resultList }" var="model" varStatus="status">
		<tr>
			<td class="tdName">${model.NUM }</td>
			<c:forEach items="${BoardColumnList }" var="column">
			<c:set var="tempName">BD_DATA_${column.KEYNO}</c:set>
			<td class="tdName"><c:out value="${model[tempName]}"/></td>					
			</c:forEach>
			<td class="tdName"><c:out value="${model.BN_UI_NAME} "/></td>
			<td class="tdName">${model.BN_REGDT }</td>
			<td class="tdName">${model.BN_IP }</td>
			<td class="tdName">${model.BN_USE }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
