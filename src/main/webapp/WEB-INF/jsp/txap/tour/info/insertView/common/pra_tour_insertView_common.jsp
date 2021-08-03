<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<input type="hidden" name="TC_TYPE" id="TC_TYPE" value="${resultData.TC_TYPE }">
<input type="hidden" name="TC_KEYNO" id="TC_KEYNO" value="${resultData.TC_KEYNO }">
<input type="hidden" name="MENUYN" id="MENUYN" value="${resultData.MENUYN }">

<fieldset>
	<legend>기본정보</legend>
	
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 사용여부</label>
		<div class="col-md-10">
			<label class="radio radio-inline">
				<input type="radio" class="radiobox" name="TC_USE" value="Y" ${empty resultData || resultData.TC_USE eq 'Y' ? 'checked="checked"':'' }>
				<span>사용</span> 
			</label>
			<label class="radio radio-inline">
				<input type="radio" class="radiobox" name="TC_USE" value="N" ${resultData.TC_USE eq 'N' ? 'checked="checked"':'' }>
				<span>미사용</span> 
			</label>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 이름</label>
		<div class="col-md-10">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="입력하세요." 
						name="TC_TITLE" id="TC_TITLE" maxlength="50" onkeyup="pf_checkLength('TC_TITLE',50)"
						value="${resultData.TC_TITLE }">
				<span class="input-group-addon length" id="TC_TITLE_length">(0/50자)</span>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">담당자</label>
		<div class="col-md-10">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="입력하세요." 
						name="TC_MANAGER" id="TC_MANAGER" maxlength="50" onkeyup="pf_checkLength('TC_MANAGER',50)"
						value="${resultData.TC_MANAGER }">
				<span class="input-group-addon length" id="TC_MANAGER_length">(0/50자)</span>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">담당부서</label>
		<div class="col-md-10">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="입력하세요." 
						name="TC_DEPARTMENT" id="TC_DEPARTMENT" maxlength="50" onkeyup="pf_checkLength('TC_DEPARTMENT',50)"
						value="${resultData.TC_DEPARTMENT }">
				<span class="input-group-addon length" id="TC_DEPARTMENT_length">(0/50자)</span>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">담당자 연락처</label>
		<div class="col-md-10">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="입력하세요." 
						name="TC_CONTACTS" id="TC_CONTACTS" maxlength="50" onkeyup="pf_checkLength('TC_CONTACTS',50)"
						value="${resultData.TC_CONTACTS }">
				<span class="input-group-addon length" id="TC_CONTACTS_length">(0/50자)</span>
			</div>
		</div>
	</div>
	
	<c:if test="${formActionType eq 'update'}">
	<div class="form-group">
		<label class="col-md-2 control-label">등록자</label>
		<div class="col-md-10">
			<input type="text" class="form-control" value="${resultData.TC_REGID }" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">등록일</label>
		<div class="col-md-10">
			<input type="text" class="form-control" value="${fn:substring(resultData.TC_REGDT,0,19)}" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">최종 수정자</label>
		<div class="col-md-10">
			<input type="text" class="form-control" value="${empty resultData.TC_MODID ? '수정이력 없음' : resultData.TC_MODID }" readonly="readonly">
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">최종 수정일</label>
		<div class="col-md-10">
			<input type="text" class="form-control" value="${empty resultData.TC_MODID ? '수정이력 없음' : fn:substring(resultData.TC_MODDT,0,19)}" readonly="readonly">
		</div>
	</div>
	</c:if>
	
</fieldset>

<fieldset>
	<legend>공통정보</legend>
	<div class="form-group">
		<label class="col-md-2 control-label">부제</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_SUBTITLE" 
										class="onoffswitch-checkbox" id="TC_SUBTITLE_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_SUBTITLE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_SUBTITLE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TC_SUBTITLE" id="TC_SUBTITLE" maxlength="50" onkeyup="pf_checkLength('TC_SUBTITLE',50)"
								value="${resultData.TC_SUBTITLE }">
						<span class="input-group-addon length" id="TC_SUBTITLE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">태그</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_TAG" 
										class="onoffswitch-checkbox" id="TC_TAG_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_TAG') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_TAG_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="ex) 태그,이름  콤마로 구분" 
								name="TC_TAG" id="TC_TAG" maxlength="100" onkeyup="pf_checkLength('TC_TAG',100)"
								value="${resultData.TC_TAG }">
						<span class="input-group-addon length" id="TC_TAG_length">(0/100자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">요약소개</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_SUMMARY" 
										class="onoffswitch-checkbox" id="TC_SUMMARY_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_SUMMARY') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_SUMMARY_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="4" name="TC_SUMMARY" id="TC_SUMMARY" maxlength="500" onkeyup="pf_checkLength('TC_SUMMARY',500)" >${resultData.TC_SUMMARY }</textarea>
					</div>
					<p class="help-block length" id="TC_SUMMARY_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">이미지</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_IMAGE" 
										class="onoffswitch-checkbox" id="TC_IMAGE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_IMAGE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_IMAGE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="file" class="btn btn-default" id="imgFile" onchange="pf_addImg();">
					</div>
					<p class="help-block">
						( 10Mb / jpg,jpeg,png,gif )<br>
						첫번째 이미지를 썸네일 이미지로 사용합니다.
					</p>
					<div class="imgWrap">
						<c:if test="${not empty imgList}">
							<c:set var="TIM_FM_KEYNO" value="${imgList[0].TIM_FM_KEYNO }"/>
						</c:if>
						<input type="hidden" name="TIM_FM_KEYNO" id="TIM_FM_KEYNO" value="${TIM_FM_KEYNO }">
						<ul class="imgBox">
						 <c:forEach items="${imgList }" var="img">
						 	<li>
								<a href="javascript:;" onclick="pf_removeImg(this)">
									<i class="fa fa-times"></i>
								</a>
								<img src="${img.THUMBNAIL_PATH }" onclick="pf_viewImg(this)">
								<input type="hidden" name="newImgFile" value="N">
								<input type="hidden" name="TIM_FILEINFO" value="${img.TIM_FS_KEYNO }">
								<input type="hidden" name="FS_ORINM" value="${img.FS_ORINM }">
								<input type="hidden" name="IMG_ORDER" value="${img.TIM_ORDER }">
							</li>
						 </c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">본문(상세내용)</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_CONTENTS" 
										class="onoffswitch-checkbox" id="TC_CONTENTS_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_CONTENTS') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_CONTENTS_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="작성버튼을 눌러주세요." readonly="readonly">
						<div class="input-group-btn">
							<button class="btn btn-primary" type="button" onclick="pf_writeContents('TC_CONTENTS');">
								<i class="fa fa-pencil"></i>
								작성
							</button>
						</div>
						<textarea name="TC_CONTENTS" id="TC_CONTENTS" style="display:none;">${resultData.TC_CONTENTS}</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">잡학사전</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_DICTIONARY" 
										class="onoffswitch-checkbox" id="TC_DICTIONARY_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_DICTIONARY') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_DICTIONARY_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="4" name="TC_DICTIONARY" id="TC_DICTIONARY" maxlength="1000" onkeyup="pf_checkLength('TC_DICTIONARY',1000)" >${resultData.TC_DICTIONARY }</textarea>
					</div>
					<p class="help-block length" id="TC_DICTIONARY_length">(0/1000자)</p>
				</div>
			</div>
		</div>
	</div>
</fieldset>


<script type="text/javascript">

var isContentsDialogCreated = false;

$(function(){

	$('#TOUR_TYPE').val('${category}').prop('selected', true);
	
	if($('#TC_KEYNO').val()){
		$('#TOUR_TYPE').attr('disabled',true);
	}else{
		$('#TOUR_TYPE').attr('disabled',false);
	}
	
	formActionType = '${formActionType}';
	
	if(formActionType != 'insert'){
		
		if(formActionType == 'copy'){
			$('#TC_KEYNO, #TC_TITLE').val('');
			$('input[name=TG_KEYNO],input[name=TM_KEYNO]').val('');
		}
		
		$('.input-group-addon.length, .help-block.length').each(function(){
			
			var id = $(this).attr('id').replace('_length','');
			var maxLength = $('#'+id).attr('maxlength');
			pf_checkLength(id,maxLength);
			
		})
		
		$('#TC_CONTENTS_TEMP').val($('#TC_CONTENTS').val());
	}
	
	
	
	$( ".imgBox" ).sortable({
		update: function(event,ui){
			pf_setImgIndex()
		}
	});
	
	
	pf_setfolder();
	
	
	
	
});




function pf_writeContents(id){
	$("#textareaID").val(id)
	$('#smartimg_img').empty();
	$('#contentsWrap').dialog('open');
	$('#editorbox').hide();
	
	if(isContentsDialogCreated){
		$('#MVD_DATA').val($("#"+id).val());
		editor_object.getById["MVD_DATA"].exec("LOAD_CONTENTS_FIELD");
	}else{
		isContentsDialogCreated = true;
		if(editor_object.length == 0){
			nhn.husky.EZCreator.createInIFrame({
		        oAppRef: editor_object,
		        elPlaceHolder: "MVD_DATA",
		        sSkinURI: "/resources/api/se2/se2Skin.html",
		        htParams : {
		            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		            bUseToolbar : true,            
		            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		            bUseVerticalResizer : true,    
		            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		            bUseModeChanger : true,
		        },
		        menuName : '관광정보' //본문에 이미지 저장시 사용되는 캡션
		    });
			$('#MVD_DATA').val($("#"+id).val());
		}else{
			$('#MVD_DATA').val($("#"+id).val());
			editor_object.getById["MVD_DATA"].exec("LOAD_CONTENTS_FIELD");
		}
		
	}
	
	
}

function pf_getContents(){
	var id = $("#textareaID").val();
	if(editor_object.length == 1){
		editor_object.getById["MVD_DATA"].exec("UPDATE_CONTENTS_FIELD", []);
		
		if($('#MVD_DATA').val() == '<p>&nbsp;</p>'){
			$('#MVD_DATA').val('');
		}
		
		$('#'+id).val($('#MVD_DATA').val());
	}
	
	return $('#'+id).val();
	
}

</script>
<%@ include file="/WEB-INF/jsp/txap/include/_layout/pra_editor_imgSetting.jsp" %>
