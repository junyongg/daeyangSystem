<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf" %>

<header>
        <h1><a href="/" title="대양기업 로고"><img src="/resources/img/sub/logo.png" alt="DAEYANG"></a></h1>
        
        <nav id="gnb">
            <ul>
                <li class="${currentMenu.MN_NAME  eq '종합 현황' ? 'on':''}"><a href="/dy/moniter/overAll.do">종합현황</a></li>
                <li class="${currentMenu.MN_NAME eq '발전 현황' ? 'on':''}"><a href="/dy/moniter/general.do">발전현황</a></li>
                <li class="${currentMenu.MN_NAME eq '통계 분석' ? 'on':''}"><a href="/dy/moniter/stastics.do">통계분석</a></li>
                <li><a href="javascript:;">게시판</a></li>
                <li><a href="javascript:;">설정</a></li>
                <li class="mobile"><a href="javascript:;" class="logout">Logout</a></li>
            </ul>
        </nav>
        
        <div class="rb">
            <sec:authorize access="isAuthenticated()">
              <dl>
                	<c:if test="${userInfo.isAdmin eq 'Y' }">
                		<dt class="user">관리자</dt>
                	</c:if>
                	<dd class="user"><b>${userInfo.UI_NAME }</b>님</dd>
              </dl>
              <c:if test="${userInfo.isAdmin eq 'Y' }">
                	<button type="button" onclick="location.href='/dyAdmin/index.do'" target="_blank" class="btn_logout">관리자페이지</button>
              </c:if>
              <button type="button" onclick="location.href='/user/logout.do'" class="btn_logout">로그아웃</button>
          	</sec:authorize>
        </div>
        
        <span class="menu_bar" style="width: 554px;"></span>

        <button type="button" class="mo_menu" title="모바일메뉴">
            <span class="hamber"><i class="xi-bars"></i></span>
            <span class="close"><i class="xi-close"></i></span>
        </button>
    </header>
