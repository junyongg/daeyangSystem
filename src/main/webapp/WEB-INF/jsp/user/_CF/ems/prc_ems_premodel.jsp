<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<!-- 안에 컨텐츠 시작 -->
	<section id="in-contents">
		
		<!-- 밑에 주요 컨텐츠 -->
		<div class="bottom-major">
			
			<!-- PV발전현황 -->
			<div class="pv-content1">

				<div class="row flex_row"> <!-- row -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">예측모델</p>
                                </div>
                                <div class="rb">
                                    <span class="blue forSpan">* 예측 오차 &nbsp;&nbsp;&nbsp;발전 : ± 2 kW</span>
                                </div>
							</div>

							<div class="graph-in-c">

								<table class="tbl_hori1 pdFore">
									<caption>예측모델</caption>
									<colgroup>
										<col width="35%">
										<col width="65%">
									</colgroup>
									<tbody>
										<tr>
											<th>금일발전예측량</th>
											<td><span class="fore">${today.EL_DATA} kW</span></td>
										</tr>
										<%-- <tr>
											<th>금일소비예측량</th>
											<td><span class="fore">${fn:substring(electronix[0].EL_DATA,0,6) } kW</span></td>
										</tr> --%>
										<tr>
											<th>전주 평균 발전량</th>
											<td><span class="fore">${empty preWeek.powers? '0': preWeek.powers } kW</span></td>
										</tr>
										<tr>
											<th>전주 평균 소비량</th>
											<td><span class="fore">${empty preWeek.usages? '0' : preWeek.usages } kW</span></td>
										</tr>
										<tr>
											<th>전년 동월 발전량</th>
											<td><span class="fore">${empty One_sum_M.powers? '0': One_sum_M.powers } kW</span></td>
										</tr>
										<tr>
											<th>전년 동월 소비량</th>
											<td><span class="fore">${empty One_sum_M.usages? '0': One_sum_M.usages  } kW</span></td>
										</tr>
									</tbody>
								</table>

							</div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->

					<div class="col-5"> <!-- col -->					
						<div class="one-b bgW"> <!-- one -->
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit">날씨정보 (광주광역시 북구 월출동)</p>
								</div>
							</div>

                            <div class="graph-in-c">
                                <div class="inner_weather_box">
                                    <div class="ro-b">
                                        <div class="lb">
                                            <h3>시간대별 날씨</h3>
                                        </div>
                                        <div class="rb" id="rb_box">
                                        </div>
                                    </div>
                                    <div class="ro-b">
                                        <div class="lb">
                                            <h3>주간날씨</h3>
                                        </div>
                                        <div class="rb">
                                            <div class="inner_weather_sub2_w">
                                                <c:forEach items="${resultDate }" var="date" varStatus="varStatus">
                                                	<c:choose>
                                                		<c:when test="${date.SKYAM eq '구름많음'}"><c:set var="srcAm" value="/resources/img/icon/icon_weather_cloud.jpg"/></c:when>
                                                		<c:when test="${date.SKYAM eq '흐림'}"><c:set var="srcAm" value="/resources/img/icon/icon_weather_cloud2.jpg"/></c:when>
                                                		<c:when test="${date.SKYAM eq '비'  or date.SKYAM eq '비/눈' or date.SKYAM eq '소나기' or date.SKYAM eq '빗방울'or date.SKYAM eq '빗방울/눈날림'}"><c:set var="srcAm" value="/resources/img/icon/icon_weather_rainy.jpg"/></c:when>
                                                		<c:when test="${date.SKYAM eq '눈' or date.SKYAM eq '눈날림' }"><c:set var="srcAm" value="/resources/img/icon/icon_weather_rainy.jpg"/></c:when>
                                                		<c:otherwise>
                                                			<c:set var="srcAm" value="/resources/img/icon/icon_weather_sun.jpg"/>
                                                		</c:otherwise>
                                                	</c:choose>
                                                	
                                                	<c:choose>
                                                		<c:when test="${date.SKYPM eq '구름많음'}"><c:set var="srcPm" value="/resources/img/icon/icon_weather_cloud.jpg"/></c:when>
                                                		<c:when test="${date.SKYPM eq '흐림'}"><c:set var="srcPm" value="/resources/img/icon/icon_weather_cloud2.jpg"/></c:when>
                                                		<c:when test="${date.SKYPM eq '비'  or date.SKYPM eq '비/눈' or date.SKYPM eq '소나기' or date.SKYPM eq '빗방울'or date.SKYPM eq '빗방울/눈날림'}"><c:set var="srcPm" value="/resources/img/icon/icon_weather_rainy.jpg"/></c:when>
                                                		<c:when test="${date.SKYPM eq '눈' or date.SKYPM eq '눈날림' }"><c:set var="srcPm" value="/resources/img/icon/icon_weather_rainy.jpg"/></c:when>
                                                		<c:otherwise>
                                                			<c:set var="srcPm" value="/resources/img/icon/icon_weather_sun.jpg"/>
                                                		</c:otherwise>
                                                	</c:choose>
                                                	
                                                	
                                                	
                                                	<div class="co-b">
	                                                    <div class="date">
	                                                        <span class="day">${fn:substring(date.NOWDATE,4,6) } /${fn:substring(date.NOWDATE,6,8) }</span>
	                                                        <span class="${varStatus.index eq '0' ? 'num on':'num'}">${varStatus.index eq '0' ? '오늘':''} </span>
	                                                    </div>
	                                                    <ul class="wea_ul">
	                                                        <li>
	                                                            <span class="icon">
	                                                            	<img src='${srcAm }' alt="날씨">
	                                                            </span>
	                                                            <span class="txt">${date.RAINRATEAM }%</span>
	                                                        </li>
	                                                        <li>
	                                                            <span class="icon"><img src='${srcPm }' alt="날씨"></span>
	                                                            <span class="txt">${date.RAINRATEPM }%</span>
	                                                        </li>
	                                                    </ul>
	                                                    <div class="degree">${date.TEMPERATUREMIN }º / ${date.TEMPERATUREMAX }º</div>
	                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div> <!-- oneEND -->
					</div> <!-- col END -->
					
				</div> <!-- row END -->




                <div class="row"> <!-- row -->

					<div class="col-100"> <!-- col -->				
						<div class="one-b bgW"> <!-- one -->
							
							<div class="graph-title-box">
								<div class="lb">
									<p class="tit pdT5">전력사용량</p>
                                </div>
                                
								<!-- <div class="rb">
                                    <ul class="graph-tab-ul2">
                                        <li><a href="javascript:;">표</a></li>
                                        <li class="active"><a href="javascript:;">그래프</a></li>
                                    </ul>
								</div> -->
							</div>


							<div class="graph-in-c">
                                <div class="cate-box1">
                                    <ul class="graph-cate">
                                        <li>
                                            <span class="squre" style="background-color:#00aeef"></span>
                                            <span class="txt">이번달</span>
                                        </li>
                                        <li>
                                            <span class="squre" style="background-color:#ff0000"></span>
                                            <span class="txt">지난달</span>
                                        </li>
                                        <li>
                                            <span class="squre" style="background-color:#f7941d"></span>
                                            <span class="txt">작년 이번달</span>
                                        </li>
                                    </ul>
                                    <!-- <ul class="graph-day-tab-ul">
                                        <li class="active"><a href="javascript:;">일</a></li>
                                        <li><a href="javascript:;">주</a></li>
                                        <li><a href="javascript:;">월</a></li>
                                        <li><a href="javascript:;">년</a></li>
                                    </ul> -->
                                </div>
								
								<div class="s2-wGraphicB n01">
									<div id="power_graph" style="width:100%; height:100%;"></div>
								</div>

							</div>

						</div> <!-- oneEND -->						
					</div> <!-- col END -->
					
				</div> <!-- row END -->



			</div>



		</div>
		<!-- 밑에 주요 컨텐츠 끝 -->
	

	</section>
	<!-- 안에 컨텐츠 끝 -->
	<script>
		var ToUsages = []
		var PoUsages = []
		var YUsages = []
	</script>
	<c:forEach items="${MonA}" var="sum">
		<script>
		ToUsages.push('${sum.usages}')
		</script>
	</c:forEach>
	<c:forEach items="${MonB}" var="sum">
		<script>
		PoUsages.push('${sum.usages}')
		</script>
	</c:forEach>
	<c:forEach items="${MonC}" var="sum">
		<script>
		YUsages.push('${sum.usages}')
		</script>
	</c:forEach>
	
	
	<script type="text/javascript">
	$("#gnb li:nth-child(3)").addClass('active');
	
	$.ajax({
	    type: "GET",
	    url: "/forest_ajax.do",
	    async: false,
	    success: function(data) {
	//     	console.log(data);    	
	         var html = ""
	       	var size = data.length/4;
	        html = '<div class="inner_weather_sub1_w">';
	        for(var i=0;i<size;i++){
	        	html += '<div class="co-b">'
	        		 + '<p class="num">'+data[i+(size*2)]+'º</p>'
	        		 +   '<div class="icon_b">';
	        	 if(data[i+(size*3)] == '0'){
		        	 if(data[i+size] == '3'){
		        		html +=		 '<img src="/resources/img/icon/icon_weather_cloud.jpg" alt="날씨">'	 ;
		        	 }else if(data[i+size]== '4'){
		        		 html +=		 '<img src="/resources/img/icon/icon_weather_cloud2.jpg" alt="날씨">';
		        	 }else{
		        		 var cu = parseInt(data[i].substring(0,2))
		        		 if(cu > 19 || cu < 06){
		        			 html +='<img src="/resources/img/icon/icon_weather_night.jpg" alt="밤 아이콘">'
		        		 }else{
			        		 html +='<img src="/resources/img/icon/icon_weather_sun.jpg" alt="맑음 아이콘">';
		        		 }
		        	 }
		         }else{
		        	 html +='<img src="/resources/img/icon/icon_weather_rainy.jpg" alt="날씨">';
		         } 
	        	 html +=  '</div>'
	    	          +   '<div class="txt';
	        	 	if(i == 0){
	        	 		html     += ' on';
	        	 	}
	        	 	html    += '">'+data[i].substring(0,2)+'시</div>'
	    	                + '</div>';
	        }
	     $("#rb_box").append(html);  
	    }
	});  


</script>