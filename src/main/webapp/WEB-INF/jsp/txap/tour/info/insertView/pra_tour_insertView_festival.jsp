<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>





<input type="hidden" name="TF_KEYNO" id="TF_KEYNO" value="${resultData.TF_KEYNO }">
<fieldset>
	<legend>축제 정보</legend>		
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 구분</label>
		<div class="col-md-10">
			<select class="form-control" name="TF_DIVISION" id="TF_DIVISION">
				<option value="">선택하세요.</option>
				<c:forEach items="${festivalTypeList }" var="festivalType">
				<option value="${festivalType.SC_KEYNO }" ${resultData.TF_DIVISION eq festivalType.SC_KEYNO ? 'selected':'' }>${festivalType.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">기간(일시)</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_TERM" 
										class="onoffswitch-checkbox" id="TF_TERM_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_TERM') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_TERM_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TF_TERM" id="TF_TERM" maxlength="50" onkeyup="pf_checkLength('TF_TERM',50)"
								value="${resultData.TF_TERM }">
						<span class="input-group-addon number" id="TF_TERM_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">행사장소</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_PLACE" 
										class="onoffswitch-checkbox" id="TF_PLACE_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_PLACE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_PLACE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TF_PLACE" id="TF_PLACE" maxlength="50" onkeyup="pf_checkLength('TF_PLACE',50)"
								value="${resultData.TF_PLACE }">
						<span class="input-group-addon number" id="TF_PLACE_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">행사일정</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_CONTENTS" 
										class="onoffswitch-checkbox" id="TF_CONTENTS_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_CONTENTS') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_CONTENTS_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="작성버튼을 눌러주세요." readonly="readonly">
						<div class="input-group-btn">
							<button class="btn btn-primary" type="button" onclick="pf_writeContents('TF_CONTENTS');">
								<i class="fa fa-pencil"></i>
								작성
							</button>
						</div>
						<textarea name="TF_CONTENTS" id="TF_CONTENTS" style="display:none;">${resultData.TF_CONTENTS}</textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">시작시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_START_TIME" 
										class="onoffswitch-checkbox" id="TF_START_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_START_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_START_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TF_START_TIME" id="TF_START_TIME" class="hiddenTimeForm" data-hour="TF_START_HOUR" data-min="TF_START_MIN" value="${resultData.TF_START_TIME }">
							<c:if test="${not empty resultData.TF_START_TIME }">
								<c:set var="TF_START_HOUR" value="${fn:split(resultData.TF_START_TIME,':')[0] }"/>
								<c:set var="TF_START_MIN" value="${fn:split(resultData.TF_START_TIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control"  placeholder="입력하세요" 
												id="TF_START_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TF_START_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TF_START_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TF_START_MIN }">
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
		<label class="col-md-2 control-label">종료시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_END_TIME" 
										class="onoffswitch-checkbox" id="TF_END_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_END_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_END_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TF_END_TIME" id="TF_END_TIME" class="hiddenTimeForm" data-hour="TF_END_HOUR" data-min="TF_END_MIN" value="${resultData.TF_END_TIME }">
							<c:if test="${not empty resultData.TA_TIME }">
								<c:set var="TF_END_HOUR" value="${fn:split(resultData.TF_END_TIME,':')[0] }"/>
								<c:set var="TF_END_MIN" value="${fn:split(resultData.TF_END_TIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control"  placeholder="입력하세요" 
												id="TF_END_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TF_END_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TF_END_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TF_END_MIN }">
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
		<label class="col-md-2 control-label">주관/주최</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_JUGWAN" 
										class="onoffswitch-checkbox" id="TF_JUGWAN_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_JUGWAN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_JUGWAN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TF_JUGWAN" id="TF_JUGWAN" maxlength="50" onkeyup="pf_checkLength('TF_JUGWAN',50)"
								value="${resultData.TF_JUGWAN }">
						<span class="input-group-addon number" id="TF_JUGWAN_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">목적</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_PURPOSE" 
										class="onoffswitch-checkbox" id="TF_PURPOSE_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_PURPOSE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_PURPOSE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TF_PURPOSE" id="TF_PURPOSE" maxlength="500" onkeyup="pf_checkLength('TF_PURPOSE',500)" >${resultData.TF_PURPOSE }</textarea>
					</div>
					<p class="help-block length" id="TF_PURPOSE_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">주요 프로그램</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_PROGRAM" 
										class="onoffswitch-checkbox" id="TF_PROGRAM_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_PROGRAM') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_PROGRAM_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TF_PROGRAM" id="TF_PROGRAM" maxlength="500" onkeyup="pf_checkLength('TF_PROGRAM',500)" >${resultData.TF_PROGRAM }</textarea>
					</div>
					<p class="help-block length" id="TF_PROGRAM_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">야간 시작시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_NIGHT_STARTIME" 
										class="onoffswitch-checkbox" id="TF_NIGHT_STARTIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_NIGHT_STARTIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_NIGHT_STARTIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TF_NIGHT_STARTIME" id="TF_NIGHT_STARTIME" class="hiddenTimeForm" data-hour="TF_NIGHT_START_HOUR" data-min="TF_NIGHT_START_MIN" value="${resultData.TF_NIGHT_STARTIME }">
							<c:if test="${not empty resultData.TF_START_TIME }">
								<c:set var="TF_NIGHT_START_HOUR" value="${fn:split(resultData.TF_NIGHT_STARTIME,':')[0] }"/>
								<c:set var="TF_NIGHT_START_MIN" value="${fn:split(resultData.TF_NIGHT_STARTIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control"  placeholder="입력하세요" 
												id="TF_NIGHT_START_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TF_NIGHT_START_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TF_NIGHT_START_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TF_NIGHT_START_MIN }">
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
		<label class="col-md-2 control-label">야간 종료시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TF_NIGHT_ENDTIME" 
										class="onoffswitch-checkbox" id="TF_NIGHT_ENDTIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TF_NIGHT_ENDTIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TF_NIGHT_ENDTIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<div class="input-group" style="width: 100%;">
							<input type="hidden" name="TF_NIGHT_ENDTIME" id="TF_NIGHT_ENDTIME" class="hiddenTimeForm" data-hour="TF_NIGHT_END_HOUR" data-min="TF_NIGHT_END_MIN" value="${resultData.TF_NIGHT_ENDTIME }">
							<c:if test="${not empty resultData.TA_TIME }">
								<c:set var="TF_NIGHT_END_HOUR" value="${fn:split(resultData.TF_NIGHT_ENDTIME,':')[0] }"/>
								<c:set var="TF_NIGHT_END_MIN" value="${fn:split(resultData.TF_NIGHT_ENDTIME,':')[1] }"/>
							</c:if>
							
							<div class="row">
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="24" class="form-control" placeholder="입력하세요" 
												id="TF_NIGHT_END_HOUR" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TF_NIGHT_END_HOUR }">
										<span class="input-group-addon number">시간</span>
									</div>
								</div>
								<div class="col-sm-6 inputWidth50">
									<div class="input-group">
										<input type="number" min="0" max="59" class="form-control" placeholder="입력하세요" 
												id="TF_NIGHT_END_MIN" maxlength="2"
												onkeydown="return cf_onlyNumAndLimitLength(this,event)" 
												value="${TF_NIGHT_END_MIN }">
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
</fieldset>



<script>
$(function(){
	cf_setttingDialog('#TF_CONTENTS_contentsWrap','행사일정 작성');
})
</script>