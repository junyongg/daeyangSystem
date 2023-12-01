<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>

<div class="flex justify-between">
 <div class="flex">
    <input type="text" class="search-control" name="field_search" data-searchindex="all" placeholder="모든필드 검색"
      style="background-color:#f0f2f5;border:none;border-radius:4px;margin-right:10px;font-size:12px;padding-top:4px;padding-bottom:4px">
    <button type="button"  onclick="pf_LinkPage()"
      class="text-xs inline-flex items-center px-3 py-1 md:px-3 md:py-1 lg:px-5 lg:py-2 border border-transparent rounded-lg text-white bg-black">검색</button>
  </div>
  <div class="flex">
    <select name="pageUnit" id="pageUnit" onchange="pf_LinkPage();" class="default_input_style input_margin_x_10px input_padding_y_4px">
      	<option value="10" ${10 eq search.pageUnit ? 'selected' : '' }>10</option>
      	<option value="25" ${25 eq search.pageUnit ? 'selected' : '' }>25</option>
    	<option value="50" ${50 eq search.pageUnit ? 'selected' : '' }>50</option>
    	<option value="100" ${100 eq search.pageUnit ? 'selected' : '' }>100</option>
    	<option value="200" ${200 eq search.pageUnit ? 'selected' : '' }>200</option>
    	<option value="300" ${300 eq search.pageUnit ? 'selected' : '' }>300</option>
    </select>
  </div>
</div>

<div class="w-full border my-3 md:my-3 lg:my-5"></div>

<div class="w-full overflow-hidden rounded-lg ring-1 ring-black ring-opacity-5">
  <div class="w-full overflow-x-auto">
    <form action="" class="form-max-width">
      <table class="pagingTable w-full whitespace-nowrap">
        <thead class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b bg-gray-50">
          <tr class="font-bold text-black">
            <td class="px-4 py-3 text-center text-xs">
              <div class="text-center mt-2">
                <a>
                 	 발전소명
                </a>
              </div>
            </td>
            <td class="px-4 py-3 text-center text-xs">
              <div class="text-center mt-2">
                <a class="arrow" data-index="2" style="cursor: pointer;">
                  	점검 횟수
                  <svg stroke="currentColor" fill="currentColor" stroke-width="0"
                    viewBox="0 0 320 512" class="inline-flex" height="1em" width="1em"
                    xmlns="http://www.w3.org/2000/svg">
<!--                     <path -->
<!--                       d="M41 288h238c21.4 0 32.1 25.9 17 41L177 448c-9.4 9.4-24.6 9.4-33.9 0L24 329c-15.1-15.1-4.4-41 17-41zm255-105L177 64c-9.4-9.4-24.6-9.4-33.9 0L24 183c-15.1 15.1-4.4 41 17 41h238c21.4 0 32.1-25.9 17-41z"> -->
<!--                     </path> -->
                  </svg>
                </a>
              </div>
            </td>
            <td class="px-4 py-3 text-center text-xs">
              <div class="text-center mt-2">
                <a>
                 	 주소
                </a>
              </div>
            </td>
            <td class="px-4 py-3"></td>
          </tr>

        </thead>
        <tbody class="bg-white divide-y text-gray-700">
        	<c:if test="${empty resultList4 }">
	        	<tr>
					<td class="px-4 py-3 text-center" colspan="100%">검색된 데이터가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${resultList4 }" var="b">
	          <tr class="">
	            <td class="py-3 text-center" style="white-space: nowrap;">
	             	<a class="text-sm" href="/sfa/safe/safeAdmin.do?SU_KEYNO=${b.SU_KEYNO}">${b.SU_SA_SULBI}</a>
	            </td>
	            <c:if test="${b.checkminus eq 0}">
		            <td class="py-3 text-center" style="white-space: nowrap;">
		              <span class="inline-flex px-2 text-xs font-medium leading-5 rounded-full text-green-700 bg-green-100">${b.combined_column }</span>
		            </td>
	            </c:if>
	            <c:if test="${b.checkminus ne 0}">
		            <td class="py-3 text-center" style="white-space: nowrap;">
		              <span class="inline-flex px-2 text-xs font-medium leading-5 rounded-full text-red-700 bg-red-100">${b.combined_column }</span>
		            </td>
	            </c:if>
	            <td class="py-3 text-center" style="white-space: nowrap;">
	             	<span class="text-sm">${b.SU_SA_AD}</span>
	            </td>
	          </tr>
	         </c:forEach>
        </tbody>
      </table>
    </form>
  </div>
  <c:if test="${not empty resultList4 }">
      <span class="pagetext flex items-center font-semibold tracking-wide uppercase">총 ${paginationInfo.totalRecordCount }건  / 총 ${paginationInfo.totalPageCount} 페이지 중 ${paginationInfo.currentPageNo} 페이지</span>
      <div class="flex mt-2 sm:mt-auto sm:justify-end">
        <nav aria-label="페이지">
          <ul class="pageNumberUl inline-flex items-center">
                <ui:pagination paginationInfo="${paginationInfo }" type="Manager" jsFunction="pf_LinkPage"/>
          </ul>
        </nav>
      </div>
    </c:if>
</div>
<input type="hidden" id="UIKEYNO" name="UIKEYNO" value="${SU_UI_KEYNO}">
<input type="hidden" name ="areaSelect" id="hidden_Area" value="${areaSelect}">
<script type="text/javascript">

$(function(){

	pf_defaultPagingSetting('${search.orderBy}','${search.sortDirect}');

})

</script>
