<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<input type="hidden" name="TT_KEYNO" id="TT_KEYNO" value="${resultData.TT_KEYNO }">
<fieldset>
	<legend>테마 정보</legend>		
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 구분</label>
		<div class="col-md-10">
			<select class="form-control" name="TT_DIVISION" id="TT_DIVISION">
				<option value="">선택하세요.</option>
				<c:forEach items="${themeTypeList }" var="themeType">
				<option value="${themeType.SC_KEYNO }" ${resultData.TT_DIVISION eq themeType.SC_KEYNO ? 'selected':'' }>${themeType.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">신청방법</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_APPLY" 
										class="onoffswitch-checkbox" id="TT_APPLY_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_APPLY') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_APPLY_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TT_APPLY" id="TT_APPLY" maxlength="50" onkeyup="pf_checkLength('TT_APPLY',50)"
								value="${resultData.TT_APPLY }">
						<span class="input-group-addon number" id="TT_APPLY_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">팩스</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_FAX" 
										class="onoffswitch-checkbox" id="TT_FAX_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_FAX') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_FAX_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TT_FAX" id="TT_FAX" maxlength="50" onkeyup="pf_checkLength('TT_FAX',50)"
								value="${resultData.TT_FAX }">
						<span class="input-group-addon number" id="TT_FAX_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</fieldset>

<fieldset id="themeFieldset397">
	<legend>체험여행 정보</legend>
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 소분류</label>
		<div class="col-md-10">
			<select class="form-control" name="TT_CHE_DIVISION" id="TT_CHE_DIVISION">
				<option value="">선택하세요.</option>
				<c:forEach items="${experiencetripTypeList }" var="experiencetripType">
				<option value="${experiencetripType.SC_KEYNO }" ${resultData.TT_CHE_DIVISION eq experiencetripType.SC_KEYNO ? 'selected':'' }>${experiencetripType.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">속칭</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_SAN_SOGCHING" 
										class="onoffswitch-checkbox" id="TA_SAN_SOGCHING_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_SAN_SOGCHING') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_SAN_SOGCHING_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TA_SAN_SOGCHING" id="TA_SAN_SOGCHING" maxlength="20" onkeyup="pf_checkLength('TA_SAN_SOGCHING',20)"
								value="${resultData.TA_SAN_SOGCHING }">
						<span class="input-group-addon number" id="TA_SAN_SOGCHING_length">(0/20자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group">
		<label class="col-md-2 control-label">체험대상</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TARGET" 
										class="onoffswitch-checkbox" id="TT_TARGET_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TARGET') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TARGET_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_TARGET" id="TT_TARGET" maxlength="500" onkeyup="pf_checkLength('TT_TARGET',500)" >${resultData.TT_TARGET }</textarea>
					</div>
					<p class="help-block length" id="TT_TARGET_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
</fieldset>

<fieldset id="themeFieldset_tripSub">
	<legend>체험여행 추가정보</legend>
	<div class="form-group trip403">
		<label class="col-md-2 control-label">배이름</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_BAE_NAME" 
										class="onoffswitch-checkbox" id="TT_BAE_NAME_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_BAE_NAME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_BAE_NAME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_BAE_NAME" id="TT_BAE_NAME" maxlength="20" onkeyup="pf_checkLength('TT_BAE_NAME',20)"
								value="${resultData.TT_BAE_NAME }">
						<span class="input-group-addon number" id="TT_BAE_NAME_length">(0/20자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip403">
		<label class="col-md-2 control-label">선장</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_BAE_CAPTAIN" 
										class="onoffswitch-checkbox" id="TT_BAE_CAPTAIN_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_BAE_CAPTAIN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_BAE_CAPTAIN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_BAE_CAPTAIN" id="TT_BAE_CAPTAIN" maxlength="20" onkeyup="pf_checkLength('TT_BAE_CAPTAIN',20)"
								value="${resultData.TT_BAE_CAPTAIN }">
						<span class="input-group-addon number" id="TT_BAE_CAPTAIN_length">(0/20자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip403">
		<label class="col-md-2 control-label">톤급</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_BAE_TON" 
										class="onoffswitch-checkbox" id="TT_BAE_TON_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_BAE_TON') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_BAE_TON_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TT_BAE_TON" id="TT_BAE_TON" maxlength="10"
								value="${resultData.TT_BAE_TON }">
						<span class="input-group-addon number">단위(톤)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip403">
		<label class="col-md-2 control-label">출발시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_BAE_START_TIME" 
										class="onoffswitch-checkbox" id="TT_BAE_START_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_BAE_START_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_BAE_START_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TT_BAE_START_TIME" id="TT_BAE_START_TIME" class="hiddenTimeForm" data-hour="TT_START_HOUR" data-min="TT_START_MIN" value="${resultData.TT_BAE_START_TIME }">
							<c:if test="${not empty resultData.TT_BAE_START_TIME }">
								<c:set var="TT_START_HOUR" value="${fn:split(resultData.TT_BAE_START_TIME,':')[0] }"/>
								<c:set var="TT_START_MIN" value="${fn:split(resultData.TT_BAE_START_TIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control"  placeholder="입력하세요" 
												id="TT_START_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TT_START_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TT_START_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TT_START_MIN }">
										<span class="input-group-addon number">분</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group trip403">
		<label class="col-md-2 control-label">도착시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_BAE_END_TIME" 
										class="onoffswitch-checkbox" id="TT_BAE_END_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_BAE_END_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_BAE_END_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TT_BAE_END_TIME" id="TT_BAE_END_TIME" class="hiddenTimeForm" data-hour="TT_END_HOUR" data-min="TT_END_MIN" value="${resultData.TT_BAE_END_TIME }">
							<c:if test="${not empty resultData.TA_TIME }">
								<c:set var="TT_END_HOUR" value="${fn:split(resultData.TT_BAE_END_TIME,':')[0] }"/>
								<c:set var="TT_END_MIN" value="${fn:split(resultData.TT_BAE_END_TIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control"  placeholder="입력하세요" 
												id="TT_END_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TT_END_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TT_END_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TT_END_MIN }">
										<span class="input-group-addon number">분</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group trip403 trip405">
		<label class="col-md-2 control-label">소요시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TIME" 
										class="onoffswitch-checkbox" id="TT_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TT_TIME" id="TT_TIME" class="hiddenTimeForm" data-hour="TT_TIME_HOUR" data-min="TT_TIME_MIN" value="${resultData.TT_TIME }">
							<c:if test="${not empty resultData.TA_TIME }">
								<c:set var="TT_TIME_HOUR" value="${fn:split(resultData.TT_TIME,':')[0] }"/>
								<c:set var="TT_TIME_MIN" value="${fn:split(resultData.TT_TIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control"  placeholder="입력하세요" 
												id="TT_TIME_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TT_TIME_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TT_TIME_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TT_TIME_MIN }">
										<span class="input-group-addon number">분</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group trip403">
		<label class="col-md-2 control-label">승선장소</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_BAE_PLACE" 
										class="onoffswitch-checkbox" id="TT_BAE_PLACE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_BAE_PLACE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_BAE_PLACE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_BAE_PLACE" id="TT_BAE_PLACE" maxlength="50" onkeyup="pf_checkLength('TT_BAE_PLACE',50)"
								value="${resultData.TT_BAE_PLACE }">
						<span class="input-group-addon number" id="TT_BAE_PLACE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip403 trip405">
		<label class="col-md-2 control-label">출발지</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_START_PLACE" 
										class="onoffswitch-checkbox" id="TT_START_PLACE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_START_PLACE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_START_PLACE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_START_PLACE" id="TT_START_PLACE" maxlength="50" onkeyup="pf_checkLength('TT_START_PLACE',50)"
								value="${resultData.TT_START_PLACE }">
						<span class="input-group-addon number" id="TT_START_PLACE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip403 trip405">
		<label class="col-md-2 control-label">도착지</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_END_PLACE" 
										class="onoffswitch-checkbox" id="TT_END_PLACE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_END_PLACE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_END_PLACE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_END_PLACE" id="TT_END_PLACE" maxlength="50" onkeyup="pf_checkLength('TT_END_PLACE',50)"
								value="${resultData.TT_END_PLACE }">
						<span class="input-group-addon number" id="TT_END_PLACE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip403 trip405">
		<label class="col-md-2 control-label">코스</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_COURCE" 
										class="onoffswitch-checkbox" id="TT_COURCE_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_COURCE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_COURCE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_COURCE" id="TT_COURCE" maxlength="500" onkeyup="pf_checkLength('TT_COURCE',500)" >${resultData.TT_COURCE }</textarea>
					</div>
					<p class="help-block length" id="TT_COURCE_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group trip405">
		<label class="col-md-2 control-label">난이도</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_WALK_NANIDO" 
										class="onoffswitch-checkbox" id="TT_WALK_NANIDO_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_WALK_NANIDO') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_WALK_NANIDO_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_WALK_NANIDO" id="TT_WALK_NANIDO" maxlength="50" onkeyup="pf_checkLength('TT_WALK_NANIDO',50)"
								value="${resultData.TT_WALK_NANIDO }">
						<span class="input-group-addon number" id="TT_WALK_NANIDO_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip405">
		<label class="col-md-2 control-label">왕복거리</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_WALK_DISTANCE" 
										class="onoffswitch-checkbox" id="TT_WALK_DISTANCE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_WALK_DISTANCE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_WALK_DISTANCE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TT_WALK_DISTANCE" id="TT_WALK_DISTANCE" maxlength="10"
								value="${resultData.TT_WALK_DISTANCE }">
						<span class="input-group-addon number">단위(km)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	

	<div class="form-group trip406">
		<label class="col-md-2 control-label">프로그램명</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TEMPLE_PROGRAM_NAME" 
										class="onoffswitch-checkbox" id="TT_TEMPLE_PROGRAM_NAME_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TEMPLE_PROGRAM_NAME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TEMPLE_PROGRAM_NAME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_TEMPLE_PROGRAM_NAME" id="TT_TEMPLE_PROGRAM_NAME" maxlength="50" onkeyup="pf_checkLength('TT_TEMPLE_PROGRAM_NAME',50)"
								value="${resultData.TT_TEMPLE_PROGRAM_NAME }">
						<span class="input-group-addon number" id="TT_TEMPLE_PROGRAM_NAME_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip406">
		<label class="col-md-2 control-label">프로그램일정</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TEMPLE_PROGRAM_CONTANT" 
										class="onoffswitch-checkbox" id="TT_TEMPLE_PROGRAM_CONTANT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TEMPLE_PROGRAM_CONTANT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TEMPLE_PROGRAM_CONTANT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_TEMPLE_PROGRAM_CONTANT" id="TT_TEMPLE_PROGRAM_CONTANT" maxlength="500" onkeyup="pf_checkLength('TT_TEMPLE_PROGRAM_CONTANT',500)" >${resultData.TT_TEMPLE_PROGRAM_CONTANT }</textarea>
					</div>
					<p class="help-block length" id="TT_TEMPLE_PROGRAM_CONTANT_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group trip403 trip406">
		<label class="col-md-2 control-label">인원</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_INWON" 
										class="onoffswitch-checkbox" id="TT_INWON_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_INWON') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_INWON_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TT_INWON" id="TT_INWON" maxlength="10"
								value="${resultData.TT_INWON }">
						<span class="input-group-addon number">단위(명)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip406">
		<label class="col-md-2 control-label">안내자</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TEMPLE_GUIDE" 
										class="onoffswitch-checkbox" id="TT_TEMPLE_GUIDE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TEMPLE_GUIDE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TEMPLE_GUIDE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_TEMPLE_GUIDE" id="TT_TEMPLE_GUIDE" maxlength="50" onkeyup="pf_checkLength('TT_TEMPLE_GUIDE',50)"
								value="${resultData.TT_TEMPLE_GUIDE }">
						<span class="input-group-addon number" id="TT_TEMPLE_GUIDE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<div class="form-group trip406">
		<label class="col-md-2 control-label">예약방법</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TEMPLE_BOOKS_WAY" 
										class="onoffswitch-checkbox" id="TT_TEMPLE_BOOKS_WAY_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TEMPLE_BOOKS_WAY') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TEMPLE_BOOKS_WAY_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_TEMPLE_BOOKS_WAY" id="TT_TEMPLE_BOOKS_WAY" maxlength="500" onkeyup="pf_checkLength('TT_TEMPLE_BOOKS_WAY',500)" >${resultData.TT_TEMPLE_BOOKS_WAY }</textarea>
					</div>
					<p class="help-block length" id="TT_TEMPLE_BOOKS_WAY_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group trip406">
		<label class="col-md-2 control-label">학습기대효과</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TEMPLE_EFFECT" 
										class="onoffswitch-checkbox" id="TT_TEMPLE_EFFECT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TEMPLE_EFFECT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TEMPLE_EFFECT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_TEMPLE_EFFECT" id="TT_TEMPLE_EFFECT" maxlength="500" onkeyup="pf_checkLength('TT_TEMPLE_EFFECT',500)" >${resultData.TT_TEMPLE_EFFECT }</textarea>
					</div>
					<p class="help-block length" id="TT_TEMPLE_EFFECT_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>

</fieldset>

<fieldset id="themeFieldset398">
	<legend>체험마을 정보</legend>
	<div class="form-group">
		<label class="col-md-2 control-label">마을유래</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TOWN_ORIGIN" 
										class="onoffswitch-checkbox" id="TT_TOWN_ORIGIN_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TOWN_ORIGIN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TOWN_ORIGIN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_TOWN_ORIGIN" id="TT_TOWN_ORIGIN" maxlength="500" onkeyup="pf_checkLength('TT_TOWN_ORIGIN',500)" >${resultData.TT_TOWN_ORIGIN }</textarea>
					</div>
					<p class="help-block length" id="TT_TOWN_ORIGIN_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">인사말</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TOWN_GREETING" 
										class="onoffswitch-checkbox" id="TT_TOWN_GREETING_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TOWN_GREETING') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TOWN_GREETING_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_TOWN_GREETING" id="TT_TOWN_GREETING" maxlength="500" onkeyup="pf_checkLength('TT_TOWN_GREETING',500)" >${resultData.TT_TOWN_GREETING }</textarea>
					</div>
					<p class="help-block length" id="TT_TOWN_GREETING_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">마을 농특산물</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TOWN_SPECIALTY" 
										class="onoffswitch-checkbox" id="TT_TOWN_SPECIALTY_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TOWN_SPECIALTY') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TOWN_SPECIALTY_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_TOWN_SPECIALTY" id="TT_TOWN_SPECIALTY" maxlength="500" onkeyup="pf_checkLength('TT_TOWN_SPECIALTY',500)" >${resultData.TT_TOWN_SPECIALTY }</textarea>
					</div>
					<p class="help-block length" id="TT_TOWN_SPECIALTY_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">살거리</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_TOWN_SALGEOLI" 
										class="onoffswitch-checkbox" id="TT_TOWN_SALGEOLI_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_TOWN_SALGEOLI') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_TOWN_SALGEOLI_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TT_TOWN_SALGEOLI" id="TT_TOWN_SALGEOLI" maxlength="500" onkeyup="pf_checkLength('TT_TOWN_SALGEOLI',500)" >${resultData.TT_TOWN_SALGEOLI }</textarea>
					</div>
					<p class="help-block length" id="TT_TOWN_SALGEOLI_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
</fieldset>

<fieldset id="themeFieldset399">
	<legend>숲과 치유 정보</legend>
	<div class="form-group">
		<label class="col-md-2 control-label">주관</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_SUP_MANAGE" 
										class="onoffswitch-checkbox" id="TT_SUP_MANAGE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_SUP_MANAGE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_SUP_MANAGE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_SUP_MANAGE" id="TT_SUP_MANAGE" maxlength="50" onkeyup="pf_checkLength('TT_SUP_MANAGE',50)"
								value="${resultData.TT_SUP_MANAGE }">
						<span class="input-group-addon number" id="TT_SUP_MANAGE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<div class="form-group">
		<label class="col-md-2 control-label">종류</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TT_SUP_KINDS" 
										class="onoffswitch-checkbox" id="TT_SUP_KINDS_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TT_SUP_KINDS') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TT_SUP_KINDS_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TT_SUP_KINDS" id="TT_SUP_KINDS" maxlength="50" onkeyup="pf_checkLength('TT_SUP_KINDS',50)"
								value="${resultData.TT_SUP_KINDS }">
						<span class="input-group-addon number" id="TT_SUP_KINDS_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</fieldset>


<script>
$(function(){
	$("#TT_DIVISION").on('change',function(){
		pf_changeTagDivision($(this).val());
	});
	$("#TT_DIVISION").trigger('change');
	
	$("#TT_CHE_DIVISION").on('change',function(){
		pf_changeTagTripDivision($(this).val());
	});
	$("#TT_CHE_DIVISION").trigger('change');
});

function pf_changeTagDivision(value){
	$('fieldset[id^=themeFieldset]').hide();
	if(value){
		var id = cf_setKeyno(value);
		$('#themeFieldset'+id).show();
	}
}
function pf_changeTagTripDivision(value){	
	$('div[class*=trip]').hide();
	$('#themeFieldset_tripSub').hide();
	if(value){
		var id = cf_setKeyno(value);
		if(id == '403' || id == '405' || id == '406'){
			$('#themeFieldset_tripSub').show();
			$('.trip'+id).show();
		}
	}
}
</script>