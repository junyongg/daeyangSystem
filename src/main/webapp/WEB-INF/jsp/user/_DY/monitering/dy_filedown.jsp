<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>



<style>
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
        <article class="artBoard top">
    		
    		
			<div class="power_select">
			    <select class="select_nor sm3 w100" id="DPP_KEYNO" name="DPP_KEYNO" value="${DPP_KEYNO }" onchange="DPPKey_Change(this.value)">
			        <c:forEach items="${list }" var="list">
			        	<option value="${list.DPP_KEYNO }" ${list.DPP_KEYNO eq DPP_KEYNO ? 'selected' : '' } >${list.DPP_NAME }</option>
			        </c:forEach>
			    </select>
			</div>
    		    
            <h2 class="circle">파일 등록 : ${ob.DPP_NAME }</h2>
            
            <div class="private_setting_wrap">
                <table class="tbl_private_se">
                    <colgroup>
                        <col style="width: 20%;">
                        <col style="width: 80%;">
                    </colgroup>
                    <caption>파일 등록</caption>
                    <tbody>
                        <tr>
                            <th class="thClass">1. 사업자등록증</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file1"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file1" name="file" style="display: none;">
	                            <span class="file-chosen">
	                            		${fn:length(RList) > 0 ?  fn:substring(RList[0].FS_ORINM,0,13) : '파일없음'}. ${RList[0].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[0]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">2. 발전사업허가증 </th>
                            <td class="tdClass">
	                            <label class="buttonClass" for="file2"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file2" name="file" style="display: none;">
	                            <span class="file-chosen">
                            		${fn:length(RList) > 0 ? fn:substring(RList[1].FS_ORINM,0,13) : '파일없음'}. ${RList[1].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[1]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">3. 사용전검사 확인증</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file3"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file3" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[2].FS_ORINM,0,13) : '파일없음'}. ${RList[2].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[2]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">4. 단선결선도</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file4"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file4" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[3].FS_ORINM,0,13) : '파일없음'}. ${RList[3].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[3]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">5. 모듈인증서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file5"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file5" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[4].FS_ORINM,0,13) : '파일없음'}. ${RList[4].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[4]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">6. 인버터인증서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file6"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file6" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[5].FS_ORINM,0,13) : '파일없음'}. ${RList[5].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[5]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">7. 토지대장 및 지적도</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file7"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file7" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[6].FS_ORINM,0,13) : '파일없음'}. ${RList[6].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[6]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">8. 도면</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file8"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file8" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[7].FS_ORINM,0,13) : '파일없음'}. ${RList[7].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[7]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">9. 토지등기부등본</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file9"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file9" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[8].FS_ORINM,0,13) : '파일없음'}. ${RList[8].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[8]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">10. 농영경영체등록 확인서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file10"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file10" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[9].FS_ORINM,0,13) : '파일없음'}. ${RList[9].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[9]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">11. 공사계획신고필증</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file11"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file11" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[10].FS_ORINM,0,13) : '파일없음'}. ${RList[10].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[10]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">12. 현장점검포</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file12"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file12" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[11].FS_ORINM,0,13) : '파일없음'}. ${RList[11].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[11]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">13. 접속반인증서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file13"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file13" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[12].FS_ORINM,0,13) : '파일없음'}. ${RList[12].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[12]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">14. 인발재하시험 및 지반조사보고서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file14"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file14" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[13].FS_ORINM,0,13) : '파일없음'}. ${RList[13].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[13]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">15. 구조검토서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file15"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file15" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[14].FS_ORINM,0,13) : '파일없음'}. ${RList[14].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[14]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">16. 준공검사신청서</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file16"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file16" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[15].FS_ORINM,0,13) : '파일없음'}. ${RList[15].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[15]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="thClass">17. 개발행위허가증</th>
                            <td class="tdClass">
                            	<label class="buttonClass" for="file17"><i class="fa-solid fa-download" style="padding-right: 10px;"></i>등록</label>
	                            <input class="fileclass" type="file" id="file17" name="file" style="display: none;">
	                            <span class="file-chosen" id="spans">
		                            ${fn:length(RList) > 0 ? fn:substring(RList[16].FS_ORINM,0,13) : '파일없음'}. ${RList[16].FS_EXT }
	                            </span>
	                            <button type="button" class="downClass" onclick="cf_download('${KeynoList[16]}')" style="display: ${fn:length(RList) > 0 ? 'block':'none'}">다운로드</button>
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
	
	
	function DPPKey_Change(key){
		location.href = "/dy/moniter/filedown.do?DPP_KEYNO="+key
	}
	
</script>
 
 
                

