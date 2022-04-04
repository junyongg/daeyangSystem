package com.tx.test.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tx.common.service.component.ComponentService;
import com.tx.test.dto.billDTO;

@Controller
public class RestApiTest {

	@Autowired ComponentService Component;
	
	@RequestMapping("/dyAdmin/bills/billsproducer.do")
	public ModelAndView billsproducer(HttpServletRequest req) throws Exception {
	ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_producer_insertView.adm");
	
		mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
	
	
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
	
}
