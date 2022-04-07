package com.tx.test.controller;


import java.awt.Component;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;

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
		mv.addObject("billList_sub",Component.getListNoParam("bills.billsSelect2"));
	
	
	     return mv;
	}
	 
	 

	 @RequestMapping("/dyAdmin/bills/hanjeon.do")
	   public ModelAndView billshanjeon(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_hanjeon.adm");
		   
		   mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		   mv.addObject("billList2",Component.getListNoParam("bills.billsSelect2"));
		
	      return mv;
	  }
	 
	 
	 @RequestMapping("/dyAdmin/bills/client.do")
	   public ModelAndView billsclient(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_client.adm");
		   
		   mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		   mv.addObject("billList2",Component.getListNoParam("bills.billsSelect2"));
		   
	      return mv;
	  }
	 
	 
	 @RequestMapping("/dyAdmin/bills/admin.do")
	   public ModelAndView billsadmin(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_admin.adm");
		   
		   mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		   mv.addObject("billList2",Component.getListNoParam("bills.billsSelect2"));
		
	      return mv;
	  }

	@RequestMapping("/dyAdmin/bills/providerSelectAjax.do")
	@ResponseBody
	public HashMap<String,Object> providerSelectAjax(HttpServletRequest req,
			@RequestParam(value="dbp_keyno")String dbp_keyno
			) throws Exception {
		 
		
		HashMap<String,Object> map = Component.getData("bills.billsSelect_one",dbp_keyno);
		
		return map;
	}
	
	
	
	@RequestMapping("/dyAdmin/bills/billsActionAjax.do")
	@ResponseBody
	public String billsActionAjax(HttpServletRequest req,billDTO bill, @RequestParam(value="buttionType", defaultValue="insert")String type) throws Exception {
		 
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
	
	@RequestMapping("/dyAdmin/bills/providerSelectAjax2.do")
	@ResponseBody
	public HashMap<String,Object> providerSelectAjax2(HttpServletRequest req,
			@RequestParam(value="dbs_keyno")String dbs_keyno
			) throws Exception {
		 
		HashMap<String,Object> map = Component.getData("bills.SuppliedSelect_one",dbs_keyno);
		
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
	
	@RequestMapping("/dyAdmin/bills/sendNtsAjax.do")
	@ResponseBody
	public billDTO sendNTS(HttpServletRequest req, billDTO bill)
			throws Exception {
		 
		 billDTO msg = bill;
		 
		 
		
		 return msg;
	}
	
}
