package com.tx.common.service.excel;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface ExcelService {
	
	public void createExcelWorkBook(HttpServletResponse response) throws Exception;
	
	public void ExcelInsert(MultipartFile file, String organHomeKey)throws Exception;
}
