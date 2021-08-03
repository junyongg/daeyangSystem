package com.tx.user.function.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.config.SettingData;
import com.tx.common.config.annotation.CheckActivityHistory;
import com.tx.common.config.annotation.service.ActivityHistoryService;
import com.tx.common.config.tld.SiteProperties;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.txap.admin.site.service.SiteService;
import com.tx.txap.homepage.menu.dto.Menu;
import com.tx.txap.homepage.organization.dto.OrganDTO;
import com.tx.txap.operation.holiday.dto.HolidayDTO;
import com.tx.txap.operation.holiday.service.HolidayService;
import com.tx.txap.program.application.dto.ApplicationDTO;
import com.tx.txap.program.application.dto.PlaceDTO;
import com.tx.txap.program.application.service.ApplicationService;

/**
 * 
 * @FileName: IntroController.java
 * @Project : cf
 * @Date    : 2017. 06. 12. 
 * @Author  : 이재령	
 * @Version : 1.0
 */
//@Controller
public class FunctionController {

	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	
	/** 활동기록 서비스*/
	@Autowired private ActivityHistoryService ActivityHistoryService;
	
	/** 휴일 관리 */
	@Autowired private HolidayService HolidayService;
	
	@Autowired SiteService SiteService;
	
	/** 신청프로그렘 서비스  */
	@Autowired private ApplicationService ApplicationService;
	
	
	/**
	 * 사이트맵
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{tiles}/use/sitemap.do")
	@CheckActivityHistory(desc="사이트맵 방문",type="hashmap")
	public ModelAndView useSitemap(
			@PathVariable String tiles) throws Exception {
		String sitePath = SiteService.getSitePath(tiles);
		ModelAndView mv  = new ModelAndView("/user/"+sitePath+"/use/prc_sitemap");
		Menu menu = Menu.builder()
				.MN_HOMEDIV_C(SiteProperties.getString("HOMEPAGE_REP"))
				.build();
		mv.addObject("sitemap", Component.getList("Menu.AMN_getUserMenuListByHOMEDIV", menu));
		ActivityHistoryService.setDesc("사이트맵", mv);
		
		return mv;
	}
	
	/**
	 * 신청 프로그램 페이지
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/program.do")
	@CheckActivityHistory(desc="신청프로그램 페이지 방문")
	public ModelAndView functionProgram(
			  HttpServletRequest req
			, ApplicationDTO ApplicationDTO
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/user/cf/function/program/prc_program");
		
		programPageView(mv,ApplicationDTO,SettingData.PROGRAM_APPLY);
		
		ApplicationService.checkExpiredDate("ApplyView",req);
		return mv;
	}
	
	/**
	 * 강좌 프로그램 페이지
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/ProgramLecture.do")
	@CheckActivityHistory(desc="강좌 프로그램 페이지 방문")
	public ModelAndView Lectureprogram(
			  HttpServletRequest req
			, ApplicationDTO ApplicationDTO
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/user/cf/function/program/prc_program");

		programPageView(mv,ApplicationDTO,SettingData.PROGRAM_LECTURE);
		
		ApplicationService.checkExpiredDate("ApplyView",req);
		return mv;
	}
	
	@SuppressWarnings("static-access")
	private void programPageView(ModelAndView mv, ApplicationDTO ApplicationDTO, String type) {
		Calendar cal = Calendar.getInstance();
		//현재 년도, 월, 일
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE ) ;
		String mm = String.format("%02d", month);
		String dd = String.format("%02d", date);
		String now_date = year + "-" + mm + "-" + dd;
		mv.addObject("now_date",now_date);
		
		ApplicationDTO.setAP_TYPE(type);
		List<Map<String,Object>> ApplicationList = Component.getList("Application.AP_getAllList", ApplicationDTO);

		mv.addObject("resultList",ApplicationList);
	}

	/**
	 * 프로그램 티켓예매 iframe
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value="/cf/function/program/iframe.do")
	public ModelAndView functionProgramiframe(
			  HttpServletRequest req
			, @RequestParam HashMap<String,Object> map
			, ApplicationDTO ApplicationDTO
			, @RequestParam("key") String key
			, @RequestParam("type") String type
			) throws Exception {
		ModelAndView mv  = new ModelAndView();
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		String REGNM = (String) user.get("UI_KEYNO");
		
//		ApplicationDTO.setAP_KEYNO(CommonService.getKeyno(key, "AP"));
		ApplicationDTO.setAP_KEYNO(key);
		
		mv.addObject("resultData", Component.getData("Application.AP_getList", ApplicationDTO));
		
		ApplicationDTO.setAPU_UI_KEYNO(REGNM);
		ApplicationDTO.setApp_type(type);
		
		Calendar cal = Calendar.getInstance();
		//현재 날짜
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1 ;
		int date = cal.get ( cal.DATE ) ;
		String mm = String.format("%02d", month);
		String dd = String.format("%02d", date);
		String now_date = year + "-" + mm + "-" + dd;
		
		mv.addObject("now_date",now_date);	//결제일 비교
		
		if(type.equals(SettingData.PROGRAM_APPLY)) {
			mv.addObject("userData", Component.getData("Application.APU_getList", ApplicationDTO));
			mv.setViewName("/user/cf/function/program/prc_program_iframe.notiles");
		}else if(type.equals(SettingData.PROGRAM_LECTURE)) {
			mv.addObject("nowYear", year);	//현제 년도로 나이비교
			mv.addObject("userList", Component.getList("Application.APU_getList", ApplicationDTO));
			mv.setViewName("/user/cf/function/program/prc_program_lecturepopup.notiles");
		}
		return mv;
	}
	
	/**
	 * 신청 프로그램 티켓갯수 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/program/ticketCnt.do")
	@ResponseBody
	public Map<String,Object> ticketCnt(
			HttpServletRequest req
			, @RequestParam HashMap<String,Object> map
			, ApplicationDTO ApplicationDTO
			) throws Exception {
		HashMap<String,Object> ticketCnt = Component.getData("Application.AP_ticketCnt", ApplicationDTO);	//최대 티켓 갯수
		
		return ticketCnt;
	}
	
	/**
	 * 프로그램 티켓예매 창띄우기 
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/programApplyAjax.do")
	@ResponseBody
	public Map<String,Object> functionProgramApplyAjax(
			  HttpServletRequest req
			, @RequestParam HashMap<String,Object> map
			, ApplicationDTO ApplicationDTO
			, @RequestParam(value="programType", required=false) String programType
			, @RequestParam("holidayType") String holidayType
			, @RequestParam("key") String key
			, @RequestParam("nowStD") String nowStD
			, @RequestParam("nowEnD") String nowEnD
			) throws Exception {
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		
		if(nowStD != null){
			map.put("BN_STDT", nowStD);
			map.put("BN_ENDT", nowEnD);
		}
		
		String STDT = (String)map.get("BN_STDT");
		String ENDT = (String)map.get("BN_ENDT");
		
		List<HolidayDTO> holiday = null;
		
		if(holidayType.equals("N")) {	//적용안함
			holiday = new ArrayList<>();	
		}else {
			holiday = HolidayService.getHolidaysType(STDT,ENDT, holidayType);
		}
		
		Date now_date = dayTime.parse(nowStD);
		Date end_date = dayTime.parse(nowEnD);
		
		ApplicationDTO.setAP_KEYNO(key);
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> schedulemain = Component.getList("Application.ScheduleMain", ApplicationDTO);			//메인 스케줄 데이터
		HashMap<String,Object> program = Component.getData("Application.AP_getList", ApplicationDTO);						//프로그램 데이터
		
		List<String> eventList = new ArrayList<String>();	//날짜만 보내기
		Calendar cal = Calendar.getInstance();
		
		if(schedulemain != null && schedulemain.size() > 0) {
			do {
				String now = dayTime.format(now_date);
				boolean holidayCheck = false;
				if(holiday.size() > 0) {
					for (HolidayDTO H : holiday) {
						if(now.equals(H.getTHM_DATE())) {
							holidayCheck = true;
							break;
						}
					}
				}
				
				if(!holidayCheck) {

					for (HashMap<String, Object> Main : schedulemain) {
						
						if(!StringUtils.isEmpty((String)Main.get("ASM_STDT"))) {	//시작일이 있으면
							Date ASM_STDT = dayTime.parse((String)Main.get("ASM_STDT"));
							Date ASM_ENDT = dayTime.parse((String)Main.get("ASM_ENDT"));
							if(now_date.compareTo(ASM_STDT) >= 0 && now_date.compareTo(ASM_ENDT) <= 0) {	//시작일이 종료일보다 작으면
								
							}else {
								continue;
							}
						}
						
						String gsmDay = (String)Main.get("ASM_DAY");
						if(StringUtils.isEmpty(gsmDay)) {
							
						}else {
							//비교 
							cal.setTime(now_date);
							int day = cal.get(Calendar.DAY_OF_WEEK)-1;
							String now_day = String.valueOf(day);
							
							if(!gsmDay.contains(now_day)) {
								continue;
							}
						}
		
						//날짜 중복시 한개만 나오게
						String tempDate = dayTime.format(now_date);
						if(!eventList.contains(tempDate)) {
							eventList.add(tempDate);
						}
					}
				
			}
				//하루씩 더하기
				cal.setTime(now_date);
				cal.add(Calendar.DATE, 1);
				now_date = cal.getTime();
				
			}while(now_date.compareTo(end_date) <= 0);
			
			}
		
		returnMap.put("eventList", eventList);
		returnMap.put("AP_WAITING_YN", (String)program.get("AP_WAITING_YN"));
		returnMap.put("MainTitle", (String)program.get("AP_NAME"));
		
		if(programType.equals(SettingData.PROGRAM_LECTURE)) {
			returnMap.put("holidayList", holiday);
		}else if(programType.equals(SettingData.PROGRAM_APPLY)){
			returnMap.put("holidayList", HolidayService.getHolidays(STDT,ENDT));			
		}
		
		return returnMap;
	}
	
	/**
	 * 신청 프로그램 티켓예매 시간 보이기
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/cf/function/programTimeAjax.do")
	@ResponseBody
	public List functionProgramTimeAjax(
			HttpServletRequest req
			,@RequestParam HashMap<String,Object> map
			, ApplicationDTO ApplicationDTO
			, @RequestParam("key") String key
			, @RequestParam("date") String date
			) throws Exception {
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		Date now_date = dayTime.parse(date);
		
		ApplicationDTO.setAP_KEYNO(key);
		
		List<HashMap<String,Object>> schedulemain = Component.getList("Application.ScheduleMain", ApplicationDTO);	//메인 스케줄 데이터
		List<HashMap<String,Object>> schedulesub = Component.getList("Application.ScheduleSub", ApplicationDTO);	//서브 스케줄 데이터
		
		String arr[] = new String[4];
		arr[0] = SettingData.APPLY_WAITING;
		arr[1] = SettingData.APPLY_COMPLETE;
		arr[2] = SettingData.APPLY_RESERVE;
		arr[3] = SettingData.APPLY_PREVIEW;
		ApplicationDTO.setSearchConditionArr(arr);
		
		List<HashMap<String,Object>> programApplyList = Component.getList("Application.APP_ProgramList", ApplicationDTO);	//프로그램 신청 리스트

		HashMap<String, Object> event = null;
		List<HashMap<String,Object>> eventList = new ArrayList<HashMap<String,Object>>();
		Calendar cal = Calendar.getInstance();
		
		if(schedulemain != null && schedulemain.size() > 0) {
			for (HashMap<String, Object> Main : schedulemain) {
				
				if(!StringUtils.isEmpty((String)Main.get("ASM_STDT"))) {	//시작일이 있으면
					Date ASM_STDT = dayTime.parse((String)Main.get("ASM_STDT"));
					Date ASM_ENDT = dayTime.parse((String)Main.get("ASM_ENDT"));
					
					//시작일이 종료일보다 작으면
					if(now_date.compareTo(ASM_STDT) >= 0 && now_date.compareTo(ASM_ENDT) <= 0) {	
						
					}else {
						continue;
					}
				}

				String gsmDay = (String)Main.get("ASM_DAY");
				if(StringUtils.isEmpty(gsmDay)) {
					
				}else {
					//비교 
					cal.setTime(now_date);
					int day = cal.get(Calendar.DAY_OF_WEEK)-1;
					String now_day = String.valueOf(day);
					
					if(!gsmDay.contains(now_day)) {
						continue;
					}
				}
				
				for (HashMap<String, Object> Sub : schedulesub) {
					if(((String)Main.get("ASM_KEYNO")).equals((String)Sub.get("ASS_ASM_KEYNO"))) {
						event = new HashMap<String,Object>();
						event.put("ASM_KEYNO", (String)Sub.get("ASS_ASM_KEYNO"));
						event.put("ASS_KEYNO", (String)Sub.get("ASS_KEYNO"));
						event.put("ST_TIME", (String)Sub.get("ASS_ST_TIME"));
						event.put("title", (String)Sub.get("ASS_SUBTITLE"));
						event.put("ST_DATE", date);
						
//						int total = (Integer)Sub.get("ASS_MAXIMUM");			//총 인원수
						String str = String.valueOf(Sub.get("ASS_MAXIMUM"));
						int total = Integer.parseInt(str);
						
							for(HashMap<String, Object> apply : programApplyList) {
//								int referenceCnt = (Integer)apply.get("APP_COUNT");	//신청된 인원수
								String str2 = String.valueOf(apply.get("APP_COUNT"));
								int referenceCnt = Integer.parseInt(str2);
								
								Date GP_DATE = dayTime.parse((String)apply.get("APP_ST_DATE"));
								//서브키 값이 같고 시간이 같으면
								if(GP_DATE.compareTo(now_date) == 0) {
									if((((String)apply.get("APP_ASS_KEYNO")).equals((String)Sub.get("ASS_KEYNO"))) 
											&& (((String)apply.get("APP_ST_TIME")).equals((String)Sub.get("ASS_ST_TIME")))) {
										total -= referenceCnt;
									}										
								}
							}
//						event.put("totalcnt", (Integer)Sub.get("ASS_MAXIMUM"));	//총 인원수
						event.put("totalcnt", Integer.parseInt(str));	//총 인원수
						event.put("cnt", total);	//잔여 인원수
						
						eventList.add(event);
					}
				}
			}
		}
		return eventList;
	}
	
	/**
	 * 신청 프로그램 티켓예매 할인적용
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/programChargeAjax.do")
	@ResponseBody
	public Map<String,Object> functionProgramChargeAjax(
			HttpServletRequest req
			,@RequestParam HashMap<String,Object> map
			, ApplicationDTO ApplicationDTO
			, @RequestParam("key") String key
			) throws Exception {
		
		ApplicationDTO.setAP_KEYNO(key);
		List<HashMap<String,Object>> chargeList = Component.getList("Application.AD_SELECT", ApplicationDTO);	//할인적용 데이터
		HashMap<String,Object> program_price = Component.getData("Application.PROGRRAM_PRICE", ApplicationDTO);		//프로그램 요금
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		
		returnMap.put("chargeList", chargeList);
		returnMap.put("program_price", program_price);
		return returnMap;
	}
	
	/**
	 * 신청 프로그램 티켓예매 할인 설명
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/program/SaleComentAjax.do")
	@ResponseBody
	public String SaleComentAjax(
			HttpServletRequest req
			,@RequestParam HashMap<String,Object> map
			, ApplicationDTO ApplicationDTO
			, @RequestParam("AD_KEYNO") String AD_KEYNO
			) throws Exception {
		
		ApplicationDTO.setAD_KEYNO(AD_KEYNO);
		
		String Coment = Component.getData("Application.SaleComent", ApplicationDTO);
		return Coment;
	}
	
	/**
	 * 신청 프로그램 등록처리
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@Transactional
	@RequestMapping(value="/cf/function/programInsert.do")
	@CheckActivityHistory(desc="신청 프로그램 등록 작업")
	public String ProgramInsert(
				  HttpServletRequest req
				, Map<String,Object> commandMap
				, @ModelAttribute ApplicationDTO ApplicationDTO
				, @RequestParam(value="APD_AD_KEYNO" , required = false) String[] APD_AD_KEYNO
				, @RequestParam(value="APD_CNT" , required = false) String[] APD_CNT
				, @RequestParam(value="APD_PRICE" , required = false) String[] APD_PRICE
			) throws Exception {
		
		//9 : 성공 || 0 : 신청인원 초과
		String result = "";
		
		ApplicationDTO.setAPP_KEYNO(CommonService.getTableKey("APP"));
		
		if(ApplicationDTO.getApp_type().equals("N")) {
			if(ApplicationDTO.getAP_PRICE().equals("0")) {
				ApplicationDTO.setAPP_STATUS(SettingData.APPLY_COMPLETE);
			}else {
				ApplicationDTO.setAPP_STATUS(SettingData.APPLY_WAITING);			
			}
		}else if(ApplicationDTO.getApp_type().equals("W")) {	//대기자
			ApplicationDTO.setAPP_STATUS(SettingData.APPLY_RESERVE);
		}
		Component.createData("Application.APP_Insert", ApplicationDTO);	//프로그램 등록
		
		if(APD_AD_KEYNO != null) {
			for (int i = 0; i < APD_AD_KEYNO.length; i++) {
				ApplicationDTO.setAPD_AD_KEYNO(APD_AD_KEYNO[i]);
				for (int j = 0; j < APD_CNT.length; j++) {
					if(i == j) {
						ApplicationDTO.setAPD_CNT(APD_CNT[j]);					
						for (int k = 0; k < APD_PRICE.length; k++) {
							if(j == k) {
								ApplicationDTO.setAPD_PRICE(APD_PRICE[k]);
								Component.createData("Application.APP_Charge", ApplicationDTO);	//요금제 등록
							}
						}
					}
				}
			}
		}else{
			//ApplicationDTO.setAPD_AD_KEYNO(CommonService.getTableKey("APD"));
            ApplicationDTO.setAPD_AD_KEYNO("AD_0000000000");
			ApplicationDTO.setAPD_CNT("0");
			ApplicationDTO.setAPD_PRICE("0");
			Component.createData("Application.APP_Charge", ApplicationDTO);	//요금제 등록
		}
		
		return result;
	}
	
	/**
	 * 수강대상자 등록처리
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/cf/function/userInsertAjax.do")
	@Transactional
	@CheckActivityHistory(desc="수강대상자 등록 작업")
	public ApplicationDTO UserInsertAjax(
			HttpServletRequest req
			, Map<String,Object> commandMap
			, @ModelAttribute ApplicationDTO ApplicationDTO
			) throws Exception {
		//ApplicationDTO.setAPU_KEYNO(CommonService.getTableKey("APU"));
		ApplicationDTO.setAPU_SELFYN("N");
		Component.createData("Application.APU_Insert", ApplicationDTO);		//수강생 등록
		
		return ApplicationDTO;
	}
	
	/**
	 * 수강대상자  수정처리
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/cf/function/userUpdateAjax.do")
	@Transactional
	@CheckActivityHistory(desc="수강대상자  수정 작업")
	public void UserUpdateAjax(
			HttpServletRequest req
			, Map<String,Object> commandMap
			, @ModelAttribute ApplicationDTO ApplicationDTO
			) throws Exception {
		//ApplicationDTO.setAPU_KEYNO(CommonService.getKeyno(ApplicationDTO.getAPU_KEYNO(), "APU"));
		ApplicationDTO.setAPU_KEYNO(ApplicationDTO.getAPU_KEYNO());
		Component.updateData("Application.APU_Update", ApplicationDTO);		//수강생 수정
	}
	
	/**
	 * 수강대상자 삭제처리
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/cf/function/userDeleteAjax.do")
	@Transactional
	@CheckActivityHistory(desc="수강대상자 삭제 작업")
	public String UserDeleteAjax(
			HttpServletRequest req
			, @RequestParam(value="APU_KEYNO" , required = false) String APU_KEYNO
			, @ModelAttribute ApplicationDTO ApplicationDTO
			) throws Exception {
//		ApplicationDTO.setAPU_KEYNO(CommonService.getKeyno(APU_KEYNO, "APU"));
		ApplicationDTO.setAPU_KEYNO(APU_KEYNO);
		Component.updateData("Application.APU_Delete", ApplicationDTO);		//수강생 삭제
		return APU_KEYNO;
	}
	
	
	
/*	@RequestMapping(value="/cf/function/program/popup.do")
	public ModelAndView functionProgrampopup() throws Exception {
		ModelAndView mv  = new ModelAndView("/user/cf/function/program/prc_program_popup");
		return mv;
	}*/

	/**
	 * 부서 안내
	 * @param req
	 * @param commandMap
	 * @param msg
	 * @param EventDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/department.do")
	@CheckActivityHistory(desc="부서 안내 페이지 방문")
	public ModelAndView cfIntroDepartmemt(HttpServletRequest req, Map<String,Object> commandMap
			, OrganDTO OrganDto
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/user/cf/function/prc_department");
		
		OrganDto.setDN_HOMEDIV_C(SiteProperties.getString("HOMEPAGE_REP"));
		mv.addObject("orgList",Component.getList("Organization.DN_getList",OrganDto));
		mv.addObject("orgPersonList",Component.getList("Organization.DU_getList",OrganDto));
		return mv;
	}
	
	/**
	 * 단체예약
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/group.do")
	@CheckActivityHistory(desc="단체예약 페이지 방문")
	public ModelAndView group(
				  HttpServletRequest req
				, Map<String,Object> commandMap
				, ApplicationDTO ApplicationDTO
				, PlaceDTO place
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/user/cf/function/group/prc_group");
	
		List<HashMap<String, Object>> GroupList = Component.getList("Group.GM_Select", ApplicationDTO);
		mv.addObject("GroupList", GroupList);
		if(GroupList.size() > 0) {
			String GM_KEYNO = (String)GroupList.get(0).get("GM_KEYNO");
			ApplicationDTO.setGM_KEYNO(GM_KEYNO);
			mv.addObject("DetailData", Component.getData("Group.GM_Select", ApplicationDTO));
			mv.addObject("placeList", Component.getList("Place.PM_getList",place));
		}
		
		return mv;
	}
	
	/**
	 * 단체예약리스트ajax
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/cf/function/groupAjax.do")
	public Map<String, Object> groupAjax(
			HttpServletRequest req
			, ApplicationDTO ApplicationDTO
			) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("programdata", Component.getData("Group.GM_Select", ApplicationDTO)); 
		return map;
	}
	
	/**
	 * 단체예약 스케줄 ajax로 가져오기 
	 *  캘린더형에서 사용중
	 */
	@RequestMapping(value="/cf/function/groupViewAjax.do")
	@ResponseBody
	public Map<String,Object> groupViewAjax(
			 HttpServletRequest req
			,@RequestParam HashMap<String,Object> map
			, ApplicationDTO ApplicationDTO
			) throws Exception {
	
		//공휴일
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		if(map.get("start") != null){
			String start = dayTime.format(new Date(Long.parseLong((String) map.get("start")) * 1000));
			String end = dayTime.format(new Date(Long.parseLong((String) map.get("end")) * 1000));
			
			//System.out.println(map.get("MN_KEYNO"));
			map.put("BN_STDT", start);
			map.put("BN_ENDT", end);
		}
		
		String STDT = (String)map.get("BN_STDT");
		String ENDT = (String)map.get("BN_ENDT");
		String holidayType = ApplicationDTO.getGM_HOLIDAY();
		
		Date now_date = dayTime.parse(STDT);
		Date end_date = dayTime.parse(ENDT);
		
		//스케줄가져오기
		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> schedulemain = Component.getList("Group.ScheduleMain", ApplicationDTO);	//메인 스케줄 데이터
		List<HashMap<String,Object>> schedulesub = Component.getList("Group.ScheduleSub", ApplicationDTO);	//메인 스케줄 데이터
		List<HashMap<String,Object>> program = Component.getList("Group.GP_ProgramList", ApplicationDTO);		//신청데이터
		List<HolidayDTO> holiday = null;
		
		if(holidayType.equals("N")) {	//적용안함
			holiday = new ArrayList<>();	
		}else {
			holiday = HolidayService.getHolidaysType(STDT,ENDT, holidayType);
		}
		
		HashMap<String,Object> event = null;
		List<HashMap<String,Object>> eventList = new ArrayList<HashMap<String,Object>>();
		Calendar cal = Calendar.getInstance();
		
		if(schedulemain != null && schedulemain.size() > 0) {
			
			do {
				String now = dayTime.format(now_date);
				boolean holidayCheck = false;
				
				if(holiday.size() > 0) {
					for (HolidayDTO H : holiday) {
						if(now.equals(H.getTHM_DATE())) {
							holidayCheck = true;
							break;
						}
					}
				}
				
				if(!holidayCheck) {
					for(HashMap<String, Object> Main : schedulemain) {
						if(!StringUtils.isEmpty((String)Main.get("GSM_STDT"))) {	//시작일이 있으면
							Date GSM_STDT = dayTime.parse((String)Main.get("GSM_STDT"));
							Date GSM_ENDT = dayTime.parse((String)Main.get("GSM_ENDT"));
							if(now_date.compareTo(GSM_STDT) >= 0 && now_date.compareTo(GSM_ENDT) <= 0) {	//시작일이 종료일보다 작으면
								
							}else {
								continue;
							}
						}
						
						String gsmDay = (String)Main.get("GSM_DAY");
						if(StringUtils.isEmpty(gsmDay)) {
							
						}else {
							//비교 
							cal.setTime(now_date);
							int day = cal.get(Calendar.DAY_OF_WEEK)-1;
							String now_day = String.valueOf(day);
							
							if(!gsmDay.contains(now_day)) {
								continue;
							}
						}
						
						for (HashMap<String, Object> Sub : schedulesub) {
							//메인키와 서브키가 일치하면
							if(((String)Main.get("GSM_KEYNO")).equals((String)Sub.get("GSS_GSM_KEYNO"))) {
								event =  new HashMap<String,Object>();
								event.put("st_date", now);
								event.put("en_date", now);
								event.put("GSS_ST_TIME", (String)Sub.get("GSS_ST_TIME"));
								event.put("GSS_EN_TIME", (String)Sub.get("GSS_EN_TIME"));
								
//								int total = (Integer)Sub.get("GSS_MAXIMUM");			//총 인원수
								String str = String.valueOf(Sub.get("GSS_MAXIMUM"));	//총 인원수
								int total = Integer.parseInt(str);
								
								for(HashMap<String, Object> tour : program) {
//									int referenceCnt = (Integer)tour.get("GP_HEADCOUNT");	//신청된 인원수
									String str2 = String.valueOf(tour.get("GP_HEADCOUNT"));	//총 인원수
									int referenceCnt = Integer.parseInt(str2);
									
									Date GP_DATE = dayTime.parse((String)tour.get("GP_DATE"));
									//서브키 값이 같고 시간이 같으면
									if(GP_DATE.compareTo(now_date) == 0) {
										if((((String)tour.get("GP_GSS_KEYNO")).equals((String)Sub.get("GSS_KEYNO"))) 
												&& (((String)tour.get("GP_TIME")).equals((String)Sub.get("GSS_ST_TIME")))) {
											total -= referenceCnt;
										}										
									}
								}
								
								event.put("GSS_MAXIMUM", total);	
								event.put("GSS_SUBTITLE", (String)Sub.get("GSS_SUBTITLE"));
								event.put("MAIN_KEYNO", (String)Sub.get("GSS_GSM_KEYNO"));
								event.put("SUB_KEYNO", (String)Sub.get("GSS_KEYNO"));
								
								eventList.add(event);
							}
						}
					}
				}
				
				//하루씩 더하기
				cal.setTime(now_date);
				cal.add(Calendar.DATE, 1);
				now_date = cal.getTime();
				
			}while(now_date.compareTo(end_date) < 0);
			
			
			}
		
		returnMap.put("eventList", eventList);
		returnMap.put("holidayList", HolidayService.getHolidays(STDT,ENDT));
		
		return  returnMap;
	}
	
	/**
	 * 투어 예약 등록
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@Transactional
	@RequestMapping(value="/cf/function/Group/TourInsert.do")
	@CheckActivityHistory(desc="투어 예약 등록 작업")
	public String TourInsert(
				  HttpServletRequest req
				, Map<String,Object> commandMap
				, ApplicationDTO ApplicationDTO
				, @RequestParam(value="Type",required= false) String type
			) throws Exception {
		
		//9 : 성공 || 0 : 신청인원 초과
		String result = "";
		
		//총 정원
		Integer maxCnt = Component.getCount("Group.GSS_MAX", ApplicationDTO);
		//해당 신청일자에 신청한 총 인원수
		Integer person = Component.getCount("Group.GP_DuplicateData", ApplicationDTO);
		if(person == null) {
			person = 0;
		}
		int remainCnt = maxCnt - person;
		
		if(remainCnt >= 0){ // 신청가능 총인원 - 신청한 인원 >= 새로운 신청중 인원
			if(type.equals("I")) {
				//고유키 세팅
				Component.createData("Group.GP_Insert", ApplicationDTO);
			}else if(type.equals("U")) {
				Component.updateData("Group.GP_Update", ApplicationDTO);				
			}
			result = "9";
		
		//신청불가
		}else{
			result = "0";
		}
		return result;
	}
	
	
	/**
	 * 채팅
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/cf/function/chat.do")
	public ModelAndView cfFunctionChat() throws Exception {
		ModelAndView mv  = new ModelAndView("/user/cf/function/prc_chat");
		
		return mv;
	}
	
	//달력 기념일 이벤트
	@RequestMapping(value="/cf/function/holidayAjax.do")
	@ResponseBody
	public Map<String,Object> BoardListViewAjax(HttpServletRequest req
			 ,@RequestParam HashMap<String,Object> map
			) throws Exception {
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String STDT = dayTime.format(new Date(Long.parseLong((String) map.get("start")) * 1000));
		String ENDT = dayTime.format(new Date(Long.parseLong((String) map.get("end")) * 1000));
		returnMap.put("holidayList", HolidayService.getHolidays(STDT,ENDT));
		
		return  returnMap;
	}
	
	
	
}
