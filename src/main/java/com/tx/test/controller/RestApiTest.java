package com.tx.test.controller;

import java.awt.Component;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

@Controller
public class RestApiTest {

	
	
	 @RequestMapping("/dyAdmin/bills/billsproducer.do")
	   public ModelAndView billsproducer(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_producer_insertView.adm");
		
	      return mv;
	  }
	 
	 
	 
	 @RequestMapping("/dyAdmin/bills/hanjeon.do")
	   public ModelAndView billshanjeon(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_hanjeon.adm");
		
	      return mv;
	  }
	 
	 
	 @RequestMapping("/dyAdmin/bills/client.do")
	   public ModelAndView billsclient(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_client.adm");
		
	      return mv;
	  }
	 
	 
	 @RequestMapping("/dyAdmin/bills/admin.do")
	   public ModelAndView billsadmin(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_admin.adm");
		
	      return mv;
	  }
	
}
