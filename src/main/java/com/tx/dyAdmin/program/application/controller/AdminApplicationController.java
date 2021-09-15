package com.tx.dyAdmin.program.application.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.tx.common.config.SettingData;
import com.tx.common.config.annotation.CheckActivityHistory;
import com.tx.common.config.tld.SiteProperties;
import com.tx.common.dto.Common;
import com.tx.common.file.FileUploadTools;
import com.tx.common.file.dto.FileSub;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;
import com.tx.common.storage.service.StorageSelectorService;
import com.tx.dyAdmin.program.application.dto.ApplicationDTO;
import com.tx.dyAdmin.program.application.dto.PlaceDTO;
import com.tx.dyAdmin.program.application.dto.PlaceSeatDTO;
import com.tx.dyAdmin.program.application.service.ApplicationService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 
 * @FileName: AdminApplicationController.java
 * @Date    : 2018. 01. 18. 
 * @Author  : 이재령	
 * @Version : 1.0
 */
@Controller
public class AdminApplicationController {

	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	
	/** 파일업로드 툴*/
	@Autowired private FileUploadTools FileUploadTools;
	
	/** 신청프로그렘 서비스  */
	@Autowired private ApplicationService ApplicationService;
	
	/** 페이지 처리 출 */
	@Autowired private PageAccess PageAccess;
	
	@Autowired private StorageSelectorService StorageSelector;
	/**
	 * 프로그램 관리 - 신청관리
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/application/application.do")
	@CheckActivityHistory(desc="신청관리 페이지 방문")
	public ModelAndView programApplication(HttpServletRequest req
			,@RequestParam(value="MN_HOMEDIV_C",required=false) String MN_HOMEDIV_C
			,Map<String,Object> commandMap
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/application/pra_application.adm");
		
		String homeKey = null;
		if(StringUtils.isNotBlank(MN_HOMEDIV_C)){
			homeKey = MN_HOMEDIV_C;
		}else{
			String siteKey = (String)req.getSession().getAttribute("SITE_KEYNO");
			if(StringUtils.isNotBlank(siteKey)){
				homeKey = siteKey;
			}else{
				homeKey = SiteProperties.getString("HOMEPAGE_REP");
			}
		}
		
		mv.addObject("MN_HOMEDIV_C", homeKey);
		mv.addObject("homeDivList", CommonService.getHomeDivCode(false));
		
		return mv;
	}
	
	/**
	 * 프로그램 관리 - 신청관리 ajax
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/dyAdmin/program/application/applicationPaingAjax.do")
	public ModelAndView programApplicationAjax(HttpServletRequest req, Map<String,Object> commandMap,
			Common search
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/application/pra_application_data");
		mv.addObject("JangsoList", Component.getListNoParam("Place.PM_getList2"));
		
		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
		
		map.put("AP_MN_HOMEDIV_C", req.getParameter("MN_HOMEDIV_C"));
		
		PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),"Application.AP_getDataListCnt",map, search.getPageUnit(), 10);
		map.put("firstIndex", pageInfo.getFirstRecordIndex());
		map.put("lastIndex", pageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
		mv.addObject("paginationInfo", pageInfo);
		
		List<Map<String,Object>> list = Component.getList("Application.AP_getDataList", map);
		mv.addObject("resultList", list);
		mv.addObject("search", search);
		return mv;
	}
	
	// 프로그램 관리 - 신청관리  엑셀
	@RequestMapping(value="/dyAdmin/program/application/applicationExcelAjax.do")
	public Object programApplicationExcel(HttpServletRequest req
			, HttpServletResponse res
			, Common search
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/application/pra_application_excel");
		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		if(searchList != null){
			map.put("searchList", searchList);
		}
		map.put("AP_MN_HOMEDIV_C", req.getParameter("MN_HOMEDIV_C"));
		mv.addObject("resultList", Component.getList("Application.AP_getDataList", map));
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
	 * 프로그램 관리 - 프로그램 마감처리
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/dyAdmin/program/application/application/deadline.do")
	@CheckActivityHistory(desc="프로그램 마감처리", homeDiv= SettingData.HOMEDIV_ADMIN)
	public void programDeadline(
				    HttpServletRequest req
				  , @RequestParam(required=false, value="AP_KEYNO") String AP_KEYNO
				  , Map<String,Object> commandMap
			) throws Exception {
		
		Component.updateData("Application.AP_Deadline", AP_KEYNO);
		
	}
	
	/**
	 * 프로그램 관리 - 신청자리스트
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/application/applicationApply.do")
	@CheckActivityHistory(desc="신청 프로그램 신청자 리스트 페이지 방문")
	public ModelAndView programApplicationApply(HttpServletRequest req,
			@RequestParam(value="MN_HOMEDIV_C",required=false) String MN_HOMEDIV_C,
			Map<String,Object> commandMap
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/application/pra_applicantList.adm");
		ApplicationService.checkExpiredDate("ApplyView",req);
		ApplicationService.ViewExpiredDate("ApplyView",req);
		
		String homeKey = null;
		if(StringUtils.isNotBlank(MN_HOMEDIV_C)){
			homeKey = MN_HOMEDIV_C;
		}else{
			String siteKey = (String)req.getSession().getAttribute("SITE_KEYNO");
			if(StringUtils.isNotBlank(siteKey)){
				homeKey = siteKey;
			}else{
				homeKey = SiteProperties.getString("HOMEPAGE_REP");
			}
		}
		
		mv.addObject("MN_HOMEDIV_C", homeKey);
		mv.addObject("homeDivList", CommonService.getHomeDivCode(false));
		
		return mv;
	}
	
	/**
	 * 프로그램 관리 - 신청자리스트ajax
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/dyAdmin/program/application/applicationApply/pagingAjax.do")
	public ModelAndView programApplicationApplyAjax(
				HttpServletRequest req
				, Common search
				, ApplicationDTO ApplicationDTO
			) throws Exception {
	
        ModelAndView mv  = new ModelAndView("/dyAdmin/program/application/pra_applicantList_data");
       
        List<HashMap<String,Object>> searchList = Component.getSearchList(req);
        Map<String,Object> map = CommonService.ConverObjectToMap(search);
       
        if(searchList != null){
            map.put("searchList", searchList);
        }
        
		map.put("AP_MN_HOMEDIV_C", req.getParameter("MN_HOMEDIV_C"));
        
        PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),"Application.APP_ApplicantListCnt",map, search.getPageUnit(), 10);
        map.put("firstIndex", pageInfo.getFirstRecordIndex());
        map.put("lastIndex", pageInfo.getLastRecordIndex());
        map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
        mv.addObject("paginationInfo", pageInfo);
        //가저올데이터
        mv.addObject("resultList", Component.getList("Application.APP_ApplicantList", map));
        mv.addObject("search", search);
        return mv;
	}
	
	// 프로그램 관리 - 신청자 관리  엑셀
	@RequestMapping(value="/dyAdmin/program/application/applicationApply/excelAjax.do")
	public Object programApplicationApplyExcel(HttpServletRequest req
			, HttpServletResponse res
			, Common search
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/application/pra_applicantList_excel");
		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		if(searchList != null){
			map.put("searchList", searchList);
		}
		map.put("AP_MN_HOMEDIV_C", req.getParameter("MN_HOMEDIV_C"));
		mv.addObject("resultList", Component.getList("Application.APP_ApplicantList", map));
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
	 * 신청프로그램 관리 - 신청자 상세정보
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/application/applicationApplyDetail.do")
	@CheckActivityHistory(desc="신청자 상세정보 페이지 방문")
	public ModelAndView programApplyDetail(
			 HttpServletRequest req
			, @RequestParam(value="key") String key
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/application/pra_applicationDetail.adm");
		mv.addObject("applicantData", Component.getData("mypage.program_apply_detail", key));	//신청자 정보
		mv.addObject("applicantSaleList", Component.getList("mypage.program_sale_detail", key));	//할인 종류
		mv.addObject("mirrorPage", "/dyAdmin/program/application/applicationApply.do");
		return mv;
	}
	
	/**
	 * 등록/수정 페이지 방문
	 * @param req
	 * @param commandMap
	 * @param ApplicationDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/application/actionView.do")
	@CheckActivityHistory(desc="신청관리 - 등록/수정 페이지 방문")
	public ModelAndView programApplicationActionView(
			HttpServletRequest req
			,Map<String,Object> commandMap
			,ApplicationDTO ApplicationDTO
			,@RequestParam (value="key" ,required=false) String key
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/application/pra_application_insert.adm");
		
		if(StringUtils.isNotEmpty(key)) ApplicationDTO.setAP_KEYNO(key);
		
		if(StringUtils.isNotEmpty(ApplicationDTO.getAP_KEYNO())){
			mv.addObject("resultData", Component.getData("Application.AP_getData", ApplicationDTO));
			mv.addObject("ApplyCnt", Component.getData("Application.ApplyCnt", ApplicationDTO));
			mv.addObject("ScheduleMain", Component.getList("Application.ScheduleMain", ApplicationDTO));
			mv.addObject("ScheduleSub", Component.getList("Application.ScheduleSub", ApplicationDTO));
			mv.addObject("action", "Update");
		}else{
			mv.addObject("action", "Insert");
		}
		
		mv.addObject("AP_MN_HOMEDIV_C", ApplicationDTO.getAP_MN_HOMEDIV_C());
		mv.addObject("placeList", Component.getListNoParam("Place.PM_getList"));
		mv.addObject("discountList", Component.getListNoParam("Application.AD_getAllList"));
		mv.addObject("mirrorPage", "/dyAdmin/program/application/application.do");
		
		return mv;
	}
	

	/**신청관리 등록/수정/삭제 작업
	 * @param req
	 * @param commandMap
	 * @param ApplicationDTO
	 * @param schduleGroupData
	 * @param AD_KEYNO
	 * @param action
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/application/action.do")
	@CheckActivityHistory(desc="신청관리 - 등록/수정/삭제 작업", homeDiv= SettingData.HOMEDIV_ADMIN)
	@Transactional
	public ModelAndView programApplicationAction(HttpServletRequest req
			, ApplicationDTO ApplicationDTO
			, @RequestParam(value="schduleGroupData", required = false ) String schduleGroupData
			, @RequestParam(value="AD_KEYNO", required = false ) String AD_KEYNO[]
			, @RequestParam(value="action", required = false ) String action
			) throws Exception {
		ModelAndView mv  = new ModelAndView("redirect:/dyAdmin/program/application/application.do");
		Map<String,Object> user = CommonService.getUserInfo(req);
		String AP_KEYNO = "";
		
		if("Insert".equals(action)){
		  //등록 작업
		  ApplicationDTO.setAP_REGNM((String)user.get("UI_KEYNO"));
		  Component.createData("Application.AP_insertData", ApplicationDTO);
		  AP_KEYNO = ApplicationDTO.getAP_KEYNO();
		  //스케쥴 셋팅
		  setSchedule(AP_KEYNO,schduleGroupData);
		}else if("Update".equals(action)){
		  //수정 작업
		  ApplicationDTO.setAP_MODNM((String)user.get("UI_KEYNO"));
		  AP_KEYNO = ApplicationDTO.getAP_KEYNO();
		  Component.updateData("Application.AP_updateData", ApplicationDTO);
		  
		  if("O".equals(ApplicationDTO.getApp_type())) {
		    //스케쥴 셋팅
		    Component.deleteData("Application.ASS_deleteData", ApplicationDTO);
		    Component.deleteData("Application.ASM_deleteData", ApplicationDTO);
			setSchedule(AP_KEYNO,schduleGroupData);
		  }
		  
		}else{
			//삭제 작업
			Component.updateData("Application.AP_deleteData", ApplicationDTO);
		}
		
		if(!"Delete".equals(action)){
			//할인정책
			HashMap<String,Object> adMap = new HashMap<String,Object>();
			adMap.put("AP_KEYNO", AP_KEYNO);
			if("Update".equals(action))Component.deleteData("Application.AD_deleteSelectData", adMap);
			if(AD_KEYNO != null){
			  adMap.put("adList", AD_KEYNO);
			  Component.createData("Application.AD_insertSelectData", adMap);
			}
		}

		return mv;
	}
	
	private void setSchedule(String AP_KEYNO, String schduleGroupData) {
		//다시 배열로 만들기
		
		schduleGroupData = schduleGroupData.replaceAll("&quot;", "\"");
		
		JsonParser parser = new JsonParser();	
		JsonElement element = parser.parse(schduleGroupData);
		JsonArray schduleGrouplist =  element.getAsJsonArray();
	      
	    for(JsonElement schduleGroup : schduleGrouplist){
	    
	       if(!schduleGroup.isJsonNull()){
	    	  ApplicationDTO mainGroup = new ApplicationDTO();
		       
	          String st_date = schduleGroup.getAsJsonObject().get("st_date").getAsString();
	          String en_date = schduleGroup.getAsJsonObject().get("en_date").getAsString();
	            
	          JsonArray days = schduleGroup.getAsJsonObject().get("day").getAsJsonArray();
	          
	          if(!days.isJsonNull()) {
	        	  String GSM_DAY = "";
	         	for (int i=0;i<days.size();i++) {
	         		if(i != 0) {
	         			GSM_DAY += ",";
	         		}
	         		GSM_DAY += days.get(i).getAsString();
	         	}
	         	mainGroup.setASM_DAY(GSM_DAY);
	          }
	            
	          JsonArray times =  schduleGroup.getAsJsonObject().get("times").getAsJsonArray();
	          
	          if(!times.isJsonNull()){
	        	  
			      mainGroup.setASM_AP_KEYNO(AP_KEYNO);
	        	  
			      //스케줄 메인 등록
		          mainGroup.setASM_STDT(st_date);
		          mainGroup.setASM_ENDT(en_date);
		             
		          Component.createData("Application.ASM_insertData", mainGroup); 
			      
	              for(JsonElement timeData : times){
	            	  ApplicationDTO subGroup = new ApplicationDTO();
	            	  subGroup.setASS_ASM_KEYNO(mainGroup.getASM_KEYNO());
	            	
	           	   	  String st_h = timeData.getAsJsonObject().get("st_h").getAsString();
	           	      String en_h = timeData.getAsJsonObject().get("en_h").getAsString();
	           	      String cnt = timeData.getAsJsonObject().get("cnt").getAsString();
	           	      String title = timeData.getAsJsonObject().get("title").getAsString();
	           	      String start_time = st_h;
	           	      String end_time = en_h;
	           	    
	           	      subGroup.setASS_ST_TIME(start_time);
	           	      if(en_h != null && !en_h.equals("")) {
	           	    	  subGroup.setASS_EN_TIME(end_time);		           	    	
	           	      }
	           	      subGroup.setASS_MAXIMUM(cnt);
	           	      subGroup.setASS_SUBTITLE(title);
	           	      Component.createData("Application.ASS_insertData", subGroup);
	             }
	             
	         }
	          
	      }
	   }
	}

	
	/**
	 * 장소 관리 - 추가 
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   					 
	@RequestMapping(value = "/dyAdmin/program/placeList/insert.do")
	@CheckActivityHistory(desc = "장소 추가 작업", homeDiv= SettingData.HOMEDIV_ADMIN)
	@Transactional
	public String programPlaceListInsert(Model model,
			PlaceDTO pm,
			@RequestParam(value="insertPlaceImg", required = false) MultipartFile thumbnail,
			@RequestParam(value="insertPlaceSeatImg", required = false) MultipartFile SeatBackground,
			@RequestParam(value="seatGroupData", required = false) String seatGroupData,
			HttpServletRequest req) throws Exception{ 
		
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		String REGNM = (String) user.get("UI_KEYNO");
		
		String fmKey = null;
		//장소 이미지 넣기 
		FileSub FileSub = new FileSub();
		if(thumbnail != null && !thumbnail.isEmpty()) {
			fmKey = FileUploadTools.updateFileMain(null, FileSub, REGNM);
			FileSub.setFS_FM_KEYNO(fmKey);
			FileSub = FileUploadTools.FileUpload(thumbnail, FileSub, REGNM, true, req);
			pm.setPM_FS_KEYNO(FileSub.getFS_KEYNO());
		}else{
			pm.setPM_FS_KEYNO(null);
		}

		//좌석 배경 이미지 넣기 
		FileSub FileSub2 = new FileSub();
		if(SeatBackground != null && !SeatBackground.isEmpty()) {
			FileSub2.setFS_FM_KEYNO(fmKey);
			FileSub2 = FileUploadTools.FileUpload(SeatBackground, FileSub2, REGNM, true, req);
			pm.setPM_SEAT_FS_KEYNO(FileSub2.getFS_KEYNO());
		}else{
			pm.setPM_SEAT_FS_KEYNO(null);
		}
		
		
		String PM_KEYNO = CommonService.getTableKey("PM");
		pm.setPM_KEYNO(PM_KEYNO);
		
		Component.createData("Place.PM_insertData", pm);
		
		if(pm.getPM_SEATPLAN_YN().equals("Y") && seatGroupData != null){ //좌석배치도 셋팅
			insertSeatGroupData(seatGroupData,PM_KEYNO);
		}
		
		return "redirect:/dyAdmin/program/placeList.do";
	}
	
	/**
	 * 좌석배치도 저장
	 * @param seatGroupData
	 * @param PM_KEYNO
	 */
	private void insertSeatGroupData(String seatGroupData, String PM_KEYNO) {
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(seatGroupData);
		JsonArray seatGrouplist =  element.getAsJsonArray();
		List<PlaceSeatDTO> seatMainList = new ArrayList<PlaceSeatDTO>();
		List<PlaceSeatDTO> seatSubList = new ArrayList<PlaceSeatDTO>();
		PlaceSeatDTO seatMain = null;
		PlaceSeatDTO seatSub = null;
		for(JsonElement seatGroup : seatGrouplist){
			if(!seatGroup.isJsonNull()){
				
				seatMain = new PlaceSeatDTO();
				
				String title = seatGroup.getAsJsonObject().get("title").getAsString();
				int row = seatGroup.getAsJsonObject().get("row").getAsInt();
				int col = seatGroup.getAsJsonObject().get("col").getAsInt();
				int top = seatGroup.getAsJsonObject().get("top").getAsInt();
				int left = seatGroup.getAsJsonObject().get("left").getAsInt();
				String PSM_KEYNO = CommonService.getTableKey("PSM");
				seatMain.setPSM_KEYNO(PSM_KEYNO);
				seatMain.setPSM_PM_KEYNO(PM_KEYNO);
				seatMain.setPSM_NAME(title);
				seatMain.setPSM_ROW(row);
				seatMain.setPSM_COL(col);
				seatMain.setPSM_TOP(top);
				seatMain.setPSM_LEFT(left);
				seatMainList.add(seatMain);
				
				JsonArray table =  seatGroup.getAsJsonObject().get("table").getAsJsonArray();
				if(!table.isJsonNull()){
					for(int i=0;i<table.size();i++){
						JsonArray rowData =  table.get(i).getAsJsonArray();
						for(int j=0;j<rowData.size();j++){
							seatSub = new PlaceSeatDTO();
							
							seatSub.setPSS_KEYNO(CommonService.getTableKey("PSS"));
							seatSub.setPSS_PSM_KEYNO(PSM_KEYNO);
							seatSub.setPSS_ROW(i);
							seatSub.setPSS_COL(j);
							seatSub.setPSS_CODE(rowData.get(j).getAsString());
							
							seatSubList.add(seatSub);
						}
					}
				}
				
			}
		}
		
		if(seatMainList.size() > 0){
			HashMap<String,Object> map = new HashMap<String,Object>();
			
			map.put("seatMainList", seatMainList);
			Component.createData("Place.PSM_insertData", map);
			map.put("seatSubList", seatSubList);
			Component.createData("Place.PSS_insertData", map);
			
		}
	}

	/**
	 * 장소 관리 - 수정
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   					 
	@RequestMapping(value = "/dyAdmin/program/placeList/update.do")
	@CheckActivityHistory(desc = "장소 수정 작업", homeDiv= SettingData.HOMEDIV_ADMIN)
	@Transactional
	public String programPlaceListUpdate(Model model,
			PlaceDTO pm,
			@RequestParam(value="insertPlaceImg", required = false ) MultipartFile thumbnail,
			@RequestParam(value="insertPlaceSeatImg", required = false ) MultipartFile SeatBackground,
			@RequestParam(value="seatGroupData", required = false ) String seatGroupData,
			HttpServletRequest req) throws Exception{ 
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		String REGNM = (String) user.get("UI_KEYNO");
		
		//장소 이미지 넣기
		FileSub FileSub = null;
		if(thumbnail != null && !thumbnail.isEmpty()) {
			FileSub fileSub = new FileSub().IS_RESIZE().RESIZE_WIDTH(SettingData.DEFAULT_IMG_RESIZE_WIDTH).RESIZE_HEIGHT(SettingData.DEFAULT_IMG_RESIZE_HEIGHT);
			if(StringUtils.isNotEmpty(pm.getPM_FS_KEYNO())){
				fileSub.setFS_KEYNO(pm.getPM_FS_KEYNO());
			}
			FileSub = FileUploadTools.FileUpload(thumbnail, REGNM, fileSub, req);
			pm.setPM_FS_KEYNO(FileSub.getFS_KEYNO());
		}else{
			pm.setPM_FS_KEYNO(null);
		}
		
		//좌석 배경 이미지 넣기 
		FileSub FileSub2 = null;
		if(SeatBackground != null && !SeatBackground.isEmpty()) {
			FileSub fileSub2 = new FileSub().IS_RESIZE().RESIZE_WIDTH(SettingData.DEFAULT_IMG_RESIZE_WIDTH).RESIZE_HEIGHT(SettingData.DEFAULT_IMG_RESIZE_HEIGHT);
			if(StringUtils.isNotEmpty(pm.getPM_SEAT_FS_KEYNO())){
				fileSub2.setFS_KEYNO(pm.getPM_SEAT_FS_KEYNO());
			}
			FileSub2 = FileUploadTools.FileUpload(SeatBackground, REGNM, fileSub2, req);
			pm.setPM_SEAT_FS_KEYNO(FileSub2.getFS_KEYNO());
		}else{
			pm.setPM_SEAT_FS_KEYNO(null);
		}
		
		
		Component.updateData("Place.PM_updateData", pm);
		
		if(pm.getPM_SEATPLAN_YN().equals("Y") && seatGroupData != null){ //좌석배치도 셋팅
			String PM_KEYNO = pm.getPM_KEYNO();
			Component.deleteData("PSM_deleteData", PM_KEYNO);
			Component.deleteData("PSS_deleteData", PM_KEYNO);
			
			insertSeatGroupData(seatGroupData,PM_KEYNO);
		}
		
		return "redirect:/dyAdmin/program/placeList.do";
	}
	
	/**
	 * 장소 관리 - 삭제
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 * 
	 */   					 
	@RequestMapping(value = "/dyAdmin/program/placeList/delete.do")
	@CheckActivityHistory(desc = "장소 삭제 작업", homeDiv= SettingData.HOMEDIV_ADMIN)
	@Transactional
	public String programPlaceListDelete(Model model,
			PlaceDTO pm,
			HttpServletRequest req) throws Exception{ 
		
		Component.updateData("Place.PM_deleteData", pm);
		
		return "redirect:/dyAdmin/program/placeList.do";
	}
	
	
	/**
	 * 프로그램 관리 - 장소관리
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/placeList.do")
	@CheckActivityHistory(desc="장소관리 페이지 방문")
	public ModelAndView programPlaceList(HttpServletRequest req, Map<String,Object> commandMap
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/place/pra_placelist.adm");
		
		return mv;
	}
	
	/**
	 * 프로그램 관리 - 장소관리Ajax
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/dyAdmin/program/placeList/paingAjax.do")
	public ModelAndView programPlaceListAjax(
				HttpServletRequest req
				, Common search
				, PlaceDTO place
			) throws Exception {
        ModelAndView mv  = new ModelAndView("/dyAdmin/program/place/pra_placelist_data");
       
        List<HashMap<String,Object>> searchList = Component.getSearchList(req);
        Map<String,Object> map = CommonService.ConverObjectToMap(search);
       
        if(searchList != null){
            map.put("searchList", searchList);
        }
        PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),"Place.PM_getDataListCnt",map, search.getPageUnit(), 10);
        map.put("firstIndex", pageInfo.getFirstRecordIndex());
        map.put("lastIndex", pageInfo.getLastRecordIndex());
        map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
        mv.addObject("paginationInfo", pageInfo);
        //가저올데이터
        List<HashMap<String, Object>> resultList = Component.getList("Place.PM_getDataList", map);
        StorageSelector.getImgPath(resultList);
        mv.addObject("resultList", resultList);
        mv.addObject("search", search);
        return mv;
	}
	
	// 프로그램 관리 - 장소관리 엑셀
	@RequestMapping(value="/dyAdmin/program/placeList/excelAjax.do")
	public Object programPlaceListExcel(HttpServletRequest req
			, HttpServletResponse res
			, Common search
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/place/pra_placelist_excel");
		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		if(searchList != null){
			map.put("searchList", searchList);
		}
		mv.addObject("resultList", Component.getList("Place.PM_getDataList", map));
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
	 * 프로그램 관리 - 장소관리 - 등록 화면
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/placeList/insertView.do")
	@CheckActivityHistory(desc="장소관리 페이지 방문")
	public ModelAndView programPlaceListInsertView(HttpServletRequest req, Map<String,Object> commandMap
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/place/pra_place_insertView.adm");
		mv.addObject("mirrorPage", "/dyAdmin/program/placeList.do");
		mv.addObject("action", "Insert");
		return mv;
	}
	
	/**
	 * 프로그램 관리 - 장소관리 - 수정 화면
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/placeList/updateView.do")
	@CheckActivityHistory(desc="장소관리 페이지 방문")
	public ModelAndView programPlaceListUpdateView(HttpServletRequest req, Map<String,Object> commandMap
			, @RequestParam(value="key", required=false) String key
			, PlaceDTO place
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/place/pra_place_insertView.adm");
		
		place.setPM_KEYNO(CommonService.getKeyno(key, "PM"));
		HashMap<String,Object> resultData = Component.getData("Place.PM_getList",place); 
		StorageSelector.getImgPath(resultData);
		StorageSelector.getImgPath(resultData,"SEATBACKGROUND");
		mv.addObject("resultData", resultData);// 데이터 가져옴
		
		String PM_SEATPLAN_YN = (String)resultData.get("PM_SEATPLAN_YN");
		
		if("Y".equals(PM_SEATPLAN_YN)){
			List<HashMap<String,Object>> seatMainList = Component.getList("Place.PSM_getList", place);
			
			if(seatMainList != null && seatMainList.size() > 0){
				
				JSONArray list = new JSONArray();
				for(HashMap<String,Object> seatMain : seatMainList){
					JSONObject obj = new JSONObject();
					obj.put("title", (String)seatMain.get("PSM_NAME"));
					obj.put("row", seatMain.get("PSM_ROW"));
					obj.put("col", seatMain.get("PSM_COL"));
					obj.put("top", seatMain.get("PSM_TOP"));
					obj.put("left", seatMain.get("PSM_LEFT"));
					JSONArray table = new JSONArray();
					String data = (String)seatMain.get("DATA");
					String rowList[] = data.split("\\|");
					for(String row : rowList){
						JSONArray colData = new JSONArray();
						String colList[] = row.split(",");
						for(String col : colList){
							colData.put(col);
						}
						table.put(colData);
					}
					obj.put("table", table);
					list.put(obj);
				}
				
				mv.addObject("seatGroups", list.toString());
			}
		}
		
		
		
		mv.addObject("mirrorPage", "/dyAdmin/program/placeList.do");
		mv.addObject("action", "Update");
		return mv;
	}
	
	/**
	 * 프로그램 관리 - 할인정책관리 리스트
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/discount.do")
	@CheckActivityHistory(desc="할인정책관리 페이지 방문")
	public ModelAndView programDiscount(HttpServletRequest req, Map<String,Object> commandMap
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/discount/pra_discount.adm");
		return mv;
	}
	
	/**
	 * 프로그램 관리 - 할인정책관리 - Ajax
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/dyAdmin/program/discount/pagingAjax.do")
	public ModelAndView programDiscountAjax(
				HttpServletRequest req
				, Common search
				, ApplicationDTO ApplicationDTO
			) throws Exception {
        ModelAndView mv  = new ModelAndView("/dyAdmin/program/discount/pra_discount_data");
       
        List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
       
        if(searchList != null){
            map.put("searchList", searchList);
        }
        PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),"Application.AD_getListCnt",map, search.getPageUnit(), 10);
        map.put("firstIndex", pageInfo.getFirstRecordIndex());
        map.put("lastIndex", pageInfo.getLastRecordIndex());
        map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
        mv.addObject("paginationInfo", pageInfo);
        //가저올데이터
        mv.addObject("resultList", Component.getList("Application.AD_getList", map));
        mv.addObject("search", search);
        return mv;
	}
	
	// 프로그램 관리 - 할인정책관리 엑셀
	@RequestMapping(value="/dyAdmin/program/discount/excelAjax.do")
	public Object programDiscountExcel(HttpServletRequest req
			, HttpServletResponse res
			, Common search
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/dyAdmin/program/discount/pra_discount_excel");
		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		if(searchList != null){
			map.put("searchList", searchList);
		}
		mv.addObject("resultList", Component.getList("Application.AD_getList", map));
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
	 * 프로그램 관리 - 할인정책관리 - 데이터 가져오기
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/dyAdmin/program/discount/dataAjax.do")
	@ResponseBody
	public Map programDiscountDelete(HttpServletRequest req
			, ApplicationDTO ApplicationDTO
			) throws Exception {
		
		ApplicationDTO.setAD_KEYNO(CommonService.getKeyno(ApplicationDTO.getAD_KEYNO(), "AD"));
		
		return Component.getData("Application.AD_getData", ApplicationDTO);
	}
	
	
	/**
	 * 프로그램 관리 - 할인정책관리 - 저장
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/discount/insert.do")
	@CheckActivityHistory(desc="할인정책 등록 작업", homeDiv= SettingData.HOMEDIV_ADMIN)
	public ModelAndView programDiscountInsert(HttpServletRequest req
			, ApplicationDTO ApplicationDTO
			) throws Exception {
		ModelAndView mv  = new ModelAndView("redirect:/dyAdmin/program/discount.do");
		
		ApplicationDTO.setAD_KEYNO(CommonService.getTableKey("AD"));
		Component.createData("Application.AD_insertData", ApplicationDTO);
		
		
		return mv;
	}
	
	/**
	 * 프로그램 관리 - 할인정책관리 - 수정
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/discount/update.do")
	@CheckActivityHistory(desc="할인정책 수정 작업", homeDiv= SettingData.HOMEDIV_ADMIN)
	public ModelAndView programDiscountUpdate(HttpServletRequest req
			,@ModelAttribute ApplicationDTO ApplicationDTO
			) throws Exception {
		ModelAndView mv  = new ModelAndView("redirect:/dyAdmin/program/discount.do");
		
		Component.updateData("Application.AD_updateData", ApplicationDTO);
		
		return mv;
	}
	
	/**
	 * 프로그램 관리 - 할인정책관리 - 삭제
	 * @param req
	 * @param commandMap
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dyAdmin/program/discount/delete.do")
	@CheckActivityHistory(desc="할인정책 삭제 작업", homeDiv= SettingData.HOMEDIV_ADMIN)
	public ModelAndView programDiscountDelete(HttpServletRequest req
			, ApplicationDTO ApplicationDTO
			, @RequestParam("key") String key
			) throws Exception {
		ModelAndView mv  = new ModelAndView("redirect:/dyAdmin/program/discount.do");
		ApplicationDTO.setAD_KEYNO(CommonService.getKeyno(key, "AD"));
		Component.updateData("Application.AD_deleteData", ApplicationDTO);
		
		return mv;
	}
	
}
