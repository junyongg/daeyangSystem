package com.tx.dyAdmin.program.application.service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface ApplicationService {

	/**
	 * 결제만료로 업데이트
	 * @param req 
	 * */
	public void checkExpiredDate(String type, HttpServletRequest req) throws Exception;	
	
	/**
	 * 관람완료로 업데이트
	 * @param req 
	 * */
	public void ViewExpiredDate(String type, HttpServletRequest req) throws Exception;	
	
	/**
	 * 버튼 텍스트 넣기(리스트)
	 * @param req 
	 * */
	public List<HashMap<String, Object>> getButtonText(List<HashMap<String, Object>> resultList) throws ParseException;	
	
	/**
	 * 버튼 텍스트 넣기(맵)
	 * @param req 
	 * */
	public HashMap<String, Object> getButtonText(HashMap<String, Object> resultMap) throws ParseException;	
}
