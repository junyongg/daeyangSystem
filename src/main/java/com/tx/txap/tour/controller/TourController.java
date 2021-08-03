package com.tx.txap.tour.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringEscapeUtils;
import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.config.SettingData;
import com.tx.common.config.annotation.CheckActivityHistory;
import com.tx.common.dto.Common;
import com.tx.common.file.FileCommonTools;
import com.tx.common.storage.service.StorageSelectorService;
import com.tx.txap.admin.code.service.CodeService;
import com.tx.txap.tour.dto.TourDTO;
import com.tx.txap.tour.service.TourService;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 * 관리자 - 관광관리 컨트롤러
 * @author 이재령
 * @version 1.0
 * @since 2019-02-13
 */
@Controller
public class TourController {
	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	@Autowired CodeService CodeService;
	/** 페이지 처리 출 */
	@Autowired private PageAccess PageAccess;
	
	/** 관광정보관리 서비스 */
	@Autowired private TourService TourService;
	
	@Autowired private StorageSelectorService StorageSelector;
	
	@Autowired FileCommonTools FileCommonTools;

	
	/**
	 * 관광관리 페이지 - admin
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = "/txap/tour/info.do")
	@CheckActivityHistory(desc = "관광정보관리 페이지 방문")
	public ModelAndView tourInfo(HttpServletRequest req
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/txap/tour/info/pra_tour_list.adm");
		
		//관광정보 타입 리스트
		mv.addObject("tourInfoList",CodeService.getCodeListisUse("CF", true));
		
		return mv;
	}
	

	/**
	 * 관광관리 페이지 - 페이징 ajax
	 * @param req
	 * @param search
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/txap/tour/info/pagingAjax.do")
	public ModelAndView tourInfoPaging(HttpServletRequest req,
			Common search
			, @RequestParam(value="TC_TYPE", required=false) String TC_TYPE
			) throws Exception {
		
		
		ModelAndView mv  = new ModelAndView("/txap/tour/info/listView/pra_tour_list_data");

		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
		
		map.put("TC_TYPE", TC_TYPE);
		
		
		String query = TourService.getTourInfoPagingData(mv,"all",true);
		
		String queryCnt = query + "Cnt";
		
		
		PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),queryCnt,map, search.getPageUnit(), 10);
		
		map.put("firstIndex", pageInfo.getFirstRecordIndex());
		map.put("lastIndex", pageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
		
		mv.addObject("paginationInfo", pageInfo);
		
		mv.addObject("TourTypeList", CodeService.getCodeListisUse("CF", true));
		List<HashMap<String,Object>> resultList = Component.getList(query, map); 
		mv.addObject("resultList", resultList);
		mv.addObject("search", search);
		return mv;
		
		
	}
	
	/**
	 * 관광관리 페이지 - excel ajax
	 * @param req
	 * @param res
	 * @param search
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/txap/tour/info/excelAjax.do")
	public ModelAndView tourInfoExcelAjax(HttpServletRequest req
			, HttpServletResponse res
			, Common search
			, @RequestParam(value="TC_TYPE", required=false) String TC_TYPE
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/txap/tour/info/listView/pra_tour_list_excel");
		
		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
		
		map.put("TC_TYPE", TC_TYPE);
		
		String query = TourService.getTourInfoPagingData(mv,"all",false);
		
		List<HashMap<String,Object>> resultList = Component.getList(query, map); 
		mv.addObject("resultList", resultList);
		mv.addObject("search", search);
		
		try {
            
			Cookie cookie = new Cookie("fileDownload", "true");
	        cookie.setPath("/");
	        res.addCookie(cookie);
            
        } catch (Exception e) {
            System.out.println("쿠키 에러 :: "+e.getMessage());
        }
		return mv;
		
	}
	
	/**
	 * 관광관리 등록 페이지 - admin
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = "/txap/tour/info/insertView.do")
	@CheckActivityHistory(desc = "관광정보 등록 페이지 방문")
	public ModelAndView tourInfoInsertView(HttpServletRequest req
			, TourDTO tour
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/txap/tour/info/pra_tour_insertView.adm");
		
		//관광정보 타입 리스트
		mv.addObject("tourInfoList",CodeService.getCodeListisUse("CF", true));
		
		mv.addObject("tour", tour);
		
		mv.addObject("mirrorPage", "/txap/tour/info.do");
		return mv;
	}
	
	/**
	 * 
	 * @param req
	 * @param category	: 관광정보 타입
	 * @param formActionType : insert / update / copy 
	 * @param tour	: update / copy 시 TC_KEYNO 넘어옴
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/txap/tour/info/insertView/formAjax.do")
	public ModelAndView tourInfoInsertViewFormAjax(HttpServletRequest req
			, @RequestParam(value="category", required=false) String category
			, @RequestParam String formActionType
			, TourDTO tour
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView();
		
		mv.addObject("formActionType", formActionType);
		
		String categoryName = "";
		
		if(category != null && !category.isEmpty()){
			categoryName = CommonService.getTourCategoryName(category);
		}
		
		String query = TourService.getTourInfoFormData(mv,categoryName,tour);
		
		if(StringUtils.isNotEmpty(tour.getTC_KEYNO())){
			mv.addObject("resultData", Component.getData(query,tour));
			List<HashMap<String, Object>> imgList = Component.getList("Tour.TIM_getList",tour);
			StorageSelector.getImgPath(imgList);
			mv.addObject("imgList", imgList);
		}
		
		mv.addObject("category",category);
		mv.addObject("categoryName",categoryName);
//		mv.setViewName("/txap/tour/info/insertView/pra_tour_insertView_"+categoryName);
		mv.setViewName("/txap/tour/info/insertView/pra_tour_insertView_data");
		
		
		return mv;
	}
	
	/**
	 * 관광정보 등록
	 * @param req
	 * @param tour
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/txap/tour/info/insertAjax.do")
	@CheckActivityHistory(desc = "관광정보 등록 작업", homeDiv = SettingData.HOMEDIV_ADMIN)
	@ResponseBody
	@Transactional
	public TourDTO tourInfoInsert(HttpServletRequest req
			, TourDTO tour
			) throws Exception{
		
		tour.setTC_KEYNO(CommonService.getTableKey("TC"));
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		
		//이미지 업로드할 경우 이미지 경로 변경.
		tour.setTC_CONTENTS(FileCommonTools.editorImgCheck(tour.getTC_CONTENTS(), "tour"));
		
		String REGNM = (String)user.get("UI_KEYNO");
		tour.setTC_REGNM(REGNM);
		//관광정보 등록
		tour.setTC_CONTENTS(StringEscapeUtils.unescapeHtml3(tour.getTC_CONTENTS()));
		TourService.insertTourInfo(req,tour,REGNM);
		
		return tour;
		
	}
	
	@RequestMapping(value = "/txap/tour/info/updateAjax.do")
	@CheckActivityHistory(desc = "관광정보 수정 작업", homeDiv = SettingData.HOMEDIV_ADMIN)
	@ResponseBody
	@Transactional
	public TourDTO tourInfoUpdate(HttpServletRequest req
			, TourDTO tour
			, @RequestParam(value="TIM_FM_KEYNO",defaultValue="") String TIM_FM_KEYNO
			) throws Exception{
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		String REGNM = (String)user.get("UI_KEYNO");
		tour.setTC_MODNM(REGNM);
		
		//이미지 업로드할 경우 이미지 경로 변경.
		tour.setTC_CONTENTS(FileCommonTools.editorImgCheck(tour.getTC_CONTENTS(), "tour"));
		
		//관광정보 수정
		tour.setTC_CONTENTS(StringEscapeUtils.unescapeHtml3(tour.getTC_CONTENTS()));
		TourService.updateTourInfo(req,tour,REGNM,TIM_FM_KEYNO);
	
		return tour;
		
	}
	
	/**
	 * 관광정보 삭제
	 * @param req
	 * @param tour
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/txap/tour/info/deleteAjax.do")
	@CheckActivityHistory(desc = "관광정보 삭제 작업", homeDiv = SettingData.HOMEDIV_ADMIN)
	@ResponseBody
	@Transactional
	public boolean tourInfoDeleteAjax(HttpServletRequest req
			, TourDTO tour
			) throws Exception{
		boolean result = false;
		String ck = tour.getMENUYN();
		if(Integer.parseInt(ck) > 0){
			result = false;
		}else{
			tour.setTC_USE("D");
			Component.updateData("Tour.TC_deleteData", tour);
			result = true;
		}
		return result;
	}
	
	
	@RequestMapping(value = "/txap/tour/info/listAjax.do")
	public ModelAndView tourInfoListAjax(HttpServletRequest req
			, TourDTO tour
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/txap/tour/info/insertView/pra_tour_insertView_simpleList");
		
		
		mv.addObject("resultList", Component.getList("Tour.TC_getSimpleList", tour));
		
		return mv;
	}
	
	@RequestMapping(value = "/txap/tour/info/list2Ajax.do")
	@ResponseBody
	public List<Map<String,Object>> tourInfoLis2tAjax(HttpServletRequest req
			, TourDTO tour
			) throws Exception{
		
		return Component.getList("Tour.TC_getSimpleList", tour);
	}
	
	/**
	 * 관광사진관리 페이지 - admin
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   
	@RequestMapping(value = "/txap/tour/image.do")
	@CheckActivityHistory(desc = "관광사진관리 페이지 방문")
	public ModelAndView tourImage(HttpServletRequest req
			) throws Exception{
		
		ModelAndView mv  = new ModelAndView("/txap/tour/image/pra_tour_image_list.adm");
		
		return mv;
	}
	

	/**
	 * 관광사진관리 페이지 - 페이징 ajax
	 * @param req
	 * @param search
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/txap/tour/image/pagingAjax.do")
	public ModelAndView tourImagePaging(HttpServletRequest req,
			Common search
			) throws Exception {
		
		
		ModelAndView mv  = new ModelAndView("/txap/tour/image/pra_tour_image_list_data");

		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
		
		String query = "Tour.TIM_getPagingList";
		String queryCnt = query + "Cnt";
		
		
		PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),queryCnt,map, search.getPageUnit(), 10);
		
		map.put("firstIndex", pageInfo.getFirstRecordIndex());
		map.put("lastIndex", pageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
		
		mv.addObject("paginationInfo", pageInfo);
		
		List<HashMap<String,Object>> resultList = Component.getList(query, map); 
		StorageSelector.getImgPath(resultList);
		mv.addObject("resultList", resultList);
		mv.addObject("search", search);
		
		//관광정보 타입 리스트
		mv.addObject("tourInfoList",CodeService.getCodeListisUse("CF", true));
		
		return mv;
		
		
	}
	
	/**
	 * 관광사진관리 페이지 - excel ajax
	 * @param req
	 * @param res
	 * @param search
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/txap/tour/image/excelAjax.do")
	public ModelAndView tourImageExcelAjax(HttpServletRequest req
			, HttpServletResponse res
			, Common search
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/txap/tour/image/pra_tour_image_list_excel");
		
		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
		
		List<HashMap<String,Object>> resultList = Component.getList("Tour.TIM_getPagingList", map); 
		mv.addObject("resultList", resultList);
		mv.addObject("search", search);
		
		try {
            
			Cookie cookie = new Cookie("fileDownload", "true");
	        cookie.setPath("/");
	        res.addCookie(cookie);
            
        } catch (Exception e) {
            System.out.println("쿠키 에러 :: "+e.getMessage());
        }
		return mv;
		
	}
	
			
}
