// JavaScript Document

$(document).ready(function(){
	
	/*// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($(".mouseIconWrap").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	alert(floatPosition);
	alert("d")
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
 
		 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 
 
		$(".mouseIconWrap").stop().animate({
			"top" : newPosition
		}, {
			'duration' : 500,
			'easing' : 'easeInOutCubic',
			'complete' : function() {
				console.log('이동 완료하였습니다.');
			}
		});
 
	}).scroll();
*/

	// 위로 버튼
	var w = $(window).width();
	if(w >920){
		$(document).scroll(function() {
			btn_mv_up('.mouseIconWrap');
		}).on('click', '.mouseIconWrap', function() {
			pf_DownMove();
		});
	}
	
	
	 /*$("#expertForm").validate({

	        onfocusout : function (element) {

	            $(element).valid();

	        },
	        
	        submitHandler: function(form) {        	
	        	pf_insert('E');
	           return false;
	          }, 

	        rules : {

	        	EI_NAME : {required:true, minlength:5, maxlength:50},
	        	EI_BIRTH : {required:true, minlength:8, maxlength:20},
	        	EI_EMAIL : {required:true, minlength:8, maxlength:20},
	        	EI_ADDRESS1 : {required:true, minlength:8, maxlength:20},
	        	EI_PHONE : {required:true, minlength:8, maxlength:20},
	        	EI_PHONE2 : {required:true, minlength:8, maxlength:20},
	        	EI_BELONG : {required:true, minlength:8, maxlength:20},
	        	EI_POSITION : {required:true, minlength:8, maxlength:20},
	        	EDR_SCHOOL : {required:true, minlength:8, maxlength:20},
	        	EDR_MAJOR : {required:true, minlength:8, maxlength:20},
	        	EDR_DEGREE : {required:true, minlength:8, maxlength:20},
	        	EDR_DETAILE : {required:true, minlength:8, maxlength:20},
	        	ER_FIELD : {required:true, minlength:8, maxlength:20},

	        },

	        messages : {

	        	EI_NAME : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EI_BIRTH : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EI_EMAIL : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EI_ADDRESS1 : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EI_PHONE : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EI_PHONE2 : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EI_BELONG : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EI_POSITION : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EDR_SCHOOL : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EDR_MAJOR : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EDR_DEGREE : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	EDR_DETAILE : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},
	        	ER_FIELD : {required:"필수정보를 적어주세요.", minlength:jQuery.validator.format("최소 {0}자 이상"), maxlength:jQuery.validator.format("최대 {0}자 이하")},

	        }, 

	        invalidHandler : function(form, validator) {
	            var errors = validator.numberOfInvalids();
	            if( errors ) 
	            {
	                $("h3 span.ok").html("(유효성 검사 실패)"); 
	                alert(validator.errorList[0].message);
	                validator.errorList[0].element.focus();
	            }
	        },
	        
	        errorPlacement: function(error, element) {
	            	if($(element).hasClass('phonesize')){
		              	$(element).parent().find('.errorMessage').html(error)
	            	}else{
	            		$(element).after(error);
	            	}
	          }
	    });

	$("#EI_BIRTH").mask('0000-00-00');	 */
	
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
	
	// *****슬라이드******
	
	//메인슬라이드
	var mainSlider = $('#bxslider1').bxSlider({
	  auto: true,
	  autoControls: false,
	  speed: 800,
	  pause: 5000,
	  adaptiveHeight: true,
	  controls : false,
	  pager: true, 
	  pagerType : 'full', 
	  infiniteLoop : true,
	  pagerCustom: '#mainSliderPager',
	  onSlideBefore: function(obj,currentIndex, nextIndex){
		  var title = $(obj).data('title');
		  var comment = $(obj).data('comment');
		  $("#main_title").text(title);
		  $("#mobile_title").text(title);
		  $("#main_comment").text(comment);
		  return true;
	  },
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
	  autoControls: false,
	  controls:false,
	  speed: 3000,
	  auto: true,
	  pause: 5000,
	  adaptiveHeight: true,
	  pager : false,
	  maxSlides:5,
	  minSlides:5,
	  slideWidth:195,
	  infiniteLoop: true,
	  onSlideBefore: function(obj,currentIndex, nextIndex){
		  bannerImgSetting()
		  return true;
	  },
	});
	
	var bannerImgState = false;
	//메인 배너 버튼
	$('.mainBannerBtnPrev').on('click',function(){		
		mainBannerSlider.stopAuto();
		mainBannerSlider.goToPrevSlide();
	})
	$('.mainBannerBtnNext').on('click',function(){
		mainBannerSlider.stopAuto();
		mainBannerSlider.goToNextSlide();
	})
	
	function bannerImgSetting(){
		//
	}
	
		
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
		
	//메인 모바일 공지사항 탭 슬라이드	
	if(window.matchMedia('(max-width: 920px)').matches){  //($(window).width() < 850)
		var mobileNoticeSlide = $('#mobileNoticeTab').bxSlider({
		  auto: false,
		  autoControls: false,
		  speed: 1000,
		  pause: 4000,
		  adaptiveHeight: false,
		  pager:false,
		  controls: false,
		  onSlideBefore: function(obj,currentIndex, nextIndex){
			  var index = $(obj).data('index');
			  $('.mainNoticeTab li').addClass('active');
			  $('.mainNoticeConWrap').hide().eq(index).show();
			  return true;
		  },
		});	
		
		//메인 모바일 공지사항 탭 지정
		//tabFucNomaMobile('.mainNoticeTab li','.mainNoticeTabCon');
	}
	
	//메인 모바일 공지사항 탭 슬라이드 버튼
	$('.btnNoticeSlideMobilePrev').on('click',function(){
		mobileNoticeSlide.goToPrevSlide();
	})
	$('.btnNoticeSlideMobileNext').on('click',function(){
		mobileNoticeSlide.goToNextSlide();
	})
	
	//뉴스레터 신청하기 - 팝업띄우기
	$('.newsLetterRequestBtn').on('click',function(){
		$("#NL_NAME").val("");
		$("#NL_POSITION").val("");
		$("#NL_BELONG").val("");
		$("#NL_EMAIL").val("");
		$("#newsConfirm").prop("checked", false);
		
		$('.newsletterServiceWrap').show();
	});
	
	$('.newsLetterCancleBtn').on('click',function(){
		$('.newsletterServiceWrap').hide();
	});	
	
	
	//전문가 DB등록 - 팝업띄우기
	$('.dbRegisterBtn').on('click',function(){
		$("input[id^=EI]").val("");
		$("input[name^=EDR]").val("");
		$("input[name^=ER]").val("");
		$("input[name=EI_BIRTH_TYPE][value=S]").prop("checked", true);
		
		$("#expert_table2 .researchTr:not(:first)").remove();
		$("#expert_table3 .researchTr:not(:first)").remove();
		
		$("label.error").css("display","none");
		$('.masterDBRegisterWrap').show();
	});
	
	$('.masterDBRegisterBtn').on('click',function(){
		$('.masterDBRegisterWrap').hide();
	});	
	
});

//마우스 다운 버튼
function pf_DownMove(seq){
    var offset = $("#contents_start2").offset();
    $('html, body').animate({scrollTop : offset.top}, 400);
}

//전문가등록, 뉴스레터 신청
function pf_popupOpen(type){
	var url = "/jcia/application/popupOpen.do?type="+type;
	var specs = "left=10,top=10,width=700,height=500";
	specs += ",toolbar=no,menubar=no,status=no,scrollbars=no,resizable=no";
	
	window.open(url, "팝업", specs);
}

//개시판 상세보기
function pf_boardPromoteLink(key){
	console.log(key)
	location.href="/jcia/Board/"+key+"/detailView.do"
}

//전문가DB 관련 부분
function pf_ResearchAdd(){
	$tr = $("#expert_table3").find(".researchTr").eq(0);
	var clone = $tr.clone();
	clone.find("input").val("");
	$("#expert_table3").append(clone);
}

function pf_ResearchRemove(obj){
	$(obj).closest("tr").remove();
}
function pf_degreeRemove(obj){
	$(obj).parent().parent().parent().remove();
	
}

function pf_degreeAdd(){
	$tr = $("#expert_table2").find(".researchTr").eq(0);
	var clone = $tr.clone();
	clone.find("input").val("");
	$("#expert_table2").append(clone);
}

//function pf_close(){
//	window.open("about:blank","_self").close();
//}

//휴대폰번호
function pf_autoHypenPhone(obj,str){
   str = str.replace(/[^0-9]/g, '');
   var tmp = '';
   if(str.length < 4){
       tmp += str;
   }else if(str.length < 7){
       tmp += str.substr(0, 3);
       tmp += '-';
       tmp += str.substr(3);
   }else if(str.length < 11){
       tmp += str.substr(0, 3);
       tmp += '-';
       tmp += str.substr(3, 3);
       tmp += '-';
       tmp += str.substr(6);
   }else{              
       tmp += str.substr(0, 3);
       tmp += '-';
       tmp += str.substr(3, 4);
       tmp += '-';
       tmp += str.substr(7);
   }
   $(obj).val(tmp)
}

//생년월일 유효성
function pf_birth(){
	var birth = $("#EI_BIRTH").val();
	var format = /^(19[3-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
    if(birth && !format.test(birth)){
     alert("생년월일이 유효하지 않습니다. \n1930-01-01부터 2099-12-31까지 입력 가능합니다.");
   	 $("#EI_BIRTH").val('');
   	 $("#EI_BIRTH").focus();
     return false;
    }
}

//이메일 유효성
 function pf_email(type){
	 var email = null;
	 var emailID = null;
	 if(type == "E"){
		 email = $("#EI_EMAIL").val();
		 emailID =$("#EI_EMAIL");
	 }else if(type == "N"){
		 
		 email = $("#NL_EMAIL").val();		 		 
		 emailID = $("#NL_EMAIL");
	 }
 	var exptext =  /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
 	if(email){
 		if(exptext.test(email)==false){
 			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
 			alert("이메일형식이 올바르지 않습니다.");
 			emailID.val('');
 			emailID.focus();
 			return false;
 		}
 		return true;
 	}
 }

//주소검색
function pf_post(zoneCode,address){
	 daum.postcode.load(function(){
	     new daum.Postcode({
	         oncomplete: function(data) {
	        	// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById(zoneCode).value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById(address).value = fullRoadAddr;	//도로명주소 입력

	         }
	     }).open();
	 });
}

var emailResult;
function pf_insert(type){
	if(type == 'E'){
		if(!pf_validate($("#EI_NAME"))){
			return false;
		}	
		if(!pf_validate($("#EI_BIRTH"))){
			return false;
		}	
		if(!pf_validate($("#EI_EMAIL"))){
			return false;
		}
		if(!pf_email(type)){
			return false;
		}
		if(!pf_validate($("#EI_ADDRESS1"))){
			return false;
		}	
		if(!pf_validate($("#EI_PHONE"))){
			return false;
		}	
		if(!pf_validate($("#EI_PHONE2"))){
			return false;
		}	
		if(!pf_validate($("#EI_BELONG"))){
			return false;
		}	
		if(!pf_validate($("#EI_POSITION"))){
			return false;
		}	
		
		var check = true;
		var obj = null;
		$("#expert_table2 .researchTr").each(function(i){
			if(check){
				obj = $(this).find("input[name=EDR_SCHOOL]");
				if(!pf_validate(obj)){
					check = false;
					return false;
				}
				obj = $(this).find("input[name=EDR_MAJOR]");
				if(!pf_validate(obj)){
					check = false;
					return false;
				}
				obj = $(this).find("input[name=EDR_DEGREE]");
				if(!pf_validate(obj)){
					check = false;
					return false;
				}
				obj = $(this).find("input[name=EDR_DETAILE]");
				if(!pf_validate(obj)){
					check = false;
					return false;
				}
			}
		});
		
		$("#expert_table3 .researchTr").each(function(i){
			if(check){
				obj = $(this).find("input[name=ER_FIELD]");
				if(!pf_validate(obj)){
					check = false;
					return false;
				}
			}
		});
		
		if(!check){
			return false;
		}
		
		if(confirm("등록하시겠습니까?")){
			$("#expertForm").attr("action","/jcia/expert/expertInsert.do");
			$("#expertForm").submit();
		}
		
	}else if(type == 'N'){
		var confirmYN = $("input[name=newsConfirm]").is(":checked");
		if(!confirmYN){
			alert("개인정보제공에 동의해주세요.");
			return false;
		}
		
		if(!pf_validate($("#NL_NAME"))){
			return false;
		}	
		if(!$("#NL_POSITION").val() && !$("#NL_BELONG").val()){
			alert("직책 또는 소속 중 하나는 필수 입력사항입니다.");
			if(!$("#NL_POSITION").val()){
				$("#NL_POSITION").focus();
				return false;
			}
			if(!$("#NL_BELONG").val()){
				$("#NL_BELONG").focus();
				return false;
			}
			/*if(!pf_validate($("#NL_POSITION"))){
				return false;
			}	
			if(!pf_validate($("#NL_BELONG"))){
				return false;
			}	*/
			return false;
		}
		
		
		if(!pf_validate($("#NL_EMAIL"))){
			return false;
		}	
		
		if(confirm("등록하시겠습니까?")){
			$("#newsForm").attr("action","/jcia/news/newsInsert.do");
			$("#newsForm").submit();		
		}			
	}
	
	/*if(confirm("등록하시겠습니까?")){
		if(type == 'E'){
			$("#expertForm").attr("action","/jcia/expert/expertInsert.do");
			$("#expertForm").submit();
		}else if(type == 'N'){
			$("#newsForm").attr("action","/jcia/news/newsInsert.do");
			$("#newsForm").submit();
		}
	}	*/
}
function pf_validate(obj){
	$obj = $(obj);
	var IDtext = $obj.closest("td").prev("th").find("label").text();
//	var IDtext = Id.closest("tr").find("label").text();
	var Idval = $obj.val();
	
	if(Idval == '' || Idval == null){
		alert(IDtext+"은/는 필수입력사항입니다.");
		$obj.focus();
		return false;
	}else{
		return true;
	}
}


//더보기
function setTab(what) {
	sc.hide();
	var url = $("#mobileNoticeTab li").eq(what).data("url");
	var title = $("#mobileNoticeTab li").eq(what).data("title");
	$("#ViewMore").attr("href", url);
	$("#ViewMore").attr("title", title);
	sc.eq(what).fadeIn();
	a.removeClass('active');
	a.eq(what).addClass('active');	
}

//모바일 메인 공지사항 
/*function tabFucNomaMobile(tabTitle,tabContents) {
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
}*/

/* 위로
스크롤이 특정 위치로 이동하면 위로버튼이 나타난다.
위로버튼을 클릭하면 상단으로 이동
*/
//function btn_mv_up(oj) {
// if(!oj) return false;
// var o = $(oj);
// var p = $(window).scrollTop();
// if(p < 850){ o.fadeIn('slow'); }    // 위로버튼이 나타나는 위치 지정
// else if(p > 850){ o.fadeOut('slow'); }    // 위로버튼을 숨기는 위치 지정
//}

function btn_mv_up(oj) {
	 if(!oj) return false;

	 var st = $(window).scrollTop();
	 var h = $(window).height();
	 
	 $(oj).stop().animate({
		 "top" : st + 200
	 }, {
		 'easing' : 'easeOutQuint',
		 'complete' : function() {
		 }
	 });
//	 $(oj).stop().hide().css('top',st + 200);    // 스크롤 이동에 따른 위로버튼의 위치 이동
	 if(st < 500) { $(oj).fadeIn(); }    // 위로버튼을 보여주는 위치 지정
	 else if(st > 500) { $(oj).stop().fadeOut(); }    // 위로버튼을 숨기는 위치 지정
}



