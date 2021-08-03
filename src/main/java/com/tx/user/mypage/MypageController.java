package com.tx.user.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.config.SettingData;
import com.tx.common.config.annotation.CheckActivityHistory;
import com.tx.common.dto.Common;
import com.tx.common.security.password.MyPasswordEncoder;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;
import com.tx.txap.admin.site.service.SiteService;
import com.tx.txap.program.application.dto.ApplicationDTO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
/**
 * 
 * @FileName: MemberController.java
 * @Project : cf
 * @Date    : 2017. 05. 31. 
 * @Author  : 이재령	
 * @Version : 1.0
 */
@Controller
public class MypageController {

	
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	
	/** 암호화 */
	@Autowired MyPasswordEncoder passwordEncoder;
	
    
    /** 페이지 처리 */
	@Autowired private PageAccess PageAccess;
	
	@Autowired SiteService SiteService;
	
	
	/**
	 * 회원 예매/신청조회 페이지
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{tiles}/mypage/applycheck.do")
	@CheckActivityHistory(desc="회원 예매/신청조회 페이지 방문")
	public ModelAndView applycheck(
			  HttpServletRequest req
			  ,@PathVariable String tiles
			) throws Exception {
		String sitePath = SiteService.getSitePath(tiles);
		ModelAndView mv  = new ModelAndView("/user/"+sitePath+"/mypage/prc_applycheck");
		return mv;
	}
	
	
	/**
	 * 수강대상자 리스트 조회
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{tiles}/mypage/ApplyUserListAjax.do")
	@ResponseBody
	public Map<String,Object> ApplyUserList(
			HttpServletRequest req
			, @RequestParam HashMap<String,Object> map
			, ApplicationDTO ApplicationDTO
			, @RequestParam("key") String APU_UI_KEYNO
			, @PathVariable String tiles
			) throws Exception {
		Map<String,Object> returnMap = new HashMap<String,Object>();
		
		ApplicationDTO.setAPU_UI_KEYNO(APU_UI_KEYNO);
		
		List<HashMap<String, Object>> UserList = Component.getList("mypage.APU_List", ApplicationDTO);
		returnMap.put("UserList", UserList);	//수강대상자리스트
		
		return returnMap;
	}
	
	/**
	 * 프로그램 결제  / 취소
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@Transactional
	@RequestMapping(value="/{tiles}/mypage/programApplyAjax.do")
	@CheckActivityHistory(type="homeTiles",desc="마이페이지 프로그램 결제  / 취소 작업")
	public void programApply(
			  HttpServletRequest req
			, Map<String,Object> commandMap
			, @RequestParam(value="APP_KEYNO",required= false) String APP_KEYNO
			, @RequestParam(value="APPtype",required= false) String APPtype
			, @RequestParam(value="ApplyCont",required= false) Integer ApplyCont
			, @RequestParam(value="AP_KEYNO",required= false) String AP_KEYNO
			, @RequestParam(value="price",required= false) Integer price
			, @PathVariable String tiles
			) throws Exception {
		req.setAttribute("homeTiles", tiles);
		//프로그램
		ApplicationDTO ApplicationDTO = new ApplicationDTO();
		ApplicationDTO.setAPP_KEYNO(APP_KEYNO);
		
		/*List<String> deleteAppSeatList = Component.getList("", ApplicationDTO)*/
		
		
		if(APPtype.equals("P")) {	//프로그램 결제
			ApplicationDTO.setAPP_STATUS(SettingData.APPLY_COMPLETE);						
		}else if(APPtype.equals("C")){	//프로그램 취소
			if(ApplyCont != 0) {		//신청 인원수가 0이 아니면
				ApplicationDTO.setAPP_AP_KEYNO(AP_KEYNO);
				ApplicationDTO.setAPP_STATUS(SettingData.APPLY_RESERVE);
				List<HashMap<String, Object>> ReserveData = Component.getList("mypage.APP_STATUS_SELCECT", ApplicationDTO);	//대기자 리스트
				
				Map<String,Object> map = new HashMap<String,Object>();
				List<String> keylist = new ArrayList<String>();
				
				int reserveCnt = ReserveData.size();
				if(reserveCnt != 0) {	//대기자가 있으면
					for(int i=1; i <= ApplyCont; i++) {
						if(i > reserveCnt) {
							break;
						}
						HashMap<String, Object> reserve = ReserveData.get(i-1);
						//신청 처리!
						keylist.add((String)reserve.get("APP_KEYNO"));
					}
					map.put("keylist", keylist);
					if(price == 0) {	//무료이면 신청완료
						map.put("APP_STATUS", SettingData.APPLY_COMPLETE);						
					}else {				//무료아닌건 결제대기
						map.put("APP_STATUS", SettingData.APPLY_WAITING);												
					}
//				keylist.put("status", SettingData.APPLY_WAITING);
					Component.updateData("mypage.program_apply_change", map);
				}
				
			}
			ApplicationDTO.setAPP_STATUS(SettingData.APPLY_CANCEL);							
		}
		Component.updateData("mypage.program_apply_type", ApplicationDTO);
		Component.deleteData("mypage.program_applySeat_delete", ApplicationDTO);
	}
	
	/**
	 * 회원 예매/신청조회 상세 팝업
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{tiles}/mypage/applycheck/applypopupAjax.do")
	@ResponseBody
	public HashMap<String, String> applypopup(
			 @RequestParam(value="GP_KEYNO",required= false) String GP_KEYNO
			, @PathVariable String tiles
			) throws Exception {
	    HashMap<String, String> applyData = Component.getData("mypage.tour_apply_detail", GP_KEYNO);
		return applyData;
	}
	
	/**
	 * 회원 예매/신청 내역 삭제
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="/{tiles}/mypage/applycheck/applyCancelAjax.do")
	@ResponseBody
	public void applyCancelAjax(
			 @RequestParam(value="GP_KEYNO",required= false) String GP_KEYNO
			, @PathVariable String tiles
			) throws Exception {
	
		ApplicationDTO ApplicationDTO = new ApplicationDTO();
		ApplicationDTO.setGP_KEYNO(GP_KEYNO);
		Component.updateData("mypage.tour_apply_cancel", GP_KEYNO);
		
	}
	
	/**
	 * 회원 예매/신청조회 수정 팝업
	 * @param req
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{tiles}/mypage/applycheck/applyUpdateAjax.do")
	@ResponseBody
	public int applyUpdateAjax(
			  @RequestParam(value="GP_KEYNO",required= false) String GP_KEYNO
			, @PathVariable String tiles
			) throws Exception {
		HashMap<String, Object> applyData = Component.getData("mypage.tour_apply_detail", GP_KEYNO);
		String GSS_KEYNO = Integer.toString((int) applyData.get("GP_GSS_KEYNO"));

			//총 정원
			Integer maxCnt = Component.getCount("Group.GSS_MAX", GSS_KEYNO);
			//해당 신청일자에 신청한 총 인원수
			Integer person = Component.getCount("Group.GP_DuplicateData", applyData);
			if(person == null) {
				person = 0;
			}
			int remainCnt = maxCnt - person;
	
		
		return remainCnt;
	}	
	
	@RequestMapping(value="/{tiles}/mypage/{type:apply|lecture|group}/dataAjax.do")
	public ModelAndView cfUseSearchAjax(HttpServletRequest req
			, Common search
			, @PathVariable String tiles
			, ApplicationDTO ApplicationDTO
			, @PathVariable String type) throws Exception {
		String sitePath = SiteService.getSitePath(tiles);
		ModelAndView mv  = new ModelAndView("/user/"+sitePath+"/mypage/prc_applycheck_ajax");
		
		String query = "";
		
		switch (type) {
			case "apply":
				ApplicationDTO.setAPP_DIVISION(SettingData.PROGRAM_APPLY);
				query= "mypage.program_apply";
				break;
			case "lecture":
				ApplicationDTO.setAPP_DIVISION(SettingData.PROGRAM_LECTURE);
				query= "mypage.program_apply";
				break;
			case "group":
				query="mypage.tour_apply";
				break;
			default:
			break;
		}
		
		Map<String, Object> user = CommonService.getUserInfo(req);
		if(user != null){
			String REGNM = (String) user.get("UI_KEYNO");
			
			if(ApplicationDTO.getSearchCondition().equals("")) {	//처음 들어올떄는 관람전으로 조회하기
				ApplicationDTO.setSearchCondition("B");
			}
			//프로그램
			ApplicationDTO.setAPP_APU_KEYNO(REGNM);
			ApplicationDTO.setGP_UI_KEYNO(REGNM);
			
			if(!"group".equals(type)){
				String arr[] = null;
				if("B".equals(ApplicationDTO.getSearchCondition())) {	//전
					arr = new String[3];
					arr[0] = SettingData.APPLY_WAITING;
					arr[1] = SettingData.APPLY_COMPLETE;
					arr[2] = SettingData.APPLY_RESERVE;
				}else if("F".equals(ApplicationDTO.getSearchCondition())) { //후
					arr = new String[1];
					arr[0] = SettingData.APPLY_PREVIEW;
				}else if("R".equals(ApplicationDTO.getSearchCondition())) { //환불
					arr = new String[2];
					arr[0] = SettingData.APPLY_CANCEL;
					arr[1] = SettingData.APPLY_EXPIRED;
				}				
				ApplicationDTO.setSearchConditionArr(arr);
			}
			ApplicationDTO.setApTiles(tiles); 	//홈페이지 구분 타일즈
			//프로그램 페이징
			
			PaginationInfo pageInfo = PageAccess.getPagInfo(ApplicationDTO.getPageIndex(),query+"_Count",ApplicationDTO, 5, 5);
			
			ApplicationDTO.setFirstIndex(pageInfo.getFirstRecordIndex());
			ApplicationDTO.setLastIndex(pageInfo.getLastRecordIndex());
			ApplicationDTO.setRecordCountPerPage(pageInfo.getRecordCountPerPage());
			ApplicationDTO.setPageIndex(pageInfo.getCurrentPageNo());
			
			mv.addObject("type",type);
			mv.addObject(type+"PaginationInfo", pageInfo);
			mv.addObject(type+"ProgramList", Component.getList(query, ApplicationDTO));	//신청프로그램
			mv.addObject("search", ApplicationDTO);
		}
		return mv;
	}
	
}
