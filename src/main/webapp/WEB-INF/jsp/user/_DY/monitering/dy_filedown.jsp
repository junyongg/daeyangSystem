<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>



<style>
input { font-size: 14x; }

.thClass{ width: 50%;}
.buttonClass{ 
    padding: 17px 50px 17px 50px;
    font-size: 16px;
    border-radius: 30px;
	background-color: #709bdb;
    color: #fff;
    }
.file-chosen{
   padding-left: 65px;
}
.downClass{
	float: right;
}
.a_box_line{
	padding-top: 45.5px;
	padding-bottom: 30.5px;
	border-radius: 50%;  /* 완전한 원형을 만들기 위해 50%로 설정 */	
	width: 136px;        /* 버튼의 너비 */
   	height: 136px;       /* 버튼의 높이 */
	text-align: center;  /* 텍스트 가운데 정렬 */
}


@media screen and (max-width: 900px) {
	.buttonClass{
		padding : 15px;		
	    font-size: 14px;
	    margin : -15px;
	    float: left;
	}
	.file-chosen{
		padding : 0px 0px 0px 45px;
		width : 220px;
		display: block;
		float : left;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.tbl_private_se td{
		padding: 20px;
		height: 60px;
	}
}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<form:form action="/dy/moniter/DownAction.do?${_csrf.parameterName}=${_csrf.token}" method="POST" id="Form" enctype="multipart/form-data">

<input type="hidden" name="UI_KEYNO" value="${UI_KEYNO }">
<input type="hidden" name="DPP_NAME" value="${ob.DPP_NAME }">
<input type="hidden" name="DPP_FM_KEYNO" id="DPP_FM_KEYNO" value="${ob.DPP_FM_KEYNO }">
<input type="hidden" name="action" id="action" value="">


<div id="container" class="heightAuto">
            
	<section class="setting_one_w">
	
		<div class="power_select">
		    <select class="select_nor sm3 w100" id="DPP_KEYNO" name="DPP_KEYNO" value="${DPP_KEYNO }" onchange="DPPKey_Change(this.value)">
		        <c:forEach items="${list }" var="list">
		        	<option value="${list.DPP_KEYNO }" ${list.DPP_KEYNO eq DPP_KEYNO ? 'selected' : '' } >${list.DPP_NAME }</option>
		        </c:forEach>
		    </select>
		</div>
	  	
	    <h2 class="circle">발전소 : ${ob.DPP_NAME }</h2>
		<br>
		<article class="artBoard top">
			<h2 class="circle">민원처리 현황</h2>
		
		    <span class="state_b pos">
		    </span>
		    
		    <input type="hidden" value="${dls_now }" name="dls_now" id="dls_now">
		    
		    <div class="table_wrapper con_h">
				<a class="a_box_line active" href="javascript:;" onclick="subView('1')">발전사업<br>허가</a>
				▷
				<a class="a_box_line" href="javascript:;" onclick="subView('2')">개발행위<br>허가</a>
				▷
				<a class="a_box_line" href="javascript:;" onclick="subView('3')">PPA<br>(전력수급계약)</a>
				▷
				<a class="a_box_line" href="javascript:;" onclick="subView('4')">공사계획<br>신고</a>
				▷
				<a class="a_box_line" href="javascript:;" onclick="subView('5')">사용전검사<br>(준공검사)</a>
				▷
				<a class="a_box_line" href="javascript:;" onclick="subView('6')">설비<br>확인</a>
			</div>
			<br><br>
			
			<div class="table_wrapper con_h">
		        <table class="tbl_private_se">
		            <colgroup>
		                <col width="25%">
		                <col width="25%">
		                <col width="25%">
		                <col width="25%">
		            </colgroup>
		            <thead>
		            </thead>
		            <tbody>
		            	<tr class="tr1">
		            		<th class="th_name1">접수일</td>
		            		<td><input type="text" class="txt_nor sm2 w100" name="dls_conn" id="dls_conn"></td>
		            		<th class="th_name2">처리예정일</td>
		            		<td><input type="text" class="txt_nor sm2 w100" name="dls_endDate" id="dls_endDate"></td>
		            		<th class="alarm"></th>
		            	</tr>
		            	<tr>
		            		<th colspan="4" style="background: gray; color: white;">대양기업</th>
		            	</tr>
		            	<tr>
		            		<th>담당부서</th>
		                    <td><input type="text" class="txt_nor sm2 w100" name="dls_depart" id="dls_depart"></td>
		                    <th>담당자</th>
		                    <td><input type="text" class="txt_nor sm2 w100" name="dls_name" id="dls_name"></td>
		                </tr>
		                <tr>
		                	<th>연락처</th>
		                    <td><input type="text" class="txt_nor sm2 w100" name="dls_phone" id="dls_phone"></td>
		                    <th>비고</th>
		                    <td><input type="text" class="txt_nor sm2 w100" name="dls_other" id="dls_other"></td>
		                </tr>
		                
		                <tr>
		            		<th colspan="4" style="background: gray; color: white;">처리기관</th>
		            	</tr>
		            	<tr>
		                    <th>담당자</th>
		                    <td><input type="text" class="txt_nor sm2 w100" name="dls_name2" id="dls_name2"></td>
		                    <th>담당부서</th>
		                    <td><input type="text" class="txt_nor sm2 w100" name="dls_depart2" id="dls_depart2"></td>
		                </tr>
		                <tr>
		                	<th>연락처</th>
		                    <td><input type="text" class="txt_nor sm2 w100" name="dls_phone2" id="dls_phone2"></td>
		                    <th>비고</th>
		                    <td><input type="text" class="txt_nor sm2 w100" name="dls_other2" id="dls_other2"></td>
		                </tr>
		            </tbody>
		        </table>
			</div>
			
			<br>
			
			<!-- 관리자만 -->
			<c:if test="${userInfo.isAdmin eq 'Y'}">
				<div class="table_wrapper con_h">
					<button type="button" id="saveButton" class="btn_nor md2 g_line" style="float: right; font-size: 12px; height: 22px; padding: 1px;" title="저장" onclick="MainSubInsert()">저장</button>
					<input type="hidden" id="savetype" name="savetype" value="">
				</div>
			</c:if>
			<div class="div_2">
				<h2 class="circle">기본내용</h2>
					<div class="table_wrapper con_h">
				        <table class="tbl_private_se">
				            <colgroup>
				                <col width="13%">
				                <col width="13%">
				                <col width="13%">
				                <col width="13%">
				                <col width="13%">
				                <col width="13%">
				            </colgroup>
				            <thead>
				            </thead>
				            <tbody>
				            	<tr>
				            		<th>신청내용</td>
				            		<td colspan="5" style="text-align: center;">
				            			<span>
				            				<input type="radio" value="0" title="공작물설치" name="dlm_type" id="dlm_type" >
				            				<label for="dlm_type">공작물설치</label>
				            			</span>
				            			<span style="padding: 0px 0px 0px 100px;">
				            				<input type="radio" value="1" title="토지형질변경" name="dlm_type" id="dlm_type2">
				            				<label for="dlm_type2">토지형질변경</label>
				            			</span>
				            		</td>
				            	</tr>
				            	<tr>
				                    <th rowspan="4" style="border: 1px solid #ddd;">위치</th>
				                    <th>주소</th>
				                    <td colspan="4"><input type="text" class="txt_nor sm2 w100" name="dlm_address" id="dlm_address" value=""></td>
				                </tr>
				                <tr style="text-align: center;">
				                    <th rowspan="2" style="border: 1px solid #ddd;" >지번</th>
				                    <th style="border: 1px solid #ddd;">신청지번</th>
				                    <th style="border: 1px solid #ddd;">필지면적</th>
				                    <th style="border: 1px solid #ddd;">지목</th>
				                    <th style="border: 1px solid #ddd;">지역·지구</th>
				                </tr>
				                <tr>
				                	<td style="padding: 0px;"><input type="text" class="txt_nor sm2 w100" style="width: 93%" name="dlm_street" id="dlm_street" value=""></td>
				                    <td style="padding: 0px;"><input type="text" class="txt_nor sm2 w100" style="width: 93%" name="dlm_area" id="dlm_area" value=""></td>
				                    <td style="padding: 0px;"><input type="text" class="txt_nor sm2 w100" style="width: 93%" name="dlm_land" id="dlm_land" value=""></td>
				                    <td style="padding: 0px;"><input type="text" class="txt_nor sm2 w100" style="width: 93%" name="dlm_use" id="dlm_use" value=""></td>
				            	</tr>
				            	<tr>
				            		<th style="border: 1px solid #ddd;">비고</th>
				            		<td colspan="4"><input type="text" class="txt_nor sm2 w100" name="dlm_usage" id="dlm_usage" value=""></td>
				            	</tr>
				            </tbody>
				        </table>
					</div>
				<br>
				
				<!-- 관리자만 -->
				<c:if test="${userInfo.isAdmin eq 'Y'}">
					<div class="table_wrapper con_h">
						<button type="button" id="MainsaveButton" class="btn_nor md2 g_line" style="float: right; font-size: 12px; height: 22px; padding: 1px;" title="저장" onclick="MainSubInsert()">저장</button>
					</div>
				</c:if>
			</div>
		</article>
	</section>
	
	<br><br>

    <section class="setting_one_w">
        <article class="artBoard top">
    		
            <div class="private_setting_wrap">
                <table class="tbl_private_se">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <caption>파일 등록</caption>
                    <tbody>
                    	<tr>
                            <th class="thClass">1. 사전조사보고서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file0"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file0" name="file" style="display: none;">
	                            <span class="file-chosen">
	                            		${fn:length(RList) > 0 ?  fn:substring(RList[0].FS_ORINM,0,13) : '파일없음'}. ${RList[0].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[0]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">2. 인적자료</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file1"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file1" name="file" style="display: none;">
	                            <span class="file-chosen">
	                            		${fn:length(RList) > 0 ?  fn:substring(RList[1].FS_ORINM,0,13) : '파일없음'}. ${RList[1].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[1]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">3. 발전사업허가 신청서 </th>
                            <td class="tdClass">
	                            <label class="buttonClass" for="file2"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file2" name="file" style="display: none;">
	                            <span class="file-chosen">
                            		${fn:length(RList) > 0 ? fn:substring(RList[2].FS_ORINM,0,13) : '파일없음'}. ${RList[2].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[2]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">3-1. 발전사업허가증 </th>
                            <td class="tdClass">
	                            <label class="buttonClass" for="file2-1"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file2-1" name="file" style="display: none;">
	                            <span class="file-chosen">
                            		${fn:length(RList) > 0 ? fn:substring(RList[3].FS_ORINM,0,13) : '파일없음'}. ${RList[3].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[3]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">4. 사업자등록</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file3"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file3" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[4].FS_ORINM,0,13) : '파일없음'}. ${RList[4].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[4]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">5. 개발행위허가 신청서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file4"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file4" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[5].FS_ORINM,0,13) : '파일없음'}. ${RList[5].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[5]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">5-1. 개발행위허가증</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file5"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file5" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[6].FS_ORINM,0,13) : '파일없음'}. ${RList[6].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[6]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">6. PPA</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file6"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file6" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[7].FS_ORINM,0,13) : '파일없음'}. ${RList[7].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[7]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">6-1. PPA 접수증</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file7"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file7" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[8].FS_ORINM,0,13) : '파일없음'}. ${RList[8].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[8]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">7. 감리원 배치확인서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file8"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file8" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[9].FS_ORINM,0,13) : '파일없음'}. ${RList[9].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[9]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">8. 전기안전관리자 선임신고 증명서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file9"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file9" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[10].FS_ORINM,0,13) : '파일없음'}. ${RList[10].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[10]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">9. 공사계획신고</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file10"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file10" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[11].FS_ORINM,0,13) : '파일없음'}. ${RList[11].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[11]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">9-1. 공사계획신고</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file11"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file11" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[12].FS_ORINM,0,13) : '파일없음'}. ${RList[12].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[12]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">10. 최종설계도면</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file12"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file12" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[13].FS_ORINM,0,13) : '파일없음'}. ${RList[13].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[13]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">11. 사용 전 검사</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file13"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file13" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[14].FS_ORINM,0,13) : '파일없음'}. ${RList[14].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[14]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">12. 한전계약</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file14"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file14" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[15].FS_ORINM,0,13) : '파일없음'}. ${RList[15].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[15]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">13. 모듈자료</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file15"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file15" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[16].FS_ORINM,0,13) : '파일없음'}. ${RList[16].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[16]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">14. 인버터자료</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file16"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file16" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[17].FS_ORINM,0,13) : '파일없음'}. ${RList[17].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[17]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">15. 구조계산서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file17"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file17" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[18].FS_ORINM,0,13) : '파일없음'}. ${RList[18].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[18]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">16. 사진대지</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file18"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file18" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[19].FS_ORINM,0,13) : '파일없음'}. ${RList[19].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[19]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">17. 공사도급계약서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file19"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file19" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[20].FS_ORINM,0,13) : '파일없음'}. ${RList[20].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[20]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="btn_private">
                <button type="submit" class="btn_nor lg2 round2 blue" id="subbutton">저장</button>
                <button type="button" class="btn_nor lg2 round2 blue" id="alldown" onclick="cf_download_zip('${ob.DPP_FM_KEYNO}')">전체다운로드</button>
            </div>
        </article>
    </section>
</div>


</form:form>



 <script>
	 $(function(){
		 
 		 subView('${dls_now}');
		 
		 if($("#DPP_FM_KEYNO").val() == "" || $("#DPP_FM_KEYNO").val() == null )
		 	{   
		 		$("#action").val("insert");
		 	}else {
		 		$("#action").val("update"); $("#subbutton").text("수정")
		 	}
		 	
		 	 
			$('.fileclass').on('change',function(obj){
				var fileValue = $(this).val().split("\\");
				var fileName = fileValue[fileValue.length-1]; // 파일명
				
				var id = $(this).attr("id")
				$("#"+id).next().text(fileName.substring(0,13) + "...")		
			})
	 })
 
	function DPPKey_Change(key){
		
		$("#DPP_KEYNO").val(key)
		$("#Form").attr("action", "/dy/moniter/filedown.do?${_csrf.parameterName}=${_csrf.token}");
		$("#Form").submit();
				
	}
	
	 function trinit(){
		$(".tr_after").remove()
		$("#dls_conn").val('');
    	$("#dls_depart").val('');
    	$("#dls_depart2").val('');
    	$("#dls_name").val('');
    	$("#dls_name2").val('');
    	$("#dls_other").val('');
    	$("#dls_other2").val('');
    	$("#dls_phone").val('');
    	$("#dls_phone2").val('');
    	$("#dls_endDate").val('');
    	$("#dls_usernumber").val('');
    	$("#dls_volum").val('');
		 
    	
    	$("#dlm_address").val('');
    	$("#dlm_street").val('');
    	$("#dlm_area").val('');
    	$("#dlm_land").val('');
    	$("#dlm_use").val('');
    	$("#dlm_usage").val('');
    	$("#dlm_type").val('');
    	
		$(".div_2").css("display","")
		$(".tr1").html(	
 				'<th class="th_name1">접수일</td>'
        		+'<td><input type="text" class="txt_nor sm2 w100" name="dls_conn" id="dls_conn"></td>'
        		+'<th class="th_name2">처리예정일</td>'
        		+'<td><input type="text" class="txt_nor sm2 w100" name="dls_endDate" id="dls_endDate"></td>'
        		+'<th class="alarm"></th>'
 		);
		 $(".div_2").html(
			 '<h2 class="circle">기본내용</h2>'+
				'<div class="table_wrapper con_h">'+
			     '   <table class="tbl_private_se">'+
			            '<colgroup>'+
			                '<col width="13%">'+
			                '<col width="13%">'+
			                '<col width="13%">'+
			               ' <col width="13%">'+
			              '  <col width="13%">'+
			             '   <col width="13%">'+
			            '</colgroup>'+
			            '<thead>'+
			            '</thead>'+
			            '<tbody>'+
			            '	<tr>'+
			            '		<th>신청내용</td>'+
			            '		<td colspan="5" style="text-align: center;">'+
			            '			<span>'+
			            '				<input type="radio" value="0" title="공작물설치" name="dlm_type" id="dlm_type" ${dlmData.dlm_type eq '0'?'checked':'' }>'+
			            '				<label for="dlm_type">공작물설치</label>'+
			            '			</span>'+
			            '			<span style="padding: 0px 0px 0px 100px;">'+
			            '				<input type="radio" value="1" title="토지형질변경" name="dlm_type" id="dlm_type2" ${dlmData.dlm_type eq '1'?'checked':'' }>'+
			            '				<label for="dlm_type2">토지형질변경</label>'+
			            '			</span>'+
			            '		</td>'+
			            	'</tr>'+
			            	'<tr>'+
			                '    <th rowspan="4" style="border: 1px solid #ddd;">위치</th>'+
			                '    <th>주소</th>'+
			                '    <td colspan="4"><input type="text" class="txt_nor sm2 w100" name="dlm_address" id="dlm_address" value="${dlmData.dlm_address }"></td>'+
			                '</tr>'+
			                '<tr style="text-align: center;">'+
			                '    <th rowspan="2" style="border: 1px solid #ddd;" >지번</th>'+
			                '    <th style="border: 1px solid #ddd;">신청지번</th>'+
			                '    <th style="border: 1px solid #ddd;">필지면적</th>'+
			                '    <th style="border: 1px solid #ddd;">지목</th>'+
			                '    <th style="border: 1px solid #ddd;">지역·지구</th>'+
			                '</tr>'+
			                '<tr>'+
			                '	<td style="padding: 0px;"><input type="text" class="txt_nor sm2 w100" style="width: 93%" name="dlm_street" id="dlm_street" value="${dlmData.dlm_street }"></td>'+
			               '     <td style="padding: 0px;"><input type="text" class="txt_nor sm2 w100" style="width: 93%" name="dlm_area" id="dlm_area" value="${dlmData.dlm_area }"></td>'+
			              '      <td style="padding: 0px;"><input type="text" class="txt_nor sm2 w100" style="width: 93%" name="dlm_land" id="dlm_land" value="${dlmData.dlm_land }"></td>'+
			             '       <td style="padding: 0px;"><input type="text" class="txt_nor sm2 w100" style="width: 93%" name="dlm_use" id="dlm_use" value="${dlmData.dlm_use }"></td>'+
			            '	</tr>'+
			            '	<tr>'+
			            '		<th style="border: 1px solid #ddd;">비고</th>'+
			           ' 		<td colspan="4"><input type="text" class="txt_nor sm2 w100" name="dlm_usage" id="dlm_usage" value="${dlmData.dlm_usage }"></td>'+
			          '  	</tr>'+
			         '   </tbody>'+
			        '</table>'+
				'</div>'+
		        '<br>'+
				
				<!-- 관리자만 -->
				'	<c:if test="${userInfo.isAdmin eq 'Y'}">'+
				'	<div class="table_wrapper con_h">'+
				'		<button type="button" id="MainsaveButton" class="btn_nor md2 g_line" style="float: right; font-size: 12px; height: 22px; padding: 1px;" title="저장" onclick="MainSubInsert()">저장</button>'+
				'	</div>'+
				'</c:if>'
			);
		 
	 }
	 
	function subView(value){
		
		$("#dls_now").val(value);
		
		//init
		trinit()
		
		
		$.ajax({
		    type   : "post",
		    url    : "/dy/moniter/SubdataView.do",
		    data   : {
			    "dls_dpp_keyno":$("#DPP_KEYNO").val(),
			    "dls_now": value
		    },
		    async:false,
		    success:function(data){
		    	$("#container > section:nth-child(1) > article > div:nth-child(4) > a").removeClass("active")
		    	
		    	$("#container > section:nth-child(1) > article > div:nth-child(4) > a:nth-child("+value+")").addClass("active")
	    		
		    	if(value == "3"){
		    		//고객번호 , 접수용량 추가 및 기본내용 삭제 
		    		$(".th_name2").text("접수번호")
		    		
		    		$(".tr1").after(
		    		'<tr class="tr_after"><th>고객번호</td> <td><input type="text" class="txt_nor sm2 w100" name="dls_usernumber" id="dls_usernumber"> </td> <th>접수용량</td> <td><input type="text" class="txt_nor sm2 w100" name="dls_volum" id="dls_volum"></td></tr>'		
		    		)
		    		$(".div_2").css("display","none")
		    	}else if(value == "4"){
		    		
		    		$(".th_name1").text("신고기간")
		    		$(".th_name2").text("감리배치기간")
		    		
		    		$(".div_2").html(
			    		'<h2 class="circle">기본내용</h2>'+
						'<div class="table_wrapper con_h">'+
					        '<table class="tbl_private_se">'+
					            '<colgroup>'+
					                '<col width="15%">'+
					                '<col width="15%">'+
					                '<col width="70%">'+
					            '</colgroup>'+
					            '<thead>'+
					            '</thead>'+
					            '<tbody>'+
					            	'<tr>'+
					                    '<th rowspan="4" style="border: 1px solid #ddd;">신청내용</th>'+
					                    '<th>공사기간</th>'+
					                    '<td colspan="4"><input type="text" class="txt_nor sm2 w100" name="dlm_address" id="dlm_address" value="${dlmData.dlm_address }"></td>'+
					                '</tr>'+
					                '<tr>'+
						                '<th>모듈</th>'+
					                    '<td colspan="4"><input type="text" class="txt_nor sm2 w100" name="dlm_street" id="dlm_street" value="${dlmData.dlm_street }"></td>'+
					            	'</tr>'+
					            	'<tr>'+
						            	'<th>인버터</th>'+
					                    '<td colspan="4"><input type="text" class="txt_nor sm2 w100" name="dlm_usage" id="dlm_usage" value="${dlmData.dlm_usage }"></td>'+
					            	'</tr>'+
					      '      </tbody>'+
					     '   </table>'+
						'</div>'+
						'<br>'+
						
						<!-- 관리자만 -->
						'	<c:if test="${userInfo.isAdmin eq 'Y'}">'+
						'	<div class="table_wrapper con_h">'+
						'		<button type="button" id="MainsaveButton" class="btn_nor md2 g_line" style="float: right; font-size: 12px; height: 22px; padding: 1px;" title="저장" onclick="MainSubInsert()">저장</button>'+
						'	</div>'+
						'</c:if>'
		    		);
		    		
		    	}else if(value == "5"){
		    		$(".tr1").html(
		    				' <th class="th_name1">접수일</td> <td colspan="3"><input type="text" class="txt_nor sm2 w100" name="dls_conn" id="dls_conn"></td>'		
		    		)
		    		$(".div_2").css("display","none")
		    	}else if(value == "6"){
		    		$(".tr1").html(
		    				' <th class="th_name1">접수일</td> <td colspan="3"><input type="text" class="txt_nor sm2 w100" name="dls_conn" id="dls_conn"></td>'		
		    		)
		    		$(".alarm").text('※설비확인 제출 월로부터 6개월 이내 개발행위준공 필수')
		    		$(".div_2").css("display","none")
		    	}
		    	
		    	
		    	if (data.license1 != null){
		    		$("#dls_conn").val(data.license1.dls_conn);
			    	$("#dls_depart").val(data.license1.dls_depart);
			    	$("#dls_depart2").val(data.license1.dls_depart2);
			    	$("#dls_name").val(data.license1.dls_name);
			    	$("#dls_name2").val(data.license1.dls_name2);
			    	$("#dls_other").val(data.license1.dls_other);
			    	$("#dls_other2").val(data.license1.dls_other2);
			    	$("#dls_phone").val(data.license1.dls_phone);
			    	$("#dls_phone2").val(data.license1.dls_phone2);
			    	$("#dls_endDate").val(data.license1.dls_endDate);
			    	$("#dls_usernumber").val(data.license1.dls_usernumber);
			    	$("#dls_volum").val(data.license1.dls_volum);
		    	}
		    	if (data.license2 != null){
		    	
		    		$("#dlm_address").val(data.license2.dlm_address);
			    	$("#dlm_street").val(data.license2.dlm_street);
			    	$("#dlm_area").val(data.license2.dlm_area);
			    	$("#dlm_land").val(data.license2.dlm_land);
			    	$("#dlm_use").val(data.license2.dlm_use);
			    	$("#dlm_usage").val(data.license2.dlm_usage);
			    	
			    	if (data.license2.dlm_type == '0'){
			    		$("#dlm_type").prop("checked", true);
			    		$("#dlm_type2").prop("checked", false);
			    	}else{
			    		$("#dlm_type").prop("checked", false);
			    		$("#dlm_type2").prop("checked", true);
			    	}
		    	}
		    	
		    	if(data.license1 == null){
					$("#saveButton").text("저장")
					$("#saveButton").attr("onclick","MainSubInsert('1')")
		    	}else{
		    		$("#saveButton").text("수정")
		    		$("#saveButton").attr("onclick","MainSubInsert('2')")
		    	}
		    	
		    	if(data.license2 != null){
				 	$("#MainsaveButton").text("수정")
					$("#MainsaveButton").attr("onclick","MainSubInsert('4')") 
				 }else{
					$("#MainsaveButton").text("저장")
					$("#MainsaveButton").attr("onclick","MainSubInsert('3')")
				 }
		    	
		    },
		    error: function() {
		    	alert("에러, 관리자에게 문의하세요.");
		    }
		});
	}
	
	
	function MainSubInsert(type){
		
		$("#savetype").val(type)
		
		$.ajax({
		    type   : "post",
		    url    : "/dy/moniter/Subdatainsert.do",
		    data   : $('#Form').serializeArray(),
		    async:false,
		    success:function(data){
		    	alert(data);
		    },
		    error: function() {
		    	alert("에러, 관리자에게 문의하세요.");
		    }
		});
	}
	
</script>
 
 
                

