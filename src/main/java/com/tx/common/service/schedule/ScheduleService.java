package com.tx.common.service.schedule;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ibm.icu.text.SimpleDateFormat;
import com.tx.common.service.component.ComponentService;
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
  
//  @Scheduled(fixedRate=10000)   //테스트용 10초 주기
	
	//날씨 데이터 매시 31분마다 
	@Scheduled(cron="0 31 * * * ?")  
	public void test() throws Exception{
		WetherService w = new WetherService();
		ArrayList<String> list = w.Daily_Wether("나주");
		list.addAll(w.Sunrise_setData("나주"));
		WeatherOrganize(list);
    }
	
	//06시부터 - 20시까지  30초 마다 실제값 테이블에 등록
//	@Scheduled(cron="0/30 * * * * ?")  
	public void InverterDataSend() throws Exception {
	}
	
	
	
	//22시에 데이터 합치기   
	@Scheduled(cron="0 0 22 * * ?")  
	public void scheduleTest() throws Exception {
		//날씨 종합데이터 저장 (am - 온도/날씨 , pm - 온도/날씨)
		WetherService w = new WetherService();
		HashMap<String, Object> map = w.All_Date("나주");
		Component.createData("Weather.WeatherData_Day", map);
		//발전소 인버터 별 데이터 초기화
	}

	
	   public void WeatherOrganize(ArrayList<String> weatherList) {
		   Component.deleteData("Weather.Daily_WeatherDelete");
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