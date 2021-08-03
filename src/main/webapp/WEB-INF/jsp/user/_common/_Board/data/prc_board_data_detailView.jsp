<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<style>
.btnBig_01 {
    padding: 10px 40px;
    font-size: 18px;
    color: #fff;
    background-color: #58595b;
    min-width: 150px;
}
.bgColorR {
    background-color: #e02b31 !important;
    color: #fff !important;
}
.detailViewBtnBox .rightBtnBox {
    position: absolute;
    right: 10px;
    top: 30px;
}
.btn {
    /* -webkit-transition: all 0.1s ease-in-out; */
    -moz-transition: all 0.1s ease-in-out;
    -o-transition: all 0.1s ease-in-out;
    /* transition: all 0.1s ease-in-out; */
    padding: 5px 10px; 
    cursor: pointer;
    display: inline-block;
}
.preview { display: block; }

@media all and (max-width:1100px){
 .preview {display: none;}
}
</style>
<!-- 카카오톡 -->
<script src="/resources/common/js/sns/kakao.min.js"></script>
<!-- 구글플러스 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>

<jsp:useBean id="toDay" class="java.util.Date" scope="page"/>
<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" var="nowDate" />

<%@ include file="/WEB-INF/jsp/user/_common/_Script/board/script_detailView.jsp"%>
<%@ include file="/WEB-INF/jsp/user/_common/_Script/board/script_detailView_editor.jsp"%>

<article id="container" class="container_sub clearfix">
	<div class="inner">
		<div class="conSub01_bottomBox">
			<div class="innerContainer clearfix">
				<form:form id="Form" name="Form" method="post">
					<input type="hidden" name="BN_KEYNO" id="BN_KEYNO" value="${BoardNotice.BN_KEYNO }">
					<input type="hidden" name="MN_KEYNO" id="MN_KEYNO" value="${BoardNotice.BN_MN_KEYNO }">
					<input type="hidden" name="BN_FM_KEYNO" id="BN_FM_KEYNO" value="${BoardNotice.BN_FM_KEYNO }">
					<input type="hidden" name="BN_MN_KEYNO" id="BN_MN_KEYNO" value="${BoardNotice.BN_MN_KEYNO }">
					<input type="hidden" name="BN_THUMBNAIL" id="BN_THUMBNAIL" value="${BoardNotice.BN_THUMBNAIL }">
					<input type="hidden" name="category" id="category" value="${category}">
					<input type="hidden" name="BC_REGNM" id="BC_REGNM" value="${userInfo.UI_ID}">
					<input type="hidden" name="BT_KEYNO" id="BT_KEYNO" value="${BoardType.BT_KEYNO }">
					<input type="hidden" name="BN_TITLE" id="BN_TITLE" value="${BoardNotices.BN_TITLE }">
					<input type="hidden" name="actionView" id="actionView" value="updateView">
					<input type="hidden" id="snsdesc" value="<c:out value="${SNSInfo.DESC}" escapeXml="true" />" />
				</form:form>
				
				<div class="boardDetailViewBox">

					<c:import url="/common/board/UserViewAjax.do?type=detail&key=${BoardType.BT_DETAIL_KEYNO }"/>
					
					<%@ include file="/WEB-INF/jsp/user/_common/_Board/data/detailView/prc_board_data_detailView_preview.jsp"%>
					
					<c:if test="${currentMenu.MN_GONGNULI_YN eq 'Y'}">
			            <div style="margin: 50px 0;">
							<%@ include file="/WEB-INF/jsp/user/_common/prc_gong_nuli.jsp" %>                            
			            </div>
		            </c:if>
		            
		            
		            
				    <div class="detailViewNextBox">
				    	<ul class="detailViewNext">
				    		<c:if test="${not empty nextBoardNotice }">
				    		<li><span>다음글</span> <a href="${tilesUrl}/Board/${nextBoardNotice.BN_KEYNO }/detailView.do"><c:out value="${nextBoardNotice.BN_TITLE }" escapeXml="true" ></c:out></a></li>
				            </c:if>
				            <c:if test="${not empty prevBoardNotice }">
				            <li><span>이전글</span> <a href="${tilesUrl}/Board/${prevBoardNotice.BN_KEYNO }/detailView.do"><c:out value="${prevBoardNotice.BN_TITLE }" escapeXml="true" ></c:out></a></li>
				            </c:if>
				        </ul>
				    </div>
				    <div class="detailViewBtnBox">
				    	<div class="rightBtnBox">
							<c:if test="${userInfo.isAdmin eq 'Y'}">
								<button class="btn btnSmall_02 bgColorR btn-default" type="button" onclick="pf_moveBoardData('${BoardNotice.BN_KEYNO}')">
									이동
								</button>
							</c:if>
							<c:if test="${BoardNotice.BN_USE_YN eq 'Y' && ( not empty BoardNotice.BN_PWD || BoardNotice.BN_REGNM == userInfo.UI_KEYNO || userInfo.isAdmin eq 'Y') }">
								<button class="btn btnSmall_02 bgColorR btn-default" type="button" onclick="pf_UpdateView('${BoardNotice.BN_KEYNO}')">
							 		수정
								</button>
								<button class="btn btnSmall_02 bgColorR btn-default" type="button" onclick="pf_deleteMove('${BoardNotice.BN_KEYNO}')">
									삭제
								</button>
							</c:if>
							<c:if test="${BoardType.BT_REPLY_YN eq 'Y' && BoardNotice.BN_IMPORTANT ne 'Y' }">
							<button class="btn btnSmall_02 bgColorG_999 btn-default" type="button" onclick="pf_replyWrite('${BoardNotice.BN_KEYNO}')">
								답글
							</button>
							</c:if>
				        </div>
				        <button type="button" class="btn btnBig_01 btn-default" onclick="pf_back()">목록</button>
				    </div>
				    <c:if test="${BoardType.BT_COMMENT_YN == 'Y' }">
					<%@ include file="detailView/prc_board_data_detailView_reply.jsp"%>
					</c:if>
				</div>

				<div class="board_layerPop" id="board_pwd_confirm">
					<div class="board_layerPop_inner">
					<form:form id="pwdForm">
						<input type="hidden" name="BN_KEYNO" id="pwdBN_KEYNO">
						<button type="button" class="board_layerPop_close" onclick="pf_closePwd()">X</button>
						<p>비밀번호를 입력하여주세요.</p>
						<input type="password" name="BN_PWD" id="pwdBN_PWD" title="비밀번호 입력" autocomplete="off" onkeyup="if(event.keyCode == 13) {pf_checkPwd();}">
						<button type="button" class="btn" onclick="pf_checkPwd()">확인</button>	
					</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</article>