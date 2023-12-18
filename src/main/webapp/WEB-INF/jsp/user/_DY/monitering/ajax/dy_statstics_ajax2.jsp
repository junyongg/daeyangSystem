<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>


<div class="pop_base_calculation header" style="top: 6%;">
				<button type="button" class="btn_close" title="닫기"  onclick="$('.base_pop_wrapper').removeClass('on')" style="position: sticky; top: 0px;"><i class="xi-close" style="margin: 10px;"></i></button>
	            <c:if test="${userInfo.isAdmin eq 'Y'}">
	            	<button type="button" class="a_box_line" style="border-radius:50%;float: left;padding: 10px 0px;color: white;background-color: #4caf50;position:sticky;top: 0px" onclick="Detail_Excel();">엑셀</button>
	            </c:if>
			</div>
            <div class="pop_base_calculation body" style="top: 51%;height: 85%;padding-top: 0px;">
                
                <div class="form_box">
				       <table class="tbl_normal fixed" style="width: auto;">
				           <colgroup>
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
					                    <td><fmt:formatNumber value="${result1.Daily_Generation/(ob.DPP_VOLUM/ob.DPP_INVER_COUNT)  }" pattern="0.00"/></td>
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
            
            
