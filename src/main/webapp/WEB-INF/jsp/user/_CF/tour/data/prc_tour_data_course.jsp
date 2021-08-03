<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<style>
.txt.active{color: #005cc1; font-weight: 700;}
</style>

<%@ include file="common/script/prc_tour_data_course_scirpt.jsp"%>

 <c:if test="${url4 eq '/night2'}">
  <!-- 탭-평소 -->
  <div class="tab_normal_wrap">
      <ul class="tab_normal col-3">
          <c:forEach items="${courseMenuList }" var="model">
           <li class="${courseURL eq model.MN_URL ? 'active' : ''}"><a href="${model.MN_URL }">${model.MN_NAME }</a></li> 
          </c:forEach>
      </ul>
  </div>
 </c:if>
  <!-- 코스안내 박스 -->
 <div class="course-guide-box">
     <div class="title-box">
         <div class="icon-box">
         </div>
         <div class="text-box">
             <span class="vertical"></span>
             <span class="sbj">코스안내</span>
             <span class="line"><span class="totalDistance" style="display: initial;"></span></span>
         </div>
     </div>
     <div class="map-box">
     	 <div id="course_map" style="width:100%;height:508px;"></div>
     </div>
     
       <div class="list-course-w"> <!-- 코스버튼 -->
         <div class="list-gr"><!-- 그룹시작 -->
             <c:forEach items="${courseList }" var="model" varStatus="status">
	             <div class="name map-btn ${status.count eq '1' ? 'active' : '' }">
	                 <button type="button" onclick="pf_moveMap(this, ${model.TCS_LAT}, ${model.TCS_LNG })">
	                     <span class="cir">
	                     	<c:if test="${not status.first && not status.last }">
	                     		<span class="in"></span>
	                     	</c:if>
	                     </span> 
                     	<span class="txt ${status.first ? 'active':''}">
	                     ${model.TCS_LEVEL}.${model.TCS_TITLE }</span>
	                 </button>
	                 <c:if test="${not status.last }">
	                 	<c:choose>
	                 		<c:when test="${not empty model.TCS_TIME && not empty model.TCS_DISTANCE}">
	                 			<div class="km">${model.TCS_TIME}(<font class="distance">${model.TCS_DISTANCE }</font>)</div>
	                 		</c:when>
	                 		<c:when test="${empty model.TCS_TIME && not empty model.TCS_DISTANCE}">
	                 			<div class="km"><font class="distance">${model.TCS_DISTANCE }</font></div>
	                 		</c:when>
	                 		<c:when test="${not empty model.TCS_TIME && empty model.TCS_DISTANCE}">
	                 			<div class="km">${model.TCS_TIME}</div>
	                 		</c:when>
	                 	</c:choose>
	                 </c:if>
	             </div>
             </c:forEach>
         </div> <!-- 그룹끝 -->
      </div> <!-- 코스버튼 끝!! -->
     
 </div>

<c:if test="${not empty resultData.TC_CONTENTS}">
	 <!-- 코스안내 -->
	 <div class="course-in-title-box">
	     <h2>코스안내</h2>
	 </div>
	 <div class="course-in-white-box guide-box">
	     ${resultData.TC_CONTENTS}
	 </div>
</c:if>
 <!-- 코스별 관광지 -->
 <div class="course-in-title-box">
     <h2>코스별 관광지</h2>
 </div>
 <div class="course-in-white-box cour-tour">
	
	<c:if test="${not empty courseList }">
		<c:forEach items="${courseList }" var="model">
		     <div class="c-row"> <!--row-->
		         <div class="img-box">
		             <p class="num">${model.TCS_LEVEL }</p>
		             <span class="s-img" style="background-image:url(${model.FS_PATH })"></span>
		         </div>
		         <div class="letter-box">
		             <h3>${model.TCS_TITLE }</h3>
		             <h4>
		                ${empty model.TCS_COMMENT ? model.TC_SUMMARY : model.TCS_COMMENT}
		             </h4>
		             
		             <c:if test="${not empty model.MN_URL }">
			             <div class="btn-box">
			                 <button type="button" class="btn-dt" onclick="pf_detailPage('${model.MN_URL}');">
			                     <span class="txt">관광지 자세히 보기</span>
			                 </button>
			             </div>
		             </c:if>
		             
		         </div>
		     </div> <!--row END-->
		</c:forEach>
	</c:if>
	<c:if test="${empty courseList }">
		등록된 코스 정보가 없습니다.
	</c:if>
 </div>
 
