<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<ul class="mobileMenuUl">
        		<c:forEach items="${ menuList}" var="model">
				
					<c:set var="current" value=""/>
					<c:if test="${model.MN_LEV eq '1' }">
						<c:if test="${model.MN_PAGEDIV_C eq sp:getData('MENU_TYPE_SUBMENU')}">
						<li><a href="javascript:;" title="${model.MN_NAME }">${model.MN_NAME }</a><span><img src="/resources/img/icon/icon_plus_01_gray.png" alt="더보기"></span></li>
		                <ul class="mobileSubMenuUl">
		                <c:forEach items="${ menuList}" var="model2">
		                <c:if test="${model.MN_KEYNO eq model2.MN_MAINKEY }">
						
							<c:if test="${model2.MN_PAGEDIV_C eq sp:getData('MENU_TYPE_SUBMENU')}">
							<li><a href="javascript:;" title="${model2.MN_NAME }">${model2.MN_NAME }</a><span><img src="/resources/img/icon/icon_plus_01_white.png" alt="더보기"></span></li>
		                    <ul class="mobileSubInnerMenuUl">
		                    <c:forEach items="${ menuList}" var="model3">
			                <c:if test="${model2.MN_KEYNO eq model3.MN_MAINKEY }">
							
		                        <li><a href="${model3.href }" target="${model3.target }" title="${model3.MN_NAME }">${model3.MN_NAME }</a></li>
	                        
	                        </c:if>
	                        </c:forEach>
		                    </ul>
							</c:if>
							<c:if test="${model2.MN_PAGEDIV_C ne sp:getData('MENU_TYPE_SUBMENU')}">
							<li><a href="${model2.href }" target="${model2.target }" title="${model2.MN_NAME }">${model2.MN_NAME }</a></li>
							</c:if>
						
						</c:if>
						</c:forEach>	
		                </ul>
						</c:if>
						<c:if test="${model.MN_PAGEDIV_C ne sp:getData('MENU_TYPE_SUBMENU')}">
						<li><a href="${model.href }" target="${model.target }" title="${model.MN_NAME }">${model.MN_NAME }</a></li>
						</c:if>
					</c:if>
				
				</c:forEach>
                
            </ul>