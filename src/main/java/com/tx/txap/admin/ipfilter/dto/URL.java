package com.tx.txap.admin.ipfilter.dto;

import com.tx.txap.admin.ipfilter.service.IpTree;

import lombok.Data;

@Data
public class URL {
	private String  keyno
				    , url[]
		    		, type;
	private IpTree ipTree;

}
