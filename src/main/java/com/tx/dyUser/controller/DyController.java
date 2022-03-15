package com.tx.dyUser.controller;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonParser;
import com.tx.common.config.SettingData;
import com.tx.common.security.password.MyPasswordEncoder;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.reqapi.requestAPIservice;
import com.tx.dyAdmin.member.dto.UserDTO;
import com.tx.dyAdmin.statistics.dto.LogDTO;
import com.tx.dyUser.wether.WetherService;


@Controller
public class DyController {
   
	@Autowired ComponentService Component;
	/** 페이지 처리 출 */
	
	@Autowired CommonService CommonService;
	
	/** 암호화 */
	@Autowired MyPasswordEncoder passwordEncoder;
	
	@Autowired requestAPIservice requestAPI;
	
   /**
    *@return 관리자 종합현황 페이지 
   */
   @RequestMapping("/dy/moniter/overAll.do")
   public ModelAndView overAll(HttpServletRequest req) throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_DY/monitering/dy_overallStatus");
	   HashMap<String,Object> cntM = new HashMap<String, Object>();
	   HashMap<String,Object> type = new HashMap<String, Object>();
	   
	   Map<String, Object> user = CommonService.getUserInfo(req);
	   type.put("UI_KEYNO",user.get("UI_KEYNO").toString());
	   type.put("UIA_NAME",user.get("UIA_NAME").toString());
	   
	   //종합현황은 관리자만 출입가능
	   type.put("type",null);
	   type.put("value","정상");
	   cntM.put("a",Component.getCount("main.select_Main_cnt",type));
	   type.put("value","장애");
	   cntM.put("b",Component.getCount("main.select_Main_cnt",type));
	   type.put("value","미개통");
	   cntM.put("c",Component.getCount("main.select_Main_cnt",type));
	   
	   mv.addObject("cntM",cntM);
	   
	   String sql = "main.select_MainData";
	   //삼환관리자 처리부분
	   if(SettingData.samwhan.equals(user.get("UIA_KEYNO").toString())) {
		   sql = "main.select_MainData_Ad";
	   }
	   mv.addObject("list", Component.getList(sql,type));
	   mv.addObject("listSum", Component.getData("main.select_MainSum",type));
      return mv;
   }
   
   
   /**
    * @return 관리자 종합현황 세부인버터 정보 추출 
    */
   @RequestMapping("/dy/moniter/overAll_Ajax.do")
   @ResponseBody
   public ModelAndView overAll_Ajax(HttpServletRequest req,
		   @RequestParam(value="keyno")String keyno
		   ) throws Exception {
	   //날씨 데이터, 용량, 현재발전, 금일, 전일 ,전월 ,금년, 누적 !
	   ModelAndView mv = new ModelAndView("/user/_DY/monitering/ajax/dy_overallStatus_ajax");
	   
	   HashMap<String,Object> type = new HashMap<String, Object>();
	   
	   Map<String, Object> user = CommonService.getUserInfo(req);
	   type.put("UI_KEYNO",user.get("UI_KEYNO").toString());
	   type.put("UIA_NAME",user.get("UIA_NAME").toString());
	   
	   //단일 데이터 (금일, 전일, 현재발전, 설치용량)
	   type.put("type",keyno);
	   
	   String sql = "main.select_MainData";
	   //삼환관리자 처리부분
	   if(SettingData.samwhan.equals(user.get("UIA_KEYNO").toString())) {
		   sql = "main.select_MainData_Ad";
	   }
	   
	   HashMap<String,Object> ob =  Component.getData(sql,type);
	   String area = ob.get("DPP_AREA").toString(); //지역
	   
	   mv.addObject("detail_Data",ob);
	   
	   List<HashMap<String,Object>> weather =  Component.getList("Weather.select_Weather",area);
	   
	   if(weather.size() > 0) {
		   mv.addObject("Weather",weather.get(1));
	   }
	   
	   
	   DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	   DateFormat format2 = new SimpleDateFormat("yyyy");
	   Date d = new Date();
	   String now = format.format(d);
	   
	   // 이번달 날짜 count 
	   Calendar c1 = Calendar.getInstance(); 
	   Date Today = c1.getTime();
	   c1.set(Calendar.DAY_OF_MONTH,1);
	   Date Fmon = c1.getTime();
	   long diffDay = (Today.getTime() - Fmon.getTime()) / (24*60*60*1000);
	   mv.addObject("month1Cnt",diffDay);

	   format = new SimpleDateFormat("yyyy-MM");
	   String nowd = format.format(c1.getTime()); 
	   c1.add(Calendar.MONTH, -1); 
	   String pred = format.format(c1.getTime()); 
	   c1.add(Calendar.MONTH, -1); 
	   String ppred = format.format(c1.getTime());
	   
	   Calendar c2 = Calendar.getInstance(); 
	   c2.add(Calendar.YEAR, -1); 
	   String nowY = format2.format(c2.getTime()); //작년

	   type.put("date","day");
	   //전월 누적치 차액(전달 - 전에전달) 
	   type.put("Conn_date",pred);
	   float preC = Component.getData("main.recent_sum",type);
	   
	   type.put("Conn_date",ppred);
	   float ppreC = Component.getData("main.recent_sum",type);
	   mv.addObject("Prmonth",preC-ppreC);
	   
	   type.put("Conn_date",nowd);//금월
	   float TodayCum = Component.getData("main.recent_sum",type);
	   mv.addObject("month1",TodayCum-preC);
	   
	   type.put("date","year");
	   type.put("Conn_date",nowY);
	   float YearCum = Component.getData("main.recent_sum",type);
	   mv.addObject("year1",TodayCum-YearCum);
	   
	   //알림테이블 부분
	   mv.addObject("ResultList",Component.getList("main.select_errorData", keyno));
	   
	   return mv;
   }
   
  /**
    * @return 현장리스트 검색
    */
   @RequestMapping("/dy/moniter/overAll_Ajax2.do")
   @ResponseBody
   public ModelAndView overAll_Ajax2(HttpServletRequest req
		  , @RequestParam(value="region")String region
		  , @RequestParam(value="status")String status
		   ) throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_DY/monitering/ajax/dy_overallStatus_ajax2");
	   
	   HashMap<String,Object> type = new HashMap<String, Object>();
	   
	   Map<String, Object> user = CommonService.getUserInfo(req);
	   type.put("UI_KEYNO",user.get("UI_KEYNO").toString());
	   type.put("UIA_NAME",user.get("UIA_NAME").toString());
	   type.put("type",null);
	   type.put("region",region);
	   type.put("status",status);
	   
	   String sql = "main.select_MainData";
	   if(SettingData.samwhan.equals(user.get("UIA_KEYNO").toString())) {
		   sql = "main.select_MainData_Ad";
	   }
	   mv.addObject("list", Component.getList(sql,type));
	   
	   return mv;
   }
   
  /**
   * @return 발전 현황
   */
   @RequestMapping("/dy/moniter/general.do")
   public ModelAndView general(HttpServletRequest req,
		   @RequestParam(value="keyno",defaultValue="0")String key,
 		   @RequestParam(value="name",defaultValue="인버터 1호")String name,
 		   HttpSession session
		   ) throws Exception{
	   ModelAndView mv = new ModelAndView("/user/_DY/monitering/dy_generalStatus");
	   //회원별 발전소 키를 가지고 정보 확인 일단 기본키
	   HashMap<String,Object> type = new HashMap<String, Object>();
	   
	   //아이디 세션에 있는값 저장
	   Map<String, Object> user = CommonService.getUserInfo(req);
	   type.put("UI_KEYNO",user.get("UI_KEYNO").toString());
	   type.put("UIA_NAME",user.get("UIA_NAME").toString());
	   
	   String sql = "main.select_MainData";
	   String sql2 = "main.Power_SelectKEY";
	   
	   if(SettingData.samwhan.equals(user.get("UIA_KEYNO").toString())) {
		   sql = "main.select_MainData_Ad";
		   sql2 = "main.Power_SelectKEY_Ad";
	   }

	   if(key.equals("0")) {
		 //1. 세션에 키값 저장확인
		   key = (String) session.getAttribute("DPP_KEYNO");
	   }
	   //2. 세션에 키값 없다면 
	   if(key == null || StringUtils.isEmpty(key)) {
		   key = Component.getData(sql2,type);
		   //선택된 키값 세션 저장(초기 제일 상위 KEY값 저장)
	   }
	   session.setAttribute("DPP_KEYNO", key);
	   List<HashMap<String,Object>> m_list = Component.getList(sql,type);
	   
	   if(m_list.size() == 0 ) {
		   mv = new ModelAndView("/user/_DY/monitering/dy_none");
		   mv.addObject("none","none");
		   return mv;
	   }
	   
	   mv.addObject("list", Component.getList(sql,type));
	   
	   type.put("type",key);
	   type.put("name",name);
	   //인버터 데이터
	   HashMap<String,Object> ob =  Component.getData(sql,type);
	   type.put("group","group");
	   
	   	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	   	DateFormat format2 = new SimpleDateFormat("yyyy");
	   	Date d = new Date();
	   	String now = format.format(d);
	   	
	   	type.put("searchBeginDate",now);
	   	type.put("searchEndDate",now);
	   
	   List<HashMap<String,Object>> dataList =  Component.getList("main.select_inverterData",type);
	   
	   String area = ob.get("DPP_AREA").toString(); //지역

	   List<HashMap<String,Object>> weather =  Component.getList("Weather.select_Weather",area);
	   
	   // 이번달 날짜 count 
	   Calendar c1 = Calendar.getInstance(); 
	   Date Today = c1.getTime();
	   c1.set(Calendar.DAY_OF_MONTH,1);
	   Date Fmon = c1.getTime();
	   long diffDay = (Today.getTime() - Fmon.getTime()) / (24*60*60*1000);
	   mv.addObject("month1Cnt",diffDay);
	   
	   
	   format = new SimpleDateFormat("yyyy-MM");
	   
	   String nowd = format.format(c1.getTime()); 
	   
	   c1.add(Calendar.MONTH, -1); 
	   String pred = format.format(c1.getTime()); 
	   c1.add(Calendar.MONTH, -1); 
	   String ppred = format.format(c1.getTime());
	   
	   Calendar c2 = Calendar.getInstance(); 
	   c2.add(Calendar.YEAR, -1); 
	   String nowY = format2.format(c2.getTime()); //작년
	   
	   type.put("date","day");
	   //전월 누적치 차액(전달 - 전에전달) 
	   type.put("Conn_date",pred);
	   float preC = Component.getData("main.recent_sum",type);
	   
	   type.put("Conn_date",ppred);
	   float ppreC = Component.getData("main.recent_sum",type);
	   mv.addObject("Prmonth",preC-ppreC);
	   
	   
	   type.put("Conn_date",nowd);//금월
	   float TodayCum = Component.getData("main.recent_sum",type);
	   mv.addObject("month1",TodayCum-preC);
	   
	   type.put("date","year");
	   type.put("Conn_date",nowY);
	   float YearCum = Component.getData("main.recent_sum",type);
	   mv.addObject("year1",TodayCum-YearCum);
	   
	   type.put("category","안전관리");//안전관리
	   mv.addObject("boardList_A", Component.getList("main.PowerBoard_select", type));

	   type.put("category","유지관리");//유지관리
	   mv.addObject("boardList_B", Component.getList("main.PowerBoard_select", type));

	   mv.addObject("DPP_KEYNO", key);
	   mv.addObject("InverterNum", name);
	   mv.addObject("invertDataList", dataList);
	   if(weather.size() > 0) {
		   mv.addObject("weatherToday",weather.get(1));
		   mv.addObject("weather",weather);
	   }
	   mv.addObject("ob",ob);
	   return mv;
   }
   
   /**
    * @return 발전 현황
    */
    @RequestMapping("/dy/moniter/generalAjax.do")
    @ResponseBody
    public HashMap<String,Object> generalAjax(HttpServletRequest req,
 		   @RequestParam(value="keyno",defaultValue="0")String key,
 		   @RequestParam(value="name",defaultValue="인버터 1호")String name	,
 		   HttpSession session
 		   ) throws Exception{
 	   HashMap<String,Object> map = new HashMap<String, Object>();
	   
 	   HashMap<String,Object> type = new HashMap<String, Object>();
 	  
 	   if(key.equals("0")) {
		   key = (String) session.getAttribute("DPP_KEYNO");
	    }
 	   session.setAttribute("DPP_KEYNO", key);
 	   
	   type.put("type",key);
	   type.put("name",name);
 	   
	   //개별데이터
	   HashMap<String,Object> data =  Component.getData("main.select_inverterData_ONE",type);
	   
	   map.put("invertData", data);
	   map.put("name", name);
	   //AllPower , Active
 	   return map;
    }
    
    /**
     * @return 통계 분석
     */
    @RequestMapping("/dy/moniter/stastics.do")
    public ModelAndView stastics(HttpServletRequest req,
    		@RequestParam(value="DPP_KEYNO",defaultValue="0")String key,
    		HttpSession session,
    		@RequestParam(value="DaliyType",defaultValue="1")String DaliyType,
    		@RequestParam(value="searchBeginDate",required=false)String searchBeginDate,
    		@RequestParam(value="searchEndDate",required=false)String searchEndDate,
    		@RequestParam(value="InverterType",defaultValue="0")String InverterType
    		) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/dy_statstics");
    	HashMap<String,Object> type = new HashMap<String, Object>();
    	
    	Map<String, Object> user = CommonService.getUserInfo(req);
 	    type.put("UI_KEYNO",user.get("UI_KEYNO").toString());
 	    type.put("UIA_NAME",user.get("UIA_NAME").toString());
 	    
 	    String sql = "main.select_MainData";
	    String sql2 = "main.Power_SelectKEY";
	    //삼환관리자 처리부분
	    if(SettingData.samwhan.equals(user.get("UIA_KEYNO").toString())) {
		    sql = "main.select_MainData_Ad";
		    sql2 = "main.Power_SelectKEY_Ad";
	    }
 	    
 	    if(key.equals("0")) {
		   key = (String) session.getAttribute("DPP_KEYNO");
 	    }
 	    if(key == null || StringUtils.isEmpty(key)) {
		   key = Component.getData(sql2,type);
 	    }
 	    session.setAttribute("DPP_KEYNO", key);
 	    mv.addObject("list", Component.getList(sql,type));
 	    
 	    type.put("type",key);
    	HashMap<String,Object> ob =  Component.getData(sql,type);
    	
    	mv.addObject("ob",ob);
//    	mv.addObject("DPP_KEYNO", key);
    	
    	mv.addObject("InverterType",InverterType);
    	mv.addObject("DaliyType",DaliyType);
    	mv.addObject("searchBeginDate",searchBeginDate);
    	mv.addObject("searchEndDate",searchEndDate);
    	
 	   return mv;
    }

    /**
     * @return 통계 분석 ajax
     */
    @RequestMapping("/dy/moniter/stasticsAjax.do")
    @ResponseBody
    public ModelAndView stasticsAjax(HttpServletRequest req,
    		HttpServletResponse res,
    		@RequestParam(value="keyno",defaultValue="1")String keyno,
    		@RequestParam(value="searchBeginDate",required=false)String searchBeginDate,
    		@RequestParam(value="searchEndDate",required=false)String searchEndDate,
    		@RequestParam(value="InverterType",defaultValue="0")String InverterType,
    		@RequestParam(value="DaliyType",defaultValue="1")String DaliyType,
    		@RequestParam(value="excel", required=false) String excel
    		) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/ajax/dy_statstics_ajax");
    	
    	HashMap<String,Object> type = new HashMap<String, Object>();
    	List<HashMap<String,Object>> result = new ArrayList<HashMap<String,Object>>();
    	List<HashMap<String,Object>> result1 = new ArrayList<HashMap<String,Object>>();
    	List<List<String>> MainList = new ArrayList<List<String>>();
    	
    	type.put("type",keyno);
    	
    	
    	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	Date d = new Date();
    	String now = format.format(d);
    	
    	if(searchBeginDate == null || searchBeginDate.equals("") || DaliyType.equals("1") ) {
    		searchBeginDate = now;
    	}
    	if(searchEndDate == null || searchEndDate.equals("") || DaliyType.equals("1")) {
    		searchEndDate = now;
    	}
    	
    	type.put("searchBeginDate",searchBeginDate);
    	type.put("searchEndDate",searchEndDate);
    	type.put("InverterType",InverterType);
    	
    	HashMap<String,Object> ob =  Component.getData("main.select_MainData",type);
    	
    	int numbering = Integer.parseInt(ob.get("DPP_INVER_COUNT").toString());
    	
    	
    	if(DaliyType.equals("1")) {
    		
    		result =  Component.getList("main.select_inverterData",type);
    		result1 = result;
    		
    		//당일일때만 오늘날짜 데이터 뽑는것 
        	type.put("minmax","min");
        	mv.addObject("mindata",Component.getData("main.daily_statistics_MinMax", type));
        	type.put("minmax","max");
        	mv.addObject("maxdata",Component.getData("main.daily_statistics_MinMax", type));
        	
        	//리스트 숫자에 맞게 투입 (종합일때) 그래프 처리
        	MainList.add(Component.getList("main.select_inverterData_date",type)); //날짜 먼저 등록
        	if(InverterType.equals("0")) {
        		for(int i=1;i<=numbering;i++) {
            		type.put("inverterNum",i);
            		List<String> subList = Component.getList("main.select_inverterData_active",type); //인버터 개별 등록
            		MainList.add(subList);
            	}
        	}else {
        		type.put("inverterNum", InverterType);
        		List<String> subList = Component.getList("main.select_inverterData_active",type); 
        		MainList.add(subList);
        	}
    	}else {
    		result =  Component.getList("main.select_inverterData_other",type);
    		type.put("now",now);
    		result1 =  Component.getList("sub.select_hourData",type);
    		
    		//최대 최솟값 날짜랑 데이터 뽑기
        	type.put("minmax","min");
        	mv.addObject("mindata",Component.getData("main.select_inverterData_other_MINMAX", type));
        	type.put("minmax","max");
        	mv.addObject("maxdata",Component.getData("main.select_inverterData_other_MINMAX", type));
        	//avg,sum
        	mv.addObject("avgdata",Component.getData("main.select_inverterData_other_AVGSUM", type));
    	}
    	
    	mv.addObject("MainList",MainList);
    	
    	mv.addObject("InverterType",InverterType);
    	mv.addObject("DaliyType",DaliyType);
    	mv.addObject("searchBeginDate",searchBeginDate);
    	mv.addObject("searchEndDate",searchEndDate);
    	mv.addObject("ob",ob);
    	mv.addObject("result",result);
    	mv.addObject("result1",result1);
    	
		if(excel != null){
			mv.addObject("DPP_NAME",ob.get("DPP_NAME"));
			mv.addObject("now",now);
			
			mv.setViewName("/user/_DY/monitering/excel/dy_statstic_excel");
			
			try {
				Cookie cookie = new Cookie("fileDownload", "true");
		        cookie.setPath("/");
		        res.addCookie(cookie);
	        } catch (Exception e) {
	            System.out.println("쿠키 에러 :: "+e.getMessage());
	        }
		}
    	return mv;
    }
    
    /**
     * @return 설정 등록 
     */
    @RequestMapping("/dy/moniter/setting.do")
    public ModelAndView setting(HttpServletRequest req) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/dy_setting");
    	
    	UserDTO userDTO = new UserDTO();
    	Map<String, Object> user = CommonService.getUserInfo(req);
    	
    	userDTO.setUI_ID(user.get("UI_ID").toString());
    	
    	userDTO = Component.getData("member.UI_IdCheck", userDTO);
    	
    	userDTO.decode();
    	
 	    mv.addObject("user",userDTO);
    	
    	return mv;
    }

    /**
     * @return 회원 수정 등록
     */
    @RequestMapping("/dy/moniter/settingAction.do")
    public ModelAndView settingUpdate(HttpServletRequest req,
    		UserDTO userDTO
    		) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/dy/moniter/setting.do");
    	userDTO.setUI_PASSWORD(passwordEncoder.encode(userDTO.getPassword()));
    	userDTO.encode();
    	Component.updateData("main.SettingUpdate", userDTO);
    	
    	
    	return mv;
    }

    
   /**
     * @return 모바일 부분
     */
    @RequestMapping("/dy/mobile.do")
    public ModelAndView MobileView(HttpServletRequest req,
		   @RequestParam(value="keyno",defaultValue="0")String key,
 		   @RequestParam(value="name",defaultValue="인버터 1호")String name,
 		   @RequestParam(value="DaliyType",defaultValue="1")String DaliyType,
 		   @RequestParam(value="searchBeginDate",required=false)String searchBeginDate,
 		   @RequestParam(value="searchEndDate",required=false)String searchEndDate,
 		   @RequestParam(value="InverterType",defaultValue="0")String InverterType,
 		   HttpSession session) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/mobile/dy_mobile");
    	
    	HashMap<String,Object> type = new HashMap<String, Object>();
 	   //아이디 세션에 있는값 저장
 	   Map<String, Object> user = CommonService.getUserInfo(req);
 	   
 	   if(user != null) {
 		   type.put("UI_KEYNO",user.get("UI_KEYNO").toString());
 		   type.put("UIA_NAME",user.get("UIA_NAME").toString());
 	   }else {
 		   mv = new ModelAndView("redirect:/user/member/login.do");
 		   return mv;
 	   }
 	  
 	   String sql = "main.select_MainData";
 	   String sql2 = "main.Power_SelectKEY";
	   //삼환관리자 처리부분
	   if(SettingData.samwhan.equals(user.get("UIA_KEYNO").toString())) {
		   sql = "main.select_MainData_Ad";
		   sql2 = "main.Power_SelectKEY_Ad";
	   }
 	  
 	   if(key.equals("0")) {
 		 //1. 세션에 키값 저장확인
 		   key = (String) session.getAttribute("DPP_KEYNO");
 	   }
 	   //2. 세션에 키값 없다면 
 	   if(key == null || StringUtils.isEmpty(key)) {
 		   key = Component.getData(sql2,type);
 		   //선택된 키값 세션 저장(초기 제일 상위 KEY값 저장)
 	   }
 	   session.setAttribute("DPP_KEYNO", key);
 	   List<HashMap<String,Object>> m_list = Component.getList(sql,type);
 	   
 	   if(m_list.size() == 0 ) {
 		   mv = new ModelAndView("/user/_DY/monitering/dy_none");
 		   mv.addObject("none","none");
 		   return mv;
 	   }
 	   
	   DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	   Date d = new Date();
	   String now = format.format(d);

	   type.put("InverterType",InverterType);
 	   
	   mv.addObject("list", Component.getList(sql,type));
 	   
 	   type.put("type",key);
 	   type.put("name",name);
 	   
 	   //인버터 데이터
 	   HashMap<String,Object> ob =  Component.getData(sql,type);
       mv.addObject("ob",ob);
       
       //당일일때만 오늘날짜 데이터 뽑는것 
	   type.put("minmax","min");
	   mv.addObject("mindata",Component.getData("main.daily_statistics_MinMax", type));
	   type.put("minmax","max");
	   mv.addObject("maxdata",Component.getData("main.daily_statistics_MinMax", type));
	   	
       String area = ob.get("DPP_AREA").toString(); //지역
  	   List<HashMap<String,Object>> weather =  Component.getList("Weather.select_Weather",area);
  	   
	   if(weather.size() > 0) {
		   mv.addObject("weatherToday",weather.get(1));
		   mv.addObject("weather",weather);
	   }
  	   
  	   mv.addObject("InverterType",InverterType);
  	   mv.addObject("DaliyType",DaliyType);
  	   
	   DateFormat format2 = new SimpleDateFormat("yyyy");
	   
	   // 이번달 날짜 count 
	   Calendar c1 = Calendar.getInstance(); 
	   Date Today = c1.getTime();
	   c1.set(Calendar.DAY_OF_MONTH,1);
	   Date Fmon = c1.getTime();
	   long diffDay = (Today.getTime() - Fmon.getTime()) / (24*60*60*1000);
	   mv.addObject("month1Cnt",diffDay);

	   format = new SimpleDateFormat("yyyy-MM");
	   String nowd = format.format(c1.getTime()); 
	   c1.add(Calendar.MONTH, -1); 
	   String pred = format.format(c1.getTime()); 
	   c1.add(Calendar.MONTH, -1); 
	   String ppred = format.format(c1.getTime());
	   
	   Calendar c2 = Calendar.getInstance(); 
	   c2.add(Calendar.YEAR, -1); 
	   String nowY = format2.format(c2.getTime()); //작년

	   type.put("date","day");
	   //전월 누적치 차액(전달 - 전에전달) 
	   type.put("Conn_date",pred);
	   float preC = Component.getData("main.recent_sum",type);
	   
	   type.put("Conn_date",ppred);
	   float ppreC = Component.getData("main.recent_sum",type);
	   mv.addObject("Prmonth",preC-ppreC);
	   
	   type.put("Conn_date",nowd);//금월
	   float TodayCum = Component.getData("main.recent_sum",type);
	   mv.addObject("month1",TodayCum-preC);
	   
	   type.put("date","year");
	   type.put("Conn_date",nowY);
	   float YearCum = Component.getData("main.recent_sum",type);
	   mv.addObject("year1",TodayCum-YearCum);
  	   
  	   
       return mv;
    }
    
    /**
     * @return 모바일 통계
     */
    @RequestMapping("/dy/mobileAjax.do")
    @ResponseBody
    public ModelAndView mobileAjax(HttpServletRequest req,
    		HttpServletResponse res,
    		@RequestParam(value="keyno",defaultValue="1")String keyno,
    		@RequestParam(value="searchBeginDate",required=false)String searchBeginDate,
    		@RequestParam(value="searchEndDate",required=false)String searchEndDate,
    		@RequestParam(value="InverterType",defaultValue="0")String InverterType,
    		@RequestParam(value="DaliyType",defaultValue="1")String DaliyType
    		) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/ajax/dy_mobile_ajax");
    	
    	HashMap<String,Object> type = new HashMap<String, Object>();
    	List<HashMap<String,Object>> result = new ArrayList<HashMap<String,Object>>();
    	
    	type.put("type",keyno);
    	
    	
    	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	Date d = new Date();
    	String now = format.format(d);
    	
    	if(searchBeginDate == null || searchBeginDate.equals("") || DaliyType.equals("1") ) {
    		searchBeginDate = now;
    	}
    	if(searchEndDate == null || searchEndDate.equals("") || DaliyType.equals("1")) {
    		searchEndDate = now;
    	}
    	
    	type.put("searchBeginDate",searchBeginDate);
    	type.put("searchEndDate",searchEndDate);
    	type.put("InverterType",InverterType);
    	
    	HashMap<String,Object> ob =  Component.getData("main.select_MainData",type);
    	//당일일때만 오늘날짜 데이터 뽑는것 
	 	type.put("minmax","min");
	 	mv.addObject("mindata",Component.getData("main.daily_statistics_MinMax", type));
	 	type.put("minmax","max");
	 	mv.addObject("maxdata",Component.getData("main.daily_statistics_MinMax", type));
 	   	
 	    List<List<String>> MainList = new ArrayList<List<String>>();
    	
    	int numbering = Integer.parseInt(ob.get("DPP_INVER_COUNT").toString());
    	
    	if(DaliyType.equals("1")) {
    		
    		result =  Component.getList("main.select_inverterData",type);
    		
    		//당일일때만 오늘날짜 데이터 뽑는것 
        	type.put("minmax","min");
        	mv.addObject("mindata",Component.getData("main.daily_statistics_MinMax", type));
        	type.put("minmax","max");
        	mv.addObject("maxdata",Component.getData("main.daily_statistics_MinMax", type));
        	
        	//리스트 숫자에 맞게 투입 (종합일때) 그래프 처리
        	MainList.add(Component.getList("main.select_inverterData_date",type)); //날짜 먼저 등록
        	if(InverterType.equals("0")) {
        		for(int i=1;i<=numbering;i++) {
            		type.put("inverterNum",i);
            		List<String> subList = Component.getList("main.select_inverterData_active",type); //인버터 개별 등록
            		MainList.add(subList);
            	}
        	}else {
        		type.put("inverterNum", InverterType);
        		List<String> subList = Component.getList("main.select_inverterData_active",type); //인버터 개별 등록
        		MainList.add(subList);
        	}
    	}else {
    		result =  Component.getList("main.select_inverterData_other",type);
    		
    		//최대 최솟값 날짜랑 데이터 뽑기
        	type.put("minmax","min");
        	mv.addObject("mindata",Component.getData("main.select_inverterData_other_MINMAX", type));
        	type.put("minmax","max");
        	mv.addObject("maxdata",Component.getData("main.select_inverterData_other_MINMAX", type));
        	//avg,sum
        	mv.addObject("avgdata",Component.getData("main.select_inverterData_other_AVGSUM", type));
    	}
    	
    	mv.addObject("MainList",MainList);
    	mv.addObject("InverterType",InverterType);
    	mv.addObject("DaliyType",DaliyType);
    	mv.addObject("searchBeginDate",searchBeginDate);
    	mv.addObject("searchEndDate",searchEndDate);
    	mv.addObject("ob",ob);
    	mv.addObject("result",result);
    	
    	return mv;
    }
    
    
    /**
     * 안전관리자 부분 
     */
    @RequestMapping("/dy/moniter/stastics2.do")
    public ModelAndView stastics2(HttpServletRequest req,
    		@RequestParam(value="DPP_KEYNO",defaultValue="0")String key,
    		HttpSession session,
    		@RequestParam(value="DaliyType",defaultValue="1")String DaliyType,
    		@RequestParam(value="searchBeginDate",required=false)String searchBeginDate,
    		@RequestParam(value="searchEndDate",required=false)String searchEndDate,
    		@RequestParam(value="InverterType",defaultValue="0")String InverterType
    		) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/dy_statstics2");
    	HashMap<String,Object> type = new HashMap<String, Object>();
    	
    	Map<String, Object> user = CommonService.getUserInfo(req);
 	    type.put("UI_KEYNO",user.get("UI_KEYNO").toString());
 	   type.put("UIA_NAME",user.get("UIA_NAME").toString());
 	    
 	    if(key.equals("0")) {
		   key = (String) session.getAttribute("DPP_KEYNO");
 	    }
 	    if(key == null || StringUtils.isEmpty(key)) {
		   key = Component.getData("main.Power_SelectKEY",type);
 	    }
 	    session.setAttribute("DPP_KEYNO", key);
 	    mv.addObject("list", Component.getList("main.select_MainData",type));
 	    
 	    type.put("type",key);
    	HashMap<String,Object> ob =  Component.getData("main.select_MainData",type);
    	
    	mv.addObject("ob",ob);
    	mv.addObject("DPP_KEYNO", key);
    	
    	mv.addObject("InverterType",InverterType);
    	mv.addObject("DaliyType",DaliyType);
    	mv.addObject("searchBeginDate",searchBeginDate);
    	mv.addObject("searchEndDate",searchEndDate);
    	
 	   return mv;
    }

    /**
     * @return 통계 분석 ajax
     */
    @RequestMapping("/dy/moniter/stasticsAjax2.do")
    @ResponseBody
    public ModelAndView stasticsAjax2(HttpServletRequest req,
    		@RequestParam(value="keyno",defaultValue="1")String keyno,
    		@RequestParam(value="searchBeginDate",required=false)String searchBeginDate,
    		@RequestParam(value="searchEndDate",required=false)String searchEndDate,
    		@RequestParam(value="InverterType",defaultValue="0")String InverterType,
    		@RequestParam(value="DaliyType",defaultValue="1")String DaliyType
    		) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/ajax/dy_statstics_ajax2");
    	
    	HashMap<String,Object> type = new HashMap<String, Object>();
    	type.put("type",keyno);
    	
    	
    	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	Date d = new Date();
    	String now = format.format(d);
    	
    	if(searchBeginDate == null || StringUtils.isEmpty(searchBeginDate)) {
    		searchBeginDate = now;
    	}
    	if(searchEndDate == null || StringUtils.isEmpty(searchEndDate)) {
    		searchEndDate = now;
    	}
    	
    	type.put("searchBeginDate",searchBeginDate);
    	type.put("searchEndDate",searchEndDate);
    	type.put("InverterType",InverterType);
    	
    	HashMap<String,Object> ob =  Component.getData("main.select_MainData",type);
    	
    	
    	List<HashMap<String,Object>> result =  Component.getList("main.select_inverterData",type);
    	
    	List<HashMap<String,Object>> charList = Component.getList("main.Statics_Two",type);
    	
    	HashMap<String, Object> tempList = new HashMap<String, Object>();
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	List<String> dates = Component.getListNoParam("main.Statics_date");
    	int tempNum = 0;
    	int tempSd = 0;
   		
    	for(int i = tempNum; i < charList.size(); i++) {
    		
    		String sd = charList.get(i).get("subDate").toString();
    		String name = charList.get(i).get("DI_NAME").toString();
    		
    		if(!map.containsKey(name)) {
    			tempSd = 0;
    		}  
    		
    		float f = 0;
			float n = Float.parseFloat(charList.get(i).get("Daily_Generation").toString());
			
    		for(int j = tempSd; j < dates.size(); j++) {
    			
    			String dd = dates.get(j).toString(); 
    			
     			if(sd.equals(dd)) {
    				if(map.containsKey(name)) {
						f = n - Float.parseFloat(tempList.get(name).toString());
						tempList.put(name, n);
						String ii = map.get(name).toString();
						ii = ii+","+f;
						map.put(name,ii);
					}else {
						f = n;
						tempList.put(name,f);
						map.put(name,f);
					}
    				if((i+1) != charList.size()) {
    					if(name.equals(charList.get(i+1).get("DI_NAME").toString())) {
        					tempNum = i+1;
            				tempSd = j+1;
            				break;	
        				}
    				}
    			}else {
    				if(map.containsKey(name)) {
						f = 0;
						tempList.put(name, n);
						String ii = map.get(name).toString();
						ii = ii+","+f;
						map.put(name,ii);
					}else {
						f = 0;
						tempList.put(name,f);
						map.put(name,f);
					}
    			}
    		}
    	}
    	
    	List<String[]> MainList = new ArrayList<String[]>();

    	for(int i = 0; i < map.size(); i++) {
    		String m = map.get("인버터 "+(i+1)+"호").toString();
    		String[] ml = m.split(",");
    		MainList.add(ml);
    	}
    	
    	mv.addObject("MainList",MainList);
    	
    	mv.addObject("InverterType",InverterType);
    	mv.addObject("DaliyType",DaliyType);
    	mv.addObject("searchBeginDate",searchBeginDate);
    	mv.addObject("searchEndDate",searchEndDate);
    	mv.addObject("ob",ob);              
    	mv.addObject("result",result);
    	return mv;
    }
    
    
    /**
     * @return 알림톡  - 안전관리자 게시물 등록확인 (관리자그룹에 전송)
     */
    @RequestMapping("/allimTalkAjax.do")
    @ResponseBody
    public String allimTalk(HttpServletRequest req,
    		@RequestParam(value="bnkey",required=false)String BN_KEYNO,
    		@RequestParam(value="key",required=false)String DPP_KEYNO,
    		@RequestParam(value="title",required=false)String title,
    		@RequestParam(value="name",required=false)String name
    		) throws Exception{
		
    	String msg = "성공";
    	HashMap<String,Object> map = Component.getData("main.PowerOneSelect",DPP_KEYNO);
    	
    	String contents = name+"(이)가 \n발전소 : "+map.get("DPP_NAME").toString()+"의 \n게시물 : "+title+" (를)을\n확인하였습니다.";
    	//토큰받기
		String tocken = requestAPI.TockenRecive(SettingData.Apikey,SettingData.Userid);
		tocken = URLEncoder.encode(tocken, "UTF-8");
    	
		//리스트 뽑기 - 현재 게시물 알림은 index=1
		JSONObject jsonObj = requestAPI.KakaoAllimTalkList(SettingData.Apikey,SettingData.Userid,SettingData.Senderkey,tocken);
		JSONArray jsonObj_a = (JSONArray) jsonObj.get("list");
		jsonObj = (JSONObject) jsonObj_a.get(6); //발전소 게시물 확인

    	//확인 눌렀을때 현재 - 슈퍼관리자한테만
    	List<UserDTO> list = Component.getListNoParam("main.NotUserData_Admin");
    	String Sendurl  = "http://dymonitering.co.kr/"; 
		for(UserDTO l : list) {
    		l.decode();
    		String phone = l.getUI_PHONE().toString().replace("-", "");
    		//받은 토큰으로 알림톡 전송		
    		requestAPI.KakaoAllimTalkSend(SettingData.Apikey,SettingData.Userid,SettingData.Senderkey,tocken,jsonObj,contents,phone,Sendurl);
    	}
		
		Component.updateData("main.UpdateBNcheck", BN_KEYNO);
		
		return msg;
    }
    
    

    /**
    * @return 날씨 등록 테스트
    */
   @RequestMapping("/wether.do")
   public void wether(HttpServletRequest req) throws Exception{
	
	   ModelAndView mv = new ModelAndView("");
	   WetherService w = new WetherService();
	   String[] regionL = {"나주","광주","해남"};
	   Component.deleteData("Weather.Daily_WeatherDelete");
	   
	   for (String r : regionL) {
		   ArrayList<String> list = w.Daily_Wether(r);
		   list.addAll(w.Sunrise_setData(r));
		   WeatherOrganize(list);
	   }
	   
//		List<HashMap<String, Object>> list = Component.getListNoParam("sub.hourData");
//		Component.getData("sub.inserthourDetail",list);
   }
   
   public void WeatherOrganize(ArrayList<String> weatherList) {
	   //혹시모를 갯수 체크
	   int count = Integer.parseInt(weatherList.get(weatherList.size()-4));
	   
	   for(int i=0;i<count;i++) {
		   HashMap<String,Object> map = new HashMap<String,Object>();
		   //시간 0
		   map.put("date",weatherList.get(i).toString());
		   //날씨 0+5 * 1
		   map.put("weather",weatherList.get(i+count*1).toString());
		   //강수 0+5 * 2
		   map.put("rn1",weatherList.get(i+count*2).toString());
		   //강수 0+5 * 3
		   map.put("sky",weatherList.get(i+count*3).toString());
		   //온도 0+5 * 4
		   map.put("t1h",weatherList.get(i+count*4).toString());
		   //습도 0+5 * 5
		   map.put("reh",weatherList.get(i+count*5).toString());
		   //풍속 0+5 * 6
		   map.put("wsd",weatherList.get(i+count*6).toString());
		   //지역
		   map.put("region",weatherList.get((weatherList.size()-3)).toString());
		   //일출
		   map.put("sunrise",weatherList.get((weatherList.size()-2)).toString());
		   //일몰
		   map.put("sunset",weatherList.get((weatherList.size()-1)).toString());
		   Component.createData("Weather.Daily_WeatherData", map);
	   }
   }
   
  /* @RequestMapping("/allimTalkSend.do")
   @ResponseBody
   public String allimTalkSend(HttpServletRequest req) throws Exception{
   	
   	String msg = "성공";
   	
   	//토큰받기
   	String tocken = requestAPI.TockenRecive(SettingData.Apikey,SettingData.Userid);
   	tocken = URLEncoder.encode(tocken, "UTF-8");
   	
   	//리스트 뽑기 - 현재 게시물 알림은 index=1
   	JSONObject jsonObj = requestAPI.KakaoAllimTalkList(SettingData.Apikey,SettingData.Userid,SettingData.Senderkey,tocken);
   	JSONArray jsonObj_a = (JSONArray) jsonObj.get("list");
   	jsonObj = (JSONObject) jsonObj_a.get(1); //발전소 게시물 확인
   	
   	//받은 토큰으로 알림톡 전송		
//   	requestAPI.KakaoAllimTalkSend(SettingData.Apikey,SettingData.Userid,SettingData.Senderkey,tocken,jsonObj,"");
   	
   	return msg;
   }*/
   
}