package com.tx.user.service.impl;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tx.common.service.component.CommonService;
import com.tx.common.service.component.ComponentService;
import com.tx.txap.program.application.dto.ApplicationDTO;
import com.tx.txap.program.application.service.ApplicationService;
import com.tx.user.service.ClientProgramService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ClientProgramService")
public class ClientProgramimpl extends EgovAbstractServiceImpl implements ClientProgramService {
	/** 공통 컴포넌트 */
	@Autowired ComponentService Component;
	@Autowired CommonService CommonService;
	@Autowired ApplicationService ApplicationService;
	
	@Override
	public List<HashMap<String, Object>> getPrograms(ApplicationDTO dto) throws ParseException {
		List<HashMap<String, Object>> resultList = Component.getList("Application.AP_getAllList", dto);
		return ApplicationService.getButtonText(resultList);
	}
}
