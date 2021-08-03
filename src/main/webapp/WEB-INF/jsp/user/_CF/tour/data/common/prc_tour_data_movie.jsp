<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/taglib/taglib.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
 <head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8" /> 
  <Script language="JavaScript">
  function auto_fit_size() {
      window.resizeTo(100, 100);
      var thisX = parseInt(document.body.scrollWidth);
      var thisY = parseInt(document.body.scrollHeight);
      var maxThisX = screen.width - 50;
      var maxThisY = screen.height - 50;
      var marginY = 0;
      //alert(thisX + "===" + thisY);
      //alert("임시 브라우저 확인 : " + navigator.userAgent);
      // 브라우저별 높이 조절. (표준 창 하에서 조절해 주십시오.)
      if (navigator.userAgent.indexOf("MSIE 6") > 0) marginY = 35;        // IE 6.x
      else if(navigator.userAgent.indexOf("MSIE 7") > 0) marginY = 80;    // IE 7.x
      else if(navigator.userAgent.indexOf("Firefox") > 0) marginY = 50;   // FF
      else if(navigator.userAgent.indexOf("Opera") > 0) marginY = 30;     // Opera
      else if(navigator.userAgent.indexOf("Netscape") > 0) marginY = -2;  // Netscape
  
      if (thisX > maxThisX) {
          window.document.body.scroll = "yes";
          thisX = maxThisX;
      }
      if (thisY > maxThisY - marginY) {
          window.document.body.scroll = "yes";
          thisX += 19;
          thisY = maxThisY - marginY;
      }
      window.resizeTo(thisX+10, thisY+marginY);
  }
 </Script>
 </head>
<body topmargin="0" leftmargin="0" onLoad="auto_fit_size();">
  <embed src="${moviePath}" width="1200" height="600" border="0" autostart="true"></embed>
</body>
</html>