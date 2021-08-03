<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>






<input type="hidden" name="TL_KEYNO" id="TL_KEYNO" value="${resultData.TL_KEYNO }">
<fieldset>
	<legend>숙박 정보</legend>		
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 구분</label>
		<div class="col-md-10">
			<select class="form-control" name="TL_DIVISION" id="TL_DIVISION">
				<option value="">선택하세요</option>
				<c:forEach items="${lodgmentTypeList }" var="lodgmentType">
				<option value="${lodgmentType.SC_KEYNO }" ${resultData.TL_DIVISION eq lodgmentType.SC_KEYNO ? 'selected':'' }>${lodgmentType.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="form-group lodgmentFieldset_hotel">
		<label class="col-md-2 control-label">권역 구분</label>
		<div class="col-md-10">
			<select class="form-control" name="TL_AREA" id="TL_AREA">
				<option value="">선택하세요.</option>
				<c:forEach items="${LodgmentAreaList }" var="LodgmentArea">
				<option value="${LodgmentArea.SC_KEYNO }" ${resultData.TL_AREA eq LodgmentArea.SC_KEYNO ? 'selected':'' }>${LodgmentArea.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="form-group lodgmentFieldset">
		<label class="col-md-2 control-label">읍/면</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_EUB" 
										class="onoffswitch-checkbox" id="TL_EUB_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_EUB') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_EUB_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TL_EUB" id="TL_EUB" maxlength="100" onkeyup="pf_checkLength('TL_EUB',100)"
								value="${resultData.TL_EUB }">
						<span class="input-group-addon length" id="TL_EUB_length">(0/100자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group lodgmentFieldset">
		<label class="col-md-2 control-label">운영자</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_OWNER" 
										class="onoffswitch-checkbox" id="TL_OWNER_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_OWNER') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_OWNER_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TL_OWNER" id="TL_OWNER" maxlength="100" onkeyup="pf_checkLength('TL_OWNER',100)"
								value="${resultData.TL_OWNER }">
						<span class="input-group-addon length" id="TL_OWNER_length">(0/100자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">입실시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_IBSIL_TIME" 
										class="onoffswitch-checkbox" id="TL_IBSIL_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_IBSIL_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_IBSIL_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하여주세요." 
								name="TL_IBSIL_TIME" id="TL_IBSIL_TIME" maxlength="50" onkeyup="pf_checkLength('TL_IBSIL_TIME',50)"
								value="${resultData.TL_IBSIL_TIME }">
						<span class="input-group-addon number" id="TL_IBSIL_TIME_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">퇴실시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_TOESIL_TIME" 
										class="onoffswitch-checkbox" id="TL_TOESIL_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_TOESIL_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_TOESIL_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하여주세요." 
								name="TL_TOESIL_TIME" id="TL_TOESIL_TIME" maxlength="50" onkeyup="pf_checkLength('TL_TOESIL_TIME',50)"
								value="${resultData.TL_TOESIL_TIME }">
						<span class="input-group-addon number" id="TL_TOESIL_TIME_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">이용조건</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_USE_JOGEON" 
										class="onoffswitch-checkbox" id="TL_USE_JOGEON_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_USE_JOGEON') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_USE_JOGEON_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TL_USE_JOGEON" id="TL_USE_JOGEON" maxlength="500" onkeyup="pf_checkLength('TL_USE_JOGEON',500)" >${resultData.TL_USE_JOGEON }</textarea>
					</div>
					<p class="help-block length" id="TL_USE_JOGEON_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">부대시설</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_GUBI_SISEOL" 
										class="onoffswitch-checkbox" id="TL_GUBI_SISEOL_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_GUBI_SISEOL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_GUBI_SISEOL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TL_GUBI_SISEOL" id="TL_GUBI_SISEOL" maxlength="500" onkeyup="pf_checkLength('TL_GUBI_SISEOL',500)" >${resultData.TL_GUBI_SISEOL }</textarea>
					</div>
					<p class="help-block length" id="TL_GUBI_SISEOL_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">시설이용규칙</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_USE_RULE" 
										class="onoffswitch-checkbox" id="TL_USE_RULE_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_USE_RULE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_USE_RULE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TL_USE_RULE" id="TL_USE_RULE" maxlength="500" onkeyup="pf_checkLength('TL_USE_RULE',500)" >${resultData.TL_USE_RULE }</textarea>
					</div>
					<p class="help-block length" id="TL_GUBI_SISEOL_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
</fieldset>

<fieldset id="lodgmentFieldset379">
	<legend>야영장/휴양림</legend>
	
	<div class="form-group">
		<label class="col-md-2 control-label">요금안내</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_PRICE_CONTENT_FEE" 
										class="onoffswitch-checkbox" id="TL_PRICE_CONTENT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_PRICE_CONTENT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_PRICE_CONTENT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TL_PRICE_CONTENT" id="TL_PRICE_CONTENT" maxlength="500" onkeyup="pf_checkLength('TL_PRICE_CONTENT',500)" >${resultData.TL_PRICE_CONTENT }</textarea>
					</div>
					<p class="help-block length" id="TL_PRICE_CONTENT_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">캠핑시설</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_CAMPING_SISEOL" 
										class="onoffswitch-checkbox" id="TL_CAMPING_SISEOL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_CAMPING_SISEOL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_CAMPING_SISEOL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TL_CAMPING_SISEOL" id="TL_CAMPING_SISEOL" maxlength="500" onkeyup="pf_checkLength('TL_CAMPING_SISEOL',500)" >${resultData.TL_CAMPING_SISEOL }</textarea>
					</div>
					<p class="help-block length" id="TL_CAMPING_SISEOL_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
</fieldset>

<fieldset id="lodgmentFieldset_hotel">
	<legend>숙박추가정보</legend>
	
	<div class="form-group">
		<label class="col-md-2 control-label">조식제공여부</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_BREAKFAST_YN" 
										class="onoffswitch-checkbox" id="TL_BREAKFAST_YN_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_BREAKFAST_YN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_BREAKFAST_YN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TL_BREAKFAST_YN" value="Y" ${empty resultData || resultData.TL_BREAKFAST_YN eq 'Y' ? 'checked="checked"':'' }>
							<span>제공함</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TL_BREAKFAST_YN" value="N" ${resultData.TL_BREAKFAST_YN eq 'N' ? 'checked="checked"':'' }>
							<span>제공안함</span> 
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">무료 와이파이 여부</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_WIFI_YN" 
										class="onoffswitch-checkbox" id="TL_WIFI_YN_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_WIFI_YN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_WIFI_YN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TL_WIFI_YN" value="Y" ${empty resultData || resultData.TL_WIFI_YN eq 'Y' ? 'checked="checked"':'' }>
							<span>있음</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TL_WIFI_YN" value="N" ${resultData.TL_WIFI_YN eq 'N' ? 'checked="checked"':'' }>
							<span>없음</span> 
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">침실 객실 수</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_BEDROOM_CNT" 
										class="onoffswitch-checkbox" id="TL_BEDROOM_CNT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_BEDROOM_CNT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_BEDROOM_CNT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TL_BEDROOM_CNT" id="TL_BEDROOM_CNT" maxlength="10"
								value="${resultData.TL_BEDROOM_CNT }">
						<span class="input-group-addon number">단위(개)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">온돌 객실 수</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_ONDOLROOM_CNT" 
										class="onoffswitch-checkbox" id="TL_ONDOLROOM_CNT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_ONDOLROOM_CNT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_ONDOLROOM_CNT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TL_ONDOLROOM_CNT" id="TL_ONDOLROOM_CNT" maxlength="10"
								value="${resultData.TL_ONDOLROOM_CNT }">
						<span class="input-group-addon number">단위(개)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">단체 객실 수</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TL_GROUPROOM_CNT" 
										class="onoffswitch-checkbox" id="TL_GROUPROOM_CNT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TL_GROUPROOM_CNT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TL_GROUPROOM_CNT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TL_GROUPROOM_CNT" id="TL_GROUPROOM_CNT" maxlength="10"
								value="${resultData.TL_GROUPROOM_CNT }">
						<span class="input-group-addon number">단위(개)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</fieldset>

<fieldset>
	<legend>객실정보</legend>
	
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 객실</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-10" style="margin-bottom: 15px;">
					<button class="btn btn-success" type="button" onclick="pf_addRoomInfo();"><i class="fa fa-plus"></i> 추가</button>
				</div>
			</div>
			<ul id="roomList">
				<c:if test="${not empty RoomList }">
					<c:forEach items="${RoomList }" var="model" varStatus="status">	
						<li class="input-group">
							<span class="input-group-addon"><font class="roomIndex">${model.TG_ORDER }</font>.</span>
							<input class="form-control" name="viewTitle" value="${model.TG_NAME }" type="text" readonly="readonly">
							<div class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="pf_openUpdateRoom(this)">
									수정
								</button>
								<button class="btn btn-default" type="button" onclick="pf_deleteRoom(this)">
									삭제
								</button>
							</div>
							<input type="hidden" name="TG_KEYNO" value="${model.TG_KEYNO }">
							<input type="hidden" name="TG_ORDER" value="${model.TG_ORDER }">
							<input type="hidden" name="TG_NAME" value="${model.TG_NAME }">
							<input type="hidden" name="TG_SIZE_METER" value="${model.TG_SIZE_METER }">
							<input type="hidden" name="TG_SIZE_FLAT" value="${model.TG_SIZE_FLAT }">
							<input type="hidden" name="TG_INWON_MIN_CNT" value="${model.TG_INWON_MIN_CNT }">
							<input type="hidden" name="TG_INWON_MAX_CNT" value="${model.TG_INWON_MAX_CNT }">
							<textarea name="TG_SUMMARY" style="display:none;">${model.TG_SUMMARY }</textarea>
							<textarea name="TG_PRICE_CONTENT" style="display:none;">${model.TG_PRICE_CONTENT }</textarea>
							<ul class="roomImgList" style="display:none;">
								<c:forEach items="${imgRoomList }" var="img">
								 	<c:if test="${model.TG_KEYNO eq img.TIM_TG_KEYNO }">
									 	<li>
											<a href="javascript:;" onclick="pf_removeImg(this)">
												<i class="fa fa-times"></i>
											</a>
											<img src="${img.THUMBNAIL_PATH }" onclick="pf_viewImg(this)">
											<input type="hidden" name="sub_IMG_ORDER${model.TM_ORDER }" value="${img.TIM_ORDER }">
											<input type="hidden" name="sub_newImgFile${model.TM_ORDER }" value="N">
											<input type="hidden" name="sub_TIM_FILEINFO${model.TM_ORDER }" value="${img.TIM_FS_KEYNO }">
											<input type="hidden" name="sub_FS_ORINM${model.TM_ORDER }" value="${img.FS_ORINM }">
											<input type="hidden" name="sub_ImgType${model.TM_ORDER }" value="G">
											<input type="hidden" name="sub_TIM_FM_KEYNO${model.TM_ORDER }" value="${img.TIM_FM_KEYNO }">
										</li>
								 	</c:if>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</c:if>
			</ul>
			
		</div>
	</div>
</fieldset>

<div id="roomInfoDialog">
	<div class="widget-body">
		<fieldset>
			<div class="form-horizontal">
				<fieldset>
					<div class="form-group">
						<label class="col-md-2 control-label">객실명</label>
						<div class="col-md-10">
							<div class="input-group">
								<input type="text" class="form-control" id="roomName" maxlength="50" onkeyup="pf_checkLength('roomName',50)" value="">
								<span class="input-group-addon length" id="roomName_length">(0/50자)</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">요금안내</label>
						<div class="col-md-10">
							<textarea class="form-control" placeholder="입력하여주세요." rows="3" id="roomPrice" maxlength="300" onkeyup="pf_checkLength('roomPrice',300)" ></textarea>
							<p class="help-block length" id="roomPrice_length">(0/300자)</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">객실설명</label>
						<div class="col-md-10">
							<textarea class="form-control" placeholder="입력하여주세요." rows="3" id="roomComment" maxlength="500" onkeyup="pf_checkLength('roomComment',500)" ></textarea>
							<p class="help-block length" id="roomComment_length">(0/500자)</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">인원수</label>
						<div class="col-md-10">
							<div class="col-sm-6 inputWidth50" style="padding: 0;">
								<div class="input-group">
									<input type="number" class="form-control" placeholder="입력하여주세요." name="roomMin" id="roomMin" maxlength="30" value="" onkeydown="return cf_onlyNumAndLimitLength(this,event)" >
									<span class="input-group-addon number">최소</span>
								</div>
							</div>
							<div class="col-sm-6 inputWidth50" style="padding: 0;">
								<div class="input-group">
									<input type="number" class="form-control" placeholder="입력하여주세요." name="roomMax" id="roomMax" maxlength="30" value="" onkeydown="return cf_onlyNumAndLimitLength(this,event)" >
									<span class="input-group-addon number">최대</span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">객실크기</label>
						<div class="col-md-10">
							<div class="col-sm-6 inputWidth50" style="padding: 0;">
								<div class="input-group">
									<input type="number" class="form-control" placeholder="입력하여주세요." name="roomSizeM" id="roomSizeM" maxlength="30" value="" onkeydown="return cf_onlyNumAndLimitLength(this,event)" >
									<span class="input-group-addon number">m</span>
								</div>
							</div>
							<div class="col-sm-6 inputWidth50" style="padding: 0;">
								<div class="input-group">
									<input type="number" class="form-control" placeholder="입력하여주세요." name="roomSizeP" id="roomSizeP" maxlength="30" value="" onkeydown="return cf_onlyNumAndLimitLength(this,event)" >
									<span class="input-group-addon number">평</span>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">객실 이미지</label>
						<div class="col-md-10">
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group">
										<input type="file" class="btn btn-default" id="imgRoomFile" onchange="pf_addRoomImg();">
									</div>
									<p class="help-block">
										( 10Mb / jpg,jpeg,png,gif )<br>
										첫번째 이미지를 썸네일 이미지로 사용합니다.
									</p>
									<div class="imgRoomWrap">
										<ul id="imgRoomBox">
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</fieldset>
	</div>
</div>



<script>
var selectedRoomObj;
$(function(){
	
	
// 	$('#TL_DIVISION').on('change',function(){
// 		pf_changeTaDivision($(this).val());
// 	})
	
// 	$('#TL_DIVISION').trigger('change');
	
	$( "#roomList" ).sortable({
		update: function(event, ui) {
			pf_setRoomIndex()
        }
	});
	
	$( "#imgRoomBox" ).sortable({
		update: function(event,ui){
			pf_setRoomImgIndex()
		}
	});
	
	pf_setttingRoomDialog();
	
})

function pf_setttingRoomDialog(obj,title,successText,successFnc,cancelText){
	var data = {
			autoOpen : false,
			width : 800,
			resizable : false,
			modal : true,
			title : '객실정보 수정',
			buttons : [{
				html : "<i class='fa fa-times'></i>&nbsp; 확인",
				"class" : "btn btn-primary",
				click : function() {
					pf_updateRoom();
				}
			}]
		}
	$('#roomInfoDialog').dialog(data);
}

function pf_changeTaDivision(value){
	
	$('fieldset[id^=lodgmentFieldset]').hide();
	if(value){
		var id = cf_setKeyno(value);
		if(id == '379'){
			$('#lodgmentFieldset'+id).show();
		}else{
			$('#lodgmentFieldset_hotel').show();
		}
	}
	
}

function pf_addRoomInfo(){
	var name = "";
	
	name = '직접 입력';
	
	var param = {
			"name" : name
	}
	$('#roomList').append(pf_getRoomHtml(param))
	
	pf_setRoomIndex();
	cf_smallBox('숙소', '객실이 추가되었습니다.', 3000);
}

function pf_getRoomHtml(param){
	
	return	  '<li class="input-group">'
			+ '	<span class="input-group-addon"><font class="roomIndex"></font>.</span>'
			+ '	<input class="form-control" name="viewTitle" value="'+param.name+'" type="text" readonly="readonly">'
			+ '	<div class="input-group-btn">'
			+ '		<button class="btn btn-default" type="button" onclick="pf_openUpdateRoom(this)">'
			+ '			수정'
			+ '		</button>'
			+ '		<button class="btn btn-default" type="button" onclick="pf_deleteRoom(this)">'
			+ '			삭제'
			+ '		</button>'
			+ '	</div>'
			+ ' <input type="hidden" name="TG_KEYNO" value="">'
			+ ' <input type="hidden" name="TG_ORDER" value="">'
			+ ' <input type="hidden" name="TG_NAME" value="'+param.name+'">'
			+ ' <input type="hidden" name="TG_INWON_MIN_CNT" value="">'
			+ ' <input type="hidden" name="TG_INWON_MAX_CNT" value="">'
			+ ' <input type="hidden" name="TG_SIZE_METER" value="">'
			+ ' <input type="hidden" name="TG_SIZE_FLAT" value="">'
			+ ' <textarea name="TG_PRICE_CONTENT" style="display:none;"></textarea>'
			+ ' <textarea name="TG_SUMMARY" style="display:none;"></textarea>'
			+ ' <div class="roomImgList" style="display:none;"></div>'
			+ '</li>';
}

function pf_updateRoom(){
	
	if(!$('#roomName').val()){
		cf_smallBox('Form', '객실명을 입력하여주세요.', 3000,'#d24158');
		$('#roomName').focus();
		return false;
	}
	
	var wrap = $(selectedRoomObj).parents('li.input-group');

	$(wrap).find('input[name=viewTitle]').val($('#roomName').val());
	$(wrap).find('input[name=TG_NAME]').val($('#roomName').val());
	$(wrap).find('input[name=TG_INWON_MIN_CNT]').val($('#roomMin').val());
	$(wrap).find('input[name=TG_INWON_MAX_CNT]').val($('#roomMax').val());
	$(wrap).find('input[name=TG_SIZE_METER]').val($('#roomSizeM').val());
	$(wrap).find('input[name=TG_SIZE_FLAT]').val($('#roomSizeP').val());
	$(wrap).find('textarea[name=TG_PRICE_CONTENT]').val($('#roomPrice').val());
	$(wrap).find('textarea[name=TG_SUMMARY]').val($('#roomComment').val());
	
	$(wrap).find('input[name=sub_IMG_ORDER]').val($(wrap).find('input[name=TG_ORDER]').val());
	$(wrap).find('.roomImgList').html($('#imgRoomBox').html());

	selectedRoomObj = '';
	$('#imgRoomBox').empty();
	
	$('#roomInfoDialog').dialog("close");
	cf_smallBox('숙박','객실이 수정되었습니다.',3000);
	
	pf_setRoomIndex();
}

function pf_openUpdateRoom(obj){
	
	$('#roomInfoDialog').dialog('open');

	selectedRoomObj = obj;
	
	var wrap = $(obj).parents('li.input-group');
	
	$('#roomName').val($(wrap).find('input[name=TG_NAME]').val())
	$('#roomMin').val($(wrap).find('input[name=TG_INWON_MIN_CNT]').val())
	$('#roomMax').val($(wrap).find('input[name=TG_INWON_MAX_CNT]').val())
	$('#roomSizeM').val($(wrap).find('input[name=TG_SIZE_METER]').val())
	$('#roomSizeP').val($(wrap).find('input[name=TG_SIZE_FLAT]').val())
	$('#roomComment').val($(wrap).find('textarea[name=TM_SUMMARY]').val())
	$('#roomPrice').val($(wrap).find('textarea[name=TG_PRICE_CONTENT]').val())
	
	$('#imgRoomBox').html($(wrap).find('.roomImgList').html())

	$('#roomnfoDialog .input-group-addon.length,#roomInfoDialog .help-block.length').each(function(){
		
		var id = $(this).attr('id').replace('_length','');
		
		var maxLength = $('#'+id).attr('maxlength');
		pf_checkLength(id,maxLength);
		
	})
	
}

function pf_deleteRoom(obj){
	$(obj).parents('li.input-group').remove();
	
	pf_setRoomIndex();
	cf_smallBox('숙소','객실이삭제되었습니다.',3000);
}

function pf_setRoomIndex(){
	$('#roomList > li').each(function(i){
		$(this).find('.roomIndex').text(i+1);
		$(this).find('input[name=TG_ORDER]').val(i+1);
		
		var RoomCnt = $(this).find('input[name=TG_ORDER]').val();
		$($(this).find('.roomImgList input[name^=sub_IMG_ORDER]')).attr("name","sub_IMG_ORDER"+RoomCnt);
		$($(this).find('.roomImgList input[name^=sub_newImgFile]')).attr("name","sub_newImgFile"+RoomCnt);
		$($(this).find('.roomImgList input[name^=sub_TIM_FILEINFO]')).attr("name","sub_TIM_FILEINFO"+RoomCnt);
		$($(this).find('.roomImgList input[name^=sub_FS_ORINM]')).attr("name","sub_FS_ORINM"+RoomCnt);
		$($(this).find('.roomImgList input[name^=sub_ImgType]')).attr("name","sub_ImgType"+RoomCnt);
		$($(this).find('.roomImgList input[name^=sub_TIM_FM_KEYNO]')).attr("name","sub_TIM_FM_KEYNO"+RoomCnt);
		
	})
}

function pf_setRoomImgIndex(){
	$('#imgRoomBox > li').each(function(i){
		$(this).find('input[name^=sub_IMG_ORDER]').val(i+1);
	})
}

function pf_removeRoomImg(obj){
	if(confirm('정말 삭제하시겠습니까?')){
		$(obj).parent().remove();	
		pf_setRoomImgIndex();
		cf_smallBox('이미지', '이미지가 삭제되었습니다.', 3000,'#d24158');
	}
}

function pf_addRoomImg(id,ext,maxSize){
	id = id || 'imgRoomFile';
	
	var MB = 1048576;
	//값이 없으면 10MB 셋팅
	maxSize = maxSize || 10;
	ext = ext || 'jpg,jpeg,gif,png';
	
	
	var isIE9 = (navigator.userAgent.indexOf('MSIE 9.0') != -1);  
	var path =$('#'+id).val();

	var thisExt = path.substring(path.lastIndexOf('.') + 1).toLowerCase();
	
	if(ext.indexOf(thisExt) != -1)  
	{ 
		
		var f = document.getElementById(id).files[0];
		var size = f.size;
		if(size > maxSize * MB){
			cf_smallBox('이미지', '파일이 너무 큽니다.('+maxSize+'MB 제한)', 3000,'gray');
			$('#'+id).val('');
			return;
		}
		if(isIE9) {  
			// $('#'+id+'_img').attr('src', path);  
		}else{  
			
			var reader = new FileReader();
			reader.onload = (function(evt) {  //evt get all value

				var name = path.substring(path.lastIndexOf('\\') + 1).toLowerCase();
				var fmKey = $("#imgRoomBox").find("input[name^=TIM_FM_KEYNO]").first().val();
				if(typeof fmKey == "undefined"){
					 fmKey = ""
				}
				
				var temp = '<li>';
				temp +=	'		<a href="javascript:;" onclick="pf_removeImg(this)">';
				temp +=	'			<i class="fa fa-times"></i>'; 
				temp +=	'		</a>';
				temp +=	'		<img src="'+evt.target.result+'" onclick="pf_viewImg(this)">';
				temp += '		<input type="hidden" name="sub_IMG_ORDER" value="">';
				temp += '		<input type="hidden" name="sub_newImgFile" value="Y">';
				temp += '		<input type="hidden" name="sub_TIM_FILEINFO" value="'+evt.target.result+'">';
				temp += '		<input type="hidden" name="sub_FS_ORINM" value="'+name+'">';
				temp += '		<input type="hidden" name="sub_ImgType" value="G">';
				temp += '		<input type="hidden" name="sub_TIM_FM_KEYNO" value="'+fmKey+'">';
				temp +=	'	</li>';

				$('#imgRoomBox').append(temp);
				pf_setRoomImgIndex();
			});
			reader.readAsDataURL(f);
		}  
		
	}else{  
		cf_smallBox('이미지', '이미지 파일 형식이 잘못되었습니다.', 3000,'gray');
		
	}   
	
	$('#'+id).val('');
	
}
</script>

