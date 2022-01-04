package com.tx.common.service.reqapi.lmp;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.tx.common.service.reqapi.requestAPIservice;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("requestAPIservice")
public class requestAPIserviceImp extends EgovAbstractServiceImpl implements requestAPIservice{
	
	//URL연결 
	public HttpURLConnection ConnenctURL(String urlString) throws Exception{
		
			URL url = new URL(urlString);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			return conn;
	}
	
	
	//토큰 받기
	public String TockenRecive(String apikey, String userid) throws Exception{
		
		String url = "https://kakaoapi.aligo.in/akv10/token/create/10/i/";
		
		HttpURLConnection con = ConnenctURL(url);
		
		con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
		con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
		
		con.setRequestMethod("POST");
		
		StringBuffer sb = new StringBuffer();
        sb.append("apikey").append("=").append(apikey).append("&");
        sb.append("userid").append("=").append(userid);
		
		con.setDoOutput(true); //POST 데이터를 OutputStream으로 넘겨 주겠다는 설정 

		OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
		wr.write(sb.toString()); 
		wr.flush();

		//응답
	    BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	    JSONObject jsonObj = (JSONObject)JSONValue.parse(in.readLine());

	    System.out.println(jsonObj);
	    
	    String tocken = (String) jsonObj.get("token");
	    
	    wr.close();
	    in.close();
	    con.disconnect();
	    
		return tocken;
	}
	
	//템플릿 리스트
	public JSONObject KakaoAllimTalkList(String apikey, String userid,  String sendkey ,String token ) throws Exception{
		
		String url = "https://kakaoapi.aligo.in/akv10/template/list/";
		
		HttpURLConnection con = ConnenctURL(url);
		con.setDoOutput(true); 
		con.setRequestMethod("POST"); 
		con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
		con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
		
		StringBuffer sb = new StringBuffer();
        sb.append("apikey").append("=").append(apikey).append("&");
        sb.append("userid").append("=").append(userid).append("&");
        sb.append("token").append("=").append(token).append("&");
        sb.append("senderkey").append("=").append(sendkey);
		
        OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
        
		wr.write(sb.toString()); 
		wr.flush();

		//응답
	    BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	    JSONObject jsonObj = (JSONObject)JSONValue.parse(in.readLine());

	    System.out.println(jsonObj);
	    
	    
	    wr.close();
	    in.close();
	    con.disconnect();
	    
		return jsonObj;
	}
	
	//알림톡 전송
	public void KakaoAllimTalkSend(String apikey, String userid,  String sendkey ,String token, JSONObject jsonObj, String contents,String phone,String Sendurl ) throws Exception{
		
		String json = "";
		JSONArray button = (JSONArray) jsonObj.get("buttons");
		if (button.size() > 0 ) {
			button = (JSONArray) jsonObj.get("buttons");
			
			JSONObject jsonObj_s = (JSONObject) button.get(0);
			
			HashMap<String,Object> buttonMain = new HashMap<String,Object>();
			
			JSONObject buttonInfo = new JSONObject();
			
			buttonInfo.put("name", jsonObj_s.get("name").toString());
			buttonInfo.put("linkType", jsonObj_s.get("linkType").toString());
			buttonInfo.put("linkTypeName", jsonObj_s.get("linkTypeName").toString());
			buttonInfo.put("linkM", Sendurl);
			buttonInfo.put("linkP", Sendurl);
			
			JSONArray buttonar = new JSONArray();
			buttonar.add(buttonInfo);
			
			buttonMain.put("button",buttonar);
			ObjectMapper mapper = new ObjectMapper(); 
			json = mapper.writeValueAsString(buttonMain);
		}
		
		
		
		String url = "https://kakaoapi.aligo.in/akv10/alimtalk/send/";
		
		HttpURLConnection con = ConnenctURL(url);
		con.setDoOutput(true); 
		con.setRequestMethod("POST"); 
		con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
		con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정
		
		StringBuffer sb = new StringBuffer();
        sb.append("apikey").append("=").append(apikey).append("&");
        sb.append("userid").append("=").append(userid).append("&");
        sb.append("token").append("=").append(token).append("&");
        sb.append("senderkey").append("=").append(sendkey).append("&");
        sb.append("tpl_code").append("=").append(jsonObj.get("templtCode")).append("&");
        sb.append("sender").append("=").append("01098601540").append("&"); //발신자 내번호 고정
        sb.append("receiver_1").append("=").append(phone).append("&"); //수신자		
        sb.append("subject_1").append("=").append("알림").append("&"); //제목		
        sb.append("message_1").append("=").append(URLEncoder.encode(contents, "UTF-8")).append("&"); //내용		
        sb.append("button_1").append("=").append(json.toString()); //버튼	
        
        OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream());
		wr.write(sb.toString()); 
		wr.flush();

		//응답
	    BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	    JSONObject jsonObjResult = (JSONObject)JSONValue.parse(in.readLine());

	    System.out.println(jsonObjResult);
	    
	    
	    wr.close();
	    in.close();
	    con.disconnect();
	    
	}
	
	
}
