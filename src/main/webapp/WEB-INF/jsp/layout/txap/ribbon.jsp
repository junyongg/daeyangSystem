<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<span class="ribbon-button-alignment"> 
	<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
		<i class="fa fa-refresh"></i>
	</span> 
</span>

<!-- breadcrumb -->
<%-- <ol class="breadcrumb">
	<li>홈</li><li>${empty naviInfo[0].MN_NAME ? 'index': naviInfo[0].MN_NAME}</li>
</ol> --%>
<!-- end breadcrumb -->

<!-- You can also add more buttons to the
ribbon for further usability

Example below:
-->
<span class="ribbon-button-alignment pull-right">
<span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
<span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
<span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
</span> 