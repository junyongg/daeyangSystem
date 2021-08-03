<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf" %>

<form:form id="Form" name="Form" action="/user/j_spring_security_check.do" method="post">
<input type="hidden" name="tiles" value="${tiles}" />

<div id="wrap1"> <!-- header 시작 -->
	<div class="I_logo_wrap">
		<div class="I_logo">
			<img src="/resources/img/bg/login_logo.jpg" alt="EMS로고">
		</div>
	</div>
</div>

<div id="box_wrap">
	<div class="login_box">
		<div class="login_box_inner">
			<div class="login_text">
				<h1>로그인</h1>
				<h2>로그인을 통해 다양한 정보와 서비스를 이용하세요.</h2>
			</div>
			<div class="Login_p_wrap">
				<label for="UI_IDs"><input type="text" style="font-size:14px;" name="UI_ID" id="UI_IDs" class="txtlogin width100Per" placeholder="아이디"></label>   
							
				<label for="UI_PASSWORD"><input type="password" style="font-size:14px;" name="UI_PASSWORD" id="UI_PASSWORD" autocomplete="off" placeholder="비밀번호"></label>  
			</div>
			<button type="submit" id="login_button" onclick="validateLoginForm(); return false;">로그인</button>
			<div class="id_memory">
				<label for="checkBox"><input type="checkbox" id="idSave">아이디 저장</label>
         		<p class="samllChar" style="margin-top: 15px; color: red;">${customExceptionmsg}</p>
			</div>
	 	</div>
	</div>
</div>

<!-- <div class="menu">
	<ul class="S_menu">
		<li><a href="join_agree.html">회원가입 <span class="T_line">|</span></a></li>
		<li><a href="javascript:;">아이디 찾기 <span class="T_line"> |</span></a></li>
		<li><a href="javascript:;">비밀번호 찾기</a></li>
	</ul>
</div> -->

<div class="menu">
	<ul class="S_menu">
		<li><a href="javascript:;" onclick="location.href='/${tiles}/member/regist.do'">회원가입</a></li>
	</ul>
</div>

</form:form>

<script>




//화면 호출시 가장 먼저 호출되는 부분 
$(document).ready(function() {
	
		var naver_clientid = '${SiteManager.SNSLOGIN_NAVER_CLIENT_ID}'
		var kakao_jskey = '${SiteManager.SNSLOGIN_KAKAO_JSKEY}'
		var facebook_appid = '${SiteManager.SNSLOGIN_FACEBOOK_APPID}'
 		var location_origin = location.origin;
 	 // 네이버 아이디 연동 
// 		var naverLogin = new naver.LoginWithNaverId(
// 								{
// 									clientId : naver_clientid, 
// 									callbackUrl : location_origin+"/${currentTiles}/naver/callback.do", // 네이버 콜백 유알엘
// 									isPopup : true, /* 팝업을 통한 연동처리 여부 */
// 									loginButton : {
// 										color : "green",
// 										type : 1,
// 										height : 55
// 									}
// 								/* 로그인 버튼의 타입을 지정 */
// 								});

// 						/* 설정정보를 초기화하고 연동을 준비 */
// 						naverLogin.init();
						
						
						
						
						
						
						//카카오 연동
													// 사용할 앱의 JavaScript 키를 설정해 주세요.
// 							    Kakao.init(kakao_jskey);
// 							    // 카카오 로그인 버튼을 생성합니다.
// 							    Kakao.Auth.createLoginButton({
// 									container: '#kakao-login-btn',
// 									size: 'large',
// 									success: function(authObj) {
// 							        	//alert(JSON.stringify(authObj));
// 							        	var scope = authObj.scope;
							        	
							        	
// 							        	// 로그인 성공시, API를 호출합니다.
// 										Kakao.API.request({
// 											url: '/v2/user/me',
// 											success: function(res) {
// 												/*  alert(Kakao.Auth.getAccessToken()+"ㅃㅃ"); */
// 												var kakao_id = res.id;
// 												var kakao_name = res.kakao_account.profile.nickname;
// 												/* var kakao_email = '';
// 												if(scope.indexOf('account_email') >= 0) {
// 													email = res.kakao_account.email
// 												} */
											
												
// 												snsLogin(kakao_id, kakao_name, 'kakao');
// 											},
// 											fail: function(error) {
// 												alert(JSON.stringify(error));
// 											}
// 										});
							        	
// 									},
// 									fail: function(err) {
// 										alert(JSON.stringify(err));
// 									}
// 							    });
						
						
						
						
						
	
						
						
// 						// 페이스북 아이디 연동
						
// 						  (function(d, s, id) {
// 										var js, fjs = d.getElementsByTagName(s)[0];
// 										if (d.getElementById(id)) {
// 											return;
// 										}
// 										js = d.createElement(s);
// 										js.id = id;
// 										js.src = "https://connect.facebook.net/ko_KR/sdk.js";
// 										fjs.parentNode.insertBefore(js, fjs);
// 									}(document, 'script', 'facebook-jssdk'));
				
				

// 									window.fbAsyncInit = function() {
// 										console.log(FB)
									
// 										return false;
// 										FB.init({
// 											appId : facebook_appid,
// 											cookie : true,
// 											xfbml : true,
// 											version : 'v5.0'
// 										});

										

// 									}; 
						
						
						
});


function fbLoginAction() {
    FB.login(function(response) {
        var fbname;
        var accessToken = response.authResponse.accessToken;
        FB.api('/me?fields=id,name', function(response) {
            var fb_data = jQuery.parseJSON(JSON.stringify(response));
            var data = "<br/>fb_id : "+fb_data.id;
            data += "<br/>name : "+fb_data.name;
            var uniqId = fb_data.id;
            var name = fb_data.name;
            var type = 'facebook';
            
            if(!confirm("페이스북아이디로 회원가입 하시겠습니까?")){
            	return false;
            }
            snsLogin(uniqId, name, type);
           	
            
            
        
            
        });
    }, {scope: 'public_profile'});
}

function snsLogin(uniqId, name, type) {
	
	$.ajax({
		type : "post",
		url : "/${currentTiles}/reward/snsLoginAjax.do",
		data :  {
			"uniqId" : uniqId,	
			"name" : name,		
			"type" : type
		},
		async : false,
		success : function(data) {
			if(data) {
				//window.close();
				location.href='/${currentTiles}/index.do'
			}else {
				alert("sns로그인 실패");
			}
		},
		error : function(xhr, status, error) {
            alert('SNS로그인 에러발생');
      }

	})
	
};




function kakaoLoginAction(){
	$("#kakao-login-btn").click();
}

$(function(){
	var saveId = cf_getCookie('saveId');
	if(saveId){
		$('#idSave').attr('checked',true);
		$('#UI_IDs').val(saveId);
		$('#UI_PASSWORD').focus();
	}else{
		$('#UI_IDs').focus();
	}
})

function validateLoginForm() {
	//나중에 관리자 보수업체 로그인 확인할때 사용(보류)
//	alert($('.type li.active').attr("value"))	
//	var loginType = $('.type li.active').attr("value");
	
    var username = document.getElementById("UI_IDs").value;
    var password = document.getElementById("UI_PASSWORD").value;
    if (!username || !password) {
        alert("ID/비밀번호를 입력해주세요.");
        return false;
    }

    try {
    	submit(username, password);
    } catch(err) {
        alert(err);
    }
    return false;
}

function submit(username, password) {
	
	//아이디 저장 체크시 쿠키에 저장
	if($('#idSave').is(':checked')){
		cf_setCookie('saveId',username)
	}else{
		cf_clearCookie('saveId');
	}
	
	// POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    var Form = document.getElementById("Form");
    Form.submit();
}
</script>
