<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<div class="sub_in_info-box">
			<div class="inner1200">
				<div class="l-b">
					<ul>
						<c:if test="${not empty resultData.TC_CONTACT}">
						<li>
							<p class="sbj">
								<i class="material-icons">local_phone</i> 연락처
							</p>
							<p class="ans">${resultData.TC_DEPARTMENT }
								${resultData.TC_CONTACT }</p>
						</li>
						</c:if>
						<li>
							<p class="sbj">
								<i class="material-icons">location_on</i> 소재지
							</p>
							<p class="ans">${resultData.TC_POST } ${resultData.TC_ADDR }
								${resultData.TC_ADDR2 }</p>
						</li>
						
						 <c:if test="${not empty resultData.TC_HOME_URL || not empty resultData.TC_BLOG_URL }">
			             <c:set value="${(not empty resultData.TC_HOME_URL || (not empty resultData.TC_HOME_URL && not empty resultData.TC_BLOG_URL)) ? resultData.TC_HOME_URL : resultData.TC_BLOG_URL}" var="tourUrl"/>
			             <li>
			             	<p class="sbj">
								<i class="material-icons">message</i> ${(not empty resultData.TC_HOME_URL || (not empty resultData.TC_HOME_URL && not empty resultData.TC_BLOG_URL)) ? '홈페이지' : '블로그'}
							</p>
							<p class="ans">
								<a href="${tourUrl}" target="_blank">${tourUrl}</a>
							</p>
			             </li>
			             </c:if>
					</ul>
				</div>
		
				<div class="r-b">
					<button type="button" class="btn-export-1 two blue"
						onclick="tour_popOpen();">
						<span class="txt">사진 상세보기</span> <span class="icon plus"><i
							class="material-icons">add</i></span>
					</button>
				</div>
			</div>
		</div>
		