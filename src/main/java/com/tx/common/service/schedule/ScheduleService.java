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
	
	Component.deleteData("Weather.Daily_WeatherDelete");
	Component.createData("Weather.Daily_WeatherData", list);
		
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

	
}