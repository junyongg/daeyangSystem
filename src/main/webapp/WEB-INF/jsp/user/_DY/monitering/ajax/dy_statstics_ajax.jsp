<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<style>
table{
	width: auto;
}

.pop_base_calculation {	
	white-space: nowrap;
	top: 50%; left: calc(13% - 231px);
	width: 98%;
}
.calculation2 {	
	white-space: nowrap;
	top: 50%; left: calc(50% - 231px);
	width: 530px;
}
@media screen and (max-width: 500px) {
	.pop_base_calculation {left:5%;width:90%;height: 85%;}
	.pop_base_calculation.header { top: 43% !important;}
	.pop_base_calculation.body { top: 53% !important;}
}

</style>

<input type="hidden" id="DaliyType" name="DaliyType" value="${not empty DaliyType? DaliyType:'1' }">
<input type="hidden" id="InverterType" name="InverterType" value="${not empty InverterType? InverterType:'0' }">
<%-- <input type="hidden" id="keyno" name="keyno" value="${ob.DDM_DPP_KEYNO }"> --%>

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
    <h2 class="circle" style="float: left;">통계분석</h2>
    <a id="more" href="javascript:;" style="padding: 0px 0px 0px 10px;font-size: 15px;margin-top: 7px;float: left;" onclick="moreTable();">상세보기</a>
    <a id="more" href="javascript:;" style="padding: 0px 0px 0px 10px;font-size: 15px;margin-top: 7px;float: left;" onclick="moreErrorTable();">에러확인</a>
<!--     <button type="button" class="a_box_line" style="color: white;background-color: #0088F1; margin-right: 10px;margin-top: -3px; float: right; ">상세보기</button> -->
	<button type="button" 
			class="a_box_line" 
			onclick="pf_excel('/dy/moniter/stasticsAjax.do?excel=excel&keyno=${ob.DPP_KEYNO}')"
			style="float: right;margin-right: 10px;margin-top: -3px; background-color: #4caf50; color: white;">
		엑셀
	</button>
    <div class="statis_cate_box">
        <dl>
            <dt>조회범위</dt>
            <dd>
                <a href="javascript:;" onclick="select('1')" class="a_box_line active">인버터 합산</a>
                <a href="javascript:;" onclick="select('2')" class="hidselec a_box_line"  >인버터별</a>
                <select class="hidselec a_box_line" disabled id="selectInverter" onchange="inputInverterNum(this.value)">
                		<option value="0">인버터 전체</option>
                   	<c:forEach varStatus="status" begin="1" end="${ob.DPP_INVER_COUNT }">
                    	<option value="${status.count }" ${InverterType eq status.count?'selected':''} >인버터 ${status.count }</option>
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
               <input type="text" class="a_box_line" name="searchBeginDate" id="searchBeginDate" value="${searchBeginDate }" onchange="searchDate(99)">
               	~ 
               <input type="text" class="a_box_line" name="searchEndDate" id="searchEndDate" value="${searchEndDate }" onchange="searchDate(99)">
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
                    <th>누적발전량(KWh)</th>
                    <th>발전시간(h)</th>
                    <th>현재 출력(KW)</th>
                    <%-- <c:if test="${DaliyType eq '1' }">
	                    <th>현재 전압(V)</th>
	                    <th>현재 전류(A)</th>
                    </c:if> --%>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${result}" var="result">
	                <tr>
	                <c:choose>
	                	<c:when test="${DaliyType eq '1' }">
		                    <td>${result.Conn_date }</td>
		                    <td>${fn:substring(result.DI_NAME,0,5)}</td>
		                    <td><fmt:formatNumber value="${result.daily }" pattern="0.0"/></td>
		                    <td>${result.Cumulative_Generation }</td>
		                    <td><fmt:formatNumber value="${result.daily/(ob.DPP_VOLUM/ob.DPP_INVER_COUNT)  }" pattern="0.00"/></td>
		                    <td>${result.Active_Power }</td>
	                	</c:when>
	                	<c:when test="${DaliyType eq '4' }">
	                		<td>${result.ddtt }</td>
		                    <td>${result.DPP_NAME }</td>
		                    <td><fmt:formatNumber value="${result.sdata }" pattern="0.00"/></td>
		                    <td><fmt:formatNumber value="${result.DDM_CUL_DATA }" pattern="0.00"/></td>
		                    <td><fmt:formatNumber value="${result.thour }" pattern="0.00"/></td>
		                    <td>
									X
<%-- 		                     <fmt:formatNumber value="${result.DDM_ACTIVE_P }" pattern="0.00"/> --%>
		                    </td>
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



	<section class="base_pop_wrapper">
			<div class="pop_base_calculation header" style="top: 6%;">
				<button type="button" class="btn_close" title="닫기"  onclick="$('.base_pop_wrapper').removeClass('on')" style="position: sticky; top: 0px;"><i class="xi-close" style="margin: 10px;"></i></button>
	            <button type="button" class="a_box_line" style="border-radius:50%;float: left;padding: 10px 0px;color: white;background-color: #4caf50;position:sticky;top: 0px" onclick="Detail_Excel();">엑셀</button>
			</div>
            <div class="pop_base_calculation body" style="top: 51%;height: 85%;padding-top: 0px;">
                
                <div class="form_box">
				       <table class="tbl_normal fixed" style="width: auto;">
				           <colgroup>
				               <!-- <col style="width: 10%;">
				               <col style="width: 15%;">
				               <col style="width: 20%;">
				               <col style="width: 20%;">
				               <col style="width: 15%;">
				               <col style="width: 15%;"> -->
				            </colgroup>
				            <thead>
				                <tr>
				                    <th>일시</th>
				                    <th>시간</th>
				                    <th>발전소</th>
				                    <th>이름</th>
				                    <th>발전량(kWh)</th>
				                    <th>누적발전량(KWh)</th>
				                    <th>발전시간(h)</th>
				                    <th>현재 출력(KW)</th>
				                    <th>Vpv1</th>
						            <th>Ipv1</th>
						            <th>Vpv2</th>
						            <th>Ipv2</th>
						            <th>Vpv3</th>
						            <th>Ipv3</th>
						            <th>Vpv4</th>
						            <th>Ipv4</th>
						            <th>Vpv5</th>
						            <th>Ipv5</th>
						            <th>Vpv6</th>
						            <th>Ipv6</th>
						            <th>Vpv7</th>
						            <th>Ipv7</th>
						            <th>Vpv8</th>
						            <th>Ipv8</th>
						            <th>Vpv9</th>
						            <th>Ipv9</th>
						            <th>Vpv10</th>
						            <th>Ipv10</th>
	
						            <th>Istr1</th>
						            <th>Istr2</th>
						            <th>Istr3</th>
						            <th>Istr4</th>
						            <th>Istr5</th>
						            <th>Istr6</th>
						            <th>Istr7</th>
						            <th>Istr8</th>
						            <th>Istr9</th>
						            <th>Istr10</th>
						            <th>Istr11</th>
						            <th>Istr12</th>
						            <th>Istr13</th>
						            <th>Istr14</th>
						            <th>Istr15</th>
						            <th>Istr16</th>
						            <th>Istr17</th>
						            <th>Istr18</th>
						            <th>Istr19</th>
						            <th>Istr20</th>

						            <th>Voltage_Of_Phase_A to B</th>
						            <th>Voltage_Of_Phase_B to C</th>
						            <th>Voltage_Of_Phase_C to A</th>
						            <th>Phase Voltage of phase A</th>
						            <th>Phase Voltage of phase B</th>
						            <th>Phase Voltage of phase C</th>
						            <th>Current of phase A</th>
						            <th>Current of phase B</th>
						            <th>Current of phase C</th>
						            <th>Internal Temperature</th>
				                </tr>
				            </thead>
				            <tbody>
				                <c:forEach items="${result1}" var="result1">
					                <tr>
					                    <td>${fn:substring(result1.Conn_date,0,11)}</td>
					                    <td>${fn:substring(result1.Conn_date,11,16)}</td>
					                    <td>${ob.DPP_NAME }</td>
					                    <td>${fn:substring(result1.DI_NAME,0,5)}</td>
					                    <td>${result1.Daily_Generation }</td>
					                    <td>${result1.Cumulative_Generation }</td>
					                    <td><fmt:formatNumber value="${result1.daily/(ob.DPP_VOLUM/ob.DPP_INVER_COUNT)  }" pattern="0.00"/></td>
					                    <td>${result1.Active_Power }</td>
					                    <td>${result1.Vpv1}</td>
							            <td>${result1.Ipv1}</td>
							            <td>${result1.Vpv2}</td>
							            <td>${result1.Ipv2}</td>
							            <td>${result1.Vpv3}</td>
							            <td>${result1.Ipv3}</td>
							            <td>${result1.Vpv4}</td>
							            <td>${result1.Ipv4}</td>
							            <td>${result1.Vpv5}</td>
							            <td>${result1.Ipv5}</td>
							            <td>${result1.Vpv6}</td>
							            <td>${result1.Ipv6}</td>
							            <td>${result1.Vpv7}</td>
							            <td>${result1.Ipv7}</td>
							            <td>${result1.Vpv8}</td>
							            <td>${result1.Ipv8}</td>
							            <td>${result1.Vpv9}</td>
							            <td>${result1.Ipv9}</td>
							            <td>${result1.Vpv10}</td>
							            <td>${result1.Ipv10}</td>
							            <td>${result1.Istr1}</td>
							            <td>${result1.Istr2}</td>
							            <td>${result1.Istr3}</td>
							            <td>${result1.Istr4}</td>
							            <td>${result1.Istr5}</td>
							            <td>${result1.Istr6}</td>
							            <td>${result1.Istr7}</td>
							            <td>${result1.Istr8}</td>
							            <td>${result1.Istr9}</td>
							            <td>${result1.Istr10}</td>
							            <td>${result1.Istr11}</td>
							            <td>${result1.Istr12}</td>
							            <td>${result1.Istr13}</td>
							            <td>${result1.Istr14}</td>
							            <td>${result1.Istr15}</td>
							            <td>${result1.Istr16}</td>
							            <td>${result1.Istr17}</td>
							            <td>${result1.Istr18}</td>
							            <td>${result1.Istr19}</td>
							            <td>${result1.Istr20}</td>
							            <td>${result1.voltage_of_phase_A_to_B}</td>
							            <td>${result1.voltage_of_phase_B_to_C}</td>
							            <td>${result1.voltage_of_phase_C_to_A}</td>
							            <td>${result1.Phase_voltage_of_phase_A}</td>
							            <td>${result1.Phase_voltage_of_phase_B}</td>
							            <td>${result1.Phase_voltage_of_phase_C}</td>
							            <td>${result1.Current_of_phase_A}</td>
							            <td>${result1.Current_of_phase_B}</td>
							            <td>${result1.Current_of_phase_C}</td>
							            <td>${result1.Internal_temperature}</td>
					               </tr>
				                </c:forEach>
				            </tbody>
				        </table>
                </div>

            </div>
        </section>
        
	<section class="base_pop_wrapper2">
	
			<div class="pop_base_calculation calculation2 header" style="top: 6%;">
				<button type="button" class="btn_close fixed" title="닫기"  onclick="$('.base_pop_wrapper2').removeClass('on')"><i class="xi-close" style="margin: 10px;"></i></button>
	            <button type="button" class="a_box_line fixed" style="border-radius:50%;float: left;padding: 10px 0px;color: white;background-color: #4caf50;" onclick="Detail_Error_Excel();">엑셀</button>
			</div>
            <div class="pop_base_calculation calculation2 body" style="top: 51%;height: 85%;padding-top: 0px;">	
            <!-- <div class="pop_base_calculation" style="top: 50%; width: 900px; left: calc(38% - 231px);" > -->

                <div class="form_box">
				       <table class="tbl_normal fixed" style="width: auto;">
				           <colgroup>
				               <col style="width: 15%;">
				               <col style="width: 20%;">
				               <col style="width: 20%;">
				               <col style="width: 15%;">
				               <col style="width: 15%;">
				            </colgroup>
				            <thead>
				                <tr>
				                    <th>일시</th>
				                    <th>시간</th>
				                    <th>발전소</th>
				                    <th>이름</th>
				                    <th>에러내용</th>
				                </tr>
				            </thead>
				            <tbody>
				                <c:forEach items="${errorlist}" var="errorlist">
					                <tr>
					                    <td>${fn:substring(errorlist.DIE_DATE,0,11)}</td>
					                    <td>${fn:substring(errorlist.DIE_DATE,11,16)}</td>
					                    <td>${ob.DPP_NAME }</td>
					                    <td>${fn:substring(errorlist.DIE_INVERTER_NAME,0,5)}</td>
					                    <td>${errorlist.DIE_DSP_ERROR }</td>
					               </tr>
				                </c:forEach>
				            </tbody>
				        </table>
                </div>

            </div>
        </section>
	
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

		$("#more").show();
		
		var list = new Array;
		
		var inverternum = "${InverterType}";
		<c:forEach begin="0" end="${fn:length(MainList)}" varStatus="status">
			var list_sub = new Array;
			<c:forEach items="${MainList[status.index]}" var="v">
				list_sub.push("${v}")
			</c:forEach>
// 			list.push(list_sub.reverse())
			list.push(list_sub)
		</c:forEach>
			console.log(list)
		
		if(inverternum == '0'){
			for(var i=1;i<list.length-1;i++){
				var aJson = new Object();
				aJson.name = "인버터"+i+"호";
				aJson.type = "line";
				aJson.showSymbol = false;
				aJson.stack = "a"+i;
				aJson.data = list[i]
				
				
				aJsonArray.push(aJson);
			}
		}else{
			for(var i=1;i<list.length-1;i++){
				var aJson = new Object();
				aJson.name = "인버터"+inverternum+"호";
				aJson.type = "line";
				aJson.showSymbol = false;
				aJson.stack = "a"+i;
				aJson.data = list[i];
				
				aJsonArray.push(aJson);
			}
		}
		
		chartGraph1(list,aJsonArray);
		
		
	}else{
		$("#more").show();
		
		var datelist = new Array();
		var datalist = new Array();
		var hourlist = new Array();
		
		// 통계분석 1년 탭
		if("${DaliyType}" == "4"){
		<c:forEach items="${result}" var="result">
			datelist.push("${result.ddtt}")
			var data = "${result.sdata}";
			datalist.push(parseFloat(data).toFixed(2))
			var hour = "${result.thour}";
			hourlist.push(parseFloat(hour).toFixed(2))
		</c:forEach>
		}else{
			<c:forEach items="${result}" var="result">
			datelist.push("${result.FORMATDATE}")
			var data = "${result.DDM_D_DATA}";
			datalist.push(parseFloat(data).toFixed(2))
			var hour = "${result.DDM_T_HOUR}";
			hourlist.push(parseFloat(hour).toFixed(2))
		</c:forEach>
		}
		
		var aJson = new Object();
		aJson.name = "발전량";
		aJson.type = "line";
		aJson.showSymbol = false;
		aJson.stack = "a1";
// 		aJson.data = datalist;
		aJson.data = datalist.reverse();
		aJsonArray.push(aJson);


		
		var aJson2 = new Object();
		aJson2.name = "발전시간";
		aJson2.type = "line";
		aJson2.showSymbol = false;
		aJson2.stack = "a2";
// 		aJson2.data = hourlist;
		aJson2.data = hourlist.reverse();
		aJsonArray.push(aJson2);

		
// 		chartGraph2(datelist,aJsonArray);
		chartGraph2(datelist.reverse(),aJsonArray);
	}
		console.log(aJson)
})

function searchDate(value){
	$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(2) > dd > a").removeClass("active")
	
	if(value == '99'){
		$(".hidselec").attr('style', 'visibility:hidden');
		$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(2) > dd > a:nth-child(1)").addClass("active")
	}else if(value == '1'){
		$(".hidselec").removeAttr('style', 'visibility:hidden');
		$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(2) > dd > a:nth-child("+(parseInt(value)+2)+")").addClass("active")
	}else{ 
		$(".hidselec").attr('style', 'visibility:hidden');
		$("#statics_ajax > article > div.statis_cate_box > dl:nth-child(2) > dd > a:nth-child("+(parseInt(value)+2)+")").addClass("active")
	}
	
	
	$("#DaliyType").val(value) //데일리타입에 searchDate
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
		/* if($("#DaliyType").val() != '1'){
			alert("당일만 조회가 가능합니다.")
			return false
		} */
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
        	keyno : $("#n_keyno").val(),
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
            trigger: 'axis'
        },
        legend: {
            show: false,
        },
        legend: {
            show: true,
        },
        grid: {
            top: '4%',
            left: '4%',
            right: '4%',
            bottom: '2%',
            containLabel: true,
           
        },
        
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: list[0]
        },
        yAxis: {
            type: 'value'
            
        },
        series : aJsonArray

        
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
            trigger: 'axis'
        },
        legend: {
            show: false,
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

function moreTable(){
	$('.base_pop_wrapper').addClass('on')
}

function moreErrorTable(){
	$('.base_pop_wrapper2').addClass('on')
}

function Detail_Excel(){
	pf_excel('/dy/moniter/stasticsAjax.do?excel=excel&keyno=${ob.DPP_KEYNO}');
}
function Detail_Error_Excel(){
	pf_excel('/dy/moniter/stasticsAjax.do?excel=error&keyno=${ob.DPP_KEYNO}');
}
</script>
