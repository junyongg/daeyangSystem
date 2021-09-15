package com.tx.dyAdmin.program.application.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tx.common.config.SettingData;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.dyAdmin.program.application.dto.ApplicationDTO;
import com.tx.dyAdmin.program.application.service.ApplicationService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ApplicationService")
public class ApplicationServiceImpl extends EgovAbstractServiceImpl implements ApplicationService {

	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	
	/**
	 * 결제만료로 업데이트
	 * @param req 
	 * */
	@Override
	public void checkExpiredDate(String type, HttpServletRequest req) throws Exception {
		
		List<Map<String,Object>> list = null;
		Map<String,Object> map = new HashMap<String,Object>();
		
		if("mypage".equals(type)) {	//자신이 신청한 프로그램만 조회
			Map<String, Object> user = CommonService.getUserInfo(req);
			map.put("APP_APU_KEYNO", (String)user.get("UI_KEYNO"));
			list =   Component.getList("mypage.program_AllList", map);
		}else if("ApplyView".equals(type)) {	//모든 프로그램을 조회
			list = Component.getListNoParam("mypage.program_AllList");
		}
		
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd");
		
		String temp = dayTime.format(new Date());
		int today = Integer.parseInt(temp);
	
		for(Map<String,Object> program : list) {
			//결제만료일 형식바꾸기
			temp = (String)program.get("APP_EXPIRED");	
			int expired = 0;
			if(!StringUtils.isEmpty(temp)) {
				expired = Integer.parseInt(temp.replaceAll("-", ""));
			}
			//프로그램 시작일
			String StartDay = (String)program.get("APP_ST_DATE");	
			int stDay = 0;
			if(!StringUtils.isEmpty(StartDay)) {	//시작일이 있으면
				stDay = Integer.parseInt(StartDay.replaceAll("-", ""));	//시작일을 '-'없애고 숫자로 바꿈
			}
			
			ApplicationDTO ApplicationDTO = new ApplicationDTO();
			ApplicationDTO.setAPP_KEYNO(program.get("APP_KEYNO").toString());
			if(program.get("APP_STATUS").equals(SettingData.APPLY_WAITING) && expired < today) {	//결제대기이고 결제만료일이 오늘날짜보다 작으면
				ApplicationDTO.setAPP_STATUS(SettingData.APPLY_EXPIRED);
				Component.updateData("mypage.program_apply_type", ApplicationDTO);
			}else if(program.get("APP_STATUS").equals(SettingData.APPLY_WAITING) && stDay < today) {	//결제대기이고 프로그램 시작일이 오늘날짜보다 작으면
				ApplicationDTO.setAPP_STATUS(SettingData.APPLY_CANCEL);
				Component.updateData("mypage.program_apply_type", ApplicationDTO);
			}else if(program.get("APP_STATUS").equals(SettingData.APPLY_COMPLETE) && stDay < today) {	//신청완료이고 프로그램 시작일이 오늘날짜보다 작으면
				ApplicationDTO.setAPP_STATUS(SettingData.APPLY_PREVIEW);				
				Component.updateData("mypage.program_apply_type", ApplicationDTO);
			}
		}
	}

	/**
	 * 관람완료로 업데이트
	 * @param req 
	 * */
	@Override
	public void ViewExpiredDate(String type, HttpServletRequest req) throws Exception {
		
		List<Map<String,Object>> list = null;
		Map<String,Object> map = new HashMap<String,Object>();
		
		if("mypage".equals(type)) {	//자신이 신청한 프로그램만 조회
			Map<String, Object> user = CommonService.getUserInfo(req);
			map.put("APP_APU_KEYNO", (String)user.get("UI_KEYNO"));
			map.put("APP_STATUS", SettingData.APPLY_COMPLETE);
			list = Component.getList("mypage.program_BeforeViewList", map);
			
		}else if("ApplyView".equals(type)) {	//모든 프로그램을 조회
			map.put("APP_STATUS", SettingData.APPLY_COMPLETE);
			list = Component.getList("mypage.program_BeforeViewList", map);
		}
		
		if(list != null && !list.isEmpty()){
			for (Map<String, Object> key : list) {
				map.put("APP_KEYNO", String.valueOf(key.get("APP_KEYNO")));
				map.put("APP_STATUS", SettingData.APPLY_PREVIEW);
				Component.updateData("mypage.viewOk", map);
			}
		}
	}
	
	/**
	 * 버튼 텍스트 넣기(맵)
	 * @param req 
	 * @throws ParseException 
	 * */
	public HashMap<String, Object> getButtonText(HashMap<String, Object> resultMap) throws ParseException{
		if(resultMap != null){

				String buttonText = null;
				String reserve_type = null;
				String ap_keyno = String.valueOf(resultMap.get("AP_KEYNO"));
				String stdt = (String)resultMap.get("AP_STDT");
				String endt = (String)resultMap.get("AP_ENDT");
				String ap_deadline = (String)resultMap.get("AP_DEADLINE");
				String ap_st_date = (String)resultMap.get("AP_APPLY_ST_DATE");
				String ap_en_date = (String)resultMap.get("AP_APPLY_EN_DATE");
				String bntText1 = (String)resultMap.get("AP_BUTTON_TEXT1");
				String bntText2 = (String)resultMap.get("AP_BUTTON_TEXT2");
				String bntText3 = (String)resultMap.get("AP_BUTTON_TEXT3");
				String bntText[] = {bntText1,bntText2,bntText3};
				if(StringUtils.isNotBlank(ap_keyno)){
					if(StringUtils.isNotBlank(ap_deadline) && "Y".equals(ap_deadline)){
						buttonText = StringUtils.defaultIfBlank(bntText3, "마감");
						reserve_type = "E";
					}else{
						HashMap<String, String> resultData = new HashMap<>();
						if(StringUtils.isNotBlank(ap_st_date) && StringUtils.isNotBlank(ap_en_date)){ /* 예매시작 O, 예매종료 O */
							resultData = setBntText(ap_st_date,ap_en_date,bntText);
						}else if(StringUtils.isNotBlank(ap_st_date) && StringUtils.isBlank(ap_en_date)){ /* 예매시작 O, 예매종료 X */
							resultData = setBntText(ap_st_date,endt,bntText);
						}else if(StringUtils.isBlank(ap_st_date) && StringUtils.isNotBlank(ap_en_date)){ /* 예매시작 X, 예매종료 O */
							resultData = setBntText(stdt,ap_en_date,bntText);
						}else if(StringUtils.isBlank(ap_st_date) && StringUtils.isBlank(ap_en_date)){ /* 예매시작 X, 예매종료 X */
							resultData = setBntText(stdt,endt,bntText);
						}
						buttonText = resultData.get("buttonText");
						reserve_type = resultData.get("reserve_type");
					}
				}
				resultMap.put("buttonText", buttonText);
				resultMap.put("reserve_type", reserve_type); /* 예매마감여부 체크 */
				
		}
		return resultMap;
	}
	
	/**
	 * 버튼 텍스트 넣기(리스트)
	 * @param req 
	 * @throws ParseException 
	 * */
	@Override
	public List<HashMap<String, Object>> getButtonText(List<HashMap<String, Object>> resultList) throws ParseException{
		if(resultList != null && resultList.size() > 0 ){
			for (HashMap<String, Object> map : resultList) {
				getButtonText(map);
			}
		}
		return resultList;
	}

	private HashMap<String, String> setBntText(String st_date, String en_date, String bntText[]) throws ParseException {
		HashMap<String, String> resultData = new HashMap<>();
		String buttonText = null;
		String reserve_type = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String nowDate = dateFormat.format(today);
		st_date = dateFormat.format(dateFormat.parse(st_date));
		en_date = dateFormat.format(dateFormat.parse(en_date));
		
		if(nowDate.compareTo(st_date) < 0){
			reserve_type = "B";
			buttonText = StringUtils.defaultIfBlank(bntText[0], "예약예정"); 
		}else if(nowDate.compareTo(st_date) >= 0 && nowDate.compareTo(en_date) <= 0){
			reserve_type = "G";
			buttonText = StringUtils.defaultIfBlank(bntText[1], "예약신청");
		}else{
			reserve_type = "E";
			buttonText = StringUtils.defaultIfBlank(bntText[2], "마감");
		}
		resultData.put("buttonText", buttonText);
		resultData.put("reserve_type", reserve_type);
		return resultData;
	}
	
}
