<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>




<input type="hidden" name="TCH_KEYNO" id="TCH_KEYNO" value="${resultData.TCH_KEYNO }">
<fieldset>
	<legend>문화재 정보</legend>		
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 구분</label>
		<div class="col-md-10">
			<select class="form-control" name="TCH_DIVISION" id="TCH_DIVISION">
				<option value="">선택하세요.</option>
				<c:forEach items="${culturalheritageTypeList }" var="culturalheritageType">
				<option value="${culturalheritageType.SC_KEYNO }" ${resultData.TCH_DIVISION eq culturalheritageType.SC_KEYNO ? 'selected':'' }>${culturalheritageType.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">종별</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCH_TYPE" 
										class="onoffswitch-checkbox" id="TCH_TYPE_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCH_TYPE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCH_TYPE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCH_TYPE" id="TCH_TYPE" maxlength="50" onkeyup="pf_checkLength('TCH_TYPE',50)"
								value="${resultData.TCH_TYPE }">
						<span class="input-group-addon number" id="TCH_TYPE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">소재지</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCH_LOCATION" 
										class="onoffswitch-checkbox" id="TCH_LOCATION_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCH_LOCATION') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCH_LOCATION_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCH_LOCATION" id="TCH_LOCATION" maxlength="50" onkeyup="pf_checkLength('TCH_LOCATION',50)"
								value="${resultData.TCH_LOCATION }">
						<span class="input-group-addon number" id="TCH_LOCATION_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">지정일</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCH_JIJEONG_DAY" 
										class="onoffswitch-checkbox" id="TCH_JIJEONG_DAY_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCH_JIJEONG_DAY') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCH_JIJEONG_DAY_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCH_JIJEONG_DAY" id="TCH_JIJEONG_DAY" maxlength="50" onkeyup="pf_checkLength('TCH_JIJEONG_DAY',50)"
								value="${resultData.TCH_JIJEONG_DAY }">
						<span class="input-group-addon number" id="TCH_JIJEONG_DAY_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">지정번호</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCH_JIJEONG_NUM" 
										class="onoffswitch-checkbox" id="TCH_JIJEONG_NUM_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCH_JIJEONG_NUM') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCH_JIJEONG_NUM_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCH_JIJEONG_NUM" id="TCH_JIJEONG_NUM" maxlength="50" onkeyup="pf_checkLength('TCH_JIJEONG_NUM',50)"
								value="${resultData.TCH_JIJEONG_NUM }">
						<span class="input-group-addon number" id="TCH_JIJEONG_NUM_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">시대</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCH_ERA" 
										class="onoffswitch-checkbox" id="TCH_ERA_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCH_ERA') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCH_ERA_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCH_ERA" id="TCH_ERA" maxlength="50" onkeyup="pf_checkLength('TCH_ERA',50)"
								value="${resultData.TCH_ERA }">
						<span class="input-group-addon number" id="TCH_ERA_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">전통사찰</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCH_STRING1" 
										class="onoffswitch-checkbox" id="TCH_STRING1_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCH_STRING1') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCH_STRING1_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCH_STRING1" id="TCH_STRING1" maxlength="50" onkeyup="pf_checkLength('TCH_STRING1',50)"
								value="${resultData.TCH_STRING1 }">
						<span class="input-group-addon number" id="TCH_STRING1_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">규모</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCH_STRING2" 
										class="onoffswitch-checkbox" id="TCH_STRING2_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCH_STRING2') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCH_STRING2_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCH_STRING2" id="TCH_STRING2" maxlength="50" onkeyup="pf_checkLength('TCH_STRING2',50)"
								value="${resultData.TCH_STRING2 }">
						<span class="input-group-addon number" id="TCH_STRING2_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">소유자</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TCH_STRING3" 
										class="onoffswitch-checkbox" id="TCH_STRING3_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TCH_STRING3') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TCH_STRING3_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TCH_STRING3" id="TCH_STRING3" maxlength="50" onkeyup="pf_checkLength('TCH_STRING3',50)"
								value="${resultData.TCH_STRING3 }">
						<span class="input-group-addon number" id="TCH_STRING3_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</fieldset>

