package com.tx.common.service.page;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

/**
 * @Pagination
 * Jsp 화면 페이지 처리 UI 생성 클래스 (게시판) 
 * @author 신희원
 * @version 1.0
 * @since 2014-11-14
 */
public class NormalPagination extends AbstractPaginationRenderer implements ServletContextAware{
	public NormalPagination() {
	} 
	
	public void initVariables(){
		firstPageLabel    = "<li class=\"pageAllPrev\"><button type=\"button\" class=\"btn-page\" onclick=\"{0}({1});return false;\"><span class=\"icon prevAll\"></span></button></li>"; 
        previousPageLabel = "<li class=\"pagePrev\"><button type=\"button\" class=\"btn-page\" onclick=\"{0}({1});return false;\"><span class=\"icon prev\"></span></button></li>";
        currentPageLabel  = "<li class=\"active\"><a href=\"javascript:;\"><span class=\"num\">{0}</span></a></li>";
        otherPageLabel    = "<li><a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><span class=\"num\">{2}</span></a></li>";
        nextPageLabel     = "<li class=\"pageNext\"><button type=\"button\" class=\"btn-page\" onclick=\"{0}({1});return false;\"><span class=\"icon next\"></span></button></li>";
        lastPageLabel     = "<li class=\"pageAllNext\"><button type=\"button\" class=\"btn-page\" onclick=\"{0}({1});return false;\"><span class=\"icon nextAll\"></span></button></li>";
	} 
	
	public void setServletContext(ServletContext servletContext){
		initVariables();
	} 
}

