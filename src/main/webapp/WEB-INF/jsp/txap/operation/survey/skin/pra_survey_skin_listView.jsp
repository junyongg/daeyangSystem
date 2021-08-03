<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<div id="content">
    <form:form id="Form" name="Form" method="post" action="">
        <input type="hidden" name="SS_KEYNO" id="SS_KEYNO" value="" />
        <input type="hidden" name="action" id="action" value="" />
        <section id="widget-grid">
            <div class="row">
                <article class="col-sm-12 col-md-12 col-lg-12">
                    <div class="jarviswidget jarviswidget-color-blueDark" id="BOARD_TYPE_LIST_1" data-widget-editbutton="false">
                        <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i>
                            </span>
                            <h2>설문 스킨 내역</h2>
                        </header>
                        <div class="widget-body ">
                            <div class="widget-body-toolbar bg-color-white">
                                <div class="alert alert-info no-margin fade in">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    설문 스킨 목록입니다. 설문 스킨을 생성, 관리 할 수 있습니다.
                                </div>
                            </div>
                            <div class="widget-body-toolbar bg-color-white">
                                <div class="row">
                                    <div class="col-sm-12 col-md-4 text-align-right" style="float:right;">
                                        <div class="btn-group">
                                            <button class="btn btn-sm btn-primary" type="button" onclick="pf_Distribute('true', '')">
                                                <i class="fa fa-file"></i> 전체 배포
                                            </button>
                                        </div>
                                        <div class="btn-group">
                                            <button class="btn btn-sm btn-primary" type="button" onclick="pf_SkinInsert()">
                                                <i class="fa fa-plus"></i> 설문 스킨 생성
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <jsp:include page="/WEB-INF/jsp/txap/include/search/pra_search_header_paging.jsp" flush="true">
                                    <jsp:param value="/txap/operation/survey/skinPagingAjax.do" name="pagingDataUrl" />
                                </jsp:include>
                                <fieldset id="tableWrap">
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </section>
    </form:form>
</div>

<script type="text/javascript">
    //설문 스킨 수정페이지 이동
    function pf_SkinUpdate(key) {
        $("#SS_KEYNO").val(key);
        $("#Form").attr("action", "/txap/operation/survey/skinUpdate.do");
        $("#Form").submit();
    }

    //설문 스킨 등록페이지 이동 
    function pf_SkinInsert() {
        $("#Form").attr("action", "/txap/operation/survey/skinUpdate.do");
        $("#Form").submit();
    }

    function pf_Distribute(allck, key) {
        var msg = "";

        if (allck == "false") {
            msg = "파일을 배포 하시겠습니까?";
        } else if (allck == "true") {
            msg = "전체 배포 하시겠습니까?";
            key = "";
        }

        if (confirm(msg)) {
            cf_loading();

            $.ajax({
                type: "post",
                url: "/txap/operation/survey/distributeAjax.do",
                data: {
                    "allck": allck,
                    "SS_KEYNO": key
                },
                async: false,
                success: function(data) {
                    if (data) {
                        cf_smallBox('ajax', "파일을 배포하였습니다.", 3000);
                    } else {
                        cf_smallBox('error', "파일 배포 실패", 3000, '#d24158');
                    }
                },
                error: function(jqXHR, textStatus, exception) {
                    cf_smallBox('error', "알수없는 에러, 관리자에게 문의하세요.", 3000, '#d24158');
                }
            }).done(function() {
                cf_loading_out();
            })
        }
    }
</script>