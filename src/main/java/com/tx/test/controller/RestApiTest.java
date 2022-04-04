package com.tx.test.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RestApiTest {

	
	
	 @RequestMapping("/dyAdmin/bills/billsproducer.do")
	   public ModelAndView billsproducer(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_producer_insertView.adm");
		
	      return mv;
	  }
	 
	 
	 
	
}
