package com.tx.dyUser.controller;

import java.util.ArrayList;
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
	   //날씨 데이터, 용량, 현재발전, 금일, 전일 ,전월 ,금년, 누적 !
	   ModelAndView mv = new ModelAndView("/user/_DY/monitering/ajax/dy_overallStatus_ajax2");
	   
	   HashMap<String,Object> type = new HashMap<String, Object>();
	   type.put("type",null);
	   type.put("region",region);
	   type.put("status",status);
	   
	   mv.addObject("list", Component.getList("main.select_MainData",type));
	   
	   return mv;
   }
   
  /**
   * @return 일반 현황
   */
   @RequestMapping("/dy/moniter/general.do")
   public ModelAndView general(HttpServletRequest req) throws Exception{
	   ModelAndView mv = new ModelAndView("");
	   
	   return mv;
   }
   
   /**
    * @return 날씨 등록 테스트
    */
   @RequestMapping("/wether.do")
   public ModelAndView wether(HttpServletRequest req) throws Exception{
	   ModelAndView mv = new ModelAndView("");
	   
	   return mv;
   }
   
   
}