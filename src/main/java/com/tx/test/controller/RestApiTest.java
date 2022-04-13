package com.tx.test.controller;


import java.awt.Component;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.math3.geometry.spherical.oned.ArcsSet.Split;
import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.tx.common.dto.Common;
import com.tx.common.security.password.MyPasswordEncoder;
import com.tx.common.security.rsa.service.RsaService;
import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.page.PageAccess;
import com.tx.common.service.weakness.WeaknessService;
import com.tx.dyAdmin.admin.code.service.CodeService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import com.tx.common.service.component.ComponentService;
import com.tx.test.dto.billDTO;


@Controller
public class RestApiTest {

	@Autowired ComponentService Component;
	
	@RequestMapping("/dyAdmin/bills/billsproducer.do")
	public ModelAndView billsproducer(HttpServletRequest req) throws Exception {
	ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_producer_insertView.adm");
	
		mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		mv.addObject("billList_sub",Component.getListNoParam("bills.SuppliedSelect"));
	
	
	     return mv;
	}
	 
	 

	 @RequestMapping("/dyAdmin/bills/hanjeon.do")
	   public ModelAndView billshanjeon(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_hanjeon.adm");
		   
		   mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		   mv.addObject("SuppliedList",Component.getListNoParam("bills.SuppliedSelect"));
		
	      return mv;
	  }
	 
	 
	 @RequestMapping("/dyAdmin/bills/client.do")
	   public ModelAndView billsclient(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_client.adm");
		   
		   mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		   mv.addObject("SuppliedList",Component.getListNoParam("bills.SuppliedSelect"));
		   
		   String now = new SimpleDateFormat("yyyy-MM-dd ").format(Calendar.getInstance().getTime());
		   String month = new SimpleDateFormat("MM").format(Calendar.getInstance().getTime());
		   
		   
		   mv.addObject("nowDate",now);
		   mv.addObject("itemName",month+"월 발전대금");
		   
	      return mv;
	  }
	 
	 
	 @RequestMapping("/dyAdmin/bills/admin.do")
	   public ModelAndView billsadmin(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_admin.adm");
		   
		   mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		   mv.addObject("SuppliedList",Component.getListNoParam("bills.SuppliedSelect"));
		
	      return mv;
	  }

	@RequestMapping("/dyAdmin/bills/providerSelectAjax.do")
	@ResponseBody
	public HashMap<String,Object> providerSelectAjax(HttpServletRequest req,
			@RequestParam(value="dbp_keyno")String dbp_keyno
			) throws Exception {
		 
		

//		String keyno = dbp_keyno.substring(1);
		HashMap<String,Object> map = Component.getData("bills.billsSelect_one",dbp_keyno);


		//등록번호 추출 부분
		String code = map.get("dbp_homemunseo_id").toString();
		if(code.equals("0")) {
			code = map.get("dbp_id").toString().substring(0,3) + "1";
			System.out.println(code);
		}else {
			String codenum = code.substring(code.length()-8,code.length());
			int tempc = Integer.parseInt(codenum) + 1 ;
			code = map.get("dbp_id").toString().substring(0,3) + tempc;
		}
		
		map.put("dbp_homemunseo_id",code);
		
		return map;
	}
	
	
	
	@RequestMapping("/dyAdmin/bills/billsActionAjax.do")
	@ResponseBody
	public String billsActionAjax(HttpServletRequest req,billDTO bill, 
			@RequestParam(value="buttionType", defaultValue="insert")String type) throws Exception {
		 
		 String msg = "";
		 
		 if(type.equals("update")) {
			 Component.updateData("bills.billsProvideUPdate", bill);
			 msg = "수정이 완료 되었습니다.";
		 }else {
			//등록된 사업자등록번호 확인 
			 int count = Component.getCount("bills.billCount",bill);
			 
			 if(count > 0) {
				 msg = "사업자 등록 번호가 이미 등록되어있습니다.";
			 }else {
				 Component.createData("bills.billsProvideInsert", bill);
				 msg = "등록이 완료 되었습니다.";
			 }
		 }
		
		 return msg;
	}
	
	@RequestMapping("/dyAdmin/bills/supliedSelectAjax.do")
	@ResponseBody
	public HashMap<String, Object> supliedSelectAjax(HttpServletRequest req,
			@RequestParam(value="dbs_keyno")String dbs_keyno
			) throws Exception {
		
//		String keyno = dbs_keyno.substring(1);
		HashMap<String,Object> map = Component.getData("bills.SuppliedSelect_one",dbs_keyno);
		
//		map.replace("dbs_keyno",keyno);
		
		return map;
	}
	
	
	
	@RequestMapping("/dyAdmin/bills/billsActionAjax2.do")
	@ResponseBody
	public String billsActionAjax2(HttpServletRequest req,billDTO bill, @RequestParam(value="buttionType2", defaultValue="insert")String type) throws Exception {
		 
		 String msg = "";
		 
		 if(type.equals("update")) {
			 Component.updateData("bills.billsProvideUPdate2", bill);
			 msg = "수정이 완료 되었습니다.";
		 }else {
			//등록된 사업자등록번호 확인 
			 int count = Component.getCount("bills.billCount2",bill);
			 
			 if(count > 0) {
				 msg = "사업자 등록 번호가 이미 등록되어있습니다.";
			 }else {
				 Component.createData("bills.billsProvideInsert2", bill);
				 msg = "등록이 완료 되었습니다.";
			 }
		 }
		
		 return msg;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/dyAdmin/bills/loadBillInfo.do")
	@ResponseBody
	public static void loadBillInfo(HttpServletRequest req, billDTO bill)
			throws Exception {

			// JSONObject객체 생성
			JSONObject data = new JSONObject();

			// JSONObject객체에 세금계산서 정보를 추가
			data.put("hometaxbill_id", bill.getHometaxbill_id());				// 회사코드 (아이디) (사용자코드 1001 *
			data.put("spass", bill.getSpass());									// 패스워드 *
			data.put("apikey", bill.getApikey() );								// 인증키*
			data.put("homemunseo_id",bill.getHomemunseo_id() );					// 고유번호*
			data.put("signature",bill.getSignature() );							// 전자서명
			
			data.put("issueid",bill.getIssueid() );								// 승인번호(자동생성)
			data.put("typecode1",bill.getTypecode1() );							// (세금)계산서 종류1*
			data.put("typecode2",bill.getTypecode2() );							// (세금)계산서 종류2*
			data.put("description", bill.getDescription() );					// 비고
			data.put("issuedate",bill.getIssuedate() );							// 작성일자*
			
			data.put("modifytype",bill.getModifytype() );						// 수정사유
			data.put("purposetype",bill.getPurposetype() );						// 영수/청구 구분*
			data.put("originalissueid",bill.getOriginalissueid() );				// 당초전자(세금)계산서 승인번호
			data.put("si_id",bill.getSi_id() );									// 수입신고번호
			data.put("si_hcnt",bill.getSi_hcnt() );								// 수입총건 *
			
			data.put("si_startdt",bill.getSi_startdt() );						// 일괄발급시작일
			data.put("si_enddt",bill.getSi_enddt() );							// 일괄발급종료일
			data.put("ir_companynumber",bill.getIr_companynumber() );			// 공급자 사업자등록번호*
			data.put("ir_biztype",bill.getIr_biztype() );						// 공급자 업태*
			data.put("ir_companyname",bill.getIr_companyname() );				// 공급자 상호*
			
			data.put("ir_bizclassification",bill.getIr_bizclassification() );	// 공급자 업종*
			data.put("ir_ceoname",bill.getIr_ceoname());						// 공급자 대표자성명*
			data.put("ir_busename",bill.getIr_busename());						// 공급자 담당부서명
			data.put("ir_name", bill.getIr_name());								// 공급자 담당자명*
			data.put("ir_cell", bill.getIr_cell());								// 공급자 담당자전화번호*
			
			data.put("ir_email",bill.getIr_email());							// 공급자 담당자이메일*
			data.put("ir_companyaddress",bill.getIr_companyaddress() );			// 공급자 주소*
			data.put("ie_companynumber", bill.getIe_companynumber());			// 공급받는자 사업자등록번호*
			data.put("ie_biztype",bill.getIe_companyname());					// 공급받는자 업태*
			data.put("ie_companyname",bill.getIe_companyname() );				// 공급받는자 사업체명*
			
			data.put("ie_bizclassification",bill.getIe_bizclassification() );	// 공급받는자 업종*
			data.put("ie_taxnumber",bill.getIe_taxnumber() );					// 공급받는자 종사업장번호
			data.put("partytypecode",bill.getPartytypecode() );					// 공급받는자 구분 01=사업자등록번호 02=주민등록번호 03=외국인*
			data.put("ie_ceoname",bill.getIe_ceoname() );						// 공급받는자 대표자명*
			data.put("ie_busename1",bill.getIe_busename1() );					// 공급받는자 담당부서1
			
			data.put("ie_name1",bill.getIe_name1() );							// 공급받는자 담당자명1*
			data.put("ie_cell1",bill.getIe_cell1() );							// 공급받는자 담당자연락처1*
			data.put("ie_email1",bill.getIe_email1() );							// 공급받는자 담당자이메일1*
			data.put("ie_busename2",bill.getIe_busename2() );					// 공급받는자 담당부서2
			data.put("ie_name2",bill.getIe_name2() );							// 공급받는자 담당자명2
			
			data.put("ie_cell2",bill.getIe_cell2());							// 공급받는자 담당자연락처2
			data.put("ie_email2",bill.getIe_email2() );							// 공급받는자 담당자이메일2
			data.put("ie_companyaddress",bill.getIe_companyaddress() );			// 공급받는자 회사주소*
			data.put("su_companynumber",bill.getSu_companynumber() );			// 수탁사업자 사업자등록번호
			data.put("su_biztype",bill.getSu_biztype() );						// 수탁사업자 업태
			
			data.put("su_companyname",bill.getSu_companyname() );				// 수탁사업자 상호명
			data.put("su_bizclassification",bill.getSu_bizclassification() );	// 수탁사업자 업종
			data.put("su_taxnumber",bill.getSu_taxnumber() );					// 수탁사업자 종사업장번호
			data.put("su_ceoname",bill.getSu_ceoname() );						// 수탁사업자 대표자명
			data.put("su_busename",bill.getSu_busename() );						// 수탁사업자 담당부서명
			
			data.put("su_name",bill.getSu_name() );								// 수탁사업자 담당자명
			data.put("su_cell",bill.getSu_cell() );								// 수탁사업자 담당자전화번호
			data.put("su_email",bill.getSu_email() );							// 수탁사업자 담당자이메일
			data.put("su_companyaddress",bill.getSu_companyaddress() );			// 수탁사업자 회사주소
			
			data.put("cash",bill.getCash().replace(",", ""));									// 현금*
			data.put("scheck",bill.getScheck().replace(",", ""));								// 수표*
			data.put("draft",bill.getDraft().replace(",", ""));									// 어음*
			data.put("uncollected",bill.getUncollected().replace(",", ""));						// 외상 미수금*
			data.put("chargetotal",bill.getChargetotal().replace(",", ""));						// 총 공급가액*
			data.put("taxtotal",bill.getTaxtotal().replace(",", ""));							// 총 세액 *
			data.put("grandtotal",bill.getGrandtotal().replace(",", ""));						// 총 금액*
			
			JSONArray jArray = new JSONArray();
			
			for (int i = 0; i < 1; i++) {
				
				JSONObject sObject = new JSONObject();
				sObject.put("description", bill.getDescription() );								// 품목별 비고입력
				sObject.put("supplyprice",bill.getSupplyprice().replace(",", ""));				// 품목별 공급가액
				sObject.put("quantity",bill.getQuantity() );									// 품목수량
				sObject.put("unit",bill.getUnit() );											// 품목규격
				sObject.put("subject",bill.getSubject() );										// 품목명
				sObject.put("gyymmdd",bill.getGyymmdd() );										// 공급연원일
				sObject.put("tax",bill.getTax().replace(",", ""));								// 세액
				sObject.put("unitprice",bill.getUnitprice().replace(",", ""));					// 단가
				jArray.put(sObject);
			}

			// 세금계산서 detail정보를 JSONObject객체에 추가
			data.put("taxdetailList", jArray);// 배열을 넣음

			System.out.println(data);
			
		 return;
	}
	
}
