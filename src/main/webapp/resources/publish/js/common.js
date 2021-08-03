// JavaScript Document

$(document).ready(function(){
	
	//와우 애니메이션 설정
	new WOW().init();
	
	
	//본문바로가기
	
	$('.skip').on({
		focus:function(){
			$(this).css("width","auto")
		},blur:function(){
			$(this).css("width","0px")
		}
	});
	
		
	// 스트롤 탑 버튼
	$('.footerScrollUp').on('click',function(){
        $('html, body').stop().animate({scrollTop : 0},700)
	});
	
	
	//메인 SNS 버튼
	$('.snsIconBox').hide();
	$('.closeBtnBox').hide();
	
	$('.mainSnsSlideWrap .nameBox').on('click',function(){
		$('.mainSnsSlideWrap').animate({top: '90px'});
		$('.snsIconBox').slideDown();
		$('.closeBtnBox').show();
	});
	
	$('.mainSnsSlideWrap .closeBtnBox').on('click',function(){
		$('.mainSnsSlideWrap').animate({top: '122px'});
		$('.snsIconBox').slideUp('fast');
		$('.closeBtnBox').hide();
	});
	
	
	//마우스 다운 버튼
	/*
	var iconMousePositionT = $('.mouseIconWrap').position().top;
	alert (iconMousePositionT);
	
	$('.mouseIconWrap .iconWrap').on('click',function(){
		$('html, body').stop().animate({scrollTop : iconMousePositionT + "px"},700)
	});
	*/
	
	
		
	
	// *****슬라이드******
	
	//메인슬라이드
	var mainSlider = $('#bxslider1').bxSlider({
	  auto: true,
	  autoControls: true,
	  speed: 800,
	  pause: 5000,
	  adaptiveHeight: true,
	  controls : false,
	  pager: true, 
	  pagerType : 'full', 
	  infiniteLoop : true,
	  pagerCustom: '#mainSliderPager',
	});
		
	//메인슬라이더 버튼
	$('.mainSlidePrevBtn').on('click',function(){
		mainSlider.goToPrevSlide();
	})
	$('.mainSlideNextBtn').on('click',function(){
		mainSlider.goToNextSlide();
	})
	
	//메인슬라이더 모바일 배너 버튼
	$('.mobileSlideBtnPrev').on('click',function(){
		mainSlider.goToPrevSlide();
	})
	
	$('.mobileSlideBtnPause').on('click',function(){
		mainSlider.stopAuto();
	})	
	
	$('.mobileSlideBtnNext').on('click',function(){
		mainSlider.goToNextSlide();
	})
	
	
	//메인 배너 슬라이드	
	var mainBannerSlider = $('#bxslider2').bxSlider({
	  auto: true,
	  autoControls: false,
	  controls:false,
	  speed: 5000,
	  pause: 5000,
	  adaptiveHeight: true,
	  pager : false,
	  minSlides:5,
	  maxSlides:5,
	  moveSlides : 0,
	  slideWidth:360,
	});
	//메인 배너 버튼
	$('.mainBannerBtnPrev').on('click',function(){
		mainBannerSlider.goToPrevSlide();
	})
	$('.mainBannerBtnNext').on('click',function(){
		mainBannerSlider.goToNextSlide();
	})
	
	
	//탑 배너
	$bannerHeight = $('.bannerImgBox').outerHeight();
	$('.oneCloseBox label').on('click',function(){
		$('.bannerImgBox').slideUp();
		$('.mobileMainMenuWrap').css('top',138-$bannerHeight+'px');
		$('.headTopWrap').css('border-top','none');
		
	});
	
	
	//탑 배너 슬라이드
	
	var topBannerSlide = $('#topBanner').bxSlider({
	  mode : 'vertical',
	  auto: true,
	  autoControls: true,
	  speed: 1500,
	  pause: 5000,
	  adaptiveHeight: true,
	  controls : false,
	  pagerCustom: '#bx-pager',
	});
	//탑 배너 버튼
	$('.bannerTopBtnPrev button').on('click',function(){
		topBannerSlide.goToPrevSlide();
	})
	$('.bannerTopBtnNext button').on('click',function(){
		topBannerSlide.goToNextSlide();
	})
	
	
	
	
	// 메인메뉴
	$mainMenu = $('.mainMenuUl > li')
	$mainSubMenu = $('.mainSubMenuUl')
	$subMenuBg = $('.bgSubMenuWrap_01')
	$mainSubMenu_subMenuBg = $('.mainSubMenuUl,.bgSubMenuWrap_01')
	$mainMenu_subMenuBg = $('.mainMenuUl,.bgSubMenuWrap_01')
	
	$mainSubMenu_subMenuBg.hide();
	
	
	$mainMenu_subMenuBg.on('mouseover',function(){
		$mainSubMenu_subMenuBg.stop().slideDown();
	});
	
	$mainMenu_subMenuBg.on('mouseleave',function(){
		$mainSubMenu_subMenuBg.stop().slideUp();
	});
	
	
	$mainMenu.on('mouseover',function(){
		$(this).addClass('active');
	});
	
	$mainMenu.on('mouseleave',function(){
		$(this).removeClass('active');
	});	
		
	
	
	
	//모바일 서브 메뉴
	$('.headerMobileMain .menuIcon button').on('click',function(){		
		$('.mobileMainMenuWrap').show();		
	});
	
	//모바일 서브 메뉴
	$('.mobileMaMenu > li').on('click',function(){		
		$('.mobileSubMenu',this).slideToggle();		
	});
	
	//모바일 서브 닫기버튼
	$('.mobileMenuInnerWrap .closeBtn').on('click',function(){		
		$('.mobileMainMenuWrap').hide();		
	});
		
	//메인 모바일 컨텐츠
	$('.mobileMainContent_01 .contentBox').hide();
	$('.mobileMainContent_01 .title_01 > a').on('click',function(){
		$('+ .contentBox',this).slideToggle();	
		$(this).toggleClass('active');
	});
	
	//메인 모바일 관련사이트
	$('.footerSiteMobileWrap .titleBox > a').on('click',function(){
		$('.footerSiteMobileWrap .contentBox').slideToggle();
		$(this).toggleClass('active');
	});	
	
	
	// 탭 지정
	tabFucNomal('.mainNoticeTab li','.mainNoticeTabCon');
		
	//메인 모바일 공지사항 탭 슬라이드	
	if(window.matchMedia('(max-width: 920px)').matches){  //($(window).width() < 850)
		var mobileNoticeSlide = $('#mobileNoticeTab').bxSlider({
		  auto: false,
		  autoControls: false,
		  speed: 1000,
		  pause: 4000,
		  adaptiveHeight: false,
		  pager:false,
		});	
		
		//메인 모바일 공지사항 탭 지정
		tabFucNomaMobile('.mainNoticeTab li','.mainNoticeTabCon');
		
	}
	//메인 모바일 공지사항 탭 슬라이드 버튼
	$('.btnNoticeSlideMobilePrev').on('click',function(){
		mobileNoticeSlide.goToPrevSlide();
	})
	$('.btnNoticeSlideMobileNext').on('click',function(){
		mobileNoticeSlide.goToNextSlide();
	})
	
	
	// 탭 지정 - 찾아오시는길
	tabFucNomal('.directionTab li','.subDirectionCon');
		
	
	
	// 탭 지정 - 소개 및 연혁
	tabFucNomal('.historyTab li','.subHistoryCon');
	
	
	// 탭 지정 - 계약정보공개
	tabFucNomal('.contractTabUl li','.contractTabCon_01');
		
	
	//뉴스레터 신청하기 - 팝업띄우기
	$('.newsLetterRequestBtn').on('click',function(){
		$('.newsletterServiceWrap').show();
	});
	
	$('.newsLetterCancleBtn').on('click',function(){
		$('.newsletterServiceWrap').hide();
	});	
	
	
	//전문가 DB등록 - 팝업띄우기
	$('.dbRegisterBtn').on('click',function(){
		$('.masterDBRegisterWrap').show();
	});
	
	$('.masterDBRegisterBtn').on('click',function(){
		$('.masterDBRegisterWrap').hide();
	});	
	
	
	//개인정보취급방침 - 팝업띄우기
	$('.privacyPopBtn').on('click',function(){
		$('.popUpPrivacyWrap').show();
	});
	
	$('.popUpPrivacyWrap .btnBoard_01').on('click',function(){
		$('.popUpPrivacyWrap').hide();
	});	
	
	
	//이메일무단수집거부 - 팝업띄우기
	$('.emailPopBtn').on('click',function(){
		$('.popUpPrivacyEmailWrap').show();
	});
	
	$('.popUpPrivacyEmailWrap .btnBoard_01').on('click',function(){
		$('.popUpPrivacyEmailWrap').hide();
	});	
	
	
	//저작권정책 - 팝업띄우기
	$('.copyrightPopBtn').on('click',function(){
		$('.popUpCopyrightWrap').show();
	});
	
	$('.popUpCopyrightWrap .btnBoard_01').on('click',function(){
		$('.popUpCopyrightWrap').hide();
	});	
	
	//서브 sns 공유 버튼		
	var toggleSnsNum = 1;
	
	$('.subSnsShareBtn').on('click',function(){
		
		if(toggleSnsNum == 1){
			$('.subSnsBtnBox').animate({marginRight:'0px'});
			toggleSnsNum = 0;
			$(this).css('color','#005ab1');
		} else {
			
			//모바일
			if(window.matchMedia('(max-width: 920px)').matches){
				$('.subSnsBtnBox').animate({marginRight:'-90px'});
				toggleSnsNum = 1;
				$(this).css('color','#888');
			} else {
			//PC
				$('.subSnsBtnBox').animate({marginRight:'-110px'});
				toggleSnsNum = 1;
				$(this).css('color','#888');
			}
		}
		
	});
	
	// 탭 지정 - 고객만족경영
	tabFucNomal('.guestTabUl li','.guestTabCon_01');
	
	
	//모바일 통합검색

	$('.headerMobileMain .searchIcon button').on('click',function(){		
		$('.searchHeaderMobileWrap').stop().slideDown();		
	});
	
	$('.searchHeaderMobileWrap .btnCloseSearchMoHeader').on('click',function(){		
		$('.searchHeaderMobileWrap').stop().slideUp();		
	});
	
	
	
});

// 탭 부분
var sc = "";
var a = "";


function tabFucNomal(tabTitle,tabContents) {
	
	init(tabTitle,tabContents);

	$(tabTitle).on('click',function(){
		init(tabTitle,tabContents);
		setTab($(this).index());
		return false;
	});	
}


function init(tabTitle,tabContents) {
	sc = $(tabContents);
	a = $(tabTitle);
	a.eq(0).addClass('active');
	sc.hide();
	sc.eq(0).show();	
}


function setTab(what) {
	sc.hide();
	sc.eq(what).fadeIn();
	a.removeClass('active');
	a.eq(what).addClass('active');	
}




//모바일 메인 공지사항 

function tabFucNomaMobile(tabTitle,tabContents) {
	
	init2(tabTitle,tabContents);

	$(tabTitle).on('click',function(){
		init2(tabTitle,tabContents);
		
		var $indexNum = parseInt ($(this).index());
		
		setTab2($indexNum);
		return false;
	});	
}



function init2(tabTitle,tabContents) {
	sc = $(tabContents);
	a = $(tabTitle);
	a.eq(0).addClass('active');
	sc.hide();
	sc.eq(0).show();	
}


function setTab2(what) {
	sc.hide();
	sc.eq(what - 1).fadeIn();
	a.removeClass('active');
	a.eq(what).addClass('active');	
}




