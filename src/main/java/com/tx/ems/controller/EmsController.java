package com.tx.ems.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.dto.Common;
import com.tx.common.security.aes.AES256Cipher;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;
import com.tx.ems.dto.SerialDTO;
import com.tx.ems.wether.WetherService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class EmsController {
   
	@Autowired ComponentService Component;
	/** 페이지 처리 출 */
	
	@Autowired CommonService CommonService;
	/** 페이지 처리 출 */
	@Autowired private PageAccess PageAccess;
	
	
   /**
    * 
    * @return
    * @throws 인버터 페이지 변경
    */
   @RequestMapping("/cf/inverter.do")
   public ModelAndView inverter(
		   @RequestParam(value="inverter",defaultValue="one")String inverter
		   ) throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/prc_ems_inverter");
	   HashMap<String, Object> map = new HashMap<String, Object>();
		//1호기 관련 데이터
		map.put("inverter", "one");
		mv.addObject("OneData",Component.getData("empc.ONE_getData",map));
		map.put("inverter", "two");
		//2호기 간단한 데이터(오늘날짜) 합계
		mv.addObject("TwoData",Component.getData("empc.ONE_getData",map));
	   
		map.put("inverter", inverter);
		map.put("type", "day");
		mv.addObject("MonSum",Component.getList("empc.ONE_sum_M",map));
		
	   mv.addObject("MonAll",Component.getData("empc.One_sum_M_All",map));
	   map.put("mon", "to");
	   mv.addObject("MonAll_Other",Component.getData("empc.One_sum_M_Other_All",map));
	   mv.addObject("MonAll_Other_pre",Component.getData("empc.One_sum_PreM_Other_All",map));

	   map.put("mon", "all");
	   mv.addObject("All_Other",Component.getData("empc.One_sum_M_Other_All",map));
	   mv.addObject("All",Component.getData("empc.One_sum_All",map));
	   
	   mv.addObject("ToSum",Component.getData("empc.ONE_sum_Today",map));
	   mv.addObject("PreSum",Component.getData("empc.ONE_sum_Preday",map));
	   
	   mv.addObject("inverter",inverter);
      
      return mv;
   }
   
   
   @RequestMapping("/cf/device.do")
   public ModelAndView device(
		   @RequestParam(value="inverter",defaultValue="one")String inverter
		   ) throws Exception{
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/prc_ems_device");
	   HashMap<String, Object> map = new HashMap<String, Object>();
		//1호기 관련 데이터
		map.put("inverter", "one");
		mv.addObject("OneData",Component.getData("empc.ONE_getData",map));
//		map.put("inverter", "two");
		//2호기 간단한 데이터(오늘날짜) 합계
//		mv.addObject("TwoData",Component.getData("empc.ONE_getData",map));
	   
		map.put("inverter", inverter);
		map.put("type", "day");
	
	   map.put("mon", "to");
	   mv.addObject("MonAll_Other",Component.getData("empc.One_sum_M_Other_All",map));
		
	   mv.addObject("MonSum",Component.getList("empc.ONE_sum_M",map));
	   mv.addObject("MonAll",Component.getData("empc.One_sum_M_All",map));
	   mv.addObject("All",Component.getData("empc.One_sum_All",map));
	   
	   mv.addObject("ToSum",Component.getData("empc.ONE_sum_Today",map));
	   mv.addObject("PreSum",Component.getData("empc.ONE_sum_Preday",map));
	   
	   mv.addObject("pcsSolar",Component.getList("ems.PcsSolaData",map));
	   mv.addObject("emsData",Component.getList("ems.EMSData",map));
	   
	   mv.addObject("LVDC",Component.getData("empc.LVDC_getDATA"));
	
	   mv.addObject("inverter",inverter);
	   
	   return mv;
   }
   
   
   @RequestMapping("/cf/dateajax.do")
   @ResponseBody
   public List<SerialDTO> dateajax(
		   @RequestParam(value="type", defaultValue="day")String type
		   ,@RequestParam(value="inverter",defaultValue="all")String inverter
		   ) throws Exception{
	   HashMap<String,Object> map = new HashMap<>();
	   List<SerialDTO> list = new ArrayList<>();
	   map.put("type", type);
	   map.put("inverter", inverter);
	   
	   if(type.equals("week")) {
		   list = Component.getList("empc.ONE_sum_M",map);
	   }else if(type.equals("month")) {
		   list = Component.getList("empc.ONE_sum_Y",map);
	   }else if(type.equals("year")) {
		   list = Component.getList("empc.ONE_sum_Y",map);
	   }else {
		   list = Component.getList("empc.ONE_sum_M",map);
	   }
	   return list;
   }

   @RequestMapping("/cf/serial.do")
   public ModelAndView serial() throws Exception{
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/prc_ems_serial");
	   
	   return mv;
   }
   
   /**
    * EMS or PCS 데이터 출력 부분
    * @return
    * @throws Exception
    */
   @RequestMapping("/serialAjax.do")
   public ModelAndView SerialAjax(
		   SerialDTO serial
		   ,@RequestParam(value="type",defaultValue="ems")String type
		   ) throws Exception{
	   ModelAndView mv = new ModelAndView();
	   if(type.equals("ems")) {
		   mv = new ModelAndView("");
		   serial = Component.getData("empc.EMS_getData");
	   }else {
		   mv = new ModelAndView("/user/_CF/ems/ajax/prc_ems_serial_ajax2"); 
		   serial = Component.getData("empc.PCS_getData");
	   }
	   mv.addObject("resultList",serial);
       return mv;
   }
   
   
   
   /**
    * 
    * @return
    * @throws 예측모델 페이지
    */
   @RequestMapping("/cf/preModel.do")
   public ModelAndView forecaste_model (
		   ) throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/prc_ems_premodel");
	   HashMap<String,Object> map = new HashMap<>();
	   
	   List<HashMap<String,Object>> result = Component.getListNoParam("Wether.SelectDate");
	  /* List<HashMap<String,Object>> electronix = Component.getListNoParam("ELECT.SelectElectData");
	   List<HashMap<String,Object>> electronixM = Component.getListNoParam("ELECT.SelectElectData_M");*/
	   
	   map.put("inverter", "all");
	   map.put("type", "day");
	   //전년 동월 소비 발전
	   mv.addObject("One_sum_M",Component.getData("One_sum_PreM_All",map));
	   
	   //전주 평균 발전 소비
	   SerialDTO preWeek = Component.getData("empc.EMS_PreWeek");
	  if(preWeek != null) {
		  if("1".equals(preWeek.getWeek_num())) {
			   preWeek = Component.getData("empc.EMS_PreWeek_F");
		   }
		   mv.addObject("preWeek", preWeek);
	  }
	   
	   //날씨
	   mv.addObject("resultDate", result);
	   //금일 발전 예측량
	   mv.addObject("today", Component.getData("ELECT.SelectElectData_Today"));
	   //이번달 데이터
	   map.put("dayType", "A");
	   mv.addObject("MonA",Component.getList("empc.PreModel_CharData",map));
	   map.put("dayType", "B");
	   mv.addObject("MonB",Component.getList("empc.PreModel_CharData",map));
	   map.put("dayType", "C");
	   mv.addObject("MonC",Component.getList("empc.PreModel_CharData",map));
	   
	   /*//이번달 발전 예측량
	   mv.addObject("electronix", electronix);
	   //지난달 발전 예측량
	   mv.addObject("electronixM", electronixM);*/
	   
	   return mv;
   }
   /**
    * 
    * @return
    * @throws 현재 시간 별 상세 날씨 출력
    */
   @RequestMapping("/forest_ajax.do")
   @ResponseBody
   public List<String> forest_ajax() throws Exception {
	   WetherService w = new WetherService();
	   List<String> list = w.AjaxDate();
	   return list;
   }
   
   /**
    * 
    * @return
    * @throws 5일 날씨 가져오기 
    */
   @RequestMapping("/Pre_WetherData.do")
   @ResponseBody
   public void PreWether() throws Exception {
		WetherService w = new WetherService();
		ArrayList<HashMap<String,Object>> list = w.FarDatePredict();
		   
		Component.deleteData("Wether.DeleteDate");
		Component.createData("Wether.DateInsert", list);
   }
   
   
   @RequestMapping("/cf/schedule.do")
   public ModelAndView schedule() throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/prc_ems_schedule");
	   List<HashMap<String,Object>> result = Component.getListNoParam("Wether.SelectDate");
	   mv.addObject("resultDate", result);
	   return mv;
   }
   
   
   
   @RequestMapping("/cf/loglist.do")
   public ModelAndView Loglist() throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/prc_ems_logList");
	   return mv;
   }
   
   @RequestMapping("/loglistAjax.do")
   public ModelAndView LoglistAjax(
		   	HttpServletRequest req
		   	,Common search
		   )  throws Exception  {
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/ajax/prc_ems_logList_ajax");

	   List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
	   PaginationInfo PageInfo = PageAccess.getPagInfo(search.getPageIndex(),"ems.emsAllDataCnt",map,search.getPageUnit2(),5);

	   map.put("firstIndex", PageInfo.getFirstRecordIndex());
		map.put("lastIndex", PageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", PageInfo.getRecordCountPerPage());
	   
	   mv.addObject("PaginationInfo", PageInfo);
	
	   List<HashMap<String,Object>> list = Component.getList("ems.emsAllData", map);
	   
	   mv.addObject("resultlist",list);
	   mv.addObject("search", search);
	   return mv;
   }
   
   
   /**
	 * excel ajax
	 * @param req
	 * @param res
	 * @param search
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/excelAjax.do")
	public ModelAndView LogListExcelAjax(
			HttpServletRequest req
			, HttpServletResponse res
			, Common search
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/user/_CF/ems/ajax/prc_ems_logList_excel");
		
		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
		
		List<HashMap<String,Object>> resultList = Component.getList("ems.emsAllData", map); 
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
   
   
   @RequestMapping("/cf/user.do")
   public ModelAndView user() throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/prc_ems_user");
	   
	   return mv;
   }
  
   
   @RequestMapping(value="/userAjax.do")
	public ModelAndView adminMemberViewPaging(HttpServletRequest req,
			Common search
			) throws Exception {
		
		ModelAndView mv  = new ModelAndView("/user/_CF/ems/ajax/prc_ems_user_ajax");

		List<HashMap<String,Object>> searchList = Component.getSearchList(req);
		
		Map<String,Object> map = CommonService.ConverObjectToMap(search);
		
		if(searchList != null){
			map.put("searchList", searchList);
		}
		
		PaginationInfo pageInfo = PageAccess.getPagInfo(search.getPageIndex(),"member.UI_getListCnt",map, search.getPageUnit2(), 10);
		
		map.put("firstIndex", pageInfo.getFirstRecordIndex());
		map.put("lastIndex", pageInfo.getLastRecordIndex());
		map.put("recordCountPerPage", pageInfo.getRecordCountPerPage());
		
		mv.addObject("paginationInfo", pageInfo);
		
		List<HashMap<String,Object>> resultList = Component.getList("member.UI_getList", map); 
		mv.addObject("resultList", userInfoDecode(resultList));
		mv.addObject("search", search);
		return mv;
		
	}
   
   
   
   private List<HashMap<String, Object>> userInfoDecode(List<HashMap<String, Object>> userList) {
		
		for(HashMap<String, Object> user : userList){
			String UI_EMAIL = (String)user.get("UI_EMAIL");
			String UI_PHONE = (String)user.get("UI_PHONE");
			
			try{
				if(StringUtils.isNotBlank(UI_EMAIL)){
					user.put("UI_EMAIL", AES256Cipher.decode(UI_EMAIL));
				}
				if(StringUtils.isNotBlank(UI_PHONE)){
					user.put("UI_PHONE", AES256Cipher.decode(UI_PHONE));
				}
				
			}catch(Exception e){
				System.out.println("UserDTO 복호화중 에러 :: " + e.getMessage());
			}
		}
		
		return userList;
	}
	//   Date date2 = new Date();
	//      String End = format1.format(date2);
	//      long difference = (date2.getTime() - date.getTime()) / 1000;

     // log.writeLog("실행 시간:: " + difference + "초");
   
   @RequestMapping(value="/cf/InsertTestData.do")
   public ModelAndView TestDataInsert() throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_CF/ems/prc_ems_TestData");
	   
	   return mv;
   }
   
   @RequestMapping(value="/cf/DataInsert.do")
   @ResponseBody
   public String DataInsert(SerialDTO inverter) throws Exception {
	   
	   String msg = "";
	   
	   if(Float.parseFloat(inverter.getIO_POWER()) >= 0 
			   && Float.parseFloat(inverter.getIO_POWER()) < 10000
			   && Float.parseFloat(inverter.getIO_CHARGE()) >= 0 
			   && Float.parseFloat(inverter.getIO_CHARGE()) < 101 
			   && Float.parseFloat(inverter.getIO_USAGE()) >= 0  
			   && Float.parseFloat(inverter.getIO_USAGE()) < 10) {
		   
		   HashMap<String,Object> map = Component.getData("empc.PowerSum");
		   String p = inverter.getIO_POWER();
		   if(map != null) {
			   p = p + map.get("powers").toString();
		   }
		   
		   
		   //탄소 절감량
		   String co2 = Float.toString((float) (Float.parseFloat(p)*1.213));
		   String money = String.format("2",(float) (Float.parseFloat(p)*0.0933));
		   
		   inverter.setIO_CO2(co2);
		   inverter.setIO_CASH(money);
		   
		   Component.createData("empc.TestData", inverter);
		   msg = "데이터가 등록되었습니다.";
	   }
	   else {
		   msg = "해당 데이터는 조건을 만족하지 못하여 등록되지 않았습니다.";
	   }
	   return msg;
   }
   
}