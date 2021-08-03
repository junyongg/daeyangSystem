<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<div id="receipt_pop_box" tabindex="0">
	<div id="tour_confirm_bg_box"></div>
	<div class="pop-container popUp_Pic_box1">  
        
       <!-- 해더 -->
       <div class="top-header">
           <div class="logo-box">
               <img src="/resources/tour/img/logo/popUp_Img_top_logo.png" alt="로고">
           </div>
           <div class="txt-box">
               <p>${resultData.TC_TITLE}</p>
           </div>
           <a href="javascript:;" class="contents_pop_cbtn" onclick="tour_popOpen2()">
				<img src="/resources/img/calendar/close_btn.gif" alt="닫기">
			</a>
       </div>

       <!-- 사진 컨텐츠 -->
       <div class="pic-content">
			<button type="button" class="popSbtn prev" onclick="tour_prevCK2('slickPrev')"><span class="blind">슬라이드 이전 버튼</span></button>
            <button type="button" class="popSbtn next" onclick="tour_prevCK2('slickNext')"><span class="blind">슬라이드 다음 버튼</span></button>
            
            <div class="popSlide-pic"> <!-- 슬라이드 -->
				<c:forEach items="${imgList }" var="model">
					<div class="one"><!-- one -->
	                    <div class="img-b">
	                        <img src="${model.FS_PATH }" alt="${model.FS_ORINM }">
	                    </div>
	                   <%--  <div class="txt-b">
	                        <h4>${model.FS_ORINM }</h4>
	                    </div> --%>
	                </div><!-- oneEnd -->
				</c:forEach>

            </div>

        </div>
        
        <!-- 사진썸네일 -->
        <div class="pic-thumnail-box">

            <div class="thum-Arrow prev" onclick="tour_prevCK('slickPrev')">
                <button type="button"><i class="material-icons">keyboard_arrow_left</i></button>
            </div>
            <div class="thum-Arrow next" onclick="tour_prevCK('slickNext')">
                <button type="button"><i class="material-icons">keyboard_arrow_right</i></button>
            </div>

            <div class="popSlide-thum"> <!-- 슬라이드 -->
				<c:forEach items="${imgList }" var="model">
					<div class="one"><!-- one -->
	                    <a href="javascript:;">
	                        <span class="img-s" style="background-image:url('${model.FS_PATH}');"></span>
	                    </a>
	                </div><!-- oneEnd -->
				</c:forEach>
            </div>
        </div>
    </div>
</div>
<div id="pop_bg_opacity"></div>
