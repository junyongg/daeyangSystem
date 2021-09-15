package com.tx.common.service.excel.impl;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.common.service.excel.ExcelService;
import com.tx.dyAdmin.homepage.organization.dto.OrganDTO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ExcelService")
public class ExcelServiceImpl extends EgovAbstractServiceImpl implements ExcelService {
	
	@Autowired
	ComponentService Component;
	@Autowired
	CommonService CommonService;
	
	
	public void createExcelWorkBook(HttpServletResponse response) throws Exception{
		
		String[] sheetName = {"조직도","조직원"};
		List<String> headerList = null; 
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		
		// 테이블 헤더용 스타일
		XSSFCellStyle headStyle = workbook.createCellStyle();
		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);
		// 데이터는 가운데 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);
		headStyle.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 255,(byte) 217,(byte) 31}, null));
		headStyle.setFillPattern(FillPatternType.FINE_DOTS);

		// 데이터용 경계 스타일 테두리만 지정
		XSSFCellStyle bodyStyle = workbook.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);
		
		for (int i = 0; i < sheetName.length; i++) {
			
			// 시트 생성
			XSSFSheet sheet = workbook.createSheet(sheetName[i]);
			// 헤더 행 생
			Row headerRow = sheet.createRow(0);
			Cell headerCell;
			
			headerList = new ArrayList<>();
			if(i == 0){
				headerList.add("키");
				headerList.add("메인키");
				headerList.add("순서");
				headerList.add("부서명");
				headerList.add("임시부서 여부");
			}else{
				headerList.add("성명");
				headerList.add("부서명");
				headerList.add("직위");
				headerList.add("담당업무");
				headerList.add("연락처");
			}
			
			for(int j=0; j<headerList.size(); j++) {
				headerCell = headerRow.createCell(j); 
				headerCell.setCellValue(headerList.get(j));
				headerCell.setCellStyle(headStyle);
			}
			
			if(i==1){
				Row bodyRow = sheet.createRow(1);
				Cell bodyCell = bodyRow.createCell(0);
				bodyCell.setCellValue("소계");
				bodyCell.setCellStyle(bodyStyle);
			}
		}
        
        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=organ_sample.xlsx");

        // 엑셀 출력
        workbook.write(response.getOutputStream());

        workbook.close();
	}
	
	
	public void ExcelInsert(MultipartFile file, String organHomeKey) throws Exception {
		
		List<HashMap<String,Object>> organList = new ArrayList<HashMap<String,Object>>();
		List<String> keyMapList = new ArrayList<String>();;
		List<HashMap<String,Object>> userList = new ArrayList<HashMap<String,Object>>();
		
		String[] organArr = {"key","mainKey","lev","organNM","tempYN"};
		String[] userArr = {"name","organNM","spot","task","tel"};
		
		//엑셀파일
		File convfile = new File(file.getOriginalFilename());
		file.transferTo(convfile);
		
		
		//엑셀 파일 오픈
		XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(convfile));
		
		setOrganMapList(wb,0,organList,organArr,"organ",keyMapList);
		setOrganMapList(wb,1,userList,userArr,"user",null);
		
		wb.close();
		convfile.delete();
		
		for (HashMap<String,Object> organ : organList) {
			OrganDTO organDTO = new OrganDTO();
			String key = keyMapList.get(Integer.parseInt((String)organ.get(organArr[0]))-1).toString();
			String dnName = (String)organ.get(organArr[3]);
			String mainKey = "";
			
			if(StringUtils.isNotBlank((String)organ.get(organArr[1]))){
				mainKey = keyMapList.get(Integer.parseInt((String)organ.get(organArr[1]))-1).toString();
			}
			
			organDTO.setDN_KEYNO(key);
			organDTO.setDN_MAINKEY(mainKey);
			organDTO.setDN_LEV(Integer.parseInt((String)organ.get(organArr[2])));
			organDTO.setDN_NAME(dnName);
			organDTO.setDN_TEMP((String)organ.get(organArr[4]));
			organDTO.setDN_HOMEDIV_C(organHomeKey);
			Component.createData("Organization.DN_excelInsert", organDTO);
			
			for (HashMap<String,Object> user : userList) {
				String dudnNM = (String)user.get(userArr[1]);
				
				if(dnName.equals(dudnNM)){
					OrganDTO organDTO2 = new OrganDTO();
					organDTO2.setDU_KEYNO(CommonService.getTableKey("DU"));
					organDTO2.setDU_DN_KEYNO(key);
					organDTO2.setDU_NAME((String)user.get(userArr[0]));
					organDTO2.setDU_ROLE((String)user.get(userArr[2]));
					organDTO2.setDU_CONTENTS((String)user.get(userArr[3]));
					organDTO2.setDU_TEL((String)user.get(userArr[4]));
					organDTO2.setDU_LEV((Integer) user.get("lev"));
					Component.createData("Organization.DU_excelInsert", organDTO2);
				}
			}
		}
		
	}
	
	private void setOrganMapList(XSSFWorkbook wb, int sheetNum, List<HashMap<String, Object>> valMapList
			, String[] trArr, String type, List<String> keyMapList) {
		// TODO Auto-generated method stub
		
		Integer duMaxLev = 0;
		Integer startLev = 1;
		
		XSSFSheet sheet=wb.getSheetAt(sheetNum);
		int rows = sheet.getPhysicalNumberOfRows();
		for (int i = 1; i < rows; i++) {
			//행을읽는다
		    XSSFRow row=sheet.getRow(i);
		    
		    if(row != null){
		    	//셀이 비어있으면 다음데이터로 넘어감 
		    	if (row.getCell(0) == null) {
		    		continue;
		    	}
		    	
		    	if("소계".equals(row.getCell(0).toString())){
	    			XSSFCell cell = row.getCell(1);
					duMaxLev = Integer.parseInt(getCellValue(cell,wb));
					continue;
				}else{
					//셀의 수
					int cells=row.getPhysicalNumberOfCells();
					HashMap<String, Object> valMap = new HashMap<String, Object>();
					for (int j = 0; j <= cells; j++) {
						XSSFCell cell = row.getCell(j);
						String value="";
						//셀이 빈값일경우를 위한 널체크
						if(cell==null){
							continue;
						}else{
							//타입별로 내용 읽기
							value = getCellValue(cell,wb);
						}
						valMap.put(trArr[j], value);
						
						if("organ".equals(type) && "key".equals(trArr[j]) && StringUtils.isNotEmpty(value)){
							keyMapList.add(CommonService.getTableKey("DN"));
						}
						
					}
					if("user".equals(type)) valMap.put("lev",startLev++);
					valMapList.add(valMap);
				}
		    	if("user".equals(type)) if(startLev >= duMaxLev) startLev = 1;
		    }
		}
	}

	@SuppressWarnings("incomplete-switch")
	private String getCellValue(XSSFCell cell, XSSFWorkbook wb) {
		String value = "";
		switch (cell.getCellType()){
		case FORMULA:
			FormulaEvaluator formulaEval = wb.getCreationHelper().createFormulaEvaluator();
			if( cell != null ) {
				CellValue evaluate = formulaEval.evaluate(cell);
				if( evaluate != null ) value = evaluate.formatAsString();
			}
			value = String.valueOf(Math.round(Double.parseDouble(value)));
			break;
		case NUMERIC:
			value = String.valueOf(Math.round(cell.getNumericCellValue()));
			break;
		case STRING:
			value=(String)cell.getStringCellValue();
			break;
		case BLANK:
			value="";
			break;
		case ERROR:
			value=cell.getErrorCellValue()+"";
			break;
		}
		
		return value;
	}
	
	
}
