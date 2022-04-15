package com.tx.test.controller;


import java.awt.Component;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
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
import org.json.simple.parser.JSONParser;
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
		   mv.addObject("loglist",Component.getListNoParam("bills.billslogselect"));
		   
		   String now = new SimpleDateFormat("yyyy-MM-dd ").format(Calendar.getInstance().getTime());
		   String nowdate = now.replace("-", "");
		   String nowdate2 = nowdate.trim();
		   String month = new SimpleDateFormat("MM").format(Calendar.getInstance().getTime());
		   String year = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
		   
		   
		   mv.addObject("nowDate",nowdate2);
		   mv.addObject("itemName",year+"년 "+month+"월 발전대금");
		
	      return mv;
	  }
	 
	 
	 @RequestMapping("/dyAdmin/bills/client.do")
	   public ModelAndView billsclient(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_client.adm");
		   
		   mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		   mv.addObject("SuppliedList",Component.getListNoParam("bills.SuppliedSelect"));
		   mv.addObject("loglist",Component.getListNoParam("bills.billslogselect"));
		   
		   String now = new SimpleDateFormat("yyyy-MM-dd ").format(Calendar.getInstance().getTime());
		   String nowdate = now.replace("-", "");
		   String nowdate2 = nowdate.trim();
		   String month = new SimpleDateFormat("MM").format(Calendar.getInstance().getTime());
		   String year = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
		   
		   
		   mv.addObject("nowDate",nowdate2);
		   mv.addObject("itemName",year+"년 "+month+"월 발전대금");
		   
	      return mv;
	  }
	 
	 
	 @RequestMapping("/dyAdmin/bills/admin.do")
	   public ModelAndView billsadmin(HttpServletRequest req) throws Exception {
		   ModelAndView mv = new ModelAndView("/dyAdmin/bill/pra_bills_admin.adm");
		   
		   mv.addObject("billList",Component.getListNoParam("bills.billsSelect"));
		   mv.addObject("SuppliedList",Component.getListNoParam("bills.SuppliedSelect"));
		   mv.addObject("loglist",Component.getListNoParam("bills.billslogselect"));
		   
		   String now = new SimpleDateFormat("yyyy-MM-dd ").format(Calendar.getInstance().getTime());
		   String nowdate = now.replace("-", "");
		   String nowdate2 = nowdate.trim();
		   String month = new SimpleDateFormat("MM").format(Calendar.getInstance().getTime());
		   String year = new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime());
		   
		   
		   mv.addObject("nowDate",nowdate2);
		   mv.addObject("itemName",year+"년 "+month+"월 발전대금");
		
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
			String codenum = code.substring(3,code.length());
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
		
		HashMap<String,Object> map = Component.getData("bills.SuppliedSelect_one",dbs_keyno);
		
		
		return map;
	}
	
	
	
	@RequestMapping("/dyAdmin/bills/billsActionAjax2.do")
	@ResponseBody
	public String billsActionAjax2(HttpServletRequest req,billDTO bill,
			@RequestParam(value="buttionType2", defaultValue="insert")String type) throws Exception {
		 
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
	
	
	public static String Api(String strUrl, String jsonMessage) { // strUrl = 전송할 restapi 서버 url , jsonMessage = 전송할 데이터
		// json형식을 String으로 형변환
		try {
			URL url = new URL(strUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setConnectTimeout(10000); // 서버에 연결되는 Timeout 시간 설정
			con.setReadTimeout(10000); // InputStream 읽어 오는 Timeout 시간 설정

			con.setRequestProperty("Connection", "keep-alive");

			con.setRequestMethod("POST");

			// json으로 message를 전달하고자 할 때
			con.setRequestProperty("Content-Type", "application/json");
			con.setDoInput(true);
			con.setDoOutput(true); // POST 데이터를 OutputStream으로 넘겨 주겠다는 설정
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);

			OutputStreamWriter wr = new OutputStreamWriter(con.getOutputStream(), "utf-8"); // 전송할때 한글깨짐현상으로 인한 utf-8
			// 인코딩
			wr.write(jsonMessage); // json 형식의 message 전달
			wr.flush();
			// -----------전송 끝

			// 리턴받는 부분 시작
			StringBuilder sb = new StringBuilder();

			if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				// Stream을 처리해줘야 하는 귀찮음이 있음.
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8")); // 리턴받을때
				// 한글깨짐현상으로인한 utf-8 인코딩
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line).append("\n");
				}
				br.close();
				// System.out.println(sb);
				return sb.toString();
			} else {
				System.out.println(con.getResponseMessage());
				return "fail";
			}
		} catch (Exception e) {
			System.err.println(e.toString());
			return "fail";
		}
	}
	

	@SuppressWarnings("unchecked")
	public String sendApi( billDTO bill)
			throws Exception {

			// JSONObject객체 생성
			JSONObject data = new JSONObject();

			// JSONObject객체에 세금계산서 정보를 추가
			data.put("hometaxbill_id", bill.getDbp_id());				// 회사코드 (아이디) (사용자코드 1001 *
			data.put("spass", bill.getDbp_pass());									// 패스워드 *
			data.put("apikey", bill.getDbp_apikey() );								// 인증키*
			data.put("homemunseo_id",bill.getDbp_homemunseo_id() );					// 고유번호*
			data.put("signature",bill.getSignature() );							// 전자서명
			
			data.put("issueid",bill.getDbl_issueid() );								// 승인번호(자동생성)
			data.put("typecode1",bill.getDbl_typecode1());							// (세금)계산서 종류1*
			data.put("typecode2",bill.getDbl_typecode2());							// (세금)계산서 종류2*
			data.put("description",bill.getDescription());						// 비고
			data.put("issuedate",bill.getDbl_issuedate());							// 작성일자*
			
			data.put("modifytype",bill.getModifytype() );						// 수정사유-
			data.put("purposetype",bill.getDbl_purposetype());						// 영수/청구 구분*
			data.put("originalissueid",bill.getOriginalissueid());				// 당초전자(세금)계산서 승인번호-
			data.put("si_id",bill.getSi_id() );									// 수입신고번호-
			data.put("si_hcnt",bill.getSi_hcnt() );								// 수입총건 *
			
			data.put("si_startdt",bill.getSi_startdt() );						// 일괄발급시작일-
			data.put("si_enddt",bill.getSi_enddt() );							// 일괄발급종료일-
			data.put("ir_companynumber",bill.getDbp_co_num() );					// 공급자 사업자등록번호*
			data.put("ir_biztype",bill.getDbp_biztype());						// 공급자 업태*
			data.put("ir_companyname",bill.getDbp_name());						// 공급자 상호*
			
			data.put("ir_bizclassification",bill.getDbp_bizclassification() );	// 공급자 업종*
			data.put("ir_ceoname",bill.getDbp_ceoname());						// 공급자 대표자성명*
			data.put("ir_busename",bill.getDbp_busename());						// 공급자 담당부서명
			data.put("ir_name", bill.getDbp_ir_name());								// 공급자 담당자명*
			data.put("ir_cell", bill.getDbp_ir_cell());								// 공급자 담당자전화번호*
			
			data.put("ir_email",bill.getDbp_email());							// 공급자 담당자이메일*
			data.put("ir_companyaddress",bill.getDbp_address() );			// 공급자 주소*
			data.put("ie_companynumber", bill.getDbs_co_num());				// 공급받는자 사업자등록번호*
			data.put("ie_biztype",bill.getDbs_biztype());					// 공급받는자 업태*
			data.put("ie_companyname",bill.getDbs_name() );				// 공급받는자 사업체명*
				
			data.put("ie_bizclassification",bill.getDbs_bizclassification() );	// 공급받는자 업종*
			data.put("ie_taxnumber",bill.getDbs_taxnum() );					// 공급받는자 종사업장번호
			data.put("partytypecode",bill.getDbl_partytypecode() );					// 공급받는자 구분 01=사업자등록번호 02=주민등록번호 03=외국인*
			data.put("ie_ceoname",bill.getDbs_ceoname() );						// 공급받는자 대표자명*
			data.put("ie_busename1",bill.getDbs_busename1() );					// 공급받는자 담당부서1
			
			data.put("ie_name1",bill.getDbs_name1() );							// 공급받는자 담당자명1*
			data.put("ie_cell1",bill.getDbs_cell1() );							// 공급받는자 담당자연락처1*
			data.put("ie_email1",bill.getDbs_email1() );							// 공급받는자 담당자이메일1*
			data.put("ie_busename2",bill.getDbs_name2() );					// 공급받는자 담당부서2
			data.put("ie_name2",bill.getDbs_name2() );							// 공급받는자 담당자명2
			
			data.put("ie_cell2",bill.getDbs_cell2());							// 공급받는자 담당자연락처2
			data.put("ie_email2",bill.getDbs_email2() );							// 공급받는자 담당자이메일2
			data.put("ie_companyaddress",bill.getDbs_address() );			// 공급받는자 회사주소*
			data.put("su_companynumber",bill.getSu_companynumber() );			// 수탁사업자 사업자등록번호-
			data.put("su_biztype",bill.getSu_biztype() );						// 수탁사업자 업태-
			
			data.put("su_companyname",bill.getSu_companyname() );				// 수탁사업자 상호명-
			data.put("su_bizclassification",bill.getSu_bizclassification() );	// 수탁사업자 업종-
			data.put("su_taxnumber",bill.getSu_taxnumber() );					// 수탁사업자 종사업장번호-
			data.put("su_ceoname",bill.getSu_ceoname() );						// 수탁사업자 대표자명-
			data.put("su_busename",bill.getSu_busename() );						// 수탁사업자 담당부서명-
			
			data.put("su_name",bill.getSu_name() );								// 수탁사업자 담당자명-
			data.put("su_cell",bill.getSu_cell() );								// 수탁사업자 담당자전화번호-
			data.put("su_email",bill.getSu_email() );							// 수탁사업자 담당자이메일-
			data.put("su_companyaddress",bill.getSu_companyaddress() );			// 수탁사업자 회사주소-
			
			data.put("cash",bill.getDbl_cash().replace(",", ""));									// 현금*
			data.put("scheck",bill.getDbl_scheck().replace(",", ""));								// 수표*
			data.put("draft",bill.getDbl_draft().replace(",", ""));									// 어음*
			data.put("uncollected",bill.getDbl_uncollected().replace(",", ""));						// 외상 미수금*
			data.put("chargetotal",bill.getDbl_chargetotal().replace(",","")) ;						// 총 공급가액*
			data.put("taxtotal",bill.getDbl_taxtotal().replace(",", ""));							// 총 세액 *
			data.put("grandtotal",bill.getDbl_grandtotal().replace(",", ""));						// 총 금액*
			
			JSONArray jArray = new JSONArray();
			
				
			JSONObject sObject = new JSONObject();
			sObject.put("sub_description", bill.getDescription() );							// 품목별 비고입력
			sObject.put("supplyprice",bill.getDbl_supplyprice().replace(",", ""));				// 품목별 공급가액
			sObject.put("quantity",bill.getDbl_quantity() );									// 품목수량
			sObject.put("unit",bill.getDbl_unit() );											// 품목규격
			sObject.put("subject",bill.getDbl_subject() );										// 품목명
			sObject.put("sub_issuedate",bill.getDbl_sub_issuedate() );											// 공급연원일
			sObject.put("tax",bill.getDbl_tax().replace(",", ""));								// 세액
			sObject.put("unitprice",bill.getDbl_unitprice().replace(",", ""));					// 단가
			jArray.put(sObject);

			// 세금계산서 detail정보를 JSONObject객체에 추가
			data.put("taxdetailList", jArray);// 배열을 넣음

			System.out.println(data);
			return null;
//			// 전자세금계산서 발행 후 리턴
//			String restapi = Api("http://115.68.1.5:8084/homtax/post", data.toString());
//			
//			if(restapi.equals("fail")) {
//				System.out.println("http://115.68.1.5:8084/homtax/post 서버에 문제가 발생했습니다.");
//				return "서버문제장애";
//			}
//			
//			// Api에서 리턴받은 값으로 예외처리 및 출력
//			JSONParser parser = new JSONParser();
//			Object obj = parser.parse(restapi);
//			JSONObject jsonObj = (JSONObject) obj;
//			String msg = "";
//			if (!restapi.equals("fail")) {
//				if (jsonObj.get("code").equals("0")) {
//					System.out.println("code : " + (String) jsonObj.get("code") + "\n" + "msg : "
//							+ (String) jsonObj.get("msg") + "\n" + "jsnumber : " + (String) jsonObj.get("jsnumber") + "\n"
//							+ "hometaxbill_id : " + (String) jsonObj.get("hometaxbill_id") + "\n" + "homemunseo_id : "
//							+ (String) jsonObj.get("homemunseo_id"));
//				} else {
//					System.out.println(
//							"code : " + (String) jsonObj.get("code") + "\n" + "msg : " + (String) jsonObj.get("msg"));
//				}
//			}else {
//				msg = "code : -1" + "\n" + "msg : 서버호출에 실패했습니다.";
//			}
//			return msg;
	}

	@RequestMapping("/dyAdmin/bills/billsInfoInsert.do")
	@ResponseBody
	public String billsInfoIsnsertAjax(HttpServletRequest req,billDTO bill) throws Exception {
		

		Component.updateData("bills.registNumberUpdate", bill);
		Component.createData("bills.billsInfoInsert", bill);
		 String msg = "세금계산서 정보 저장 완료";


		return msg;
	
	}
	
	@RequestMapping("/dyAdmin/bills/billsInfoUpdate.do")
	@ResponseBody
	public String billsInfoUpdateAjax(HttpServletRequest req,billDTO bill) throws Exception {
		
		
		Component.updateData("bills.billsInfoUpdate", bill);
		 String msg = "세금계산서 정보 수정 완료";


		return msg;
	
	}
	
	@RequestMapping("/dyAdmin/bills/selectAllView.do")
	@ResponseBody
	public billDTO selectAllView(HttpServletRequest req,billDTO bill) throws Exception {
		
		
		bill = Component.getData("bills.selectAllView", bill);
		
		
		return bill;
	
	}
	
	@RequestMapping("/dyAdmin/bills/sendNTS.do")
	@ResponseBody
	public billDTO sendNTS(HttpServletRequest req,billDTO bill,
			@RequestParam(value="chkvalue")String dbl_keyno) throws Exception {
		
		String[] list = dbl_keyno.split(",");
		
		for(int i= 0; i<list.length; i++) {
		bill = Component.getData("bills.selectAllView", list[i]);
		sendApi(bill);
		}
		
		return bill;
	}
	
	@RequestMapping("/dyAdmin/bills/deleteInfo.do")
	@ResponseBody
	public String deleteInfo(HttpServletRequest req,
			@RequestParam(value="chkvalue")String dbl_keyno) throws Exception {
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "";
		String [] dblkey = dbl_keyno.split(",");
		
		map.put("dblkey", dblkey);

		Component.deleteData("bills.billsDelete", dblkey);
	
		return msg;
	
	}

}
