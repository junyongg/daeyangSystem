package com.tx.dyAdmin.power.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.config.SettingData;
import com.tx.common.config.annotation.CheckActivityHistory;
import com.tx.common.config.tld.SiteProperties;
import com.tx.common.dto.Common;
import com.tx.common.security.aes.AES256Cipher;
import com.tx.common.security.password.MyPasswordEncoder;
import com.tx.common.security.rsa.service.RsaService;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;
import com.tx.common.service.weakness.WeaknessService;
import com.tx.dyAdmin.admin.code.service.CodeService;
import com.tx.dyAdmin.member.dto.UserDTO;
import com.tx.dyAdmin.member.dto.UserSettingDTO;
import com.tx.dyAdmin.program.application.dto.ApplicationDTO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdminPowerController {

	
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
	 * 회원 리스트
	 * @param req
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/power/view.do")
	@CheckActivityHistory(desc="발전소 등록 리스트")
	public ModelAndView adminPowerView(HttpServletRequest req
			,@ModelAttribute UserDTO UserDTO
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/dyAdmin/power/pra_power_list.adm");
		return mv;
	}
	
	/**
	 * 회원 리스트 - 페이징 ajax
	 * @param req
	 * @param search
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/power/pagingAjax.do")
	public ModelAndView adminMemberViewPaging(HttpServletRequest req,
			Common search
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/power/pra_power_list_data");

		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
		
		PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),"member.UI_getListCnt",map, search.getPageUnit(), 10);
		
		map.put("firstIndex", pageInfo.getFirstRecordIndex());
		map.put("lastIndex", pageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
		
		mv.addObject("paginationInfo", pageInfo);
		
//		List<HashMap<String,Object>> resultList = Component.getList("member.UI_getList", map); 
//		mv.addObject("resultList", userInfoDecode(resultList));
		mv.addObject("search", search);
		return mv;
		
		
	}
		
}
