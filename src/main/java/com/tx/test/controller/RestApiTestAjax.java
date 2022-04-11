package com.tx.test.controller;

import java.awt.Component;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.dto.Common;
import com.tx.common.security.password.MyPasswordEncoder;
import com.tx.common.security.rsa.service.RsaService;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;
import com.tx.common.service.weakness.WeaknessService;
import com.tx.dyAdmin.admin.code.service.CodeService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class RestApiTestAjax {

	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	
	/** 암호화 */
	@Autowired MyPasswordEncoder passwordEncoder;
	
	/** RSA */
	@Autowired RsaService RsaService;
	
	/** 페이지 처리 출 */
	@Autowired private PageAccess PageAccess;
	
	@Autowired WeaknessService WeaknessService;
	
	@Autowired CodeService CodeService;
	
	
	 /**
		 * 공급자 리스트 - 페이징 ajax
		 * @param req
		 * @param search
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="/dyAdmin/bills/clientpagingAjax.do")
		public ModelAndView clientViewPaging(HttpServletRequest req,
				Common search
				) throws Exception {
			
			ModelAndView mv  = new ModelAndView("/dyAdmin/bills/pra_bills_client_data");

			List<HashMap<String,Object>> searchList = Component.getSearchList(req);
			
			Map<String,Object> map = CommonService.ConverObjectToMap(search);
			
			if(searchList != null){
				map.put("searchList", searchList);
			}
			
			PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),"power.Pw_getListCnt",map, search.getPageUnit(), 10);
			
			map.put("firstIndex", pageInfo.getFirstRecordIndex());
			map.put("lastIndex", pageInfo.getLastRecordIndex());
			map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
			
			mv.addObject("paginationInfo", pageInfo);
			
			List<HashMap<String,Object>> resultList = Component.getList("power.Pw_getList", map); 
			mv.addObject("resultList", resultList);
			mv.addObject("search", search);
			return mv;
		}
}
