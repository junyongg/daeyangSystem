<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.net.URLEncoder,com.tx.common.dto.Common" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=Content-Type content="text/html; charset=UTF-8"> 
<%

String visitorCase = (String)request.getAttribute("visitorCase");
String MENU_MAIN_NAME = (String)request.getAttribute("MENU_MAIN_NAME");
String MAIN_NAME = (String)request.getAttribute("MAIN_NAME");
String SUB_NAME = (String)request.getAttribute("SUB_NAME");

String fileName = "";

if(MENU_MAIN_NAME == null || MENU_MAIN_NAME.isEmpty()){
	fileName = "전체 메뉴 게시글 조회 " + visitorCase + "별 통계.xls";
}else{
	fileName = "( " + MENU_MAIN_NAME +" " + MAIN_NAME + ") " + SUB_NAME + " 게시글 조회 " + visitorCase + "별 통계.xls";
}

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

<table>
	<thead>
		<tr></tr>
		<tr class="background">
			<th colspan="3" class="title">
			${not empty MENU_MAIN_NAME ? '(' : ''}
			${MENU_MAIN_NAME} ${MAIN_NAME} 
			${not empty MENU_MAIN_NAME ? ')' : ''}
			${SUB_NAME} 게시글 ${visitorCase}별 통계
			</th>
		</tr>
		<tr></tr>
		<tr>
			<th colspan="3" class="Subdate">
				<c:if test="${not empty search.searchBeginDate || not empty search.searchEndDate  }">
				${search.searchBeginDate} ~ ${search.searchEndDate}
				</c:if>
			</th>
		</tr>
	</thead>
</table>		

<table id="dt_basic">
	<thead>
		<tr class="background2">
			<th class="thsize">${visitorCase}</th>
			<th class="thsize">접속자수</th>
			<th class="thsize">비율</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${total ne '0'}">
			<c:forEach items="${html }" var="model" varStatus="status">
			<tr>
				<td class="tdName">${model.CONTENT }</td> 
				<td class="tdName">${model.COUNT }</td> 
				<td class="tdName">${model.persent }%</td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${total eq '0'}">
 			<tr> 
 				<td colspan="3" class="thsize">검색 결과가 없습니다.</td>
 			</tr>
 		</c:if>	
	</tbody>
	<c:if test="${total ne '0'}">
		<tfoot id="footercolumn">
			<tr>
				<th colspan="1" class="thsize">total</th>
				<th class="thsize">${total }</th>
				<th class="thsize">100%</th>
			</tr>
		</tfoot>
	</c:if>
</table>