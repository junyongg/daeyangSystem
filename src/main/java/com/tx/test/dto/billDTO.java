package com.tx.test.dto;

import lombok.Data;

@Data
public class billDTO {
	
	String 	hometaxbill_id,
	spass,
	apikey,
	homemunseo_id,
	signature,
	
	issueid,
	typecode1,
	typecode2,
	description,
	issuedate,
	
	modifytype,
	purposetype,
	originalissueid,
	si_id,
	si_hcnt
	
	,si_startdt
	,si_enddt
	,ir_companynumber
	,ir_biztype
	,ir_companyname
	
	,ir_bizclassification
	,ir_ceoname
	,ir_busename
	,ir_name
	,ir_cell
	
	,ir_email
	,ir_companyaddress
	,ie_companynumber
	,ie_biztype
	,ie_companyname
	
	,ie_bizclassification
	,ie_taxnumber
	,partytypecode
	,ie_ceoname
	,ie_busename1
	
	,ie_name1
	,ie_cell1
	,ie_email1
	,ie_busename2
	,ie_name2
	
	,ie_cell2
	,ie_email2
	,ie_companyaddress
	,su_companynumber
	,su_biztype
	
	,su_companyname
	,su_bizclassification
	,su_taxnumber
	,su_ceoname
	,su_busename
	
	,su_name
	,su_cell
	,su_email
	,su_companyaddress
	
	,cash
	,scheck
	,draft
	,uncollected
	,chargetotal
	,taxtotal
	,grandtotal = "";
	
	

}
