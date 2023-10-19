package com.tx.common.service.member.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.config.annotation.CheckActivityHistory;
import com.tx.common.config.tld.SiteProperties;
import com.tx.common.dto.TilesDTO;
import com.tx.common.security.password.MyPasswordEncoder;
import com.tx.common.security.rsa.service.RsaService;
import com.tx.common.security.service.AuthenticationSessionService;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.dyAdmin.admin.site.dto.SiteManagerDTO;
import com.tx.dyAdmin.admin.site.service.SiteService;
import com.tx.dyAdmin.member.dto.UserDTO;
import com.tx.dyAdmin.member.dto.UserSettingDTO;

/**
 * 
 * @FileName: LoginController.java
 * @Project : demo
 * @Date    : 2017. 02. 06. 
 * @Author  : 이재령	
 * @Version : 1.0
 */
@Controller
public class CommonMemberController {

	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	
	/** 암호화 */
	@Autowired MyPasswordEncoder passwordEncoder;
	
	/** RSA */
	@Autowired RsaService RsaService;
	@Autowired SiteService SiteService;
	@Autowired AuthenticationSessionService AuthenticationSessionService;
	
	@RequestMapping(value="/user/member/login.do")
	public ModelAndView memberLogion(HttpServletRequest req, Map<String,Object> commandMap
			, @Valid TilesDTO TilesDTO
			,HttpSession session
			,HttpServletResponse res
			) throws Exception {
		String tiles = TilesDTO.getTiles(req);
		
		if( tiles == null || tiles.equals("cf") ||tiles.equals("sfa")) tiles = "dy";
		
		
		
		ModelAndView mv  = new ModelAndView("/user/"+SiteService.getSitePath(tiles)+"/member/prc_login");
		
		
		SiteManagerDTO SiteManagerDTO =  Component.getData("SiteManager.getData",SiteProperties.getCmsUser());
		mv.addObject("SiteManager", SiteManagerDTO);
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		
		//모바일일 경우 세션을 날리고 다시 로그인 하게 만들자
		//모바일 부분 체크 이후 url 변경
		String userAgent = req.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		boolean kakao = userAgent.matches( ".*(iPhone|iPod|Kakao).*");
		
		if (kakao) {
//			session.invalidate();
//			session.removeAttribute("userInfo");
//			session.removeAttribute("referrerPage");
//			mv.setViewName("redirect:/"+tiles+"/index.do");
//			System.out.println(mv.getViewName());
			//return mv;
		}
		
		//로그인한 상태라면 메인화면으로 리다이렉트 (관리자와 회원 구분)
		if(user != null){
			mv.setViewName("redirect:/"+tiles+"/index.do");
			return mv;
		}
		
		//리턴페이지 셋팅
		if(req.getParameter("returnPage") != null){
			session.setAttribute("returnPage", req.getParameter("returnPage"));
		}else if(session.getAttribute("referrerPage") == null){
			session.setAttribute("referrerPage", req.getHeader("Referer"));
		}
		
		//에러메세지 셋팅
		if(req.getSession().getAttribute("customExceptionmsg") != null){
			mv.addObject("customExceptionmsg",req.getSession().getAttribute("customExceptionmsg"));
			req.getSession().removeAttribute("customExceptionmsg");
		}
		
			
		//RsaService.setRsa(req);
		mv.addObject("tiles",tiles);
		
		
		mv.addObject("mirrorPage", "/"+tiles+"/member/login.do");	
		/*
		 * if(tiles.equals("sfa")) { mv.addObject("mirrorPage", "/dy/member/login.do");
		 * }else {
		 * 
		 * }
		 */
		
		
		return mv;
	}
	
	@RequestMapping(value="/{tiles}/naver/callback.do")
	public ModelAndView naverLoginfCallback(HttpServletRequest req, Map<String,Object> commandMap
			,@PathVariable String tiles
			) throws Exception {
		ModelAndView mv  = new ModelAndView("/user/"+SiteService.getSitePath(tiles)+"/member/naver_callback.notiles");
		SiteManagerDTO SiteManagerDTO =  Component.getData("SiteManager.getData",SiteProperties.getCmsUser());
		mv.addObject("SiteManager", SiteManagerDTO);
		return mv;
	}
	
	
	@RequestMapping(value="/{tiles}/reward/snsLoginAjax.do")
	@Transactional
	@ResponseBody
	public boolean snsLogin(HttpServletRequest req
			, @PathVariable String tiles
			, UserDTO UserDTO
			, @RequestParam(value="uniqId", required=false, defaultValue="") String sns_uniqId
			, @RequestParam(value="name", required=false, defaultValue="") String sns_name
			, @RequestParam(value="email", required=false, defaultValue="") String sns_email
			, @RequestParam(value="type", required=false, defaultValue="") String sns_type
			) throws Exception {
		
		System.out.println("snsInfo :: " + sns_uniqId +  ", " + sns_type);
		boolean check = false;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uniqId", sns_uniqId);
		paramMap.put("type", sns_type);
		
		UserDTO user = Component.getData("member.getSnsMember", paramMap);
		
		if(user == null) {
			// 신규 가입처리
			//String encryptionPW = passwordEncoder.encode("$sns_" + sns_type + "_pw_" + sns_uniqId);
			
			UserDTO.setUI_KEYNO(CommonService.getTableKey("UI"));
			UserDTO.setUI_NAME(sns_name);
			UserDTO.setUI_REP_NAME(sns_name);
			UserDTO.setUI_SNS_ID(sns_uniqId);
			UserDTO.setUI_EMAIL(sns_email);
			UserDTO.setUI_SNS_TYPE(sns_type);
			UserDTO.setUI_ID("$sns_" + sns_type + "_id_" + sns_uniqId);
			UserDTO.setUI_AUTH_YN("Y");
			UserDTO.encode();	
			Component.createData("member.UI_snsInsert", UserDTO);
			
			// 권한부여
			UserSettingDTO setting = Component.getData("member.US_getData", tiles);
			if(setting.getUS_UIA_KEYNO() != null && !setting.getUS_UIA_KEYNO().equals("")){
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("UI_KEYNO", UserDTO.getUI_KEYNO());
				map.put("UIA_KEYNO", setting.getUS_UIA_KEYNO().split(","));
				Component.createData("member.UI_setAuthority", map);
			}
			
			user = Component.getData("member.getSnsMember", paramMap);
		}
		
		if(user != null) {
			// 스프링 권한 인증
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			String authority[] = user.getUIA_NAME().split(",");
			for(String auth : authority){
				roles.add(new SimpleGrantedAuthority(auth));
			}
			user.setAuthorities(roles);
			Collection<? extends GrantedAuthority> authorities = user.getAuthorities();
			
			Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getUI_PASSWORD(), authorities);
	        SecurityContextHolder.getContext().setAuthentication(AuthenticationSessionService.updateAuthentication(authentication, user.getUI_ID()+"", req));
			check = true;
	        
			return check;
		}
		
		return check;
	}
	
	
	
	@RequestMapping(value="/user/login/denied.do")
	@CheckActivityHistory(desc="접근 거부 페이지 방문")
	public ModelAndView loginDenied(HttpServletRequest req
			) throws Exception {
		
		return new ModelAndView("/error/denied");
	}
	
	/**
	 * 로그 아웃 후 홈페이지 분기처리
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/common/logout.do")
	public ModelAndView logout(HttpServletRequest req
			) throws Exception {
		ModelAndView mv  = new ModelAndView("redirect:/");
		String tiles = (String)req.getSession().getAttribute("currentTiles");
		System.err.println("ryanius2 :: " + tiles);
		
		if(StringUtils.isNotEmpty(tiles)){
			mv.setViewName("redirect:/"+tiles+"/index.do");
		}
		return mv;
	}
	
	/**
	 * 아이디 중복체크 , 금지단어 체크
	 * @param req
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/common/member/regist/checkIdEmailAjax.do")
	@ResponseBody
	public String commonMemberRegistCheck(HttpServletRequest req
			, UserDTO UserDTO
			, @RequestParam(value="tiles") String tiles
			
			) throws Exception {
		
		String result = Component.getData("member.UI_checkIdAndEmail", UserDTO);
		if(result != null && result.contains("id")){
			return "id";
		}
		
		UserSettingDTO setting = Component.getData("member.US_getData",tiles);
		if(setting != null){
			//금지단어 체크
			if(UserDTO.getUI_ID()!= null && !UserDTO.getUI_ID().equals("")){
				String UI_ID = UserDTO.getUI_ID();
//			System.out.println("아이디 : "+UI_ID );
				for(String f : setting.getUS_ID_FILTER().split(",")){
					if(UI_ID.contains(f)){
						return "idFilter";
					}
				}
			}
			
			if(UserDTO.getUI_NAME()!= null && !UserDTO.getUI_NAME().equals("")){
				String UI_NAME = UserDTO.getUI_NAME();
				for(String f : setting.getUS_ID_FILTER().split(",")){
					if(UI_NAME.contains(f)){
						return "nameFilter";
					}
				}
			}
		}
		return "ok";
		
	}
	
	/**
	 * 금지단어 체크
	 * @param req
	 * @param ResearchSkinDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/common/member/update/forbiddenWorkdCheckAjax.do")
	@ResponseBody
	public String commonMemberUpdateForbiddenWorkdCheckAjax(HttpServletRequest req
			, @RequestParam(value="tiles") String tiles
			, @RequestParam(value="text") String text
			) throws Exception {
		
		UserSettingDTO setting = Component.getData("member.US_getData",tiles);
		if(setting != null){
			//금지단어 체크
			if(StringUtils.isNotEmpty(text)){
				for(String f : setting.getUS_ID_FILTER().split(",")){
					if(text.contains(f)){
						return "F";
					}
				}
			}
		}
		return "S";
		
	}
	
	
	/**
	 * 비밀번호 체크
	 * @param req
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/common/member/update/checkPassword.do")
	@ResponseBody
	public boolean commonMemberUpdateCheckPassword(HttpServletRequest req
			, UserDTO UserDTO
			) throws Exception {
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		
		String password = user.get("UI_PASSWORD")+"";
		
		return passwordEncoder.matches(UserDTO.getUI_PASSWORD(), password);
		
	}
	
	/**
	 * 아이디 체크
	 * @param req
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/common/member/update/checkId.do")
	@ResponseBody
	public boolean commonMemberUpdateCheckId(HttpServletRequest req
			, UserDTO UserDTO
			, @RequestParam(value="tiles") String tiles
			) throws Exception {
		int result = Component.getCount("member.UI_checkId", UserDTO);
		
		if(result == 1){
			return true;
		}else{
			UserSettingDTO setting = Component.getData("member.US_getData",tiles);
			//금지단어 체크
			if(setting !=null && setting.getUS_ID_FILTER() !=null && !setting.getUS_ID_FILTER().equals("")) {
				if(UserDTO.getUI_ID()!= null && !UserDTO.getUI_ID().equals("")){
					String UI_ID = UserDTO.getUI_ID();
					for(String f : setting.getUS_ID_FILTER().split(",")){
						if(UI_ID.contains(f)){
							return true;
						}
					}
				}
			}
			return false;
		}
	}
	
	/**
	 * 비밀번호 체크
	 * @param req
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/common/member/update/checkPwd.do")
	@ResponseBody
	public boolean commonMemberUpdateCheckPwd(HttpServletRequest req
			, UserDTO UserDTO
			, @RequestParam(value="type",required=false) String type
			) throws Exception {
		
		
		String encPwd = null;
		if(type != null && "admin".equals(type)){
			Map<String, Object> user = CommonService.getUserInfo(req);
			if(user != null){
				encPwd = (String)user.get("UI_PASSWORD");
			}
		}else{
			UserDTO user = Component.getData("member.UI_IdCheck", UserDTO);
			encPwd = user.getUI_PASSWORD();
		}
		
		if(StringUtils.isEmpty(encPwd)){
			return false;
		}
		
		return passwordEncoder.matches(UserDTO.getUI_PASSWORD(), encPwd);
	}
	
	
	/**
	 * 금지단어 체크
	 * @param req
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/common/member/update/checkIdEmailAjax.do")
	@ResponseBody
	public String commonMemberUpdateCheck(HttpServletRequest req
			, UserDTO UserDTO
			, @RequestParam(value="tiles") String tiles
			
			) throws Exception {
		
		
		UserSettingDTO setting = Component.getData("member.US_getData",tiles);
		//금지단어 체크
		if(UserDTO.getUI_NAME()!= null && !UserDTO.getUI_NAME().equals("")){
			String UI_NAME = UserDTO.getUI_NAME();
			for(String f : setting.getUS_ID_FILTER().split(",")){
				if(UI_NAME.contains(f)){
					return "nameFilter";
				}
			}
		}
		
		return "ok";
		
	}
	
	/**
	 * 로그인 체크
	 * @param req
	 * @param UserDTO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/common/member/checkLogin.do")
	@ResponseBody
	public String commonMemberCheckLogin(HttpServletRequest req
			) throws Exception {
		
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		
		return (user == null) ? "N":"Y";
		
	}
	
}
