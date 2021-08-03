<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<style>

.smart-form .inline-group .checkbox, .smart-form .inline-group .radio {margin-right: 10px;}

.btn {margin-left:0;}

@media (min-width: 768px) {
	.input-group .inputWidth50:first-of-type {padding-right:0;}
	.input-group .inputWidth50:last-of-type {padding-left:1px;}
}

.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
    background-color: #fff;
    opacity: 1;
}

.input-group-addon.length,
.input-group-addon.number {min-width:95px;}
.imgWrap {overflow-x:auto;}
.imgBox, #imgMenuBox, #imgRoomBox {width: max-content;display: flex;}
.imgBox li,#imgMenuBox li, #imgRoomBox li {display: inline-block;position: relative;}
.imgBox li a,#imgMenuBox li a, #imgRoomBox li a {position: absolute;right: 10px;top: 0;}
.imgBox li a i,#imgMenuBox li a i, #imgRoomBox li a i {font-size: 20px;color: red;border: 1px solid;padding: 2px;background: rgba(255,255,255,0.5);}
.imgBox li img,#imgMenuBox li img, #imgRoomBox li img {height:200px;margin:0 10px;cursor: pointer;}

.map {position:relative; width:100%;height:400px;border:1px solid #eee;padding:5px;}
.map #moveMapBtnBox {position:absolute;right:5px;top:5px;z-index: 10 }

#viewImg {display:none;position: fixed;top:0;left:0;width:100%;height:100%;z-index: 1000000;background: rgba(0,0,0,0.7)}

#viewImg img {display: block;cursor: pointer;}

#simpleListBody tr.selected {background-color: #d9e7f1;}  



.input-group-addon.radioAddon {border-right: 1px solid #ccc;}
.input-group-addon.radioAddon + label {margin-left:10px;}

fieldset > legend > *,
#allFieldControll > * {cursor: pointer;}

#allFieldControll {border-bottom: none;padding-top: 0;line-height: 31px;padding-left: 4px;}

#courseList {width:100%;margin-top:10px;}
#courseList li {margin-top:10px;cursor: pointer;}

.customoverlay {    position: relative;
    bottom: 55px;
    border-radius: 6px;
    border: 0;
    box-shadow: 0px 1px 2px #888;
    float: left;}
    
.customoverlay a {
    display: block;
    text-decoration: none;
    color: #000;
    text-align: center;
    border-radius: 6px;
    font-size: 12px;
    font-weight: bold;
    overflow: hidden;
}

.customoverlay:after {
    content: '';
    position: absolute;
    margin-left: -12px;
    left: 50%;
    bottom: -12px;
    width: 22px;
    height: 12px;
    background: url(/resources/img/icon/marker/vertex_white.png);
}
.customoverlay span {display: inline-block;height: 25px;line-height: 25px;padding: 0 15px;}
.customoverlay .title {text-align: center;background: #fff;font-weight: bold;}
.customoverlay .number {color: #fff;background: #d95050;margin-left: -3px; }

.fixed-btns {position: fixed;bottom: 10px;right: 30px;z-index: 100;}

.fixed-btns > li {display: inline-block;margin-bottom: 7px;}

.six { width:60px; }

</style>


<section id="widget-grid" class="">
	<div class="row">
		<article class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
				data-widget-editbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i>
					</span>
					<h2>관광정보 리스트</h2>
				</header>
				<div class="widget-body" >
					<div class="widget-body-toolbar bg-color-white">
						<div class="alert alert-info no-margin fade in">
							<button type="button" class="close" data-dismiss="alert">×</button>
							* 카테고리를 선택 후 관광정보 등록 이나 수정/복사 버튼을 눌러주세요.
						</div> 
					</div>
					<div class="widget-body-toolbar bg-color-white smart-form">
						<div class="col-sm-4">
							<label class="label">카테고리</label>
							<label class="select">
								<select id="tourInfoCategory" onchange="pf_getTourInfoList()">
									<option value="">선택하여주세요.</option>
									<c:forEach items="${tourInfoList }" var="tourInfo">
									<option value="${tourInfo.SC_KEYNO }" ${tour.TC_TYPE eq tourInfo.SC_KEYNO ? 'selected':'' }>${tourInfo.SC_CODENM }</option>
									</c:forEach>
								</select> <i></i> 
							</label>
						</div>
						<div class="col col-sm-5">
							<label class="label">&nbsp;</label>
							<div class="input-group">  
								<input type="text" class="form-control" placeholder="검색어를 입력하세요." id="tourKeyWord"/>
							</div>
						</div>
						<div class="col col-sm-3 text-align-right pull-right">
							<label class="label">&nbsp;</label>
							<div class="btn-group">  
								<button class="btn btn-sm btn-primary" type="button" onclick="pf_newData()">
									<i class="fa fa-plus"></i> 관광정보 등록
								</button> 
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<table id="tourInfoListTable" class="pagingTable table table-striped table-bordered table-hover" width="100%">
						<thead>
							<tr>
								<th>카테고리</th>
								<th>이름</th>
								<th>설정</th>
							</tr>
						</thead>
						<tbody id="simpleListBody">
							
						</tbody>
					</table>
				</div>
			</div>
		</article>
		<article class="col-xs-12 col-sm-6 col-md-8 col-lg-8">
			<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1"
				data-widget-editbutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-table"></i>
					</span>
					<h2>관광정보 등록 및 수정</h2>
				</header>
				<div class="widget-body " >
					<div class="widget-body-toolbar bg-color-white">
						<div class="alert alert-info no-margin fade in">
							<button type="button" class="close" data-dismiss="alert">×</button>
							* 각 항목들에 있는 YES/NO 스위치는 해당 항목 노출 여부 입니다.
						</div> 
					</div>
					<div class="widget-body-toolbar bg-color-white smart-form">
						<div style="margin-top:20px;">
							<div class="pull-left">
								<legend id="allFieldControll">
									<span>모든필드</span>&nbsp;<i class="fa fa-plus" style="color:#3276b1"></i>
								</legend>
							</div>
							<div class="text-align-right pull-right">
								<div class="col-md-4" style="width: 200px; margin-right: 10px;">
									<select class="form-control" name="TOUR_TYPE" id="TOUR_TYPE" onchange="pf_settingForm(this.value,'insert')">
										<option value="">선택하세요</option>
										<c:forEach items="${tourInfoList}" var="model">
											<option value="${model.SC_KEYNO }"><c:out value="${model.SC_CODENM }"/></option>
										</c:forEach>
									</select>
								</div>
								<div class="btn-group">  
									<button class="btn btn-sm btn-primary" type="button" onclick="pf_save()">
										<i class="fa fa-save"></i> 저장
									</button>
									<button class="btn btn-sm btn-danger deleteBtn" type="button" style="margin-left:10px;display:none" onclick="pf_delete()">
										<i class="fa fa-trash-o"></i> 삭제
									</button> 
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<form:form id="Form" class="form-horizontal" name="Form" method="post" action="">
						<div id="inputFormBox">
						</div>
					</form:form>
				</div>
			</div>
		</article>
	</div>
</section>


<div id="viewImg">

</div>

<ul class="fixed-btns">
	<li>
		<a href="javascript:;" onclick="pf_save()" class="btn btn-primary btn-circle btn-lg" title="저장하기"><i class="fa fa-save"></i></a>
	</li>
	
	<li class="deleteBtn">
		<a href="javascript:;" onclick="pf_delete()" class="btn btn-danger btn-circle btn-lg" title="삭제하기"><i class="fa fa-trash-o"></i></a>
	</li>
	<li>
		<a href="javascript:;" onclick="pf_newData()" class="btn btn-success btn-circle btn-lg" title="새 글"><i class="glyphicon glyphicon-ok"></i></a>
	</li>
	<li>
		<a href="javascript:;" onclick="pf_moveTop()" class="btn btn-default btn-circle btn-lg" title="위로가기"><i class="fa fa-chevron-up"></i></a>
	</li>
</ul>



<div id="contentsWrap">
	<input type="hidden" id="textareaID" value="" />
	<textarea id="MVD_DATA" style="width:700px;height:600px;"></textarea>
	<div id="editorbox">
	  <div class="smart-form">
		<div class="input input-file col-md-10">
			<span class="button">
				<input type="file" id="smartimg" name="smartimg" class="txtDefault txtWlong_1" onchange="selectFiles(this,'smartimg');" multiple="multiple">파일선택
			</span>
			<input type="text" name="thumbnail_text" id="thumbnail_text" placeholder="이미지를 선택하여주세요.">
		</div>
		<div class="col-md-2 smart-form six">
		<button class="btn btn-sm btn-default"  type="button" id="imgsettingbutton" onclick="imgSetting();">적용</button>
		</div>
		<input type="hidden" id="selectedImg">
		<div id="smartimg_img">
		</div>
	  </div>
	</div>
</div>

</div>

<script type="text/javascript" src="/resources/api/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<!-- 이재령 임시키 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${sp:getString('DAUM_APPKEY')}&libraries=services"></script>
<script>
    
</script>

<script type="text/javascript">

var editor_object = [];

var formActionType = '';

var marker;
var map;


$(function(){
	
	pf_getTourInfoList();
	
	
	var tcKey = '${tour.TC_KEYNO}';

	if(tcKey){
		pf_settingForm($('#tourInfoCategory').val(),'update',tcKey)	
	}else{
		pf_settingForm($('#tourInfoCategory').val(),'insert');
	}
	
	cf_setttingDialog('#contentsWrap','상세내용 작성','확인','pf_getContents()');
	
	//모든 필드 열기/접기
	pf_setfolderAll();
	
	$( window ).scroll( function() {
		if ( $( this ).scrollTop() > 200 ) {
			$( '.fixed-btns' ).fadeIn();
		} else {
			$( '.fixed-btns' ).fadeOut();
		}
	} );
	
	$('#tourKeyWord').keyup(function(){
	      var value = $(this).val();
	      pf_tourSearch(value)
 	})
});

function pf_tourSearch(value){
	$('#simpleListBody tr').each(function(){
        var title = $(this).find('.title').text();
        if(title.indexOf(value) != -1){
           $(this).show();
        }else{
           $(this).hide();
        }
     })
}


function pf_getTourInfoList(){
	
	var category = $('#tourInfoCategory').val();
	$.ajax({
		type: "POST",
		url: "/txap/tour/info/listAjax.do",
		data: {
			"TC_TYPE" : category
		},
		async :false,
		success : function(data){
			$('#simpleListBody').html(data);
		},
		error: function(jqXHR, textStatus, errorThrown){
			cf_smallBox('ajax', '알수없는 에러 발생. 관리자한테 문의하세요.', 3000,'gray');
		}
   }).done(function(){
	   cf_loading_out();
   });
	
   pf_tourSearch($('#tourKeyWord').val())
}


function pf_newData(){
	var category = $('#tourInfoCategory').val();
// 	if(!category){
// 		cf_smallBox('에러', '카테고리를 선택하여주세요.', 3000,'gray');
// 		$('#tourInfoCategory').focus();
// 		return false;
// 	}
	
	pf_settingForm(category,'insert');
	
	
}

function pf_settingForm(category,formActionType,key,showMsg){
	
	key = key || '';
	
	showMsg = showMsg || 'Y';
	
	
	cf_loading();
	
	setTimeout(function(){
		$.ajax({
			type: "POST",
			url: "/txap/tour/info/insertView/formAjax.do",
			data: {
				"category" 			: 	category,
				"formActionType"	:	formActionType,
				"TC_KEYNO"			:	key
			},
			async :false,
			success : function(data){
				$('#TC_CONTENTS').parents('.ui-dialog').remove();
				$('#menuInfoDialog').parents('.ui-dialog').remove();
				$('#inputFormBox').html(data);
				$('tr.selected').removeClass('selected');
				
				if(formActionType == 'insert' || formActionType == 'copy'){
					$('#TC_TYPE').val(category);
					$('.deleteBtn').hide();
				}else{
					$('.deleteBtn').show();
					
					$('input.thisKey').each(function(){
						if($(this).val() == key){
							$(this).parents('tr').addClass('selected');
						}
					})
					
					
				}
				
				if(showMsg == 'Y'){
					var msg = '';
					if(formActionType == 'insert'){
						msg = '새로운 폼 정보를 불러왔습니다.';
					}else if(formActionType == 'update'){
						msg = '선택하신 관광정보를 불러왔습니다.';
					}else if(formActionType == 'copy'){
						msg = '선택하신 관광정보를 불러왔습니다.';
					}
					
					cf_smallBox('폼',msg, 3000);
				}
				
				
				
			},
			error: function(jqXHR, textStatus, errorThrown){
				cf_smallBox('ajax', '알수없는 에러 발생. 관리자한테 문의하세요.', 3000,'gray');
				cf_loading_out();
			}
	   }).done(function(){
		   cf_loading_out();
	   });
	},100)
	
	
}

function pf_checkLength(id,maxLength){
	var letterLength = $('#'+id).val().length;
	if(letterLength > maxLength){
		letterLength = maxLength;
	}
	var text = '(' + letterLength + '/' + maxLength +'자)'
		
	$('#'+id+"_length").text(text);
}

function pf_classcheckLength(obj,maxLength,type){
	var letterLength = $(obj).val().length;
	if(letterLength > maxLength){
		letterLength = maxLength;
	}
	var text = '(' + letterLength + '/' + maxLength +'자)'
	
	if(type == 'textarea'){
		$(obj).parent().next().text(text);
	}else{
		$(obj).next().text(text);	
	}
	
	
}


function pf_addImg(id,ext,maxSize){
	
	id = id || 'imgFile';
	
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
			
				var temp = '<li>';
				temp +=	'		<a href="javascript:;" onclick="pf_removeImg(this)">';
				temp +=	'			<i class="fa fa-times"></i>'; 
				temp +=	'		</a>';
				temp +=	'		<img src="'+evt.target.result+'" onclick="pf_viewImg(this)">';
				temp += '		<input type="hidden" name="IMG_ORDER" value="">';
				temp += '		<input type="hidden" name="newImgFile" value="Y">';
				temp += '		<input type="hidden" name="TIM_FILEINFO" value="'+evt.target.result+'">';
				temp += '		<input type="hidden" name="FS_ORINM" value="'+name+'">';
				temp +=	'	</li>';
				
				$('.imgBox').append(temp);
				pf_setImgIndex();
			});
			reader.readAsDataURL(f);
		}  
		
	}else{  
		cf_smallBox('이미지', '이미지 파일 형식이 잘못되었습니다.', 3000,'gray');
		
	}   
	
	$('#'+id).val('');
	
}

function pf_viewImg(obj){
	$('#viewImg').show('300');
	$('#viewImg').append($(obj).clone());
	
	var windowWidth = $(window).width();
	var windowHeight = $(window).height();
	var imgWidth = $('#viewImg img').width();
	
	if(windowWidth > imgWidth){
		$('#viewImg img').css({
			'margin':'0 auto'
		});
	}else{
		$('#viewImg img').css({
			'width'			:	'90%',
			'margin':'0 auto'
		});
	}
	
	var imgHeight = $('#viewImg img').height();
	if(windowHeight > imgHeight){
		$('#viewImg img').css({
			'position'	:'absolute',
			'top'		:'0',
			'bottom'	:'0',
			'left'		:'0',
			'right'		:'0',
			'margin'	:'auto'
		});
	}else{
		$('#viewImg img').css({
			'height'		:	windowHeight * 0.9 + 'px',
			'margin-top'	:	windowHeight * 0.05 + 'px'
		});
	}
	
	
	
	$('#viewImg img').on('click',function(){
		
		$('#viewImg').hide('300');	
		$('#viewImg img').remove();
	})
	
		
}

function pf_removeImg(obj){
	if(confirm('정말 삭제하시겠습니까?')){
		$(obj).parent().remove();	
		cf_smallBox('이미지', '이미지가 삭제되었습니다.', 3000,'#d24158');
	}
}

function pf_setImgIndex(){
	$('.imgBox > li').each(function(i){
		$(this).find('input[name=IMG_ORDER]').val(i+1);
	})
}

//주소 찾기
function pf_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress || data.jibunAddress; // 도로명 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('TC_POST').value = data.zonecode;
            document.getElementById("TC_ADDR").value = roadAddr;
           
        }
    }).open();
}


function pf_save(){
	if(!pf_checkForm()){
		return false;
	}
	
	pf_sendForm(formActionType);
	
	
	
}


function pf_sendForm(type){
	
	var url,msg;
	if(type == 'insert' || type == 'copy'){
		url = '/txap/tour/info/insertAjax.do';
		msg = '성공적으로 등록되었습니다.';
	}else if(type == 'update'){
		url = '/txap/tour/info/updateAjax.do';
		msg = '성공적으로 수정되었습니다.';
	}else if(type == 'delete'){
		url = '/txap/tour/info/deleteAjax.do';
		msg = '성공적으로 삭제되었습니다.';
	}else{
		return false;
	}
	cf_loading();
	setTimeout(function(){
		$.ajax({
			type: "POST",
			url: url,
			data: $('#Form').serializeArray(),
			async :false,
			success : function(data){
				pf_getTourInfoList();
				
				if(type == 'delete'){
					if(data){
						pf_initForm();					
						cf_smallBox('Form', msg, 3000);
					}else{
						cf_smallBox('Form', "메뉴에 등록된 관광정보는 삭제하실 수 없습니다.", 3000,'#d24158');
					}
				}else{
					pf_settingForm(data.TC_TYPE,'update',data.TC_KEYNO,'N')
					cf_smallBox('Form', msg, 3000);
				}
				
			},
			error: function(jqXHR, textStatus, errorThrown){
				cf_smallBox('ajax', '알수없는 에러 발생. 관리자한테 문의하세요.', 3000,'gray');
				cf_loading_out();
			}
	   }).done(function(){
		   cf_loading_out();
	   });
	},100)
}

/**
 * 입력폼 초기화
 */
function pf_initForm(){
	$('#TC_CONTENTS').parents('.ui-dialog').remove();
	$('#inputFormBox').html('');
	$('tr.selected').removeClass('selected');
	$('.deleteBtn').hide();
}

function pf_checkForm(){
	
	if(formActionType == 'insert'){
		if(!$('#TOUR_TYPE').val()){
			cf_smallBox('error', '관광구분을 선택해주세요.', 3000,'gray');
			$('#TOUR_TYPE').focus();
			return false;
		}else{
			$('#TC_TYPE').val($('#TOUR_TYPE').val());
		}
	}
	if(formActionType == 'update'){
		var menuCnt = Number($("#MENUYN").val());
		var use = $("input[name=TC_USE]:checked").val();
		if(menuCnt > 0 && use == 'N'){
			pf_setFocusAndAlert('input[name=TC_USE]:checked','메뉴에 등록되어있어서 미사용으로 변경하실 수 없습니다.');
			return false;
		}
	}
	
	if(!$('#TC_TITLE').val()){
		
		pf_setFocusAndAlert('#TC_TITLE','이름을 입력하여주세요.');
		return false;
	}
	if(!$('#TC_LAT').val()){
		pf_setFocusAndAlert('#TC_LAT', '위치값을 입력하여주세요.');
		return false;
	}
	if(!$('#TC_LNG').val()){
		pf_setFocusAndAlert('#TC_LNG', '위치값을 입력하여주세요.');
		return false;
	}
	
	var checkUrlInputForm = true;
	
	var urlRegex = /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?/;
	
	$('.urlInputForm').each(function(){
		if(checkUrlInputForm){
			//값이 있고 정규식에 실패하면 에러
			if($(this).val() && !urlRegex.test($(this).val())){
				pf_setFocusAndAlert(this,'url 형식이 올바르지 않습니다. url은 http:// or https:// 로 시작되어야됩니다.');
				checkUrlInputForm = false;
			}
		}
	})
	
	if(!checkUrlInputForm){
		return false;
	}
	
	if(typeof pf_getContents == 'function' ) {
		pf_getContents('TC_CONTENTS');
	}
	
	//시간폼 일괄 체크
	$('.hiddenTimeForm').each(function(){
		var id = $(this).attr('id');
		var hour = $('#'+$(this).data('hour')).val();
		var min = $('#'+$(this).data('min')).val();
		
		if(hour && !min){
			min = '00';
		}else if(!hour && min){
			hour = '00';
		} 
		
		if(hour && min){
			$('#'+id).val(hour + ':' + min);
		}
		
	})
	
	
	var category = $('#TC_TYPE').val();
	
	if(category == "${sp:getData('TOUR_DESTINATION')}"){
		
		if(!$('#TA_DIVISION').val()){
			pf_setFocusAndAlert('#TA_DIVISION', '관광명소 구분을 선택하여주세요.');
			return false;
		}
		
	}else if(category == "${sp:getData('TOUR_COURSE')}"){
		
		if($('#courseList li').length < 2){
			pf_setFocusAndAlert('#TCM_TYPE1', '경로가 등록되지 않았습니다. 코스를 두개이상 등록하여주세요.');
			return false;
		}
		
	}else if(category == "${sp:getData('TOUR_THEME')}"){
		
		if(!$('#TT_DIVISION').val()){
			pf_setFocusAndAlert('#TT_DIVISION', '테마 구분을 선택하여주세요.');
			return false;
		}
		if($('#TT_DIVISION').val() == 'SC_0000000397'){
			if(!$('#TT_CHE_DIVISION').val()){
				pf_setFocusAndAlert('#TT_CHE_DIVISION', '체험여행 구분을 선택하여주세요.');
				return false;
			}
		}
	}else if(category == "${sp:getData('TOUR_LODGMENT')}"){	
		
		if(!$('#TL_DIVISION').val()){
			pf_setFocusAndAlert('#TL_DIVISION', '숙박 구분을 선택하여주세요.');
			return false;
		}
	}else if(category == "${sp:getData('TOUR_RESTAURANT')}"){	
		var checkCk = false;
		$("input:checkbox[name='TR_DIVISION']").each(function(i){
			if($(this).is(":checked")){
				checkCk = true;
			}
		})
		
		if(!checkCk){
			pf_setFocusAndAlert('#TR_DIVISION', '식당 구분을 선택하여주세요.');
			return false;
		}
	}else if(category == "${sp:getData('TOUR_CULTURAL_HERITAGE')}"){	
		
		if(!$('#TCH_DIVISION').val()){
			pf_setFocusAndAlert('#TCH_DIVISION', '문화재 구분을 선택하여주세요.');
			return false;
		}
	}else if(category == "${sp:getData('TOUR_FESTIVAL')}"){	
		if(!$('#TF_DIVISION').val()){
			pf_setFocusAndAlert('#TF_DIVISION', '축제 구분을 선택하여주세요.');
			return false;
		}
	}
	


	
	
	return true;
}


/**
 * 포커스 하기전에 현재 폼이 숨겨져있는지 확인하여 숨겨져 있으면 show 처리
 */
function pf_setFocusAndAlert(obj,msg){
	
	cf_smallBox('Form', msg, 3000,'#d24158');
	
	$legend = $(obj).parents('fieldset').find('legend');
	$icon = $legend.find('i');
	if($icon.hasClass('fa-minus')){
		$icon.removeClass('fa-minus').addClass('fa-plus');
		$legend.siblings().show('100')
	}
	
	$(obj).focus();
	
}

function pf_deleteSimple(menuCnt,key){
	if(menuCnt > 0){
		cf_smallBox('Form', "메뉴에 등록된 관광정보는 삭제하실 수 없습니다.", 3000,'#d24158');
		return false;
	}
	
	cf_loading();
	setTimeout(function(){
		$.ajax({
			type: "POST",
			url: "/txap/tour/info/deleteAjax.do",
			data: {
					"TC_KEYNO":key,
					"MENUYN":menuCnt
				},
			async :false,
			success : function(data){
				pf_getTourInfoList();
				if(data){
					pf_initForm();					
					cf_smallBox('Form', "삭제되었습니다.", 3000);
				}else{
					cf_smallBox('Form', "메뉴에 등록된 관광정보는 삭제하실 수 없습니다.", 3000,'#d24158');
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				cf_smallBox('ajax', '알수없는 에러 발생. 관리자한테 문의하세요.', 3000,'gray');
				cf_loading_out();
			}
	   }).done(function(){
		   cf_loading_out();
	   });
	},100)
}

function pf_delete(){
	var menuCnt = Number($("#MENUYN").val());
	
	if(menuCnt > 0){
		cf_smallBox('Form', "메뉴에 등록된 관광정보는 삭제하실 수 없습니다.", 3000,'#d24158');
		return false;
	}
	
	if(confirm('정말 삭제하시겠습니까?')){
		pf_sendForm('delete');
	}
}

function pf_setfolder(){
	
	
	var temp = '&nbsp;<i class="fa fa-plus" style="color:#3276b1"></i>';
	
	$('fieldset > legend').each(function(){
		$(this).html('<span>'+$(this).html()+'</span>')
		$(this).append(temp);
	})
	
	$('fieldset > legend > span,fieldset > legend > i').on('click',function(){
		
		var tagName = $(this)[0].tagName.toLowerCase();
		
		var itag;
		
		if(tagName == 'span'){
			itag = $(this).next();
		}else if(tagName == 'i'){
			itag = $(this);
		}else{
			return;
		}
		
		if($(itag).hasClass('fa-plus')){
			$(itag).removeClass('fa-plus').addClass('fa-minus');
			$(itag).parent().siblings().hide('100')
		}else{
			$(itag).removeClass('fa-minus').addClass('fa-plus');
			$(itag).parent().siblings().show('100')
		}
	})
	
}

function pf_setfolderAll(){
	$('#allFieldControll > *').on('click',function(){
		
		var tagName = $(this)[0].tagName.toLowerCase();
		
		var itag;
		
		if(tagName == 'span'){
			itag = $(this).next();
		}else if(tagName == 'i'){
			itag = $(this);
		}else{
			return;
		}
		
		if($(itag).hasClass('fa-plus')){
			$(itag).removeClass('fa-plus').addClass('fa-minus');
			$('fieldset > legend > i').removeClass('fa-plus').addClass('fa-minus');
			$('fieldset > legend > i').parent().siblings().hide('100')
		}else{
			$(itag).removeClass('fa-minus').addClass('fa-plus');
			$('fieldset > legend > i').removeClass('fa-minus').addClass('fa-plus');
			$('fieldset > legend > i').parent().siblings().show('100')
		}
	})
	
	
}

function pf_moveTop(){
	$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
}


</script>