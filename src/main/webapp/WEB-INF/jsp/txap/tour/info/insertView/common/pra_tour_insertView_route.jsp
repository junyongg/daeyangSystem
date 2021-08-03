<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<fieldset>
	<legend>오시는 길</legend>	
	
	<div class="form-group">
		<label class="col-md-2 control-label">자가용</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_WAY_JAGA" 
										class="onoffswitch-checkbox" id="TC_WAY_JAGA_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_WAY_JAGA') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_WAY_JAGA_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TC_WAY_JAGA" id="TC_WAY_JAGA" maxlength="500" onkeyup="pf_checkLength('TC_WAY_JAGA',500)" >${resultData.TC_WAY_JAGA }</textarea>
					</div>
					<p class="help-block length" id="TC_WAY_JAGA_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">대중교통</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_WAY_PUBLIC" 
										class="onoffswitch-checkbox" id="TC_WAY_PUBLIC_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_WAY_PUBLIC') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_WAY_PUBLIC_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TC_WAY_PUBLIC" id="TC_WAY_PUBLIC" maxlength="500" onkeyup="pf_checkLength('TC_WAY_PUBLIC',500)" >${resultData.TC_WAY_PUBLIC }</textarea>
					</div>
					<p class="help-block length" id="TC_WAY_PUBLIC_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">교통안내</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TC_WAY_GUIDE" 
										class="onoffswitch-checkbox" id="TC_WAY_GUIDE_SHOW"
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TC_WAY_GUIDE') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TC_WAY_GUIDE_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TC_WAY_GUIDE" id="TC_WAY_GUIDE" maxlength="500" onkeyup="pf_checkLength('TC_WAY_GUIDE',500)" >${resultData.TC_WAY_GUIDE }</textarea>
					</div>
					<p class="help-block length" id="TC_WAY_GUIDE_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
</fieldset>
