package com.tx.txap.member.dto;

import java.io.Serializable;
import java.util.regex.Matcher;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.tx.common.security.password.MyPasswordEncoder;

import lombok.Data;

@Data
@Component
public class ModReqUserDTO implements Serializable {
	
	private static final long serialVersionUID = -3793808669767332434L;
	
	/** 암호화 */
	@Autowired MyPasswordEncoder passwordEncoder;
	
	// U_USERINFO 테이블
	private String  UI_KEYNO;
	private String	UI_ID;
	@NotEmpty
	private String	UI_PASSWORD;
	@NotEmpty
	@Size(min=4, max=16)
	private String	UI_PASSWORD2;
	@NotEmpty
	@Size(min=2, max=20)
	private String	UI_NAME;
	private String	UI_EMAIL;
	private String	UI_PHONE;
	private String	UI_BIRTH;
	private String	UI_ZENDER;
	private String	UI_AUTHORITY;
	private String	UI_DELYN;
	private String	UI_REGDT;
	private String	UI_MODDT;
	private String	UI_AUTH_YN;
	private String	UI_AUTH_DATA;
	@NotEmpty
	@Size(min=2, max=20)
	private String	UI_REP_NAME;
	
	/**
	 * 커맨드 객체 검증(validate)
	 * @param 에러 바인딩 객체, 타일즈, 정규식 규칙, request
	 **/
	public void checkEtcValid(Errors bindingResult, UserSettingDTO setting, String regex, HttpServletRequest req, boolean isCurrentPWMatch) {
		
		if(!isCurrentPWMatch) {
			bindingResult.rejectValue("UI_PASSWORD", "currentPW.mismatch", "비밀번호가 잘못되었습니다.");
		}
		
		if(!chkPatternValue(regex, this.UI_PASSWORD2)) {
			bindingResult.rejectValue("UI_PASSWORD2", "password.mismatch", "비밀번호 형식이 잘못되었습니다.");
		}
		
		if(chkProhibitValue(setting, this.UI_NAME)) {
			bindingResult.rejectValue("UI_NAME", "name.prohibit", "사용할 수 없는 이름 입니다.");
		}
		
		if(chkProhibitValue(setting, this.getUI_REP_NAME())) {
			bindingResult.rejectValue("UI_REP_NAME", "rep_name.prohibit", "사용할 수 없는 별명 입니다.");
		}
		
	}
	
	/**
	 * 입력받은 값 금지단어 체크
	 * @param 타일즈, 검증값
	 * @return 금지단어 true, 사용가능 false 
	 **/
	private boolean chkProhibitValue(UserSettingDTO setting, String value) {
		
		//금지단어 체크
		if( setting !=null && StringUtils.isNotEmpty(setting.getUS_ID_FILTER()) ) {
			if( StringUtils.isNotEmpty(value) ){
				String val = value;
				for(String f : setting.getUS_ID_FILTER().split(",")){
					if(val.contains(f)){
						return true;
					}
				}
			}
		}
		return false;
	}
	
	/**
	 * 입력받은 값 패턴 체크
	 * @param 정규식 규칙, 검증값
	 * @return 패턴일치 true, 패턴불일치 false 
	 **/
	private boolean chkPatternValue(String regex, String value) {
		return regexCheck(regex, value);
	}
	
	/**
	 * 정규식 검증
	 * */
	private boolean regexCheck(String regex, String parameter) {
		java.util.regex.Pattern pattern = java.util.regex.Pattern.compile(regex);
		Matcher matcher = pattern.matcher(parameter);
		return matcher.matches();
	}
	
}
