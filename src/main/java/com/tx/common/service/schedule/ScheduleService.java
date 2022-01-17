package com.tx.common.service.schedule;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tx.common.config.SettingData;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.reqapi.requestAPIservice;
import com.tx.dyAdmin.member.dto.UserDTO;
import com.tx.dyUser.wether.WetherService;

/**
 * @author admin
 * 스케쥴 관리
 *
 */
@Service("ScheduleService")
public class ScheduleService {

	/** 공통 컴포넌트 */
	@Autowired
	ComponentService Component;
	/** 알림톡 API */
	@Autowired
	requestAPIservice requestAPI;
	
	//날씨 데이터 매시 57분마다 
	@Scheduled(cron="0 57 * * * ?")
	@Transactional
	public void test() throws Exception{
       WetherService w = new WetherService();
		
	   String[] regionL = {"나주","광주"};
	   
	   Component.deleteData("Weather.Daily_WeatherDelete");
	   
	   for (String r : regionL) {
		   ArrayList<String> list = w.Daily_Wether(r);
		   list.addAll(w.Sunrise_setData(r));
		   
		   WeatherOrganize(list);
	   }
    }
	
	//오전 8시 30분에 통신 체크 한번
	@Scheduled(cron="0 0 9 * * ?")  
	public void InverterDataSend() throws Exception {
		List<HashMap<String,Object>> list = Component.getListNoParam("main.PowerConCheck");
		
		for(HashMap<String,Object> l : list) {
			String ch = l.get("checking").toString();
			if(ch.equals("N")) { //오늘날짜 데이터가 들어오지않음
				//알림전송하면됌
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
				Calendar c1 = Calendar.getInstance(); 
				
				String today = sdf.format(c1.getTime());
				String dpName = l.get("DPP_NAME").toString();
				String Contents = "현재 "+dpName+"의 인버터에서 "+today+"에 통신에 대한 에러가 발생했습니다."; 
				
				int cnt = 2; //
				
				//토큰받기
				String tocken = requestAPI.TockenRecive(SettingData.Apikey,SettingData.Userid);
				tocken = URLEncoder.encode(tocken, "UTF-8");
		    	
				//리스트 뽑기 - 현재 게시물 알림은 index=1
				JSONObject jsonObj = requestAPI.KakaoAllimTalkList(SettingData.Apikey,SettingData.Userid,SettingData.Senderkey,tocken);
				JSONArray jsonObj_a = (JSONArray) jsonObj.get("list");
				jsonObj = (JSONObject) jsonObj_a.get(cnt); //발전소 게시물 확인

		    	
		    	//전송할 회원 리스트 - 관리자만
		    	List<UserDTO> ls = Component.getListNoParam("main.NotUserData_Admin");
				
				for(UserDTO ll : ls) {
					ll.decode();
		    		String phone = ll.getUI_PHONE().toString().replace("-", "");
		    		String url = "http://dymonitering.co.kr/";
		    		//받은 토큰으로 알림톡 전송		
		    		requestAPI.KakaoAllimTalkSend(SettingData.Apikey,SettingData.Userid,SettingData.Senderkey,tocken,jsonObj,Contents,phone,url);
		    	}
			}
		}
	}
	
	
	
	//22시에 데이터 합치기   
//	@Scheduled(cron="0 0 22 * * ?")  
	public void scheduleTest() throws Exception {
		//날씨 종합데이터 저장 (am - 온도/날씨 , pm - 온도/날씨)
		WetherService w = new WetherService();
		HashMap<String, Object> map = w.All_Date("나주");
		Component.createData("Weather.WeatherData_Day", map);
		//발전소 인버터 별 데이터 초기화
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
		   //온도 0+5 * 5
		   map.put("reh",weatherList.get(i+count*5).toString());
		   //온도 0+5 * 6
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
	
}