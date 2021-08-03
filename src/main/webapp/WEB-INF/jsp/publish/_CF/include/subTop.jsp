<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf" %>
	
	<nav id="nav_gnb">
		<ul id="gnb">
			<li class="">
				<a href="/">
					<span class="icon n01"></span>
					<span class="txt">종합현황</span>
				</a>
			</li>
			<c:forEach items="${ menuList}" var="model">
                		<%-- <sec:authorize url="${model.MN_URL}"> --%>
						<c:set var="current" value=""/>
						<c:if test="${model.MN_LEV eq '1' }">
							 <li class="">
								<a class="${current}" href="${model.href }" target="${model.target }" title="${model.MN_NAME }">
									<span class="icon n02"></span>
									<span class="txt">${model.MN_NAME }</span>
								</a>
							</li>
						</c:if>
						<%-- </sec:authorize> --%>
            </c:forEach>
		</ul>
	</nav>
	
	
	
	
	
	
	
	
	
	<!-- <nav id="nav_gnb">
		<ul id="gnb">
			<li class="active">
				<a href="index.html">
					<span class="icon n01"></span>
					<span class="txt">종합현황</span>
				</a>
			</li>
			<li>
				<a href="device_pv.html">
					<span class="icon n02"></span>
					<span class="txt">장치현황</span>
				</a>
			</li>
			<li>
				<a href="drive_pv.html">
					<span class="icon n03"></span>
					<span class="txt">운전현황</span>
				</a>
			</li>
			<li>
				<a href="forecast_model.html">
					<span class="icon n06 lg"></span>
					<span class="txt">예측모델</span>
				</a>
			</li>
			<li>
				<a href="scheduling.html">
					<span class="icon n07 lg"></span>
					<span class="txt">스케쥴링</span>
				</a>
			</li>
			<li>
				<a href="log_list.html">
					<span class="icon n05"></span>
					<span class="txt">로그관리</span>
				</a>
			</li>
			<li>
				<a href="user_1.html">
					<span class="icon n04"></span>
					<span class="txt">사용자관리</span>
				</a>
			</li>
		</ul>
	</nav> -->