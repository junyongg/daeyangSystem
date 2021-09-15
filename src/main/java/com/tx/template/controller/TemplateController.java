package com.tx.template.controller;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ibatis.common.logging.Log;
import com.tx.common.config.SettingData;
import com.tx.common.config.annotation.CheckActivityHistory;
import com.tx.common.dto.TilesDTO;
import com.tx.common.dto.SNS.SNSInfo;
import com.tx.common.dto.SNS.SNSInfoBuilder;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.publish.CommonPublishService;
import com.tx.dyAdmin.admin.site.service.SiteService;
import com.tx.dyAdmin.homepage.menu.dto.Menu;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TemplateController {
	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	
	@Autowired SiteService SiteService;
	@Autowired CommonPublishService CommonPublishService;
	
	
	@RequestMapping(value="/{tiles}/index.do")
	public ModelAndView templateIndex(HttpServletRequest req
			, @PathVariable String tiles
			, @RequestParam(value = "msg", defaultValue = "") String msg
			, @RequestParam(value="inverter", defaultValue="all")String inverter
			) throws Exception {
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();

		//1호기 관련 데이터
		map.put("inverter", "one");
		map.put("inverter", "two");
		
		//2호기 간단한 데이터(오늘날짜) 합계
		
		map.put("inverter", inverter);
		map.put("type", "day");

		if("user".equals(tiles)){
			tiles = new TilesDTO().checkNull(null, req);
			mv.setViewName("redirect:/"+tiles+"/index.do");
			return mv;
		}
		
		String sitePath = SiteService.getSitePath(tiles);
		if(StringUtils.isEmpty(sitePath)){
			mv.setViewName("");
			return mv;
		}
		
		//관리자 체크해서 권한없을시  redirect 시킨다.
		Map<String, Object> user = CommonService.getUserInfo(req);
		String userKeyno = ((String) user.get("UI_KEYNO"));
		String UIA_KEYNO = Component.getData("Authority.UIA_getDataByUIKEYNO", userKeyno);
		
		//관리자(개발자 계정)이 아니면 redirect
		if(SettingData.AUTHORITY_ADMIN.equals(UIA_KEYNO)) {
			mv.setViewName("/publish/"+sitePath+"/prc_main");
		}else {
			mv.setViewName("redirect:/"+tiles+"/device.do");
		}
		
		if(!"".equals(msg)) {
			mv.addObject("msg", URLDecoder.decode(msg, "UTF-8")); // 현재 회원인증후 메세지
		}

		return mv;
		
	}
	
	
	@RequestMapping(value="/{tiles}/indexEn.do")
	public ModelAndView templateIndexEn(HttpServletRequest req
			, @PathVariable String tiles
			, @RequestParam(value = "msg", defaultValue = "") String msg
			, @RequestParam(value="inverter", defaultValue="all")String inverter
			) throws Exception {
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();

		//1호기 관련 데이터
		map.put("inverter", "one");
		mv.addObject("OneData",Component.getData("empc.ONE_getData",map));
		map.put("inverter", "two");
		//2호기 간단한 데이터(오늘날짜) 합계
		mv.addObject("TwoData",Component.getData("empc.ONE_getData",map));
		
		map.put("inverter", inverter);

//		mv.addObject("PredayData",Component.getListNoParam("empc.ONE_getList_Preday"));
		map.put("type", "day");
		mv.addObject("TodaySum",Component.getData("empc.ONE_sum_Today",map));
		mv.addObject("PredaySum",Component.getData("empc.ONE_sum_Preday",map));
		mv.addObject("MonSum",Component.getList("empc.ONE_sum_M",map));

		if("user".equals(tiles)){
			tiles = new TilesDTO().checkNull(null, req);
			mv.setViewName("redirect:/"+tiles+"/index.do");
			return mv;
		}
		
		String sitePath = SiteService.getSitePath(tiles);
		if(StringUtils.isEmpty(sitePath)){
			mv.setViewName("");
			return mv;
		}
		mv.setViewName("/user/"+sitePath+"/ems"+"/prc_main_en.en");
		
		if(!"".equals(msg)) {
			mv.addObject("msg", URLDecoder.decode(msg, "UTF-8")); // 현재 회원인증후 메세지
		}

		return mv;
		
	}
	
	
	
	/**
	 * 사용자 정의형 URL mapping
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   					 
	@RequestMapping(value = {"/{a}","/{a}/{b}","/{a}/{b}/{c}","/{a}/{b}/{c}/{d}","/{a}/{b}/{c}/{d}/{e}","/{a}/{b}/{c}/{d}/{e}/{f}"})
	@CheckActivityHistory
	public String userCustomURLMappingPatterns2(Model model
			, HttpServletRequest req
			, @RequestParam(value="MVH_KEYNO", required=false) String MVH_KEYNO
			) throws Exception{ 
		
		String URI = (String) req.getRequestURI();
		System.err.println("######### 901 : 사용자정의형 URL : " + URI );
		
		String tilesNm = URI.split("/")[1];
		
		Menu Menu = new Menu();
		Menu.setMN_URL(URI);
		Menu = Component.getData("Menu.AMN_getSimpleMenuByURL", Menu);		
		
		if( Menu != null ){
			
			String pageDiv = Menu.getMN_PAGEDIV_C();
			
			Integer key = Integer.parseInt(Menu.getMN_KEYNO().split("_")[1]);
			
			/* 메뉴가 게시판형일 경우 */
			if(SettingData.MENU_TYPE_BOARD.equals(pageDiv) && StringUtils.isNotEmpty(Menu.getMN_BT_KEYNO()) ){
				return "forward:/"+tilesNm+"/Board/main/"+ key +"/view.do";
			}
			
			/* 메뉴가 일반뷰형이거나 소개페이지일 경우 */
			if(SettingData.MENU_TYPE_PAGE.equals(pageDiv) || 
					( SettingData.MENU_TYPE_SUBMENU.equals(pageDiv) && StringUtils.isNotEmpty(Menu.getMN_FORWARD_URL()))){
				
				HashMap<String, Object> hTMLViewData = new HashMap<>();
				hTMLViewData = Component.getData("HTMLViewData.MVD_getData", Menu.getMN_KEYNO());
				model.addAttribute("HTMLViewData", hTMLViewData);
				if(hTMLViewData != null){

					SNSInfo SNSInfo = SNSInfoBuilder.Builder()
							.setTitle((String)hTMLViewData.get("MN_NAME"))
							.setDesc((String)hTMLViewData.get("VIEW_DATA"), true)
							.build();
					model.addAttribute("SNSInfo", SNSInfo);
					
					String returnPage= "/publish/"+hTMLViewData.get("HM_SITE_PATH").toString()+"/views/"+CommonPublishService.getFileName("page", (String)hTMLViewData.get("MN_KEYNO"),false); 
					System.out.println("returnPage :: " + returnPage);
					return returnPage;
				}
			}
			
			/* 메뉴가 링크형일 경우 */
			if(SettingData.MENU_TYPE_LINK.equals(pageDiv)){
				String forward = Menu.getMN_FORWARD_URL();			
				return "redirect:"+forward;
			}
		}
		
		
		return "";
		
	}
	
}
