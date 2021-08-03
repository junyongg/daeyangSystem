package com.tx.ems.wether;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.JsonObject;


public class WetherService {

	Date date = new Date();
	DateFormat format = new SimpleDateFormat("yyyyMMdd");
	DateFormat format2 = new SimpleDateFormat("HHmm");
	String dates = format.format(date);
	//동네 예보
	public  ArrayList< HashMap<String, Object>> wetherService() throws Exception{
		
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey="
		   		+ "dQsCZl8ZlcJHAjjmit2miCTpY042aQYG2P%2Bbnq%2BuVToDqFAVoVv%2Bdx%2FUbDLF6RvjVqVdYHAw%2FGrlbMyCSbdbHA%3D%3D"
		   		+ "&pageNo=1"
		   		+ "&numOfRows=307"
		   		+ "&dataType=JSON"
		   		+ "&base_date="+dates
		   		+ "&base_time=0500"
		   		+ "&nx=59&ny=79&";
		   
		   JSONObject json = readJsonFromUrl(url);
		   
		   JSONArray jsonList = (((json.getJSONObject("response")).getJSONObject("body")).getJSONObject("items")).getJSONArray("item");
		   
		   ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		   /***
		    * POP	강수확률
		    * PTY	강수형태
		    * T3H	3시간 기온
		    * SKY	하늘상태
		    * - 하늘상태(SKY) 코드 : 맑음(1), 구름많음(3), 흐림(4) 
			- 강수형태(PTY) 코드 : 없음(0), 비(1), 비/눈(2), 눈(3), 소나기(4), 빗방울(5), 빗방울/눈날림(6), 눈날림(7)
			여기서 비/눈은 비와 눈이 섞여 오는 것을 의미 (진눈개비)
		    * 
		    * 
		    */
		   HashMap<String, Object> map = new HashMap<>();
		   for(int i=0; i<jsonList.length();i++) {
			   JSONObject j = jsonList.getJSONObject(i);
			  
			   
			   if(j.getString("fcstTime").equals("0900")) {
				   if(j.getString("category").equals("POP")) {map.put("rainRateAm", j.getString("fcstValue"));}
				   if(j.getString("category").equals("PTY")) {
					   if(j.getString("fcstValue").equals("1")) {
						   map.put("skyAm","비");
					   }else if(j.getString("fcstValue").equals("2")) {
						   map.put("skyAm","비/눈");
					   }else if(j.getString("fcstValue").equals("3")) {
						   map.put("skyAm","눈");
					   }else if(j.getString("fcstValue").equals("4")) {
						   map.put("skyAm","소나기");
					   }else if(j.getString("fcstValue").equals("5")) {
						   map.put("skyAm","빗방울");
					   }else if(j.getString("fcstValue").equals("6")) {
						   map.put("skyAm","빗방울/눈날림");
					   }else if(j.getString("fcstValue").equals("7")) {
						   map.put("skyAm","눈날림");
					   }
					   map.put("raintypeAm", j.getString("fcstValue"));
				   }
				   if(j.getString("category").equals("SKY")) {
					   if(map.get("raintypeAm").equals("0")) {
						   if(j.getString("fcstValue").equals("3")){
							   map.put("skyAm","구름많음");
						   }else if(j.getString("fcstValue").equals("4")) {
							   map.put("skyAm","흐림");
						   }else {
							   map.put("skyAm","맑음");
						   }
					   }
				   }
				   if(j.getString("category").equals("T3H")) {
					   map.put("temperatureAm", j.getString("fcstValue"));
					   map.put("NowDate", j.getString("fcstDate"));
					   map.put("temperatureMin", j.getString("fcstValue"));
				   }
			   }else if(j.getString("fcstTime").equals("1800")) {
				   if(j.getString("category").equals("POP")) {map.put("rainRatePm", j.getString("fcstValue"));}
				   if(j.getString("category").equals("PTY")) {
					   if(j.getString("fcstValue").equals("1")) {
						   map.put("skyPm","비");
					   }else if(j.getString("fcstValue").equals("2")) {
						   map.put("skyPm","비/눈");
					   }else if(j.getString("fcstValue").equals("3")) {
						   map.put("skyPm","눈");
					   }else if(j.getString("fcstValue").equals("4")) {
						   map.put("skyPm","소나기");
					   }else if(j.getString("fcstValue").equals("5")) {
						   map.put("skyPm","빗방울");
					   }else if(j.getString("fcstValue").equals("6")) {
						   map.put("skyPm","빗방울/눈날림");
					   }else if(j.getString("fcstValue").equals("7")) {
						   map.put("skyPm","눈날림");
					   }
					   map.put("raintypePm", j.getString("fcstValue"));
				   }
				   if(j.getString("category").equals("SKY")) {
					   if(map.get("raintypePm").equals("0")) {
						   if(j.getString("fcstValue").equals("3")){
							   map.put("skyPm","구름많음");
						   }else if(j.getString("fcstValue").equals("4")) {
							   map.put("skyPm","흐림");
						   }else {
							   map.put("skyPm","맑음");
						   }
					   }
				   }
				   if(j.getString("category").equals("T3H")) {
					   map.put("temperaturePm", j.getString("fcstValue"));
					   list.add(map);
					   map = new HashMap<>();
				   }
			   }else if(j.getString("fcstTime").equals("1500")) {
				   if(j.getString("category").equals("TMX")) {
					   String temp = j.getString("fcstValue").substring(0,(j.getString("fcstValue").indexOf(".")));
					   System.out.println(temp); 
					   map.put("temperatureMax", temp);
				   }
			   }
		   }
		   return list;
	}

	public  ArrayList<HashMap<String,Object>> FarDatePredict() throws Exception{
		
		
		//강수량 + 날씨상태
		String url = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst?"
				+ "serviceKey=dQsCZl8ZlcJHAjjmit2miCTpY042aQYG2P%2Bbnq%2BuVToDqFAVoVv%2Bdx%2FUbDLF6RvjVqVdYHAw%2FGrlbMyCSbdbHA%3D%3D"
				+ "&pageNo=1"
				+ "&numOfRows=10"
				+ "&dataType=JSON"
				+ "&regId=11F20000"
				+ "&tmFc="+dates+"0600&";
		 
		String url2 = "http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?"
				+ "serviceKey=dQsCZl8ZlcJHAjjmit2miCTpY042aQYG2P%2Bbnq%2BuVToDqFAVoVv%2Bdx%2FUbDLF6RvjVqVdYHAw%2FGrlbMyCSbdbHA%3D%3D"
				+ "&pageNo=1"
				+ "&numOfRows=10"
				+ "&dataType=JSON"
				+ "&regId=11F20501"
				+ "&tmFc="+dates+"0600&";
		
		
		 JSONObject json = readJsonFromUrl(url);
		 JSONObject json2 = readJsonFromUrl(url2);
		 JSONArray jsonList = (((json.getJSONObject("response")).getJSONObject("body")).getJSONObject("items")).getJSONArray("item");
		 JSONArray jsonList2 = (((json2.getJSONObject("response")).getJSONObject("body")).getJSONObject("items")).getJSONArray("item");
		 
		 
		 //강수량 sky
		 ArrayList<HashMap<String,Object>> futureList = wetherService();

		 JSONObject j = jsonList.getJSONObject(0);
		 JSONObject j2 = jsonList2.getJSONObject(0);
		 
		 //한번에 정리!
		 for(int i=5;i<8;i++) {
			 HashMap<String, Object> map = new HashMap<>();
			 //날씨 설정 +1
			 Calendar cal = Calendar.getInstance();
			 cal.setTime(date);
			 cal.add(Calendar.DATE, i-2);
			 String futureDate = format.format(cal.getTime());	
			 //am 부터 
		 	 map.put("NowDate", futureDate);
			 map.put("rainRateAm", j.getInt("rnSt"+i+"Am"));
			 map.put("skyAm", j.getString("wf"+i+"Am"));
			 map.put("temperatureAm", j2.getInt("taMin"+i));
			 //pm설정
			 map.put("rainRatePm", j.getInt("rnSt"+i+"Pm"));
			 map.put("skyPm", j.getString("wf"+i+"Pm"));
			 map.put("temperaturePm", j2.getInt("taMax"+i));
			 //최대값 최소값
			 map.put("temperatureMin",j2.getInt("taMin"+i));
			 map.put("temperatureMax",j2.getInt("taMax"+i));
			 
			 futureList.add(map);
		 }
		 futureList = Make_CloudData(futureList);
		 
		 return futureList;
	}
	
	
	public ArrayList<String> AjaxDate() throws Exception{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR, -1);
		String futureDate = format2.format(cal.getTime());
		
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtFcst?"
				+ "serviceKey=dQsCZl8ZlcJHAjjmit2miCTpY042aQYG2P%2Bbnq%2BuVToDqFAVoVv%2Bdx%2FUbDLF6RvjVqVdYHAw%2FGrlbMyCSbdbHA%3D%3D"
				+ "&pageNo=1&numOfRows=100"
				+ "&dataType=JSON"
				+ "&base_date=" + dates
				+ "&base_time="+futureDate
				+ "&nx=59&ny=79&";
		
		JSONObject json = readJsonFromUrl(url);
		JSONArray jsonList = (((json.getJSONObject("response")).getJSONObject("body")).getJSONObject("items")).getJSONArray("item");
		
		
		ArrayList<String> list = new ArrayList<>();
		ArrayList<String> list_temp = new ArrayList<>();
		
		for(int i=0; i<jsonList.length();i++) {
			JSONObject j = jsonList.getJSONObject(i);
			
			if(j.getString("category").equals("PTY")) {
				list.add(j.getString("fcstTime"));
				list_temp.add(j.getString("fcstValue"));
			}
			if(j.getString("category").equals("T1H")) {
				list.add(j.getString("fcstValue"));
			}
			if(j.getString("category").equals("SKY")) {
				list.add(j.getString("fcstValue"));
			}
		}
		list.addAll(list_temp);
		return list;
	}
	
	
	//url 파싱하는거 
	private String jsonReadAll(Reader reader) throws IOException {
			StringBuilder sb = new StringBuilder();
			int cp;
			while ((cp = reader.read()) != -1) {
				sb.append((char) cp);
			}
			return sb.toString();
		}
	   
	   public JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
			InputStream is = new URL(url).openStream();
			try {
				BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
				String jsonText = jsonReadAll(rd);
				JSONObject json = new JSONObject(jsonText);
				return json;
			} finally {
				is.close();
			}

		}
	
	  
	   public ArrayList<HashMap<String,Object>> Make_CloudData(ArrayList<HashMap<String,Object>> list) throws Exception {
		   
		   for(HashMap<String,Object> m : list) {
			   double cloud_a = 0.0;
			   String a = m.get("skyAm").toString();
			   String p = m.get("skyPm").toString();
			   
			   if(a.equals("맑음")) {
				   cloud_a += 2;
			   }else if(a.equals("구름많음")) {cloud_a += 5;
			   }else if(a.equals("흐림")) {cloud_a += 7;
				   }else {cloud_a += 9;}
			   if(p.equals("맑음")) {
				   cloud_a += 2;
			   }else if(p.equals("구름많음")) {cloud_a += 5;
			   }else if(p.equals("흐림")) {cloud_a += 7;
			   }else {cloud_a += 9;}
			   m.put("CLOUDRATE", cloud_a/2);
		   }
		   
		   return list;
	   }
	   
	   
}
