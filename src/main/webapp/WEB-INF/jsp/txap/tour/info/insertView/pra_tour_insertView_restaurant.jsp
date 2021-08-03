<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>






<input type="hidden" name="TR_KEYNO" id="TR_KEYNO" value="${resultData.TR_KEYNO }">

<fieldset>
	<legend>식당 정보</legend>
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 구분</label>
		<div class="col-md-10">
			<section class="smart-form">
				<div class="inline-group" id="TR_DIVISION">
					<c:forEach items="${restaurantTypeList }" var="restaurantType">
						<label class="checkbox" style="padding-top: 0; margin-top: 5px;">
							<input type="checkbox" name="TR_DIVISION" value="${restaurantType.SC_KEYNO }" onclick="pf_checkedConfirm();" class="valid" aria-invalid="false"  ${fn:contains(resultData.TR_DIVISION,restaurantType.SC_KEYNO) ? 'checked':'' }>
							<i></i><span>${restaurantType.SC_CODENM }</span> 
						</label>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>
	
	<%-- <div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 구분</label>
		<div class="col-md-10">
			<select class="form-control" name="TR_DIVISION" id="TR_DIVISION">
				<option value="">선택하세요.</option>
				<c:forEach items="${restaurantTypeList }" var="restaurantType">
				<option value="${restaurantType.SC_KEYNO }" ${resultData.TR_DIVISION eq restaurantType.SC_KEYNO ? 'selected':'' }>${restaurantType.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div> --%>
	
	<div class="form-group">
		<label class="col-md-2 control-label">영업 시작시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_START_TIME" 
										class="onoffswitch-checkbox" id="TR_START_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_START_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_START_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TR_START_TIME" id="TR_START_TIME" maxlength="50" onkeyup="pf_checkLength('TR_START_TIME',50)"
								value="${resultData.TR_START_TIME }">
						<span class="input-group-addon number" id="TR_START_TIME_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">영업 마감시간</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_END_TIME" 
										class="onoffswitch-checkbox" id="TR_END_TIME_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_END_TIME') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_END_TIME_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TR_END_TIME" id="TR_END_TIME" maxlength="50" onkeyup="pf_checkLength('TR_END_TIME',50)"
								value="${resultData.TR_END_TIME }">
						<span class="input-group-addon number" id="TR_END_TIME_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">영업자 성명</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_OWNER" 
										class="onoffswitch-checkbox" id="TR_OWNER_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_OWNER') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_OWNER_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TR_OWNER" id="TR_OWNER" maxlength="50" onkeyup="pf_checkLength('TR_OWNER',50)"
								value="${resultData.TR_OWNER }">
						<span class="input-group-addon number" id="TR_OWNER_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">대표메뉴</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_MAIN_MENU" 
										class="onoffswitch-checkbox" id="TR_MAIN_MENU_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_MAIN_MENU') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_MAIN_MENU_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TR_MAIN_MENU" id="TR_MAIN_MENU" maxlength="100" onkeyup="pf_checkLength('TR_MAIN_MENU',100)"
								value="${resultData.TR_MAIN_MENU }">
						<span class="input-group-addon number" id="TR_MAIN_MENU_length">(0/100자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">휴일</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_HOLIDAY" 
										class="onoffswitch-checkbox" id="TR_HOLIDAY_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_HOLIDAY') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_HOLIDAY_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="text" class="form-control" placeholder="입력하세요." 
								name="TR_HOLIDAY" id="TR_HOLIDAY" maxlength="50" onkeyup="pf_checkLength('TR_HOLIDAY',50)"
								value="${resultData.TR_HOLIDAY }">
						<span class="input-group-addon number" id="TR_HOLIDAY_length">(0/50자)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">구비시설</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_GUBI_SISEOL" 
										class="onoffswitch-checkbox" id="TR_GUBI_SISEOL_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_GUBI_SISEOL') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_GUBI_SISEOL_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TR_GUBI_SISEOL" id="TR_GUBI_SISEOL" maxlength="500" onkeyup="pf_checkLength('TR_GUBI_SISEOL',500)" >${resultData.TR_GUBI_SISEOL }</textarea>
					</div>
					<p class="help-block length" id="TR_PARKING_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">주차안내</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_PARKING" 
										class="onoffswitch-checkbox" id="TR_PARKING_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_PARKING') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_PARKING_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TR_PARKING" id="TR_PARKING" maxlength="500" onkeyup="pf_checkLength('TR_PARKING',500)" >${resultData.TR_PARKING }</textarea>
					</div>
					<p class="help-block length" id="TR_PARKING_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
</fieldset>

<fieldset class="restaurantFieldset_food">
	<legend>식당 추가정보</legend>
	
	<div class="form-group">
		<label class="col-md-2 control-label">음식분류</label>
		<div class="col-md-10">
			<select class="form-control" name="TR_FOOD_TYPE" id="TR_FOOD_TYPE">
				<option value="">선택하세요.</option>
				<c:forEach items="${foodTypeList }" var="foodType">
				<option value="${foodType.SC_KEYNO }" ${resultData.TR_FOOD_TYPE eq foodType.SC_KEYNO ? 'selected':'' }>${foodType.SC_CODENM }</option>
				</c:forEach>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label">룸 수</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_ROOM_CNT" 
										class="onoffswitch-checkbox" id="TR_ROOM_CNT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_ROOM_CNT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_ROOM_CNT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TR_ROOM_CNT" id="TR_ROOM_CNT" maxlength="10"
								value="${resultData.TR_ROOM_CNT }">
						<span class="input-group-addon number">단위(개)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">좌석 수</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_SEAT_CNT" 
										class="onoffswitch-checkbox" id="TR_SEAT_CNT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_SEAT_CNT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_SEAT_CNT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<input type="number" min="0" class="form-control" placeholder="입력하세요" 
								name="TR_SEAT_CNT" id="TR_SEAT_CNT" maxlength="10"
								value="${resultData.TR_SEAT_CNT }">
						<span class="input-group-addon number">단위(개)</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">포장가능 여부</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_PACKING_YN" 
										class="onoffswitch-checkbox" id="TR_PACKING_YN_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_PACKING_YN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_PACKING_YN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_PACKING_YN" value="Y" ${empty resultData || resultData.TR_PACKING_YN eq 'Y' ? 'checked="checked"':'' }>
							<span>가능</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_PACKING_YN" value="N" ${resultData.TR_PACKING_YN eq 'N' ? 'checked="checked"':'' }>
							<span>불가능</span> 
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">흡연석 여부</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_SMOKING_CNT" 
										class="onoffswitch-checkbox" id="TR_SMOKING_CNT_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_SMOKING_CNT') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_SMOKING_CNT_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_SMOKING_CNT" value="Y" ${empty resultData || resultData.TR_SMOKING_CNT eq 'Y' ? 'checked="checked"':'' }>
							<span>있음</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_SMOKING_CNT" value="N" ${resultData.TR_SMOKING_CNT eq 'N' ? 'checked="checked"':'' }>
							<span>없음</span> 
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">애완동물 출입여부</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_PETS_YN" 
										class="onoffswitch-checkbox" id="TR_PETS_YN_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_PETS_YN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_PETS_YN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_PETS_YN" value="Y" ${empty resultData || resultData.TR_PETS_YN eq 'Y' ? 'checked="checked"':'' }>
							<span>허용</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_PETS_YN" value="N" ${resultData.TR_PETS_YN eq 'N' ? 'checked="checked"':'' }>
							<span>금지</span> 
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">와이파이 여부</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_WIFI_YN" 
										class="onoffswitch-checkbox" id="TR_WIFI_YN_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_WIFI_YN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_WIFI_YN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_WIFI_YN" value="Y" ${empty resultData || resultData.TR_WIFI_YN eq 'Y' ? 'checked="checked"':'' }>
							<span>있음</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_WIFI_YN" value="N" ${resultData.TR_WIFI_YN eq 'N' ? 'checked="checked"':'' }>
							<span>없음</span>
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">유모차 출입여부</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon radioAddon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_STROLLER_YN" 
										class="onoffswitch-checkbox" id="TR_STROLLER_YN_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_STROLLER_YN') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_STROLLER_YN_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_STROLLER_YN" value="Y" ${empty resultData || resultData.TR_STROLLER_YN eq 'Y' ? 'checked="checked"':'' }>
							<span>가능</span> 
						</label>
						<label class="radio radio-inline">
							<input type="radio" class="radiobox" name="TR_STROLLER_YN" value="N" ${resultData.TR_STROLLER_YN eq 'N' ? 'checked="checked"':'' }>
							<span>불가능</span>
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label class="col-md-2 control-label">예약안내</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">
							<span class="onoffswitch">
								<input type="checkbox" name="TC_SHOW_COLUMN" value="TR_BOOKING" 
										class="onoffswitch-checkbox" id="TR_BOOKING_SHOW" 
										${empty resultData || fn:contains(resultData.TC_SHOW_COLUMN,'TR_BOOKING') ? 'checked="checked"':'' }>
								<label class="onoffswitch-label" for="TR_BOOKING_SHOW"> 
									<span class="onoffswitch-inner" data-swchon-text="YES" data-swchoff-text="NO"></span> 
									<span class="onoffswitch-switch"></span> 
								</label> 
							</span>
						</span>
						<textarea class="form-control" placeholder="입력하여주세요." rows="2" name="TR_BOOKING" id="TR_BOOKING" maxlength="500" onkeyup="pf_checkLength('TR_BOOKING',500)" >${resultData.TR_BOOKING }</textarea>
					</div>
					<p class="help-block length" id="TR_BOOKING_length">(0/500자)</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-2 control-label"><span class="nessSpan">*</span> 메뉴</label>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-10" style="margin-bottom: 15px;">
					<button class="btn btn-success" type="button" onclick="pf_addMenuInfo();"><i class="fa fa-plus"></i> 추가</button>
				</div>
			</div>
			<ul id="menuList">
				<c:if test="${not empty MenuList }">
					<c:forEach items="${MenuList }" var="model" varStatus="status">
						<li class="input-group">
							<span class="input-group-addon"><font class="menuIndex">${model.TM_ORDER }</font>.</span>
							<input class="form-control" name="viewTitle" value="${model.TM_NAME }" type="text" readonly="readonly">
							<div class="input-group-btn">
								<button class="btn btn-default" type="button" onclick="pf_openUpdateMenu(this)">
									수정
								</button>
								<button class="btn btn-default" type="button" onclick="pf_deleteMenu(this)">
									삭제
								</button>
							</div>
							<input type="hidden" name="TM_KEYNO" value="${model.TM_KEYNO }">
							<input type="hidden" name="TM_ORDER" value="${model.TM_ORDER }">
							<input type="hidden" name="TM_NAME" value="${model.TM_NAME }">
							<input type="hidden" name="TM_PRICE" value="${model.TM_PRICE }">
							<input type="hidden" name="TM_MAINYN" value="${model.TM_MAINYN }">
							<textarea name="TM_SUMMARY" style="display:none;">${model.TM_SUMMARY }</textarea>
							<ul class="menuImgList" style="display:none;">
								<c:forEach items="${imgMenuList }" var="img">
								 	<c:if test="${model.TM_KEYNO eq img.TIM_TM_KEYNO }">
									 	<li>
											<a href="javascript:;" onclick="pf_removeImg(this)">
												<i class="fa fa-times"></i>
											</a>
											<img src="${img.THUMBNAIL_PATH }" onclick="pf_viewImg(this)">
											<input type="hidden" name="sub_IMG_ORDER${model.TM_ORDER }" value="${img.TIM_ORDER }">
											<input type="hidden" name="sub_newImgFile${model.TM_ORDER }" value="N">
											<input type="hidden" name="sub_TIM_FILEINFO${model.TM_ORDER }" value="${img.TIM_FS_KEYNO }">
											<input type="hidden" name="sub_FS_ORINM${model.TM_ORDER }" value="${img.FS_ORINM }">
											<input type="hidden" name="sub_ImgType${model.TM_ORDER }" value="M">
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


<div id="menuInfoDialog">
	<div class="widget-body">
		<fieldset>
			<div class="form-horizontal">
				<fieldset>
					<div class="form-group">
						<label class="col-md-2 control-label">메뉴명</label>
						<div class="col-md-10">
							<div class="input-group">
								<input type="text" class="form-control" id="menuName" maxlength="50" onkeyup="pf_checkLength('menuName',50)" value="">
								<span class="input-group-addon length" id="menuName_length">(0/50자)</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">가격</label>
						<div class="col-md-10">
							<div class="input-group">
								<input type="number" class="form-control" id="menuPrice" maxlength="10" onkeydown="return cf_onlyNumAndLimitLength(this,event)"  value="">
								<span class="input-group-addon number">원</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">주메뉴여부</label>
						<div class="col-md-10">
							<div class="input-group">
								<div class="input-group">
									<label class="radio radio-inline">
										<input type="radio" class="radiobox" name="menuMainYN" value="Y">
										<span>YES</span> 
									</label>
									<label class="radio radio-inline">
										<input type="radio" class="radiobox" name="menuMainYN" value="N">
										<span>NO</span> 
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">메뉴설명</label>
						<div class="col-md-10">
							<textarea class="form-control" placeholder="입력하여주세요." rows="3" id="menuComment" maxlength="300" onkeyup="pf_checkLength('menuComment',300)" ></textarea>
							<p class="help-block length" id="menuComment_length">(0/300자)</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-2 control-label">메뉴 이미지</label>
						<div class="col-md-10">
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group">
										<input type="file" class="btn btn-default" id="imgMenuFile" onchange="pf_addMenuImg();">
									</div>
									<p class="help-block">
										( 10Mb / jpg,jpeg,png,gif )<br>
										첫번째 이미지를 썸네일 이미지로 사용합니다.
									</p>
									<div class="imgMenuWrap">
										<ul id="imgMenuBox">
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
var selectedMenuObj;

$(function(){
	
	pf_checkedConfirm()
	
	$( "#menuList" ).sortable({
		update: function(event, ui) {
			pf_setMenuIndex()
        }
	});
	
	$( "#imgMenuBox" ).sortable({
		update: function(event,ui){
			pf_setMenuImgIndex()
		}
	});
	
	pf_setttingMenuDialog();
})

function pf_setttingMenuDialog(obj,title,successText,successFnc,cancelText){
	var data = {
			autoOpen : false,
			width : 800,
			resizable : false,
			modal : true,
			title : '메뉴정보 수정',
			buttons : [{
				html : "<i class='fa fa-times'></i>&nbsp; 확인",
				"class" : "btn btn-primary",
				click : function() {
					pf_updateMenu();
				}
			}]
		}
	$('#menuInfoDialog').dialog(data);
}

function pf_checkedConfirm(){
	var checkCk = false;
	$('input:checkbox[name=TR_DIVISION]').each(function(i){
		if($(this).is(':checked') ){
			var id = cf_setKeyno($(this).val());
			if(id != '380'){
				checkCk = true;	
			}
		}
	})
	if(checkCk){
		$('.restaurantFieldset_food').show();
	}else{
		$('.restaurantFieldset_food').hide();
	}
}


function pf_addMenuInfo(){
	var name = "";
	
	name = '직접 입력';
	
	var param = {
			"name" : name
	}
	$('#menuList').append(pf_getMenuHtml(param))
	
	pf_setMenuIndex();
	cf_smallBox('식당', '메뉴가 추가되었습니다.', 3000);
}

function pf_getMenuHtml(param){
	
	return	  '<li class="input-group">'
			+ '	<span class="input-group-addon"><font class="menuIndex"></font>.</span>'
			+ '	<input class="form-control" name="viewTitle" value="'+param.name+'" type="text" readonly="readonly">'
			+ '	<div class="input-group-btn">'
			+ '		<button class="btn btn-default" type="button" onclick="pf_openUpdateMenu(this)">'
			+ '			수정'
			+ '		</button>'
			+ '		<button class="btn btn-default" type="button" onclick="pf_deleteMenu(this)">'
			+ '			삭제'
			+ '		</button>'
			+ '	</div>'
			+ ' <input type="hidden" name="TM_KEYNO" value="">'
			+ ' <input type="hidden" name="TM_ORDER" value="">'
			+ ' <input type="hidden" name="TM_NAME" value="'+param.name+'">'
			+ ' <input type="hidden" name="TM_PRICE" value="">'
			+ ' <input type="hidden" name="TM_MAINYN" value="">'
			+ ' <textarea name="TM_SUMMARY" style="display:none;"></textarea>'
			+ ' <div class="menuImgList" style="display:none;"></div>'
			+ '</li>';
}

function pf_updateMenu(){
	
	if(!$('#menuName').val()){
		cf_smallBox('Form', '메뉴명을 입력하여주세요.', 3000,'#d24158');
		$('#menuName').focus();
		return false;
	}
	
	if(!$('#menuPrice').val()){
		cf_smallBox('Form', '가격을 입력하여주세요.', 3000,'#d24158');
		$('#menuPrice').focus();
		return false;
	}
	
	var wrap = $(selectedMenuObj).parents('li.input-group');

	$(wrap).find('input[name=viewTitle]').val($('#menuName').val());
	$(wrap).find('input[name=TM_NAME]').val($('#menuName').val());
	$(wrap).find('input[name=TM_PRICE]').val($('#menuPrice').val());
	$(wrap).find('input[name=TM_MAINYN]').val($('input[name=menuMainYN]:checked').val());
	$(wrap).find('textarea[name=TM_SUMMARY]').val($('#menuComment').val());
	
	$(wrap).find('input[name=sub_IMG_ORDER]').val($(wrap).find('input[name=TM_ORDER]').val());
	$(wrap).find('.menuImgList').html($('#imgMenuBox').html());

	selectedMenuObj = '';
	$('#imgMenuBox').empty();

	$('input[name="menuMainYN"]').removeAttr('checked');
	$('#menuInfoDialog').dialog("close");
	cf_smallBox('식당','메뉴가 수정되었습니다.',3000);
	
	pf_setMenuIndex();
}

function pf_openUpdateMenu(obj){
	
	$('#menuInfoDialog').dialog('open');
	selectedMenuObj = obj;
	
	var wrap = $(obj).parents('li.input-group');
	
	$('#menuName').val($(wrap).find('input[name=TM_NAME]').val())
	$('#menuPrice').val($(wrap).find('input[name=TM_PRICE]').val())
	
	var checkVal = $(wrap).find('input[name=TM_MAINYN]').val();
	if(!checkVal){
	    $('input[name=menuMainYN][value=N]').prop("checked",true);
	}else{
	    $('input[name=menuMainYN][value='+checkVal+']').prop("checked",true);
	}
	
	$('#menuComment').val($(wrap).find('textarea[name=TM_SUMMARY]').val())
	
	$('#imgMenuBox').html($(wrap).find('.menuImgList').html())

	$('#menuInfoDialog .input-group-addon.length,#menuInfoDialog .help-block.length').each(function(){
		
		var id = $(this).attr('id').replace('_length','');
		
		var maxLength = $('#'+id).attr('maxlength');
		pf_checkLength(id,maxLength);
		
	})
	
}

function pf_deleteMenu(obj){
	$(obj).parents('li.input-group').remove();
	
	pf_setMenuIndex();
	cf_smallBox('식당','메뉴가 삭제되었습니다.',3000);
}

function pf_setMenuIndex(){
	$('#menuList > li').each(function(i){
		$(this).find('.menuIndex').text(i+1);
		$(this).find('input[name=TM_ORDER]').val(i+1);
		
		var MenuCnt = $(this).find('input[name=TM_ORDER]').val();
		$($(this).find('.menuImgList input[name^=sub_IMG_ORDER]')).attr("name","sub_IMG_ORDER"+MenuCnt);
		$($(this).find('.menuImgList input[name^=sub_newImgFile]')).attr("name","sub_newImgFile"+MenuCnt);
		$($(this).find('.menuImgList input[name^=sub_TIM_FILEINFO]')).attr("name","sub_TIM_FILEINFO"+MenuCnt);
		$($(this).find('.menuImgList input[name^=sub_FS_ORINM]')).attr("name","sub_FS_ORINM"+MenuCnt);
		$($(this).find('.menuImgList input[name^=sub_ImgType]')).attr("name","sub_ImgType"+MenuCnt);
		$($(this).find('.menuImgList input[name^=sub_TIM_FM_KEYNO]')).attr("name","sub_TIM_FM_KEYNO"+MenuCnt);
	})
}

function pf_setMenuImgIndex(){
	$('#imgMenuBox > li').each(function(i){
		$(this).find('input[name^=sub_IMG_ORDER]').val(i+1);
	})
}

function pf_removeMenuImg(obj){
	if(confirm('정말 삭제하시겠습니까?')){
		$(obj).parent().remove();	
		pf_setMenuImgIndex();
		cf_smallBox('이미지', '이미지가 삭제되었습니다.', 3000,'#d24158');
	}
}

function pf_addMenuImg(id,ext,maxSize){
	id = id || 'imgMenuFile';
	
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
				var fmKey = $("#imgMenuBox").find("input[name^=TIM_FM_KEYNO]").first().val();
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
				temp += '		<input type="hidden" name="sub_ImgType" value="M">';
				temp += '		<input type="hidden" name="sub_TIM_FM_KEYNO" value="'+fmKey+'">';
				temp +=	'	</li>';

				$('#imgMenuBox').append(temp);
				pf_setMenuImgIndex();
			});
			reader.readAsDataURL(f);
		}  
		
	}else{  
		cf_smallBox('이미지', '이미지 파일 형식이 잘못되었습니다.', 3000,'gray');
		
	}   
	
	$('#'+id).val('');
	
}
</script>
