package com.tx.txap.admin.board.service;

import com.tx.txap.admin.board.dto.BoardPersonal;

/**
 * 개인정보필터 서비스
 */

public interface PersonalfilterService {
	public BoardPersonal PersonalfilterCheck(String BN_CONTENTS, String BT_PERSONAL);
}
