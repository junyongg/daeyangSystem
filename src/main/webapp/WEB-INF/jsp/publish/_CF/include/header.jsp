<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf" %>



<!------------------------------------------------------------------------
    		 HEADER START   헤더111
	------------------------------------------------------------------------->
	<header id="hd">	
		<div class="logo-b">
			<a href="/"><img src="/resources/img/icon/logo_top_01.png" alt="로고"></a>
		</div>
	
		<div class="mobile-head-box">					
			<button type="button" class="main-hamberger btn-mobileMenu">
	            <span class="ham-bar bar01"></span>
	            <span class="ham-bar bar02"></span>
	            <span class="ham-bar bar03"></span>
	        </button>
		</div>
	
		<div class="right-con">		
			<p class="date inli">${time2 }</p>
			<p class="time inli">${time3 }</p>
			<div class="h-line inli"></div>
			<c:if test="${not empty userInfo }">		
				<p class="name inli">${userInfo.UI_NAME }님</p>
			</c:if>
			<sec:authorize access="isAnonymous()">
				<button type="button" class="btn-logOut" onclick="location.href='/cf/member/regist.do'">
						<span class="txt">회원가입</span>
					</button>
               	<button type="button" class="btn-logOut" onclick="cf_login()">
               	<span class="icon"><i class="xi-log-out"></i></span>
               	<span class="txt">로그인</span>
               	</button>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<c:if test="${userInfo.isAdmin eq 'Y' }">
					<button type="button" class="btn-logOut" onclick="location.href='/txap/index.do'">
						<span class="txt">관리자페이지</span>
					</button>
				</c:if>
				<button type="button" class="btn-logOut" onclick="location.href='/user/logout.do'">
					<span class="icon"><i class="xi-log-out"></i></span>
					<span class="txt">로그아웃</span>
				</button>
			</sec:authorize>		
      </div>
	</header>

	<!------------------------------------------------------------------------
    		 HEADER END           
	------------------------------------------------------------------------->
    <div id="mobile-menu-wrap">
		<ul class="top-ul">
			
			<sec:authorize access="isAnonymous()">
               	<li><a href="javascript:;" onclick="location.href='/cf/member/regist.do'">회원가입</a></li>
               	<li><a href="javascript:;" onclick="cf_login()">로그인</a></li>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<c:if test="${userInfo.isAdmin eq 'Y' }">
					<li><a href="javascript:;" onclick="location.href='/txap/index.do'">Admin</a></li>
				</c:if>
					<li><a href="javascript:;" onclick="location.href='/user/logout.do'">LogOut</a></li>
			</sec:authorize>
		</ul>
	
		<c:if test="${not empty userInfo }">		
			<div class="middle-b">
				<p class="info">${userInfo.UI_NAME }님 안녕하세요.</p>
			</div>
		</c:if>
		
		<ul class="mobile-gnb">
			<c:forEach items="${ menuList}" var="model">
						<c:set var="current" value=""/>
						<c:if test="${model.MN_LEV eq '1' }">
							<li>
								<a class="${current}" href="${model.href }" target="${model.target }" title="${model.MN_NAME }">
									<span class="txt">${model.MN_NAME }</span>
									<span class="arrow"><i class="xi-angle-right-thin"></i></span>
								</a>
							</li>
						</c:if>
			</c:forEach>
		</ul>
	</div>
	<div id="black-b-mobileMenu"></div> <!-- 모바일메뉴 검정바탕 -->
	<!-- 모바일 메뉴 끝 -->
    
    <nav id="navWrap"> <!-- 윈도우메뉴 스킨 -->
    	
      <c:import url="/common/Menu/MenuHeaderTemplate/UserViewAjax.do?key=4"/>
    	
    	
    </nav> 
    
    <script>
  /*   $(function(){
		setTimeout(function() {
			$(".goog-te-combo").addClass("tx-select-top")
		}, 500);
		
    }); */
    </script>
