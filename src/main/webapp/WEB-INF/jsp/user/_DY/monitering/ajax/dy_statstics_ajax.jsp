<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<input type="hidden" id="DaliyType" name="DaliyType" value="${not empty DaliyType? DaliyType:'1' }">
<input type="hidden" id="InverterType" name="InverterType" value="${not empty InverterType? InverterType:'0' }">
<input type="hidden" id="keyno" name="keyno" value="${ob.DDM_DPP_KEYNO }">

<div class="top_row">
   <article class="artBoard one">
       <h2 class="circle">종합</h2>

       <div class="all_static_b">
           <dl class="st_dl">
               <c:choose>
	              <c:when test="${DaliyType eq '1' }">
	               <dt>최저: ${mindata.Conn_date }</dt>
	              </c:when>
	              <c:otherwise>
	              	<dt>최저: ${fn:substring(mindata.DDM_DATE,0,11)} </dt>
	              </c:otherwise>
	           </c:choose>
               <dd>
                   <div class="table_wrapper auto">
                       <table class="tbl_normal auto">
                           <tbody>
                               <c:choose>
                               	<c:when test="${DaliyType eq '1' }">
                               		<tr>
	                                   <th class="txtL" style="width: 50%;">발전 출력</th>
	                                   <td class="txtR" style="width: 50%;"><b>${empty mindata.Active_Power ? 0 : mindata.Active_Power}</b>W</td>
	                               </tr>	
                               	</c:when>
                               	<c:otherwise>
           							<tr>
	                                   <th class="txtL" style="width: 50%;">발전량</th>
	                                   <td class="txtR" style="width: 50%;"><b><fmt:formatNumber value="${empty mindata.DDM_D_DATA ? 0 : mindata.DDM_D_DATA }" pattern="0.00"/></b>kWh</td>
	                                </tr> 
                               		<tr>
        	                           <th class="txtL" style="width: 50%;">발전시간</th>
    	                               <td class="txtR" style="width: 50%;"><b><fmt:formatNumber value="${mindata.DDM_D_DATA/ob.DPP_VOLUM }" pattern="0.00"/></b>h</td>
	                               </tr>
                               	</c:otherwise>
                               </c:choose>
                           </tbody>
                       </table>
                   </div>
               </dd>
           </dl>

           <dl class="st_dl">
             <c:choose>
              <c:when test="${DaliyType eq '1' }">
               <dt>최고: ${maxdata.Conn_date }</dt>
              </c:when>
              <c:otherwise>
              	<dt>최고: ${fn:substring(maxdata.DDM_DATE,0,11)}</dt>
              </c:otherwise>
             </c:choose>
               <dd>
                   <div class="table_wrapper auto">
                       <table class="tbl_normal auto">
                           <tbody>
                               <c:choose>
                               	<c:when test="${DaliyType eq '1' }">
	                          		<tr>
	                                   <th class="txtL" style="width: 50%;">발전 출력</th>
	                                   <td class="txtR" style="width: 50%;"><b>${empty maxdata.Active_Power? 0: maxdata.Active_Power}</b>W</td>
	                               </tr>	
                               	</c:when>
                               	<c:otherwise>
           							<tr>
	                                   <th class="txtL" style="width: 50%;">발전량</th>
	                                   <td class="txtR" style="width: 50%;"><b><fmt:formatNumber value="${empty maxdata.DDM_D_DATA ? 0: maxdata.DDM_D_DATA }" pattern="0.00"/></b>kWh</td>
	                                </tr> 
                               		<tr>
        	                           <th class="txtL" style="width: 50%;">발전시간</th>
    	                               <td class="txtR" style="width: 50%;"><b><fmt:formatNumber value="${maxdata.DDM_D_DATA/ob.DPP_VOLUM }" pattern="0.00"/></b>h</td>
	                               </tr>
                               	</c:otherwise>
                               </c:choose>
                           </tbody>
                       </table>
                   </div>
               </dd>
           </dl>
			
		   <c:choose>
           	<c:when test="${DaliyType eq '1' }">
	           <dl class="st_dl">
	               <dt>당일</dt>
	               <dd>
	<%--                    <p class="gb_txt"><fmt:formatNumber value="${ob.DDM_D_DATA }" pattern="0.00"/>KWh</p> --%>
	                   <div class="table_wrapper auto">
	                       <table class="tbl_normal auto">
	                           <tbody>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전량</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${empty ob.DDM_D_DATA ? 0 : ob.DDM_D_DATA }" pattern="0.00"/>KWh</td>
	                               </tr>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전시간</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${ob.DDM_D_DATA/ob.DPP_VOLUM }" pattern="0.00"/>h</td>
	                               </tr>
	                           </tbody>
	                       </table>
	                   </div>
	               </dd>
	           </dl>
	           
	           <dl class="st_dl">
	               <dt>누적</dt>
	               <dd>
	                   <div class="table_wrapper auto">
	                       <table class="tbl_normal auto">
	                           <tbody>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전량</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${empty ob.DDM_CUL_DATA ? 0 : ob.DDM_CUL_DATA}" pattern="0.00"/>KWh</td>
	                               </tr>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전시간</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${ob.DDM_CUL_DATA/ob.DPP_VOLUM }" pattern="0.00"/>h</td>
	                               </tr>
	                           </tbody>
	                       </table>
	                   </div>
	               </dd>
	           </dl>
	          </c:when>
	          <c:otherwise>
	          	 <dl class="st_dl">
	               <dt>평균</dt>
	               <dd>
	                   <div class="table_wrapper auto">
	                       <table class="tbl_normal auto">
	                           <tbody>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전량</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${avgdata.avgData }" pattern="0.00"/>KWh</td>
	                               </tr>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전시간</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${avgdata.avgData/ob.DPP_VOLUM  }" pattern="0.00"/>h</td>
	                               </tr>
	                           </tbody>
	                       </table>
	                   </div>
	               </dd>
		         </dl>
		           
		         <dl class="st_dl">
		            <dt>합계</dt>
	               <dd>
	                   <div class="table_wrapper auto">
	                       <table class="tbl_normal auto">
	                           <tbody>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전량</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${avgdata.sumData }" pattern="0.00"/>KWh</td>
	                               </tr>
	                               <tr>
	                                   <th class="txtL" style="width: 50%;">발전시간</th>
	                                   <td class="txtR" style="width: 50%;"><fmt:formatNumber value="${avgdata.sumData/ob.DPP_VOLUM  }" pattern="0.00"/>h</td>
	                               </tr>
	                           </tbody>
	                       </table>
	                   </div>
	               </dd>
		         </dl>
	          </c:otherwise>
	          </c:choose>
       </div>
   </article>

   <article class="artBoard one">
       <h2 class="circle">발전 출력 그래프</h2>

       <div class="con_h fix">
           <div class="line_graph_w">
               <div id="line_graph" style="height: 100%; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1634621548504"><div style="position: relative; width: 823px; height: 258px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="823" height="258" style="position: absolute; left: 0px; top: 0px; width: 823px; height: 258px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div class=""></div></div>
            </div>
        </div>
    </article>
</div>

<article class="artBoard bott_r">
    <h2 class="circle">통계분석</h2>

    <div class="statis_cate_box">
        <dl>
            <dt>조회범위</dt>
            <dd>
                <a href="javascript:;" onclick="select('1')" class="a_box_line active">인버터 합산</a>
                <a href="javascript:;" onclick="select('2')" class="a_box_line"  >인버터별</a>
                <select class="a_box_line" disabled id="selectInverter" onchange="inputInverterNum(this.value)">
                   	<c:forEach varStatus="status" begin="1" end="${ob.DPP_INVER_COUNT }">
                    	<option value="${status.count }" ${InverterType eq status.count?'selected':''} >인버터 ${status.count }호</option>
                    </c:forEach>
                </select>
            </dd>
        </dl>

        <dl>
            <dt>조회기간</dt>
            <dd>
               <a href="javascript:;" onclick="searchDate('99')" class="a_box_line">사용자설정</a>
               <a href="javascript:;" onclick="searchDate('0')" class="a_box_line">전일</a>
               <a href="javascript:;" onclick="searchDate('1')" class="a_box_line active">당일</a>
               <a href="javascript:;" onclick="searchDate('2')" class="a_box_line">1주일</a>
               <a href="javascript:;" onclick="searchDate('3')" class="a_box_line">1개월</a>
               <a href="javascript:;" onclick="searchDate('4')" class="a_box_line">1년</a>
           </dd>
       </dl>

       <dl>
           <dt>기간설정</dt>
           <dd>
               <input type="text" class="a_box_line" name="searchBeginDate" id="searchBeginDate" value="${searchBeginDate }">
               	~ 
               <input type="text" class="a_box_line" name="searchEndDate" id="searchEndDate" value="${searchEndDate }">
               <a href="javascript:;" class="search_a" onclick="searching()">검색</a>
           </dd>
       </dl>
   </div>

   <div class="table_wrapper md con_h n02">
       <table class="tbl_normal fixed">
           <colgroup>
               <col style="width: 10%;">
               <col style="width: 15%;">
               <col style="width: 20%;">
               <col style="width: 20%;">
               <col style="width: 15%;">
               <col style="width: 15%;">
            </colgroup>
            <thead>
                <tr>
                    <th>일시</th>
                    <th>이름</th>
                    <th>발전량(kWh)</th>
                    <th>누적발전량(KW)</th>
                    <th>발전시간(h)</th>
                    <th>현재 출력(W)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${result}" var="result">
	                <tr>
	                <c:choose>
	                	<c:when test="${DaliyType eq '1' }">
		                    <td>${result.Conn_date }</td>
		                    <td>${result.DI_NAME }</td>
		                    <td>${result.Daily_Generation }</td>
		                    <td>${result.Cumulative_Generation }</td>
		                    <td><fmt:formatNumber value="${result.Daily_Generation/(ob.DPP_VOLUM/ob.DPP_INVER_COUNT)  }" pattern="0.00"/></td>
		                    <td>${result.Active_Power }</td>
	                	</c:when>
	                	<c:otherwise>
	                		<td><fmt:formatDate value="${result.DDM_DATE }" pattern="yyyy-MM-dd"/></td>
		                    <td>${result.DPP_NAME }</td>
		                    <td><fmt:formatNumber value="${result.DDM_D_DATA }" pattern="0.00"/></td>
		                    <td><fmt:formatNumber value="${result.DDM_CUL_DATA }" pattern="0.00"/></td>
		                    <td><fmt:formatNumber value="${result.DDM_T_HOUR  }" pattern="0.00"/></td>
		                    <td>
									X
<%-- 		                     <fmt:formatNumber value="${result.DDM_ACTIVE_P }" pattern="0.00"/> --%>
		                    </td>
	                	</c:otherwise>
	                </c:choose>
	               </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

	
</article>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
$(function(){
	
	$("#searchBeginDate").datepicker({
		maxDate : 0,
		dateFormat: "yy-mm-dd"
	});
	$("#searchEndDate").datepicker({
		minDate : 0,
		dateFormat: "yy-mm-dd"
	});
	
	$('#searchBeginDate').on('change',function(){
		$('#searchEndDate').datepicker('option', 'minDate', $(this).val());
	});
	$('#searchEndDate').on('change',function(){
		$('#searchBeginDate').datepicker('option', 'maxDate', $(this).val());
	});
	
	
	searchDate("${DaliyType}")
	if("${InverterType}" == '0'){
		select('1')
	}else{
		select('2')
	}
	
	var aJsonArray = new Array();
	//당일 그래프 분기 처리
	if("${DaliyType}" == "1"){
		var list = new Array;
		
		var inverternum = "${InverterType}";
		<c:forEach begin="0" end="${fn:length(MainList)}" varStatus="status">
			var list_sub = new Array;
			<c:forEach items="${MainList[status.index]}" var="v">
				list_sub.push("${v}")
			</c:forEach>
			list.push(list_sub.reverse())
		</c:forEach>
		
		if(inverternum == '0'){
			for(var i=1;i<list.length-1;i++){
				var aJson = new Object();
				aJson.name = "인버터"+i+"호";
				aJson.type = "line";
				aJson.stack = "a"+i;
				aJson.data = list[i];
				
				aJsonArray.push(aJson);
			}
		}else{
			for(var i=1;i<list.length-1;i++){
				var aJson = new Object();
				aJson.name = "인버터"+inverternum+"호";
				aJson.type = "line";
				aJson.stack = "a"+i;
				aJson.data = list[i];
				
				aJsonArray.push(aJson);
			}
		}
		
		chartGraph1(list,aJsonArray);
	}else{
		
		var datelist = new Array();
		var datalist = new Array();
		var hourlist = new Array();
		<c:forEach items="${result}" var="result">
			datelist.push("${result.FORMATDATE}")
			var data = "${result.DDM_D_DATA}";
			datalist.push(parseFloat(data).toFixed(2))
			var hour = "${result.DDM_T_HOUR}";
			hourlist.push(parseFloat(hour).toFixed(2))
		</c:forEach>
		
		var aJson = new Object();
		aJson.name = "발전량";
		aJson.type = "line";
		aJson.stack = "a1";
		aJson.data = datalist;
		
		aJsonArray.push(aJson);
		
		var aJson2 = new Object();
		aJson2.name = "발전시간";
		aJson2.type = "line";
		aJson2.stack = "a2";
		aJson2.data = hourlist;
		
		
		aJsonArray.push(aJson2);
		
		chartGraph2(datelist,aJsonArray);
	}
})

function searchDate(value){
	$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(2) > dd > a").removeClass("active")
	if(value == '99'){
		$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(2) > dd > a:nth-child(1)").addClass("active")
	}else{
		$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(2) > dd > a:nth-child("+(parseInt(value)+2)+")").addClass("active")
	}
	
	
	$("#DaliyType").val(value)
	select("1")
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1; 
	var dd = date.getDate();
	
	var stdt = yyyy + "-" + pf_setTwoDigit(mm) + "-" + pf_setTwoDigit(dd);
	var endt = stdt;
	
	if(value == 1){ // 오늘
		
	}else if(value == 2){ //일주일
		stdt = pf_getNewDate('d',-7);
	}else if(value == 3){ //1개월
		stdt = pf_getNewDate('m',-1);
	}else if(value == 4){ //1년
		stdt = pf_getNewDate('y',-1);
	}else if(value == 0){ //전일
		stdt = pf_getNewDate('d',-1);
	}else{
		return false;
	}
	
	$('#searchBeginDate').val(stdt);
	$('#searchEndDate').val(endt);
	
	
	function pf_getNewDate(type,num){
		if(type == 'd'){
			date.setDate(date.getDate() + num);
		}else if(type == 'm'){
			date.setMonth(date.getMonth() + num);
		}else if(type == 'y'){
			date.setFullYear(date.getFullYear() + num);
		}
		
		yyyy = date.getFullYear();
		mm = date.getMonth()+1; 
		dd = date.getDate();
		
		return yyyy + "-" + pf_setTwoDigit(mm) + "-" + pf_setTwoDigit(dd);
	}
}

function pf_setTwoDigit(value){
	value = value + "";
	if( value.length == 1) {
		return value = '0' + value;
	}else{
		return value;
	}
}

function select(type){
	if(type == '2'){
		if($("#DaliyType").val() != '1'){
			alert("당일만 조회가 가능합니다.")
			return false
		}
		$("#InverterType").val("1")
		$("#selectInverter").attr("disabled",false)
	}else{
		$("#InverterType").val("0")
		$("#selectInverter").attr("disabled",true)
	}
	$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(1) > dd > a").removeClass("active");
	$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(1) > dd > a:nth-child("+(parseInt(type))+")").addClass("active");
	
}

function inputInverterNum(value){
	$("#InverterType").val(value)
}

function searching(){
	
	$.ajax({
        url: '/dy/moniter/stasticsAjax.do',
        type: 'POST',
        data: {
        	keyno : $("#keyno").val(),
        	InverterType : $("#InverterType").val(),
        	DaliyType : $("#DaliyType").val(),
        	searchBeginDate : $("#searchBeginDate").val(),
        	searchEndDate : $("#searchEndDate").val()
        },
        async: false,  
        success: function(result) {
        	$("#statics_ajax").html(result);
        },
        error: function(){
        	alert("에러 관리자에 문의해주세요.");
        }
	});
	
}


function chartGraph1(list,aJsonArray){
	
	var dom = document.getElementById("line_graph");
    var myChart = echarts.init(dom);
    var app = {};

    var option;


    option = {
        color: ['#F31614', '#38C146', '#3A37FF','#ffeb3b','#ff9800'],
        tooltip: {
            show: true,
        },
        legend: {
            show: true,
        },
        legend: {
            show: true,
        },
        grid: {
            top: '4%',
            left: '4%',
            right: '4%',
            bottom: '2%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: list[0]
        },
        yAxis: {
            type: 'value'
        },
        series: aJsonArray
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }
}

function chartGraph2(list,aJsonArray){
	
	var dom = document.getElementById("line_graph");
    var myChart = echarts.init(dom);
    var app = {};

    var option;


    option = {
        color: ['#F31614', '#38C146', '#3A37FF','#ffeb3b','#ff9800'],
        tooltip: {
            show: true,
        },
        legend: {
            show: true,
        },
        legend: {
            show: true,
        },
        grid: {
            top: '4%',
            left: '4%',
            right: '4%',
            bottom: '2%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: list
        },
        yAxis: {
            type: 'value'
        },
        series: aJsonArray
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }
}

</script>
