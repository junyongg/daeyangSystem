package com.tx.dyAdmin.member.dto;

import com.tx.common.dto.Common;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class LicenseDTO extends Common {
	
	private static final long serialVersionUID = -3793808669767332434L;
	
	private String  
					//main 
					dlm_keyno,
					dlm_street,
					dlm_use,
					dlm_usage,
					dlm_land,
					dlm_address,
					dlm_area,
					dlm_type,
					dlm_dpp_keyno,
					//sub
					dls_keyno,
					dls_dpp_keyno,
					dls_conn,
					dls_name,
					dls_depart,
					dls_phone,
					dls_other,
					dls_name2,
					dls_depart2,
					dls_phone2,
					dls_other2,
					dls_now,
					dls_endDate,
					//other
					savetype
					;
}
