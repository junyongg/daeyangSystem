package com.tx.dyUser.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;
import com.tx.dyUser.wether.WetherService;


@Controller
public class DyController {
   
	@Autowired ComponentService Component;
	/** 페이지 처리 출 */
	
	@Autowired CommonService CommonService;
	/** 페이지 처리 출 */
	@Autowired private PageAccess PageAccess;
	
	
   /**
    * @return 관리자 종합현황 페이지 
    */
   @RequestMapping("/dy/moniter/overAll.do")
   public ModelAndView overAll(HttpServletRequest req) throws Exception {
	   ModelAndView mv = new ModelAndView("/user/_DY/monitering/dy_overallStatus");
	   HashMap<String,Object> cntM = new HashMap<String, Object>();
	   HashMap<String,Object> type = new HashMap<String, Object>();
	   
	   type.put("type",null);
	   
	   cntM.put("a",Component.getCount("main.select_Main_cnt","정상"));
	   cntM.put("b",Component.getCount("main.select_Main_cnt","장애"));
	   cntM.put("c",Component.getCount("main.select_Main_cnt","미개통"));
	   
	   mv.addObject("cntM",cntM);
	   
	   mv.addObject("list", Component.getList("main.select_MainData",type));
	   mv.addObject("listSum", Component.getData("main.select_MainSum"));
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
	   
	   //단일 데이터 (금일, 전일, 현재발전, 설치용량)
	   type.put("type",keyno);
	   
	   HashMap<String,Object> ob =  Component.getData("main.select_MainData",type);
	   String area = ob.get("DPP_AREA").toString(); //지역
	   
	   mv.addObject("detail_Data",ob);
	   mv.addObject("Weather",Component.getData("Weather.select_Weather",area));
	   
	   type.put("date","month");//금월
	   mv.addObject("month",Component.getData("main.select_MainSum_MY",type));
	   type.put("date","year");//금년
	   mv.addObject("year",Component.getData("main.select_MainSum_MY",type));
	   type.put("date","all");//누적
	   mv.addObject("all",Component.getData("main.select_MainSum_MY",type));
	   
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
	   type.put("type",null);
	   type.put("region",region);
	   type.put("status",status);
	   
	   mv.addObject("list", Component.getList("main.select_MainData",type));
	   
	   return mv;
   }
   
  /**
   * @return 발전 현황
   */
   @RequestMapping("/dy/moniter/general.do")
   public ModelAndView general(HttpServletRequest req,
		   @RequestParam(value="keyno",defaultValue="1")String defaultKey,
 		   @RequestParam(value="name",defaultValue="인버터 1호")String name
		   ) throws Exception{
	   ModelAndView mv = new ModelAndView("/user/_DY/monitering/dy_generalStatus");
	   //회원별 발전소 키를 가지고 정보 확인 일단 기본키
	   HashMap<String,Object> type = new HashMap<String, Object>();
	   type.put("type",defaultKey);
	   type.put("name",name);
	   //인버터 데이터
	   HashMap<String,Object> ob =  Component.getData("main.select_MainData",type);
	   type.put("group","group");
	   
	   List<HashMap<String,Object>> dataList =  Component.getList("main.select_inverterData",type);
	   
	   String area = ob.get("DPP_AREA").toString(); //지역
	   WetherService w = new WetherService();
	   ArrayList<String> weather = w.AjaxDate(area);
	   
	   type.put("date","month");//금월
	   mv.addObject("month",Component.getData("main.select_MainSum_MY",type));
	   mv.addObject("Prmonth",Component.getData("main.select_MainSum_Pre_M",type)); //전월
	   type.put("date","year");//금년
	   mv.addObject("year",Component.getData("main.select_MainSum_MY",type));
	   type.put("date","all");//누적
	   mv.addObject("all",Component.getData("main.select_MainSum_MY",type));
	   
	   
	   System.out.println(weather);
	   mv.addObject("invertDataList", dataList);
	   mv.addObject("weatherToday",Component.getData("Weather.select_Weather",area));
	   mv.addObject("weather",weather);
	   mv.addObject("ob",ob);
	   return mv;
   }
   
   /**
    * @return 발전 현황
    */
    @RequestMapping("/dy/moniter/generalAjax.do")
    @ResponseBody
    public HashMap<String,Object> generalAjax(HttpServletRequest req,
 		   @RequestParam(value="keyno",defaultValue="1")String defaultKey,
 		   @RequestParam(value="name",defaultValue="인버터 1호")String name		   
 		   ) throws Exception{
 	   HashMap<String,Object> map = new HashMap<String, Object>();
	   
 	   HashMap<String,Object> type = new HashMap<String, Object>();
	   type.put("type",defaultKey);
	   type.put("name",name);
 	   
	   //개별데이터
	   HashMap<String,Object> data =  Component.getData("main.select_inverterData_ONE",type);
	   
	   map.put("invertData", data);
	   //AllPower , Active
 	   return map;
    }
    
    /**
     * @return 통계 분석
     */
    @RequestMapping("/dy/moniter/stastics.do")
    public ModelAndView stastics(HttpServletRequest req,
    		@RequestParam(value="keyno",defaultValue="1")String defaultKey
    		) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/dy_statstics");
    	HashMap<String,Object> type = new HashMap<String, Object>();
 	   type.put("type",defaultKey);
    	HashMap<String,Object> ob =  Component.getData("main.select_MainData",type);
    	
    	mv.addObject("ob",ob);
 	   return mv;
    }

    /**
     * @return 통계 분석 ajax
     */
    @RequestMapping("/dy/moniter/stasticsAjax.do")
    @ResponseBody
    public ModelAndView stasticsAjax(HttpServletRequest req,
    		@RequestParam(value="keyno",defaultValue="1")String defaultKey,
    		@RequestParam(value="searchBeginDate",required=false)String searchBeginDate,
    		@RequestParam(value="searchEndDate",required=false)String searchEndDate,
    		@RequestParam(value="InverterType",defaultValue="0")String InverterType,
    		@RequestParam(value="DaliyType",defaultValue="1")String DaliyType
    		) throws Exception{
    	ModelAndView mv = new ModelAndView("/user/_DY/monitering/ajax/dy_statstics_ajax");
    	
    	HashMap<String,Object> type = new HashMap<String, Object>();
    	type.put("type",defaultKey);
    	
    	
    	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	Date d = new Date();
    	String now = format.format(d);
    	
    	if(searchBeginDate == null) {
    		searchBeginDate = now;
    	}
    	if(searchEndDate == null) {
    		searchEndDate = now;
    	}
    	
    	type.put("searchBeginDate",searchBeginDate);
    	type.put("searchEndDate",searchEndDate);
    	type.put("InverterType",InverterType);
    	
    	HashMap<String,Object> ob =  Component.getData("main.select_MainData",type);
    	
    	
    	List<HashMap<String,Object>> result =  Component.getList("main.select_inverterData",type);
    	
    	int numbering = Integer.parseInt(ob.get("DPP_INVER_COUNT").toString());
    	
    	List<List<String>> MainList = new ArrayList<List<String>>();
    	
    	if(DaliyType.equals("1")) {
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
    * @return 날씨 등록 테스트
    */
   @RequestMapping("/wether.do")
   public ModelAndView wether(HttpServletRequest req) throws Exception{
	   ModelAndView mv = new ModelAndView("");
		WetherService w = new WetherService();
		ArrayList<String> list = w.Daily_Wether("나주");
		list.addAll(w.Sunrise_setData("나주"));
		
		Component.deleteData("Weather.Daily_WeatherDelete");
		Component.createData("Weather.Daily_WeatherData", list);
	   return mv;
   }
   
   
}