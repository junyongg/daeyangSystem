<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<c:if test="${not empty imgList }">
	<div class="ga-sub-slide-w">
	    <div class="inner1200">
	        <button type="button" class="btn-s prev" onclick="pf_gallery_prevCK('slickPrev')"><img src="/resources/tour/img/icon/icon_de_s_arrow_prev.png" alt="슬라이드 이전 버튼"></button>
	        <button type="button" class="btn-s next" onclick="pf_gallery_prevCK('slickNext')"><img src="/resources/tour/img/icon/icon_de_s_arrow_next.png" alt="슬라이드 다음 버튼"></button>
	        <div class="slide-box">
	        	<c:forEach items="${imgList }" var="model">
		            <div class="one">
		                <a href="javascript:;">
		                    <img src="${model.FS_PATH }" alt="${model.FS_ORINM }">
		                </a>
		            </div>
	        	</c:forEach>
	        </div>
	    </div>
	</div>
</c:if>

<script>
var subGallerySlide;
$(function(){
	//답사 30 갤러리 슬라이드
	var $subGallery = $('.ga-sub-slide-w .slide-box');
	
	subGallerySlide = $('.ga-sub-slide-w .slide-box').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		arrows: false,
		speed:500,
		infinite:true,
		easing: 'easeInOutQuint'
	});
	
})

function pf_gallery_prevCK(type){
	subGallerySlide.slick(type);
}
</script>