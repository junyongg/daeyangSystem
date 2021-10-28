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
		firstPageLabel    = "<a class=\"btn first\" href=\"javascript:;\" onclick=\"{0}({1});return false;\"></a>"; 
        previousPageLabel = "<a class=\"btn prev\" href=\"javascript:;\" onclick=\"{0}({1});return false;\"></a>";
        currentPageLabel  = "<a class=\"active\" href=\"javascript:;\">{0}</a>";
        otherPageLabel    = "<a class=\"on\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>";
        nextPageLabel     = "<a class=\"btn next\" href=\"javascript:;\" onclick=\"{0}({1});return false;\"></a>";
        lastPageLabel     = "<a class=\"btn last\" href=\"javascript:;\" onclick=\"{0}({1});return false;\"></a>";
	} 
	
	public void setServletContext(ServletContext servletContext){
		initVariables();
	} 
}

