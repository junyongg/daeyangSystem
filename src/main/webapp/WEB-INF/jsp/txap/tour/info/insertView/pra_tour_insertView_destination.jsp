<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>




<input type="hidden" name="TA_KEYNO" id="TA_KEYNO" value="${resultData.TA_KEYNO }">
<fieldset>
	<legend>관광명소 정보</legend>		
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 구분</label>
		<div class="col-md-10">
			<select class="form-control" name="TA_DIVISION" id="TA_DIVISION">
				<option value="">선택하세요.</option>
				<c:forEach items="${destinationTypeList }" var="destinationType">
				<option value="${destinationType.SC_KEYNO }" ${resultData.TA_DIVISION eq destinationType.SC_KEYNO ? 'selected':'' }>${destinationType.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">관광소요시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_TIME" 
										class="onoffswitch-checkbox" id="TA_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TA_TIME" id="TA_TIME" class="hiddenTimeForm" data-hour="TA_HOUR" data-min="TA_MIN" value="${resultData.TA_TIME }">
							<c:if test="${not empty resultData.TA_TIME }">
								<c:set var="TA_HOUR" value="${fn:split(resultData.TA_TIME,':')[0] }"/>
								<c:set var="TA_MIN" value="${fn:split(resultData.TA_TIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control"  placeholder="입력하세요."
												id="TA_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TA_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TA_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TA_MIN }">
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
	
	<div class="form-group">
		<label class="col-md-2 control-label">추천계절</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_SEASON" 
										class="onoffswitch-checkbox" id="TA_SEASON_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_SEASON') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_SEASON_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TA_SEASON" id="TA_SEASON" maxlength="50" onkeyup="pf_checkLength('TA_SEASON',50)"
								value="${resultData.TA_SEASON }">
						<span class="input-group-addon number" id="TA_SEASON_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</fieldset>

<fieldset id="destinationFieldset369">
	<legend>산</legend>
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
		<label class="col-md-2 control-label">한자명</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_SAN_HANJANAME" 
										class="onoffswitch-checkbox" id="TA_SAN_HANJANAME_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_SAN_HANJANAME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_SAN_HANJANAME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TA_SAN_HANJANAME" id="TA_SAN_HANJANAME" maxlength="20" onkeyup="pf_checkLength('TA_SAN_HANJANAME',20)"
								value="${resultData.TA_SAN_HANJANAME }">
						<span class="input-group-addon number" id="TA_SAN_HANJANAME_length">(0/20자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">규모(해발고도)</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_SAN_SCALE" 
										class="onoffswitch-checkbox" id="TA_SAN_SCALE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_SAN_SCALE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_SAN_SCALE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_SAN_SCALE" id="TA_SAN_SCALE" maxlength="10"
								value="${resultData.TA_SAN_SCALE }">
						<span class="input-group-addon number">단위(m)</span>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
</fieldset>

<fieldset id="destinationFieldset370">
	<legend>해수욕장</legend>
	
	<div class="form-group">
		<label class="col-md-2 control-label">면적</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_BEACH_AREA" 
										class="onoffswitch-checkbox" id="TA_BEACH_AREA_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_BEACH_AREA') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_BEACH_AREA_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_BEACH_AREA" id="TA_BEACH_AREA" maxlength="6"
								onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
								value="${resultData.TA_BEACH_AREA }">
						<span class="input-group-addon number">단위(m<sup>2</sup>)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">길이</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_BEACH_LONG" 
										class="onoffswitch-checkbox" id="TA_BEACH_LONG_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_BEACH_LONG') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_BEACH_LONG_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_BEACH_LONG" id="TA_BEACH_LONG" maxlength="5"
								onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
								value="${resultData.TA_BEACH_LONG }">
						<span class="input-group-addon number">단위(m)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">폭</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_BEACH_WIDTH" 
										class="onoffswitch-checkbox" id="TA_BEACH_WIDTH_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_BEACH_WIDTH') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_BEACH_WIDTH_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_BEACH_WIDTH" id="TA_BEACH_WIDTH" maxlength="5"
								onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
								value="${resultData.TA_BEACH_WIDTH }">
						<span class="input-group-addon number">단위(m)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">해변형태</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_BEACH_SHAPE" 
										class="onoffswitch-checkbox" id="TA_BEACH_SHAPE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_BEACH_SHAPE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_BEACH_SHAPE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요" 
								name="TA_BEACH_SHAPE" id="TA_BEACH_SHAPE" maxlength="20" onkeyup="pf_checkLength('TA_BEACH_SHAPE',20)"
								value="${resultData.TA_BEACH_SHAPE }">
						<span class="input-group-addon number" id="TA_BEACH_SHAPE_length">(0/20자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">경사도</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_BEACH_SLOPE" 
										class="onoffswitch-checkbox" id="TA_BEACH_SLOPE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_BEACH_SLOPE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_BEACH_SLOPE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_BEACH_SLOPE" id="TA_BEACH_SLOPE" maxlength="2"
								onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
								value="${resultData.TA_BEACH_SLOPE }">
						<span class="input-group-addon number">단위(°)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">안전거리</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_BEACH_SAFE_DISTANCE" 
										class="onoffswitch-checkbox" id="TA_BEACH_SAFE_DISTANCE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_BEACH_SAFE_DISTANCE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_BEACH_SAFE_DISTANCE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_BEACH_SAFE_DISTANCE" id="TA_BEACH_SAFE_DISTANCE" maxlength="4"
								onkeydown="return cf_onlyNumAndLimitLength(this,event)"  
								value="${resultData.TA_BEACH_SAFE_DISTANCE }">
						<span class="input-group-addon number">단위(m)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</fieldset>

<!-- <fieldset id="destinationFieldset371">
	<legend>야경</legend>
</fieldset>

<fieldset id="destinationFieldset372">
	<legend>대교</legend>
</fieldset> -->

<fieldset id="destinationFieldset368">
	<legend>섬</legend>
	
	<div class="form-group">
		<label class="col-md-2 control-label">도서유형</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_SUM_TYPE" 
										class="onoffswitch-checkbox" id="TA_SUM_TYPE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_SUM_TYPE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_SUM_TYPE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TA_SUM_TYPE" value="유인도" ${empty resultData || resultData.TA_SUM_TYPE eq '유인도' ? 'checked="checked"':'' }>
							<span>유인도</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TA_SUM_TYPE" value="무인도" ${resultData.TA_SUM_TYPE eq '무인도' ? 'checked="checked"':'' }>
							<span>무인도</span>
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">면적</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_SUM_AREA" 
										class="onoffswitch-checkbox" id="TA_SUM_AREA_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_SUM_AREA') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_SUM_AREA_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_SUM_AREA" id="TA_SUM_AREA" maxlength="6"
								onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
								value="${resultData.TA_SUM_AREA }">
						<span class="input-group-addon number">단위(m<sup>2</sup>)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">해안선</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_SUM_COASTLINE" 
										class="onoffswitch-checkbox" id="TA_SUM_COASTLINE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_SUM_COASTLINE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_SUM_COASTLINE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_SUM_COASTLINE" id="TA_SUM_COASTLINE" maxlength="6"
								onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
								value="${resultData.TA_SUM_COASTLINE }">
						<span class="input-group-addon number">단위(m)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">가구 수</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TA_SUM_GAGU_CNT" 
										class="onoffswitch-checkbox" id="TA_SUM_GAGU_CNT_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TA_SUM_GAGU_CNT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TA_SUM_GAGU_CNT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TA_SUM_GAGU_CNT" id="TA_SUM_GAGU_CNT" maxlength="5"
								onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
								value="${resultData.TA_SUM_GAGU_CNT }">
						<span class="input-group-addon number">단위(세대)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</fieldset>


<script>

$(function(){
	
	
	$('#TA_DIVISION').on('change',function(){
		pf_changeTaDivision($(this).val());
	})
	
	$('#TA_DIVISION').trigger('change');
	
	
	
})

function pf_changeTaDivision(value){
	
	$('fieldset[id^=destinationFieldset]').hide();
	
	if(value){
		var id = cf_setKeyno(value);
		$('#destinationFieldset'+id).show();
	}
	
}

</script>

