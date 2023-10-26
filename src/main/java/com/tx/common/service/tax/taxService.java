package com.tx.common.service.tax;

import java.util.List;

import com.tx.test.dto.billDTO;

public interface taxService {
		
	public void registIssue(billDTO bill, String tocken) throws Exception;
	
	public String result(String HomeId, String CopNum) throws Exception;
	
}
