<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<input type="hidden" name="TI_KEYNO" id="TI_KEYNO" value="${resultData.TI_KEYNO }">
<fieldset>
	<legend>이용안내</legend>	
	
	<div class="form-group">
		<label class="col-md-2 control-label">이용시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_TIME" 
										class="onoffswitch-checkbox" id="TI_TIME_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="3" name="TI_TIME" id="TI_TIME" maxlength="300" onkeyup="pf_checkLength('TI_TIME',300)" >${resultData.TI_TIME }</textarea>
					</div>
					<p class="help-block length" id="TI_TIME_length">(0/300자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">이용 상세안내</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_DETAIL" 
										class="onoffswitch-checkbox" id="TI_DETAIL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_DETAIL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_DETAIL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="3" name="TI_DETAIL" id="TI_DETAIL" maxlength="500" onkeyup="pf_checkLength('TI_DETAIL',500)" >${resultData.TI_DETAIL }</textarea>
					</div>
					<p class="help-block length" id="TI_DETAIL_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">입장료</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_ENTRANCE_FEE" 
										class="onoffswitch-checkbox" id="TI_ENTRANCE_FEE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_ENTRANCE_FEE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_ENTRANCE_FEE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TI_ENTRANCE_FEE" id="TI_ENTRANCE_FEE" maxlength="200" onkeyup="pf_checkLength('TI_ENTRANCE_FEE',200)" >${resultData.TI_ENTRANCE_FEE }</textarea>
					</div>
					<p class="help-block length" id="TI_ENTRANCE_FEE_length">(0/200자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">휴무일</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_CLOSED_DAY" 
										class="onoffswitch-checkbox" id="TI_CLOSED_DAY_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_CLOSED_DAY') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_CLOSED_DAY_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TI_CLOSED_DAY" id="TI_CLOSED_DAY" maxlength="50" onkeyup="pf_checkLength('TI_CLOSED_DAY',50)"
								value="${resultData.TI_CLOSED_DAY }">
						<span class="input-group-addon length" id="TI_CLOSED_DAY_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">주차장 유무</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_PARKING_YN" 
										class="onoffswitch-checkbox" id="TI_PARKING_YN_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_PARKING_YN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_PARKING_YN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TI_PARKING_YN" value="Y" ${resultData.TI_PARKING_YN eq 'Y' ? 'checked="checked"':'' }>
							<span>있음</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TI_PARKING_YN" value="N" ${empty resultData || resultData.TI_PARKING_YN eq 'N' ? 'checked="checked"':'' }>
							<span>없음</span> 
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">주차시설</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_PARKING_PLACE" 
										class="onoffswitch-checkbox" id="TI_PARKING_PLACE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_PARKING_PLACE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_PARKING_PLACE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TI_PARKING_PLACE" id="TI_PARKING_PLACE" maxlength="200" onkeyup="pf_checkLength('TI_PARKING_PLACE',200)" >${resultData.TI_PARKING_PLACE }</textarea>
					</div>
					<p class="help-block length" id="TI_PARKING_PLACE_length">(0/200자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">편의시설</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_CONVENIENCE_SISEOL" 
										class="onoffswitch-checkbox" id="TI_CONVENIENCE_SISEOL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_CONVENIENCE_SISEOL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_CONVENIENCE_SISEOL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="3" name="TI_CONVENIENCE_SISEOL" id="TI_CONVENIENCE_SISEOL" maxlength="500" onkeyup="pf_checkLength('TI_CONVENIENCE_SISEOL',500)" >${resultData.TI_CONVENIENCE_SISEOL }</textarea>
					</div>
					<p class="help-block length" id="TI_CONVENIENCE_SISEOL_length">(0/500자)</p>
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
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_BUDAE_SISEOL" 
										class="onoffswitch-checkbox" id="TI_BUDAE_SISEOL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_BUDAE_SISEOL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_BUDAE_SISEOL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="3" name="TI_BUDAE_SISEOL" id="TI_BUDAE_SISEOL" maxlength="500" onkeyup="pf_checkLength('TI_BUDAE_SISEOL',500)" >${resultData.TI_BUDAE_SISEOL }</textarea>
					</div>
					<p class="help-block length" id="TI_BUDAE_SISEOL_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">장애인/노약자/임산부 시설정보</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_ETC_SISEOL" 
										class="onoffswitch-checkbox" id="TI_ETC_SISEOL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_ETC_SISEOL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_ETC_SISEOL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="3" name="TI_ETC_SISEOL" id="TI_ETC_SISEOL" maxlength="500" onkeyup="pf_checkLength('TI_ETC_SISEOL',500)" >${resultData.TI_ETC_SISEOL }</textarea>
					</div>
					<p class="help-block length" id="TI_ETC_SISEOL_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">기타 정보</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_ETC_DETAIL" 
										class="onoffswitch-checkbox" id="TI_ETC_DETAIL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_ETC_DETAIL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_ETC_DETAIL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="3" name="TI_ETC_DETAIL" id="TI_ETC_DETAIL" maxlength="500" onkeyup="pf_checkLength('TI_ETC_DETAIL',500)" >${resultData.TI_ETC_DETAIL }</textarea>
					</div>
					<p class="help-block length" id="TI_ETC_DETAIL_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">언어 서비스</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TI_LANG_SERVICE" 
										class="onoffswitch-checkbox" id="TI_LANG_SERVICE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TI_LANG_SERVICE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TI_LANG_SERVICE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TI_LANG_SERVICE" id="TI_LANG_SERVICE" maxlength="50" onkeyup="pf_checkLength('TI_LANG_SERVICE',50)"
								value="${resultData.TI_LANG_SERVICE }">
						<span class="input-group-addon length" id="TI_LANG_SERVICE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</fieldset>
