package com.tx.txap.tour.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.file.FileCommonTools;
import com.tx.common.file.FileUploadTools;
import com.tx.common.file.dto.FileSub;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.storage.service.StorageSelectorService;
import com.tx.txap.admin.code.service.CodeService;
import com.tx.txap.tour.dto.TourDTO;
import com.tx.txap.tour.service.TourService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("TourService")
public class TourServiceImpl extends EgovAbstractServiceImpl implements TourService {
	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	@Autowired CodeService CodeService;
	/** 파일업로드 툴*/
	@Autowired private FileUploadTools FileUploadTools;
	
	@Autowired FileCommonTools FileCommonTools;
	
	@Autowired private StorageSelectorService StorageSelector;
	
//	private final String CHECK_STRORAGE_STR = "do?file=";
	
	/**
	 * 관광정보 등록
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	@Override
	public void insertTourInfo(HttpServletRequest req, TourDTO tour, String REGNM) throws Exception{
		//관광정보 이미지 등록
		insertTourInfoImg(req,tour,REGNM);
		
		Component.createData("Tour.TC_insertData", tour);
		
		
		String categoryName = CommonService.getTourCategoryName(tour.getTC_TYPE());
		
		switch (categoryName) {
		case "destination":
			
			/** 이용안내 테이블*/
			tour.setTI_KEYNO(CommonService.getTableKey("TI"));
			Component.createData("Tour.TI_insertData", tour);
			
			/** 관광명소 테이블 */
			tour.setTA_KEYNO(CommonService.getTableKey("TA"));
			Component.createData("Tour.TA_insertData", tour);
			
			break;
		case "course":
			
			insertTourInfoCourse(req,tour,REGNM);
			
			break;
		case "theme":
			
			/** 이용안내 테이블*/
			tour.setTI_KEYNO(CommonService.getTableKey("TI"));
			Component.createData("Tour.TI_insertData", tour);
			
			/** 테마 테이블 */
			tour.setTT_KEYNO(CommonService.getTableKey("TT"));
			Component.createData("Tour.TT_insertData", tour);
			
			break;
		case "lodgment":
			
			/** 숙박 테이블 */
			insertTourInfoLodgment(req,tour,REGNM);
			
			break;
		case "restaurant":
			
			insertTourInfoRestaurant(req,tour,REGNM);
			
			break;
		case "culturalheritage":
			
			/** 이용안내 테이블*/
			tour.setTI_KEYNO(CommonService.getTableKey("TI"));
			Component.createData("Tour.TI_insertData", tour);
			
			/** 문화재 테이블 */
			tour.setTCH_KEYNO(CommonService.getTableKey("TCH"));
			Component.createData("Tour.TCH_insertData", tour);
			
			break;
		case "festival":
			
			tour.setTF_CONTENTS(StringEscapeUtils.unescapeHtml3(tour.getTF_CONTENTS()));
			/** 이용안내 테이블*/
			tour.setTI_KEYNO(CommonService.getTableKey("TI"));
			Component.createData("Tour.TI_insertData", tour);
			
			/** 축제 테이블 */
			tour.setTF_KEYNO(CommonService.getTableKey("TF"));
			Component.createData("Tour.TF_insertData", tour);
			
			break;

		default:
			break;
		}
		
	}
	/**
	 * 관광정보 - 코스 등록
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void insertTourInfoCourse(HttpServletRequest req, TourDTO tour, String REGNM) throws Exception {
		
		/** 이용안내 테이블*/
		tour.setTI_KEYNO(CommonService.getTableKey("TI"));
		Component.createData("Tour.TI_insertData", tour);
		
		/** 코스 테이블 */
		tour.setTCM_KEYNO(CommonService.getTableKey("TCM"));
		Component.createData("Tour.TCM_insertData", tour);
		
		insertTourInfoCourseRouteList(req,tour,REGNM,false);
		
		
	}
	
	/**
	 * 코스 경로 리스트 등록
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void insertTourInfoCourseRouteList(HttpServletRequest req, TourDTO tour, String REGNM, boolean isUpdate) throws Exception {
		
		if(isUpdate){
			Component.deleteData("Tour.TCS_deleteData", tour);
		}
		
		String TCS_TITLE[] = req.getParameterValues("TCS_TITLE");
		String TCS_LAT[] = req.getParameterValues("TCS_LAT");
		String TCS_LNG[] = req.getParameterValues("TCS_LNG");
		String TCS_TYPE[] = req.getParameterValues("TCS_TYPE");
		String TCS_TYPE_KEYNO[] = req.getParameterValues("TCS_TYPE_KEYNO");
		String TCS_COMMENT[] = req.getParameterValues("TCS_COMMENT");
		String TCS_AUTO_DISTANCE[] = req.getParameterValues("TCS_AUTO_DISTANCE");
		String TCS_DISTANCE[] = req.getParameterValues("TCS_DISTANCE");
		String TCS_TIME[] = req.getParameterValues("TCS_TIME");
		String TCS_POSITON_TYPE[] = req.getParameterValues("TCS_POSITON_TYPE");
		
		if(CommonService.checkArrayLength(TCS_TITLE,TCS_LAT,TCS_LNG,TCS_TYPE,TCS_TYPE_KEYNO,TCS_COMMENT)){
			
			List<HashMap<String,Object>> courseList = new ArrayList<HashMap<String,Object>>();
			
//			String FM_KEYNO = FileUploadTools.makeFileMainData(REGNM);
			
			for(int i=0;i<TCS_TITLE.length;i++){
				
				HashMap<String,Object> courseMap = new HashMap<String,Object>();
				courseMap.put("TCS_TITLE", TCS_TITLE[i]);
				courseMap.put("TCS_LAT", TCS_LAT[i]);
				courseMap.put("TCS_LNG", TCS_LNG[i]);
				courseMap.put("TCS_TYPE", TCS_TYPE[i]);
				courseMap.put("TCS_TYPE_KEYNO", TCS_TYPE_KEYNO[i]);
				courseMap.put("TCS_COMMENT", TCS_COMMENT[i]);
				courseMap.put("TCS_AUTO_DISTANCE", TCS_AUTO_DISTANCE[i]);
				courseMap.put("TCS_DISTANCE", TCS_DISTANCE[i]);
				courseMap.put("TCS_TIME", TCS_TIME[i]);
				courseMap.put("TCS_POSITON_TYPE", TCS_POSITON_TYPE[i]);
				courseMap.put("TCS_LEVEL", (i+1));
				
				courseList.add(courseMap);
				
			}
			
			Map<String,Object> courseData = new HashMap<String,Object>();
			
			courseData.put("TCM_KEYNO", tour.getTCM_KEYNO());
			courseData.put("courseList", courseList);
			
			Component.createData("Tour.TCS_insertData", courseData);
			
			
		}
	}
	
	/**
	 * 관광정보 - 숙박 등록
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void insertTourInfoLodgment(HttpServletRequest req, TourDTO tour, String REGNM) throws Exception {
		/** 숙박 테이블 */
		tour.setTL_KEYNO(CommonService.getTableKey("TL"));
		
		Component.createData("Tour.TL_insertData", tour);
		
		insertTourInfoRoomList(req,tour,REGNM,false);
	}
	
	/**
	 * 객실 리스트 등록
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void insertTourInfoRoomList(HttpServletRequest req, TourDTO tour, String REGNM, boolean isUpdate) throws Exception {
		
		if(isUpdate){
			Component.deleteData("Tour.TL_deleteData", tour);
		}
		
		/** 객실 테이블 */
		String TG_KEYNO[] = req.getParameterValues("TG_KEYNO");
		String TG_NAME[] = req.getParameterValues("TG_NAME");
		String TG_INWON_MIN_CNT[] = req.getParameterValues("TG_INWON_MIN_CNT");
		String TG_INWON_MAX_CNT[] = req.getParameterValues("TG_INWON_MAX_CNT");
		String TG_SIZE_METER[] = req.getParameterValues("TG_SIZE_METER");
		String TG_SIZE_FLAT[] = req.getParameterValues("TG_SIZE_FLAT");
		String TG_PRICE_CONTENT[] = req.getParameterValues("TG_PRICE_CONTENT");
		String TG_SUMMARY[] = req.getParameterValues("TG_SUMMARY");
		String TG_ORDER[] = req.getParameterValues("TG_ORDER");
	
		if(CommonService.checkArrayLength(TG_KEYNO,TG_NAME,TG_INWON_MIN_CNT,TG_INWON_MAX_CNT,TG_SIZE_METER,TG_SIZE_FLAT,TG_PRICE_CONTENT,TG_SUMMARY,TG_ORDER)){
			
			List<HashMap<String,Object>> roomList = new ArrayList<HashMap<String,Object>>();
			for (int i = 0; i < TG_NAME.length; i++) {
				tour.setTG_IMG("");
				HashMap<String,Object> roomMap = new HashMap<String,Object>();

				if(TG_KEYNO[i] == null || TG_KEYNO[i].equals("")){
					tour.setTG_KEYNO(CommonService.getTableKey("TG"));
				}else{
					tour.setTG_KEYNO(TG_KEYNO[i]);
					Component.deleteData("Tour.TIM_TG_deleteData", tour);
				}
				
				roomMap.put("TG_KEYNO", tour.getTG_KEYNO());
				roomMap.put("TG_TL_KEYNO", tour.getTL_KEYNO());
				roomMap.put("TG_NAME", TG_NAME[i]);
				roomMap.put("TG_INWON_MIN_CNT", TG_INWON_MIN_CNT[i]);
				roomMap.put("TG_INWON_MAX_CNT", TG_INWON_MAX_CNT[i]);
				roomMap.put("TG_SIZE_METER", TG_SIZE_METER[i]);
				roomMap.put("TG_SIZE_FLAT", TG_SIZE_FLAT[i]);
				roomMap.put("TG_PRICE_CONTENT", TG_PRICE_CONTENT[i]);
				roomMap.put("TG_SUMMARY", TG_SUMMARY[i]);
				roomMap.put("TG_ORDER", TG_ORDER[i]);
				
				/*객실 이미지 등록*/
				if(isUpdate){	
					updateTourMenuRoomInfoImg(req,tour,REGNM,"G",TG_ORDER[i]);
				}else{
					insertTourMenuRoomInfoImg(req,tour,REGNM,"G",TG_ORDER[i]);
				}
				
				roomMap.put("TG_IMG", tour.getTG_IMG());
				
				roomList.add(roomMap);
			}
			
			Map<String,Object> roomData = new HashMap<String,Object>();
			roomData.put("roomList", roomList);
			
			Component.createData("Tour.TG_insertData", roomData);
		}
	}
	
	
	/**
	 * 관광정보 - 식당 등록
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void insertTourInfoRestaurant(HttpServletRequest req, TourDTO tour, String REGNM) throws Exception {
		/** 식당 테이블 */
		tour.setTR_KEYNO(CommonService.getTableKey("TR"));
		
		Component.createData("Tour.TR_insertData", tour);
		
		insertTourInfoMenuList(req,tour,REGNM,false);
	}

	/**
	 * 메뉴 리스트 등록
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void insertTourInfoMenuList(HttpServletRequest req, TourDTO tour, String REGNM, boolean isUpdate) throws Exception {
		
		if(isUpdate){
			Component.deleteData("Tour.TM_deleteData", tour);
		}
		
		/** 메뉴 테이블 */
		String TM_KEYNO[] = req.getParameterValues("TM_KEYNO");
		String TM_NAME[] = req.getParameterValues("TM_NAME");
		String TM_PRICE[] = req.getParameterValues("TM_PRICE");
		String TM_SUMMARY[] = req.getParameterValues("TM_SUMMARY");
		String TM_ORDER[] = req.getParameterValues("TM_ORDER");
		String TM_MAINYN[] = req.getParameterValues("TM_MAINYN");
	
		if(CommonService.checkArrayLength(TM_KEYNO,TM_NAME,TM_PRICE,TM_SUMMARY,TM_ORDER,TM_MAINYN)){
			
			List<HashMap<String,Object>> menuList = new ArrayList<HashMap<String,Object>>();
			for (int i = 0; i < TM_NAME.length; i++) {
				tour.setTM_IMG("");
				HashMap<String,Object> menuMap = new HashMap<String,Object>();

				if(TM_KEYNO[i] == null || TM_KEYNO[i].equals("")){
					tour.setTM_KEYNO(CommonService.getTableKey("TM"));
				}else{
					tour.setTM_KEYNO(TM_KEYNO[i]);
					Component.deleteData("Tour.TIM_TM_deleteData", tour);
				}
				
				menuMap.put("TM_KEYNO", tour.getTM_KEYNO());
				menuMap.put("TM_TR_KEYNO", tour.getTR_KEYNO());
				menuMap.put("TM_NAME", TM_NAME[i]);
				menuMap.put("TM_PRICE", TM_PRICE[i]);
				menuMap.put("TM_SUMMARY", TM_SUMMARY[i]);
				menuMap.put("TM_ORDER", TM_ORDER[i]);
				menuMap.put("TM_MAINYN", TM_MAINYN[i]);
				
				/*메뉴 이미지 등록*/
				if(isUpdate){	
					updateTourMenuRoomInfoImg(req,tour,REGNM,"M",TM_ORDER[i]);
				}else{
					insertTourMenuRoomInfoImg(req,tour,REGNM,"M",TM_ORDER[i]);
				}
				
				
				menuMap.put("TM_IMG", tour.getTM_IMG());
				
				menuList.add(menuMap);
			}
			
			Map<String,Object> menuData = new HashMap<String,Object>();
			menuData.put("menuList", menuList);
			
			Component.createData("Tour.TM_insertData", menuData);
		}
	}
	
	/**
	 * 관광정보 수정
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	@Override
	public void updateTourInfo(HttpServletRequest req, TourDTO tour, String REGNM, String TIM_FM_KEYNO) throws Exception{
		//관광정보 이미지 수정
		updateTourInfoImg(req,tour,REGNM,TIM_FM_KEYNO);
		
		Component.updateData("Tour.TC_updateData", tour);
		
		String categoryName = CommonService.getTourCategoryName(tour.getTC_TYPE());
		
		switch (categoryName) {
		case "destination":
			
			/** 이용안내 테이블*/
			Component.updateData("Tour.TI_updateData", tour);
			
			/** 관광명소 테이블 */
			Component.updateData("Tour.TA_updateData", tour);
			
			break;
		case "course":
			
			updateTourInfoCourse(req,tour,REGNM);
			
			break;
		case "theme":
			
			/** 이용안내 테이블*/
			Component.updateData("Tour.TI_updateData", tour);
			
			/** 테마 테이블 */
			Component.updateData("Tour.TT_updateData", tour);
			
			break;	
		case "lodgment":
			
			/** 숙박 테이블 */
			updateTourInfoLodgment(req,tour,REGNM);
			
			break;
		case "restaurant":
			
			/** 식당 테이블 */
			updateTourInfoRestaurant(req,tour,REGNM);
			
			break;
		case "culturalheritage":
			
			/** 이용안내 테이블*/
			Component.updateData("Tour.TI_updateData", tour);
			
			/** 문화제 테이블 */
			Component.updateData("Tour.TCH_updateData", tour);
			
			break;
		case "festival":
			
			tour.setTF_CONTENTS(StringEscapeUtils.unescapeHtml3(tour.getTF_CONTENTS()));
			/** 이용안내 테이블*/
			Component.updateData("Tour.TI_updateData", tour);
			
			/** 축제 테이블 */
			Component.updateData("Tour.TF_updateData", tour);
			
			break;

		default:
			break;
		}
		
		
	}
	
	/**
	 * 관광정보 - 코스 수정
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void updateTourInfoCourse(HttpServletRequest req, TourDTO tour, String REGNM) throws Exception {
		
		/** 이용안내 테이블*/
		Component.updateData("Tour.TI_updateData", tour);
		
		/** 코스 테이블 */
		Component.updateData("Tour.TCM_updateData", tour);
		
		insertTourInfoCourseRouteList(req,tour,REGNM,true);
		
		
	}
	
	/**
	 * 관광정보 - 객실 수정
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void updateTourInfoLodgment(HttpServletRequest req, TourDTO tour, String REGNM) throws Exception {
		/** 숙박 테이블 */
		Component.updateData("Tour.TL_updateData", tour);
		
		insertTourInfoRoomList(req,tour,REGNM,true);
		
		
	}
	
	/**
	 * 관광정보 - 메뉴 수정
	 * @param req
	 * @param tour
	 * @param REGNM
	 * @throws Exception
	 */
	private void updateTourInfoRestaurant(HttpServletRequest req, TourDTO tour, String REGNM) throws Exception {
		
		/** 식당 테이블 */
		Component.updateData("Tour.TR_updateData", tour);
		
		insertTourInfoMenuList(req,tour,REGNM,true);
		
		
	}
	
	
	
	/**
	 * 관광정보 폼 데이터 가져오기
	 * @param categoryName
	 * @param tour
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getTourInfoFormData(ModelAndView mv, String categoryName, TourDTO tour) throws Exception{
		
		String query = "";
		
		switch (categoryName) {
		case "destination":
			//관광명소 타입 리스트
			mv.addObject("destinationTypeList",CodeService.getCodeListisUse("CG", true));
			query = "Tour.TC_getDestinationData";
			break;
		case "course":
			//관광정보 타입 리스트
			mv.addObject("tourInfoList",CodeService.getCodeListisUse("CF", true));
			
			//코스 타입 리스트
			mv.addObject("courseTypeList",CodeService.getCodeListisUse("CK", true));
			
			if(StringUtils.isNotEmpty(tour.getTC_KEYNO())){
				//코스 경로 리스트
				mv.addObject("courseList",Component.getList("Tour.TCS_getList", tour));
			}
			
			query = "Tour.TC_getCourseData";
			break;
		case "theme":
			//테마 타입 리스트
			mv.addObject("themeTypeList",CodeService.getCodeListisUse("CN", true));
			//체험여행 타입 리스트
			mv.addObject("experiencetripTypeList",CodeService.getCodeListisUse("CO", true));
			
			query = "Tour.TC_getThemeData";
			break;
		case "lodgment":
			//숙박 타입 리스트
			mv.addObject("lodgmentTypeList",CodeService.getCodeListisUse("CH", true));
			//숙박 권역 타입 리스트
			mv.addObject("LodgmentAreaList",CodeService.getCodeListisUse("CR", true));
			
			//객실 리스트
			mv.addObject("RoomList",Component.getList("Tour.TG_getRoomList", tour));
			
			List<HashMap<String, Object>> imgRoomList = Component.getList("Tour.TIM_getRoomList", tour);
			StorageSelector.getImgPath(imgRoomList);
			mv.addObject("imgRoomList",imgRoomList);
			
			query = "Tour.TC_getLodgmentData";
			break;
		case "restaurant":
			//식당 타입 리스트
			mv.addObject("restaurantTypeList",CodeService.getCodeListisUse("CI", true));
			mv.addObject("foodTypeList",CodeService.getCodeListisUse("CJ", true));
			
			//메뉴 리스트
			mv.addObject("MenuList",Component.getList("Tour.TM_getMenuList", tour));
			List<HashMap<String, Object>> imgMenuList = Component.getList("Tour.TIM_getMenuList", tour);
			StorageSelector.getImgPath(imgMenuList);
			mv.addObject("imgMenuList", imgMenuList);
			
			query = "Tour.TC_getrestaurantData";
			break;
		case "culturalheritage":
			//문화제 리스트
			mv.addObject("culturalheritageTypeList",CodeService.getCodeListisUse("CL", true));
			
			query = "Tour.TC_getculturalheritageData";
			break;
		case "festival":
			//축제 타입 리스트
			mv.addObject("festivalTypeList",CodeService.getCodeListisUse("CM", true));
			
			query = "Tour.TC_getfestivalData";
			break;

		default:
			query = "Tour.TC_getData";
			break;
		}
		
		return query;
	}
	
	/**
	 * 관광정보 페이징 데이터 가져오기
	 * @param mv
	 * @param tourInfo
	 * @param isPaging true : 페이징 / false : 엑셀
	 * @return
	 * @throws Exception
	 */
	public String getTourInfoPagingData(ModelAndView mv, String tourInfo, boolean isPaging) throws Exception{
		
		String query = "";
		
		switch (tourInfo) {
		case "destination":
			query = "Tour.TC_getDestinationtList";
			
			if(isPaging){
				//관광명소 타입 리스트
				mv.addObject("destinationTypeList",CodeService.getCodeListisUse("CG", true));
			}
			break;
		case "course":
			query = "Tour.TC_getCoursetList";
			
			if(isPaging){
				//관광정보 타입 리스트
				mv.addObject("tourInfoList",CodeService.getCodeListisUse("CF", true));
				
				//코스 타입 리스트
				mv.addObject("courseTypeList",CodeService.getCodeListisUse("CK", true));
			}
			break;
		case "theme":
			query = "Tour.TC_getThemeList";
			
			if(isPaging){
				//테마 타입 리스트
				mv.addObject("themeTypeList",CodeService.getCodeListisUse("CN", true));
			}
			break;
		case "lodgment":
			query = "Tour.TC_getLodgmentList";
			
			if(isPaging){
				//숙박 타입 리스트
				mv.addObject("lodgmentTypeList",CodeService.getCodeListisUse("CH", true));
			}
			break;
		case "restaurant":
			query = "Tour.TC_getRestaurantList";
			
			if(isPaging){
				//식당 타입 리스트
				mv.addObject("restaurantTypeList",CodeService.getCodeListisUse("CI", true));
			}
			break;
		case "culturalheritage":
			query = "Tour.TC_getCulturalHeritageList";
			
			if(isPaging){
				//문화재 타입 리스트
				mv.addObject("culturalheritageTypeList",CodeService.getCodeListisUse("CL", true));
			}
			break;
		case "festival":
			query = "Tour.TC_getFestivalList";
			
			if(isPaging){
				//축제 타입 리스트
				mv.addObject("festivalTypeList",CodeService.getCodeListisUse("CM", true));
			}
			break;

		default:
			query = "Tour.TC_getAllList";
			break;
		}
		
		return query;
	}
	
	
	
	/**
	 * 관광정보 이미지 등록
	 * @param req
	 * @param REGNM
	 * @throws Exception
	 */
	private void insertTourInfoImg(HttpServletRequest req, TourDTO tour, String REGNM) throws Exception {

		//이미지 처리
		String newImgFile[] = req.getParameterValues("newImgFile");
		String TIM_FILEINFO[] = req.getParameterValues("TIM_FILEINFO");
		String FS_ORINM[] =  req.getParameterValues("FS_ORINM");
		String IMG_ORDER[] =  req.getParameterValues("IMG_ORDER");
		
		//ImgType : C - 공통
		if(CommonService.checkArrayLength(newImgFile,TIM_FILEINFO,FS_ORINM,IMG_ORDER)){
			
			List<HashMap<String,Object>> imgList = new ArrayList<HashMap<String,Object>>();
			
			String FM_KEYNO = FileUploadTools.makeFileMainData(REGNM);
			
			for(int i=0;i<TIM_FILEINFO.length;i++){
				
				FileSub sub = null;
				//신규 이미지
				if("Y".equals(newImgFile[i])){
					HashMap<String,String> imgInfo = new HashMap<String,String>();
					
					String title = FS_ORINM[i].substring(0, FS_ORINM[i].lastIndexOf("."));
					String ext = FS_ORINM[i].substring(FS_ORINM[i].lastIndexOf(".")+1);
					
					imgInfo.put("uri", TIM_FILEINFO[i]);
					imgInfo.put("title", title);
					imgInfo.put("ext", ext);
					
					sub =  FileUploadTools.FileUploadByDataURI(imgInfo, FM_KEYNO, REGNM);
					
					
				}else{	//복사한 이미지
					sub =  FileUploadTools.FileCopy(TIM_FILEINFO[i], FM_KEYNO, REGNM);
					
				}
				
				HashMap<String,Object> imgMap = new HashMap<String,Object>();
				
				imgMap.put("TIM_TC_KEYNO", tour.getTC_KEYNO());
				if(i == 0){
					tour.setTC_THUMBNAIL(sub.getFS_KEYNO());
				}
				
				imgMap.put("TIM_FS_KEYNO", sub.getFS_KEYNO());
				imgMap.put("TIM_ORDER", IMG_ORDER[i]);
				
				imgList.add(imgMap);
				
			}
			
			Map<String,Object> imgData = new HashMap<String,Object>();
			imgData.put("imgList", imgList);
			
			Component.createData("Tour.TIM_insertData", imgData);
			
			
		}else{
			tour.setTC_THUMBNAIL("");
		}
	}

	
	private String[] getParameterValues(HttpServletRequest req, String value, String index) {
		
		if(index != null){
			value += index;
		}
		
		return req.getParameterValues(value);
	}
	
	/**
	 * 관광정보 이미지 수정
	 * @param req
	 * @param tour 
	 * @param REGNM
	 * @throws Exception
	 */
	private void updateTourInfoImg(HttpServletRequest req, TourDTO tour, String REGNM, String TIM_FM_KEYNO) throws Exception {
		
		Component.deleteData("Tour.TIM_deleteData", tour);
		
        String newImgFile[] = req.getParameterValues("newImgFile");
        String TIM_FILEINFO[] = req.getParameterValues("TIM_FILEINFO");
        String FS_ORINM[] =  req.getParameterValues("FS_ORINM");
		
		if(CommonService.checkArrayLength(newImgFile,TIM_FILEINFO,FS_ORINM)){
			
			List<HashMap<String,Object>> imgList = new ArrayList<HashMap<String,Object>>();
			
			for(int i=0;i<TIM_FILEINFO.length;i++){
				
				//신규 이미지
				if("Y".equals(newImgFile[i])){
					HashMap<String,String> imgInfo = new HashMap<String,String>();
					
					String title = FS_ORINM[i].substring(0, FS_ORINM[i].lastIndexOf("."));
					String ext = FS_ORINM[i].substring(FS_ORINM[i].lastIndexOf(".")+1);
					
					imgInfo.put("uri", TIM_FILEINFO[i]);
					imgInfo.put("title", title);
					imgInfo.put("ext", ext);
					
					if("".equals(TIM_FM_KEYNO)){	//공통 이미지 FM_KEYNO
						TIM_FM_KEYNO = FileUploadTools.makeFileMainData(REGNM);
					}
				
					FileSub sub =  FileUploadTools.FileUploadByDataURI(imgInfo, TIM_FM_KEYNO, REGNM);
					HashMap<String,Object> imgMap = new HashMap<String,Object>();

					imgMap.put("TIM_TC_KEYNO", tour.getTC_KEYNO());
					imgMap.put("TIM_FS_KEYNO", sub.getFS_KEYNO());
					imgMap.put("TIM_ORDER", (i+1));
					
					imgList.add(imgMap);
					
					if(i == 0){
						tour.setTC_THUMBNAIL(sub.getFS_KEYNO());
					}
					
					
				}else{
					HashMap<String,Object> imgMap = new HashMap<String,Object>();
					
					imgMap.put("TIM_TC_KEYNO", tour.getTC_KEYNO());
					imgMap.put("TIM_FS_KEYNO", TIM_FILEINFO[i]);
					imgMap.put("TIM_ORDER", (i+1));
					
					imgList.add(imgMap);
					
					if(i == 0){
						tour.setTC_THUMBNAIL(TIM_FILEINFO[i]);
					}
				}
				
			}
			
			Map<String,Object> imgData = new HashMap<String,Object>();
			imgData.put("imgList", imgList);
			Component.createData("Tour.TIM_insertData", imgData);
			
		}else{
			tour.setTC_THUMBNAIL("");
		}	
	}	
	
	/**
	 * 관광정보 메뉴/객실 이미지 등록
	 * @param req
	 * @param REGNM
	 * @throws Exception
	 */
	private void insertTourMenuRoomInfoImg(HttpServletRequest req, TourDTO tour, String REGNM,String type,String index) throws Exception {

		//이미지 처리
		String ImgType[] = getParameterValues(req,"sub_ImgType",index);
		String newImgFile[] = getParameterValues(req,"sub_newImgFile",index);
		String TIM_FILEINFO[] = getParameterValues(req,"sub_TIM_FILEINFO",index);
		String FS_ORINM[] =  getParameterValues(req,"sub_FS_ORINM",index);
		String IMG_ORDER[] =  getParameterValues(req,"sub_IMG_ORDER",index);
		
		//ImgType : M - 메뉴, G - 객실
		if(CommonService.checkArrayLength(ImgType,newImgFile,TIM_FILEINFO,FS_ORINM,IMG_ORDER)){
			
			List<HashMap<String,Object>> imgList = new ArrayList<HashMap<String,Object>>();
			
			String FM_KEYNO = FileUploadTools.makeFileMainData(REGNM);
			
			for(int i=0;i<TIM_FILEINFO.length;i++){
				
				FileSub sub = null;
				//신규 이미지
				if("Y".equals(newImgFile[i])){
					HashMap<String,String> imgInfo = new HashMap<String,String>();
					
					String title = FS_ORINM[i].substring(0, FS_ORINM[i].lastIndexOf("."));
					String ext = FS_ORINM[i].substring(FS_ORINM[i].lastIndexOf(".")+1);
					
					imgInfo.put("uri", TIM_FILEINFO[i]);
					imgInfo.put("title", title);
					imgInfo.put("ext", ext);
					
					sub =  FileUploadTools.FileUploadByDataURI(imgInfo, FM_KEYNO, REGNM);
					
					
				}else{	//복사한 이미지
					sub =  FileUploadTools.FileCopy(TIM_FILEINFO[i], FM_KEYNO, REGNM);
					
				}
				
				HashMap<String,Object> imgMap = new HashMap<String,Object>();
				
				if(type.equals("M") && ImgType[i].equals("M")){
					
					imgMap.put("TIM_TM_KEYNO", tour.getTM_KEYNO());
					if(IMG_ORDER[i].equals("1")){
						tour.setTM_IMG(sub.getFS_KEYNO());
					}
					
				}else if(type.equals("G") && ImgType[i].equals("G")){
					
					imgMap.put("TIM_TG_KEYNO", tour.getTG_KEYNO());
					if(IMG_ORDER[i].equals("1")){
						tour.setTG_IMG(sub.getFS_KEYNO());
					}
					
				}
				
				imgMap.put("TIM_FS_KEYNO", sub.getFS_KEYNO());
				imgMap.put("TIM_ORDER", IMG_ORDER[i]);
				
				imgList.add(imgMap);
				
			}
			
			Map<String,Object> imgData = new HashMap<String,Object>();
			imgData.put("imgList", imgList);
			
			Component.createData("Tour.TIM_insertData", imgData);
			
			
		}else{
			tour.setTC_THUMBNAIL("");
		}
	}

	
	/**
	 * 관광정보 메뉴/객실 이미지 수정
	 * @param req
	 * @param tour 
	 * @param REGNM
	 * @throws Exception
	 */
	private void updateTourMenuRoomInfoImg(HttpServletRequest req, TourDTO tour, String REGNM,String type,String index) throws Exception {
		
		//이미지 처리
		String ImgType[] = getParameterValues(req,"sub_ImgType",index);
		String newImgFile[] = getParameterValues(req,"sub_newImgFile",index);
		String TIM_FILEINFO[] = getParameterValues(req,"sub_TIM_FILEINFO",index);
		String FS_ORINM[] =  getParameterValues(req,"sub_FS_ORINM",index);
		String IMG_ORDER[] =  getParameterValues(req,"sub_IMG_ORDER",index);
		String TIM_FM_KEYNO[] =  getParameterValues(req,"sub_TIM_FM_KEYNO",index);
		String FM_KEYNO = null;
		if(CommonService.checkArrayLength(ImgType,newImgFile,TIM_FILEINFO,FS_ORINM,IMG_ORDER,TIM_FM_KEYNO)){
			
			List<HashMap<String,Object>> imgList = new ArrayList<HashMap<String,Object>>();
			
			for(int i=0;i<TIM_FILEINFO.length;i++){
				
				//신규 이미지
				if("Y".equals(newImgFile[i])){
					HashMap<String,String> imgInfo = new HashMap<String,String>();
					
					String title = FS_ORINM[i].substring(0, FS_ORINM[i].lastIndexOf("."));
					String ext = FS_ORINM[i].substring(FS_ORINM[i].lastIndexOf(".")+1);
					
					imgInfo.put("uri", TIM_FILEINFO[i]);
					imgInfo.put("title", title);
					imgInfo.put("ext", ext);
					
					if("".equals(TIM_FM_KEYNO[i])){
						FM_KEYNO = FileUploadTools.makeFileMainData(REGNM);
					}else{
						FM_KEYNO = TIM_FM_KEYNO[i];
					}
				
					FileSub sub =  FileUploadTools.FileUploadByDataURI(imgInfo, FM_KEYNO, REGNM);
					HashMap<String,Object> imgMap = new HashMap<String,Object>();

					imgMap.put("TIM_FS_KEYNO", sub.getFS_KEYNO());
					imgMap.put("TIM_ORDER", IMG_ORDER[i]);
					
					imgList.add(imgMap);
					
					if(type.equals("M") && ImgType[i].equals("M")){
						
						imgMap.put("TIM_TM_KEYNO", tour.getTM_KEYNO());
						if(IMG_ORDER[i].equals("1")){
							tour.setTM_IMG(sub.getFS_KEYNO());
						}
					}else if(type.equals("G") && ImgType[i].equals("G")){
						
						imgMap.put("TIM_TG_KEYNO", tour.getTG_KEYNO());
						if(IMG_ORDER[i].equals("1")){
							tour.setTG_IMG(sub.getFS_KEYNO());
						}
					}
					
					
				}else{
					HashMap<String,Object> imgMap = new HashMap<String,Object>();
					
					imgMap.put("TIM_FS_KEYNO", TIM_FILEINFO[i]);
					imgMap.put("TIM_ORDER", IMG_ORDER[i]);
					
					imgList.add(imgMap);
					
					if(type.equals("M") && ImgType[i].equals("M")){
						
						imgMap.put("TIM_TM_KEYNO", tour.getTM_KEYNO());
						if(IMG_ORDER[i].equals("1")){
							tour.setTM_IMG(TIM_FILEINFO[i]);
						}
						
					}else if(type.equals("G") && ImgType[i].equals("G")){
						
						imgMap.put("TIM_TG_KEYNO", tour.getTG_KEYNO());
						if(IMG_ORDER[i].equals("1")){
							tour.setTG_IMG(TIM_FILEINFO[i]);
						}
					}
					
				}
				
			}
			
			Map<String,Object> imgData = new HashMap<String,Object>();
			imgData.put("imgList", imgList);
			Component.createData("Tour.TIM_insertData", imgData);
			
		}else{
			tour.setTC_THUMBNAIL("");
		}	
	}	
	
	/**
	 * 관광정보 on 표시한 데이터 가져오기
	 * @param data
	 * @return 
	 * @throws Exception
	 */
	public List<HashMap<String, Object>> getTourAvailableData(HashMap<String, Object> data) throws Exception {
		List<HashMap<String, Object>> dataList = new ArrayList<>();
		
		if(data.get("TC_SHOW_COLUMN") != null){
			String[] columns = data.get("TC_SHOW_COLUMN").toString().split(",");
			for (int i = 0; i < columns.length; i++) {
				HashMap<String, Object> dataMap = new HashMap<>();
				if(data.get(columns[i]) != null && !data.get(columns[i]).toString().isEmpty() && !data.get(columns[i]).toString().equals(" ")){
					dataMap.put("columnKey", columns[i]);
					dataMap.put("columnName", Component.getData("Tour.get_columnName",columns[i]));
					dataMap.put("value", data.get(columns[i]));
					dataList.add(dataMap);
				}
			}
		}
		
		return dataList;
	}
	
}