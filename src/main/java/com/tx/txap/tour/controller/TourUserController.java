package com.tx.txap.tour.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.config.SettingData;
import com.tx.common.config.annotation.CheckActivityHistory;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;
import com.tx.txap.admin.code.service.CodeService;
import com.tx.txap.admin.site.service.SiteService;
import com.tx.txap.homepage.menu.dto.Menu;
import com.tx.txap.tour.dto.TourDTO;
import com.tx.txap.tour.service.TourService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 * 유저단 - 관광관리 컨트롤러
 * @author 이재령
 * @version 1.0
 * @since 2019-02-13
 */
@Controller
public class TourUserController {
	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	@Autowired CodeService CodeService;
	/** 페이지 처리 출 */
	@Autowired private PageAccess PageAccess;
	
	@Autowired SiteService SiteService;
	
	/** 관광정보관리 서비스 */
	@Autowired private TourService TourService;
	
	/**
	 * 관광지 정보 페이지
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = "/{tiles}/tour/{keyno:[\\d]+}/view.do")
	public ModelAndView tourInfo(HttpServletRequest req
			, @PathVariable String keyno
			, @PathVariable String tiles
			, @RequestParam(value="url3", required=false) String url3
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/user/"+SiteService.getSitePath(tiles)+"/tour/data/prc_tour_data");
		
		Menu Menu = new Menu();
		Menu.setMN_KEYNO(CommonService.getKeyno(keyno, "MN"));
		Menu = Component.getData("Menu.AMN_getMenuByKey", Menu);
		
		TourDTO tour = new TourDTO();
		tour.setTC_KEYNO(Menu.getMN_TOURKEY());
		tour.setTC_USE("Y");
		
		HashMap<String,Object> resultData = Component.getData("Tour.TC_getData",tour);
		
		if(resultData == null){
			return mv;
		}
		
		String category = CommonService.getTourCategoryName((String)resultData.get("TC_TYPE"));

		String query = TourService.getTourInfoFormData(mv,category,tour);
		
		HashMap<String, Object> data = Component.getData(query,tour);
		
		List<HashMap<String, Object>> dataList = TourService.getTourAvailableData(data);
		
		mv.addObject("resultList", dataList);
		
		if(category.equals("course")){
			List<HashMap<String, Object>> courseMenuList = Component.getList("Menu.get_CourseMenuList", Menu.getMN_KEYNO());
			List<HashMap<String, Object>> courseList = Component.getList("Tour.get_CourseList", resultData.get("TC_KEYNO"));
			mv.addObject("CourseMainName",Component.getData("Menu.get_CourseMainName",Menu.getMN_KEYNO()));
			mv.addObject("courseMenuList",courseMenuList);
			mv.addObject("courseList",courseList);
			mv.addObject("courseURL",Menu.getMN_URL());
			mv.addObject("url3",url3);
		}

		
		mv.addObject("category", category);
		
		mv.addObject("resultData", data);
		
		mv.addObject("imgList", Component.getList("Tour.TIM_getList",tour));
		
		mv.addObject("mirrorPage", Menu.getMN_URL());
		
		return mv;
	}
	

	
	/**
	 * 관광 소메뉴 이미지 팝업
	 * @param req
	 * @param TourDTO
	 * @param distance
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tour/SubMenu/imageViewAjax.do")
	public ModelAndView tourImagePopAjax(
			 HttpServletRequest req
			 , TourDTO tour
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/tour/tour/images/prc_tour_img_view");
		
		mv.addObject("imgList", Component.getList("Tour.TIM_getList",tour));
		
		return mv;
		
	}
	
	/**
	 * 관광 소메뉴 페이지
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = {"/tour/{url1}/{url2}/index.do","/tour/{url1}/{url2}/{url3}/index.do"})
	@CheckActivityHistory(desc="관광 소메뉴 페이지 방문")
	public ModelAndView tourSubMenu(HttpServletRequest req
			, @PathVariable String url1
			, @PathVariable String url2
			, @RequestParam(value="tripParameter", required=false) String tripParameter
			) throws Exception{
		ModelAndView mv  = new ModelAndView();
		
		
		String URI = (String) req.getRequestURI();
		Menu Menu = new Menu();
		Menu.setMN_URL(URI);
		Menu = Component.getData("Menu.AMN_getMenuByURL", Menu);
		
		String url3 = "";
		if(URI.split("/").length == 6){
			url3 = URI.split("/")[4];
		}
		
		String MN_KEYNO = Menu.getMN_KEYNO();
		
		List<Menu> list = Component.getList("Menu.get_subMenu", Menu);
		
		if(list != null && list.size() > 0){	//소메뉴 아래 소메뉴 탭으로 구분
			mv.addObject("resultList", list);
		}else{
			mv.addObject("SubMenuKey", MN_KEYNO);
		}
		
		
		String jspName = "/tour/tour/index/prc_tour_index";
		String searchYN = "Y";
		if(url2.equals("best")){
			jspName = jspName + "_" + url2; 
			mv.addObject("bestList",Component.getList("Tour.get_bestList", MN_KEYNO));
			searchYN = "N";
		}else if(url3.equals("night") || url3.equals("night2")){
			String MN_KEYNO2 = Component.getData("Menu.get_MenuKey",Menu);
			mv.addObject("SubSubMenuKey", MN_KEYNO2);
			searchYN = "N";
		}else if(url2.equals("camp")){
			mv.addObject("CampMenu", url2);
		}else if(url2.equals("course")){
			searchYN = "N";			
		}
		
		if(tripParameter != null){
			if(tripParameter.equals("space")){
				MN_KEYNO = "MN_0000001278";
			}else if(tripParameter.equals("nature")){
				MN_KEYNO = "MN_0000001280";
			}else if(tripParameter.equals("history")){
				MN_KEYNO = "MN_0000001284";
			}else if(tripParameter.equals("ship")){
				MN_KEYNO = "MN_0000001286";
			}else if(tripParameter.equals("fishing")){
				MN_KEYNO = "MN_0000001288";
			}else if(tripParameter.equals("walk")){
				MN_KEYNO = "MN_0000001291";
			}
			mv.addObject("SubMenuKey", MN_KEYNO);
		}
			
		
		mv.setViewName(jspName);
		mv.addObject("tiles","tour");
		mv.addObject("url1",url1);
		mv.addObject("url2",url2);
		mv.addObject("url3",url3);
		mv.addObject("searchYN",searchYN);
		
		return mv;
	}
	

	/**
	 * 관광 소메뉴 페이지 Paging
	 * @param req
	 * @param TourDTO
	 * @param distance
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value={"/tour/SubMenu/pageingAjax.do","/tour/SubMenu/{url2}/pageingAjax.do","/tour/SubMenu/{url2}/{url3}/pageingAjax.do"})
	public ModelAndView tourSubMenuAjax(
			HttpServletRequest req
			, Menu Menu
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView();
		
		String jspName = "/tour/tour/index/prc_tour_index_data";

		String URI = (String) req.getRequestURI();
		String url2 = "";
		String url3 = "";
		if(URI.split("/").length == 6){
			url2 = URI.split("/")[3];
			url3 = URI.split("/")[4];
			jspName = "/tour/tour/index/prc_tour_index_"+url2+"_"+url3;
		}else if(URI.split("/").length == 5){
			url2 = URI.split("/")[3];			
			jspName = "/tour/tour/index/prc_tour_index_"+url2;
		}
		
		String queryCnt = "Tour.get_submenuListCnt";
		String query = "Tour.get_submenuList";
		
		if(url3.equals("area") || url3.equals("night")){
			queryCnt = "Tour.get_CourseSubmenuListCnt";
			query = "Tour.get_CourseSubmenuList";
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("MN_MAINKEY", Menu.getMN_MAINKEY());
		map.put("searchKeyword", Menu.getSearchKeyword());
		map.put("searchCondition", Menu.getSearchCondition());
		
		PaginationInfo pageInfo = PageAccess.getPagInfo(Menu.getPageIndex(),queryCnt,map,6,5);
		map.put("firstIndex", pageInfo.getFirstRecordIndex()+1);
		map.put("lastIndex", pageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
		map.put("pageIndex", pageInfo.getCurrentPageNo());
		mv.addObject("paginationInfo", pageInfo);
		
		map.put("urlType", url2);
		
		List<HashMap<String,Object>> TourSubMenuList = Component.getList(query, map);
		mv.addObject("TourSubMenuList", TourSubMenuList);
		mv.setViewName(jspName);
		
		return mv;
		
	}
	
	/**
	 * 주변정보 보기
	 * @param req
	 * @param TourDTO
	 * @param distance
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/tour/around/searchAjax.do")
	public HashMap<String,Object> aroundSearchAjax(
			 HttpServletRequest req
			,TourDTO TourDTO
			,@RequestParam(value="distance", required=false) String distance
			) throws Exception{
		
		HashMap<String,Object> data = new HashMap<String,Object>();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("TC_LAT", TourDTO.getTC_LAT());
		map.put("TC_LNG", TourDTO.getTC_LNG());
		map.put("TC_TYPE", TourDTO.getTC_TYPE());
		map.put("TC_KEYNO", TourDTO.getTC_KEYNO());
		map.put("distance", distance);
		List<HashMap<String,Object>> list = Component.getList("Tour.get_aroundInfo2", map);
		
		for(Map<String,Object> b : list){
			String MenuType = null; 
			if(b.get("TR_DIVISION") != null){
				if(((String) b.get("TR_DIVISION")).contains(SettingData.TOUR_RESTAURANT_MODEL)){
					MenuType = "model";
				}else if(((String) b.get("TR_DIVISION")).contains(SettingData.TOUR_RESTAURANT_HYGIENIC)){
					MenuType = "hygienic";					
				}
			}
			if(b.get("TL_DIVISION") != null){
				MenuType = "area";
			}
			data.put("MenuType",MenuType);
		}
		data.put("list", list);
		return data;
	}
	
	
	/**
	 * 숙박 리스트
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = {"/tour/rest/lodgment/{typeInfo}.do", "/tour/rest/{typeInfo}.do"})
	public ModelAndView lodgInfo(HttpServletRequest req
			, @PathVariable String typeInfo
			, @RequestParam(value="TL_AREA", required=false) String TL_AREA
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/tour/tour/index/lodgment/prc_tour_index");
		String MenuTab = "N";
		String subMenuKey = null;
		if(typeInfo.equals("area")){
			MenuTab = "Y";
			mv.addObject("LodgmentAreaList",CodeService.getCodeListisUse("CR", true));
		}else if(typeInfo.equals("hotel")){
			subMenuKey = SettingData.TOUR_HOTEL;
		}else if(typeInfo.equals("motel")){
			subMenuKey = SettingData.TOUR_MOTEL;
		}
		mv.addObject("subMenuKey",subMenuKey);
		mv.addObject("MenuTab",MenuTab);
		mv.addObject("typeInfo",typeInfo);
		mv.addObject("searchYN","Y");
		mv.addObject("TL_AREA",TL_AREA);
		
		return mv;
	}
	
	/**
	 * 숙박 페이지 Paging
	 * @param req
	 * @param TourDTO
	 * @param distance
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tour/SubMenu/lodgment/pageingAjax.do")
	public ModelAndView lodgmentMenuAjax(
			HttpServletRequest req
			, TourDTO TourDTO
			, @RequestParam(value="type", required=false) String type
			, @RequestParam(value="typeInfo", required=false) String typeInfo
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView();
		
		String jspName = "/tour/tour/index/lodgment/prc_tour_index_data";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		
		List<HashMap<String, Object>> list = new ArrayList<>(); 
		List<HashMap<String, Object>> codeList = CodeService.getCodeListisUse("CH", true);
		int ListCnt = 6;
		map.put("addressCol", "TC_ADDR");
		if(typeInfo.equals("pension")){
			for (HashMap<String, Object> data : codeList) {
				HashMap<String, Object> codeData = new HashMap<>();
				if(data.get("SC_CODEVAL01") != null && !data.get("SC_CODEVAL01").equals("") && data.get("SC_CODEVAL01").equals("pension")){
					codeData.put("TL_DIVISION", data.get("SC_KEYNO"));
				}
				list.add(codeData);
			}
			map.put("DIVISION_KEYS", list);
			map.put("addressCol", "TL_EUB");
			map.put("OrderType", "TL_EUB");
			ListCnt = 20;
			jspName = "/tour/tour/index/lodgment/pension/prc_tour_index_data";
		}else if(typeInfo.equals("area")){
			for (HashMap<String, Object> data : codeList) {
				HashMap<String, Object> codeData = new HashMap<>();
				if(data.get("SC_CODEVAL01") != null && !data.get("SC_CODEVAL01").equals("") && data.get("SC_CODEVAL01").equals("lodgment")){
					codeData.put("TL_DIVISION", data.get("SC_KEYNO"));
				}
				list.add(codeData);
			}
			map.put("DIVISION_KEYS", list);
			map.put("OrderType", "TC_REGDT");
		}else{
			map.put("OrderType", "TC_REGDT");
			map.put("TL_DIVISION", TourDTO.getTL_DIVISION());
		}
			
		map.put("TL_AREA", TourDTO.getTL_AREA());
		map.put("searchKeyword", TourDTO.getSearchKeyword());
		map.put("searchCondition", TourDTO.getSearchCondition());
		
		PaginationInfo pageInfo = PageAccess.getPagInfo(TourDTO.getPageIndex(),"Tour.get_lodgmentCnt",map,ListCnt,5);
		map.put("firstIndex", pageInfo.getFirstRecordIndex()+1);
		map.put("lastIndex", pageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
		map.put("pageIndex", pageInfo.getCurrentPageNo());
		mv.addObject("paginationInfo", pageInfo);
		map.put("urlType", "");
		List<HashMap<String,Object>> TourSubMenuList = Component.getList("Tour.get_lodgmentList", map);
		mv.addObject("lodgmentMenuList", TourSubMenuList);
		mv.addObject("typeInfo", typeInfo);
		mv.setViewName(jspName);
		return mv;
		
		
	}
	
	/**
	 * 식당 리스트
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = "/tour/rest/restaurant/{typeInfo}.do")
	public ModelAndView restInfo(HttpServletRequest req
			, @PathVariable String typeInfo
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/tour/tour/index/restaurant/prc_tour_index");
		String subMenuKey = null;
		if(typeInfo.equals("model")){
			subMenuKey = SettingData.TOUR_RESTAURANT_MODEL;
		}else if(typeInfo.equals("hygienic")){
			subMenuKey = SettingData.TOUR_RESTAURANT_HYGIENIC;
		}
		mv.addObject("subMenuKey",subMenuKey);
		mv.addObject("typeInfo",typeInfo);
		
		return mv;
	}
	
	/**
	 * 식당 페이지 Paging
	 * @param req
	 * @param TourDTO
	 * @param distance
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/tour/SubMenu/restaurant/pageingAjax.do")
	public ModelAndView restaurantMenuAjax(
			HttpServletRequest req
			, TourDTO TourDTO
			, @RequestParam(value="typeInfo", required=false) String typeInfo
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView();
		
		String jspName = "/tour/tour/index/restaurant/prc_tour_index_data";
		int ListCnt = 6;
		if(typeInfo.equals("total")){
			ListCnt = 20;
			jspName = "/tour/tour/index/restaurant/total/prc_tour_index_data";
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("TR_DIVISION", TourDTO.getTR_DIVISION());
		map.put("typeInfo", typeInfo);
		map.put("searchKeyword", TourDTO.getSearchKeyword());
		map.put("searchCondition", TourDTO.getSearchCondition());
		
		PaginationInfo pageInfo = PageAccess.getPagInfo(TourDTO.getPageIndex(),"Tour.get_restaurantCnt",map,ListCnt,5);
		map.put("firstIndex", pageInfo.getFirstRecordIndex()+1);
		map.put("lastIndex", pageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
		map.put("pageIndex", pageInfo.getCurrentPageNo());
		mv.addObject("paginationInfo", pageInfo);
		
		List<HashMap<String,Object>> TourSubMenuList = Component.getList("Tour.get_restaurantList", map);
		mv.addObject("restaurantMenuList", TourSubMenuList);
		mv.addObject("typeInfo", typeInfo);
		mv.setViewName(jspName);
		
		return mv;
		
		
	}
	
	/**
	 * 숙박 정보 페이지
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = "/tour/tour/page/{keyno:[\\d]+}/view.do")
	public ModelAndView tourInfo2(HttpServletRequest req
			, @PathVariable String keyno
			, @RequestParam(value="typeInfo", required=false) String typeInfo
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/tour/tour/data/prc_tour_data");
		
		TourDTO tour = new TourDTO();
		tour.setTC_USE("Y");
		tour.setTC_KEYNO(CommonService.getKeyno(keyno, "TC"));
		HashMap<String,Object> resultData = Component.getData("Tour.TC_getData",tour);
		
		if(resultData == null){
			return mv;
		}
		
		String category = CommonService.getTourCategoryName((String)resultData.get("TC_TYPE"));
		
		String query = TourService.getTourInfoFormData(mv,category,tour);
		
		HashMap<String, Object> data = Component.getData(query,tour);
		
		mv.addObject("resultData", data);
		
		mv.addObject("category", category);
		
		mv.addObject("imgList", Component.getList("Tour.TIM_getList",tour));
		
		mv.addObject("listPageUrl","/tour/rest/"+category+"/"+typeInfo+".do");
		
		mv.addObject("mirrorPage", "/tour/rest/"+category+"/"+typeInfo+".do");
		
		
		return mv;
	}
	
	
	
	
	
	/**
	 * 동영상
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = "/tour/tour/movieOpenAjax.do")
	public ModelAndView movieOpenAjax(HttpServletRequest req
			, @RequestParam(value="name", required=false) String name
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/tour/tour/data/common/prc_tour_data_movie");
		mv.addObject("moviePath","/resources/tour/movie/"+name+".mp4");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
