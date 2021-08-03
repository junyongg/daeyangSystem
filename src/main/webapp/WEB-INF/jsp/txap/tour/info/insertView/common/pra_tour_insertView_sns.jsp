<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<fieldset>
	<legend>SNS</legend>		
	<div class="form-group">
		<label class="col-md-2 control-label">홈페이지 URL</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_HOME_URL" 
										class="onoffswitch-checkbox" id="TC_HOME_URL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_HOME_URL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_HOME_URL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control urlInputForm2" placeholder="http:// or https:// 로 시작되어야합니다." 
								name="TC_HOME_URL" id="TC_HOME_URL" maxlength="300" onkeyup="pf_checkLength('TC_HOME_URL',300)"
								value="${fn:trim(resultData.TC_HOME_URL)}">
						<span class="input-group-addon length" id="TC_HOME_URL_length">(0/300자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">블로그 URL</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_BLOG_URL" 
										class="onoffswitch-checkbox" id="TC_BLOG_URL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_BLOG_URL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_BLOG_URL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control urlInputForm2" placeholder="http:// or https:// 로 시작되어야합니다." 
								name="TC_BLOG_URL" id="TC_BLOG_URL" maxlength="300" onkeyup="pf_checkLength('TC_BLOG_URL',300)"
								value="${fn:trim(resultData.TC_BLOG_URL) }">
						<span class="input-group-addon length" id="TC_BLOG_URL_length">(0/300자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">SNS URL</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_SNS_URL" 
										class="onoffswitch-checkbox" id="TC_SNS_URL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_SNS_URL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_SNS_URL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control urlInputForm" placeholder="http:// or https:// 로 시작되어야합니다." 
								name="TC_SNS_URL" id="TC_SNS_URL" maxlength="300" onkeyup="pf_checkLength('TC_SNS_URL',300)"
								value="${fn:trim(resultData.TC_SNS_URL) }">
						<span class="input-group-addon length" id="TC_SNS_URL_length">(0/300자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">예약사이트 URL</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_RESERVATION_URL" 
										class="onoffswitch-checkbox" id="TC_RESERVATION_URL_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_RESERVATION_URL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_RESERVATION_URL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control urlInputForm" placeholder="http:// or https:// 로 시작되어야합니다." 
								name="TC_RESERVATION_URL" id="TC_RESERVATION_URL" maxlength="300" onkeyup="pf_checkLength('TC_RESERVATION_URL',300)"
								value="${fn:trim(resultData.TC_RESERVATION_URL) }">
						<span class="input-group-addon length" id="TC_RESERVATION_URL_length">(0/300자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</fieldset>
