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
import com.tx.ems.dto.SerialDTO;
import com.tx.ems.wether.WetherService;

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
	
	//날씨 데이터 매시 59분마다 
	@Scheduled(cron="0 59 * * * ?")  
	public void test() throws Exception{

	WetherService w = new WetherService();
	ArrayList<HashMap<String,Object>> list = w.FarDatePredict();
	   
	Component.deleteData("Wether.DeleteDate");
	Component.createData("Wether.DateInsert", list);
	
     }
	
	//06시부터 - 20시까지  30초 마다 실제값 테이블에 등록
//	@Scheduled(cron="0/30 * * * * ?")  
	public void InverterDataSend() throws Exception {
//		System.out.println("inver 데이터 넣기");
//		Component.createData("INVERTER.InverterInsert", null);
	}
	
	
	
	//12시에 데이터 합치기   
//	@Scheduled(cron="0 59 17 * * ?")  
	public void scheduleTest() throws Exception {
		System.out.println("스케쥴 테스트");
		//인버터 부분 초기화
		Component.createData("schedule.InverterInsertDay", null);
		Component.deleteData("schedule.InverterDeleteDay");
		
		//pcs 부분 초기화		
		Component.deleteData("schedule.PcsDeleteDay");
		//분전반 데이터 부분 초기화		
		Component.deleteData("schedule.LvcdDeleteDay");
		//ems 데이터 부분 남기기
		Component.deleteData("schedule.EmsDeleteDay");
	}

	//12시에 데이터 합친 뒤 삭제   
	/*@Scheduled(cron="0/30 * 08-20 * * ?")  
	public void scheduleTest2() throws Exception {
		System.out.println("스케쥴 테스트");
		DataRandomInsert_PCS();
		DataRandomInsert_EMS();
		DataRandomInsert_LVDC();
	}*/

	
	
	//	@Scheduled(cron="0 0 0/1 * * ?")  
	/*public void InverterDataSendHour() throws Exception {
		System.out.println("한시간단위 데이터 정리");
		Component.createData("INVERTER.InverterInsertHour", null);
		Component.deleteData("INVERTER.InverterDeleteHour");
	}*/


	
	
	//한시간마다 초기화 시켰던거
	/*@Scheduled(cron="0 0 0/1 * * ?")  
	public void InverterDataSendHour_Delete() throws Exception {
		System.out.println("나머지 데이터 삭제");
		Component.deleteData("INVERTER.deletePcsSolar");
		Component.deleteData("INVERTER.deleteEmsData");
		Component.deleteData("INVERTER.deleteInverter_one");
	}*/
	
	//pcs데이터 랜덤발생기
	public void DataRandomInsert_PCS() throws Exception{
		 int min = 0, max = 15;
		 int random = (int) (Math.random() * (max - min + 1) + min);
		 HashMap<String,Object> map2 = new HashMap<>();
		 HashMap<String,Object> ps = Component.getData("empc.PowerSum");
		 
		 String psd = "0";
		 if(ps != null) {
			 psd = ps.get("PSD_VALUE").toString();
		 }
		 
		 int p = random + Integer.parseInt(psd);
		 map2.put("PSD_VALUE", p);		 
		 Component.createData("schedule.TestRandomPCS", map2);
	}
	
	//ems데이터 랜덤발생기
	public void DataRandomInsert_EMS() {
		SerialDTO in = new SerialDTO();
		
		int min = -10, max = 100;
		in.setSystemV(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		min = -10; max = 10;
		in.setSystemC(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		min = 0; max = 100;
		
		in.setSOC(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		
		
		in.setSOH(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage1(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage2(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage3(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage4(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage5(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage6(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage7(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage8(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage9(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage10(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage11(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage12(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage13(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		in.setVoltage14(String.format("%.1f", (double) (Math.random() * (max - min + 1) + min)));
		
		in.setTemp1(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setTemp2(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setTemp3(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setTemp4(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setTemp5(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setTemp6(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setTemp7(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setTemp8(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setTemp9(Integer.toString((int) (Math.random() * (max - min + 1) + min)));
		in.setOnoff("1");
		
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		in.setTime(format1.format(date));
		
		Component.createData("empc.emsInsertData", in);
	}
	
	//lvdc데이터 랜덤발생기
	public void DataRandomInsert_LVDC() {
		 SerialDTO in = new SerialDTO();
		 SerialDTO data = Component.getData("empc.LVDCgetData_To");
		 
			 
//			 in.setCh1_V(Integer.toString((int) (Math.random() * (max2 - min2 + 1) + min2) + plus));
			 in.setCh1_V("0");
			 in.setCh1_A("0");
			 in.setCh1_P("0");
//			 min2 = 0.001;  max2 = 0.01;
//			 in.setCh1_Wh(Double.toString((double) (Math.random() * (max2 - min2 + 1) + min2) + plusW));
			 in.setCh1_Wh("0");
			 in.setCh1_RWh("0");
			 
//			 plus = Integer.parseInt(data.getCh2_V());
//			 plusW = Double.parseDouble(data.getCh2_Wh());
			 in.setCh2_V("0");
			 in.setCh2_A("0");
			 in.setCh2_P("0");
			 in.setCh2_Wh("0");
			 in.setCh2_RWh("0");
			 
			 in.setCh3_V("0");
			 in.setCh3_A("0");
			 in.setCh3_P("0");
			 in.setCh3_Wh("0");
			 in.setCh3_RWh("0");
			 
			 in.setCh4_V("0");
			 in.setCh4_A("0");
			 in.setCh4_P("0");
			 in.setCh4_Wh("0");
			 in.setCh4_RWh("0");
			 
			 in.setCh5_V("0");
			 in.setCh5_A("0");
			 in.setCh5_P("0");
			 in.setCh5_Wh("0");
			 in.setCh5_RWh("0");
			 
			 in.setCh6_V("0");
			 in.setCh6_A("0");
			 in.setCh6_P("0");
			 in.setCh6_Wh("0");
			 in.setCh6_RWh("0");
			 
			 in.setCh7_V("0");
			 in.setCh7_A("0");
			 in.setCh7_P("0");
			 in.setCh7_Wh("0");
			 in.setCh7_RWh("0");
			 
			 in.setCh8_V("0");
			 in.setCh8_A("0");
			 in.setCh8_P("0");
			 in.setCh8_Wh("0");
			 in.setCh8_RWh("0");
			 
			 in.setCh9_V("0");
			 in.setCh9_A("0");
			 in.setCh9_P("0");
			 in.setCh9_Wh("0");
			 in.setCh9_RWh("0");
			 
			 in.setCh10_V("0");
			 in.setCh10_A("0");
			 in.setCh10_P("0");
			 in.setCh10_Wh("0");
			 in.setCh10_RWh("0");
			 
			 in.setCh11_V("0");
			 in.setCh11_A("0");
			 in.setCh11_P("0");
			 in.setCh11_Wh("0");
			 in.setCh11_RWh("0");
			 
			 in.setCh12_V("0");
			 in.setCh12_A("0");
			 in.setCh12_P("0");
			 in.setCh12_Wh("0");
			 in.setCh12_RWh("0");
		 
		 in.setCh1_MOT("0");
		 in.setCh2_MOT("0");
		 in.setCh3_MOT("0");
		 in.setCh4_MOT("0");
		 in.setCh5_MOT("0");
		 in.setCh6_MOT("0");
		 in.setCh7_MOT("0");
		 in.setCh8_MOT("0");
		 in.setCh9_MOT("0");
		 in.setCh10_MOT("0");
		 in.setCh11_MOT("0");
		 in.setCh12_MOT("0");
		 
		 Date date = new Date();
		 SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		 in.setDate_time(format1.format(date));
		 String plusS = "0";
		 String plusWS = "0";
		 if(data != null) {
			 plusS = data.getTotal_V();
			 plusWS = data.getTotal_Wh();
		 }
		 
		 System.out.println(plusS + " \\ " + plusWS);
		 
		 int plus = Integer.parseInt(plusS);
		 double plusW = Double.parseDouble(plusWS);
		 
		 double min2 = 0 , max2 = 1.5;
		 in.setTotal_V(Integer.toString((int) (Math.random() * (max2 - min2 + 1) + min2) + plus));
		 in.setTotal_A("210");
		 in.setTotal_P("0");
		 
		 min2 = 0.0001; max2 = 0.001;
		 in.setTotal_Wh(Double.toString((double) (Math.random() * (max2 - min2 + 1) + min2) + plusW));
		 in.setTotal_RWh("0");
		 
		 Component.createData("schedule.TestRandomLVDC", in);
		 
		 Component.createData("INVERTER.InverterInsert",null);
	}
	
	
	public void DataRandomInsert_Inveter() {
		
	}
	
}