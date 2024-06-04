<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf" %>

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

<main class="h-full overflow-y-auto ">
          <div class="container grid px-6 mx-auto">
            <div class="relative">
              <div
                class="w-full rounded-lg bg-indigo-200 text-center p-2 md:p-2 lg:p-4 text-sm md:text-sm lg:text-base md:text-base lg:text-lg font-bold my-4 md:md-4 lg:my-7">
                발전소 및 인허가 관련 정보 등록</div>
              <form:form id="Form" class="form-horizontal" name="Form"  action="" method="post"  enctype="multipart/form-data">
              <div class="w-full rounded-lg bg-white p-5 my-4 md:md-4 lg:my-7" style="text-align: center;">            	
				
					<div class="w3-right w3-margin">  
						<button class="w3-button w3-green w3-round-large" type="button" onclick="excelInsert();" >
							<i class="fa fa-plus"></i>엑셀 등록
						</button>
					</div>
					<div class="filebox w3-right w3-margin w3-quarter">
					 	<input class="upload-name" value="첨부파일" placeholder="첨부파일">
					 	<label for="excelFile">파일찾기</label> 
						<input type="file" id="excelFile" name="excelFile">
					</div>

                <select name="user" id="user" onchange="providerSelect(this.value)" class="w3-select w3-border" style="width:80%; text-align: center;">
                    <option value="0">신규등록</option>
                    <c:forEach items="${plantList }" var="b">
					<option value="${b.bd_plant_keyno }">${b.bd_plant_name }</option>
					</c:forEach>
                </select>
                
                  <div class="grid grid-cols-4 gap-y-2 gap-x-6 mt-4">
                    <div class="flex items-center flex-shrink-0">
                      <label for="id"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">발전소 명</label>
                      <input type="text" id="bd_plant_name" name="bd_plant_name"
                        class="w-full rounded-sm border_input_style input_padding_y_4px"/>
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="password"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">사업자 명</label>
                      <input type="text" id="bd_plant_owner" name="bd_plant_owner"
                        class="w-full rounded-sm border_input_style input_padding_y_4px"/>
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="auth_key"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">연락처</label>
                      <input type="text" id="bd_plant_phone" name="bd_plant_phone"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="classification"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">소재지</label>
                      <input type="text" id="bd_plant_add" name="bd_plant_add"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="business_registration_number"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">용량</label>
                      <input type="text" id="bd_plant_volum" name="bd_plant_volum"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="category"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">설치형태</label>
                      <input type="text" id="bd_plant_installtype" name="bd_plant_installtype"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                     <div class="flex items-center flex-shrink-0">
                      <label for="category"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">발전사업허가예정일</label>
                      <input type="text" id="bd_plant_BusDueDate" name="bd_plant_BusDueDate"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                     <div class="flex items-center flex-shrink-0">
                      <label for="category"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">발전사업허가일</label>
                      <input type="text" id="bd_plant_BusStart" name="bd_plant_BusStart"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="name"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">발전사업만료일</label>
                      <input type="text" id="bd_plant_BusEndDate" name="bd_plant_BusEndDate"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="classification"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">개발행위허가일</label>
                      <input type="text" id="bd_plant_DevStartDate" name="bd_plant_DevStartDate"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="tax_registration_id"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">개발행위만료일</label>
                      <input type="text" id="bd_plant_DevEndDate" name="bd_plant_DevEndDate"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="representative_name"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">PPA접수일</label>
                      <input type="text" id="bd_plant_PPADate" name="bd_plant_PPADate"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                    <div class="flex items-center flex-shrink-0">
                      <label for="department1"
                        class="text-xs w-28 font-semibold text-black rounded-sm mr-2.5 flex items-center">PPA접수용량</label>
                      <input type="text" id="bd_plant_PPAVolum" name="bd_plant_PPAVolum"
                        class="w-full rounded-sm border_input_style input_padding_y_4px" value="" />
                    </div>
                  </div>
                  <div class="w-full border my-3 md:my-3 lg:my-5"></div>
                  <div id ="buttondiv2" style="float : right;"></div>
                  <div id = "buttondiv1">
					  <input type="hidden" id="buttionType" name="buttionType" value="insert"> 
					  <input type="hidden" id="bd_plant_keyno" name="bd_plant_keyno" value=""> 
	                  <button type="button" id="ActionType" onclick="providerInsert();"
	                    class="text-sm md:text-sm lg:text-base font-bold inline-flex items-center px-4 py-2 md:px-4 md:py-2 lg:px-6 lg:py-3 border border-transparent rounded-lg text-white bg-button-blue">저장</button>
				  </div>
				</div>
              </form:form>
            </div>
          </div>
        </main>
<jsp:include page="/WEB-INF/jsp/user/_BD/license/JS/datePickerSetting.jsp" flush="true"></jsp:include> 
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript" src="/jsp/user/_BD/license/JS/datePickerSetting.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript">

$(function() {
	
	datePickerSetting();
	 $('#user').select2(); //검색 select
	
});

function providerSelect(value){
	if(value == "0"){
		clear();		
		$("#buttondiv2").empty();
		$("#ActionType").html('<i class="fa fa-floppy-o"></i> 저장')
		$("#buttionType").val("insert");
	}else{
		providerSelectmethod(value);
	}
}

function clear(){
	$("#bd_plant_name").val("")
	$("#bd_plant_owner").val("")
	$("#bd_plant_phone").val("")
	$("#bd_plant_add").val("")
	$("#bd_plant_volum").val("")
	$("#bd_plant_installtype").val("")
	$("#bd_plant_BusStart").val("")
	$("#bd_plant_BusEndDate").val("")
	$("#bd_plant_DevStartDate").val("")
	$("#bd_plant_DevEndDate").val("")
	$("#bd_plant_PPADate").val("")
	$("#bd_plant_PPAVolum").val("")
	$("#bd_plant_keyno").val("")
}

function providerSelectmethod(value){
	 $.ajax({
        url: '/bd/license/PlantSelectAjax.do?${_csrf.parameterName}=${_csrf.token}',
        type: 'POST',
        data: {
        	"bd_plant_keyno":value
        },
        async: false,  
        success: function(result) {
        	$("#bd_plant_name").val(result.bd_plant_name)
        	$("#bd_plant_owner").val(result.bd_plant_owner)
        	$("#bd_plant_phone").val(result.bd_plant_phone)
        	$("#bd_plant_add").val(result.bd_plant_add)
        	$("#bd_plant_volum").val(result.bd_plant_volum)
        	$("#bd_plant_installtype").val(result.bd_plant_installtype)
        	$("#bd_plant_BusStart").val(result.bd_plant_BusStart)
        	$("#bd_plant_BusEndDate").val(result.bd_plant_BusEndDate)
        	$("#bd_plant_DevStartDate").val(result.bd_plant_DevStartDate)
        	$("#bd_plant_DevEndDate").val(result.bd_plant_DevEndDate)
        	$("#bd_plant_PPADate").val(result.bd_plant_PPADate)
        	$("#bd_plant_PPAVolum").val(result.bd_plant_PPAVolum)
        	$("#bd_plant_keyno").val(result.bd_plant_keyno)
        	
        		
        	$("#buttondiv2").html('<button class="text-sm md:text-sm lg:text-base font-bold inline-flex items-center px-4 py-2 md:px-4 md:py-2 lg:px-6 lg:py-3 border border-transparent rounded-lg text-white bg-button-red" type="button" onclick="prodeleteInfo();"><i class="glyphicon glyphicon-trash"></i> 삭제</button>')
        	$("#ActionType").html('<i class="glyphicon glyphicon-refresh"></i> 수정')
        	$("#buttionType").val("update");
        	
        },
        error: function(){
        	alert("발전소 선택 에러");
        }
	}); 
}

function providerInsert(){
	 $.ajax({
        url: '/bd/license/PlantInsertAjax.do?${_csrf.parameterName}=${_csrf.token}',
        type: 'POST',
        data: $("#Form").serialize(),
        async: false,  
        success: function(result) {
        	alert(result);
        	location.reload();
        },
        error: function(){
        	alert("발전소 저장 에러(연구소에 문의바랍니다.)");
        }
	}); 
}

function prodeleteInfo(){
	
	if(confirm("현재 발전소를 삭제하시겠습니까?")){
		$.ajax({
			type: "POST",
			url: "/bd/license/PlantDeleteAjax.do?${_csrf.parameterName}=${_csrf.token}",
			async: false,
			data: $('#Form').serializeArray(),
			success : function(data){
				alert(data);
				location.reload();
			}, 
			error: function(){			
			}
		}); 	
	}else
		return false;
}


function excelInsert(){
	if($("#excelFile").val() == ''){
		alert("파일을 선택해 주세요");
	}else{
		alert("발전소 등록이 완료되었습니다");
		$("#Form").attr("action","/bd/license/insertExcel.do?${_csrf.parameterName}=${_csrf.token}");
		$("#Form").submit();
	}
}

function validationCheck(){
	if($("#hometaxbill_id").val() == ''){
		alert("아이디를 입력해주세요");
		return false
	}else if($("#spass").val() == ''){
		alert("패스워드를 입력해주세요");
		return false
	}else if($("#apikey").val() == ''){
		alert("인증키를 입력해주세요");
		return false
	}else if($("#ir_companynumber").val() == ''){
		alert("사업자등록번호를 입력해주세요");
		return false
	}else if($("#ir_biztype").val() == ''){
		alert("업태를 입력해주세요");
		return false
	}else if($("#ir_companyname").val() == ''){
		alert("상호를 입력해주세요");
		return false
	}else if($("#ir_ceoname").val() == ''){
		alert("대표자이름을 입력해주세요");
		return false
	}
	return true	
}



//----------------------------------인허가 관련 script---------------------------------------------------------


function providerSelect2(value){
	
	if(value == "0"){
		clear2();
		$("#buttondiv2-2").empty();
		$("#ActionType2").html('<i class="fa fa-floppy-o"></i> 저장')
		$("#buttionType2").val("insert");
	}else{
		providerSelectmethod2(value);
	}
}

function clear2(){
	$("#ie_companynumber").val("")
	$("#ie_biztype").val("")
	$("#ie_companyname").val("")
	$("#ie_bizclassification").val("")
	$("#ie_taxnumber").val("")
	$("#ie_ceoname").val("")
	$("#ie_busename1").val("")
	$("#ie_name1").val("")
	$("#ie_cell1").val("")
	$("#ie_email1").val("")
	$("#ie_busename2").val("")
	$("#ie_name2").val("")
	$("#ie_cell2").val("")
	$("#ie_email2").val("")
	$("#ie_companyaddress").val("")
}

function providerSelectmethod2(value){
	 $.ajax({
        url: '/sfa/bills/supliedSelectAjax.do?${_csrf.parameterName}=${_csrf.token}',
        type: 'POST',
        data: {
        	"dbs_keyno":value
        },
        async: false,  
        success: function(result) {
        	$("#dbs_keyno").val(result.dbs_keyno)
        	$("#ie_companynumber").val(result.dbs_co_num)
        	$("#ie_biztype").val(result.dbs_biztype)
        	$("#ie_companyname").val(result.dbs_name)
        	$("#ie_bizclassification").val(result.dbs_bizclassification)
        	$("#ie_taxnumber").val(result.dbs_taxnum)
        	$("#ie_ceoname").val(result.dbs_ceoname)
        	$("#ie_busename1").val(result.dbs_busename1)
        	$("#ie_name1").val(result.dbs_name1)
        	$("#ie_cell1").val(result.dbs_cell1)
        	$("#ie_email1").val(result.dbs_email1)
        	$("#ie_busename2").val(result.dbs_busename2)
        	$("#ie_name2").val(result.dbs_name2)
        	$("#ie_cell2").val(result.dbs_cell2)
        	$("#ie_email2").val(result.dbs_email2)
        	$("#ie_companyaddress").val(result.dbs_address)
        	
        
        	
        	$("#buttondiv2-2").html('<button class="text-sm md:text-sm lg:text-base font-bold inline-flex items-center px-4 py-2 md:px-4 md:py-2 lg:px-6 lg:py-3 border border-transparent rounded-lg text-white bg-button-blue" type="button" onclick="supdeleteInfo();" style="margin-right:10px;"><i class="glyphicon glyphicon-trash"></i> 삭제</button>')
        	$("#ActionType2").html('<i class="glyphicon glyphicon-refresh"></i> 수정')
        	$("#buttionType2").val("update");
        	
        },
        error: function(){
        	alert("공급자 선택 에러");
        }
	}); 
}

function providerInsert2(){
	 $.ajax({
        url: '/sfa/bills/billsActionAjax2.do?${_csrf.parameterName}=${_csrf.token}',
        type: 'POST',
        data: $("#Form2").serialize(),
        async: false,  
        success: function(result) {
        	alert(result);
        	location.reload();
        },
        error: function(){
        	alert("공급자 선택 에러");
        }
	}); 
}

function supdeleteInfo(){
	if(confirm("현재 공급받는자를 삭제하시겠습니까?")){
		$.ajax({
			type: "POST",
			url: '/sfa/bills/supdelete.do?${_csrf.parameterName}=${_csrf.token}',
			async: false,
			data: $('#Form2').serialize(),
			success : function(data){
				alert(data);
				location.reload();
			}, 
			error: function(){		
				alert("공급자 선택 에러");
			}
		}); 
	}else
		return false;
}


document.getElementById('select-search').addEventListener('input', function() {
    var filter = this.value.toUpperCase();
    var items = document.querySelectorAll('.select-items div');
    items.forEach(function(item) {
        if (item.textContent.toUpperCase().indexOf(filter) > -1) {
            item.style.display = '';
        } else {
            item.style.display = 'none';
        }
    });
    document.querySelector('.select-items').style.display = 'block';
});

document.querySelectorAll('.select-items div').forEach(function(item) {
    item.addEventListener('click', function() {
        document.getElementById('select-search').value = this.textContent;
        document.querySelector('.select-items').style.display = 'none';
    });
});

document.addEventListener('click', function(e) {
    if (!e.target.matches('#select-search')) {
        document.querySelector('.select-items').style.display = 'none';
    }
});
</script>