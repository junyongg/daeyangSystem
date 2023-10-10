package com.tx.common.service.tax;

import com.tx.test.dto.billDTO;

public interface taxService {
		
	public void registIssue(billDTO bill) throws Exception;
	
	public void result() throws Exception;
	
}
