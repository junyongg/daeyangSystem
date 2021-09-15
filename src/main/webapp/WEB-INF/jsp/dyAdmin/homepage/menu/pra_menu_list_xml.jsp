<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*" %>
<%@ page import="org.syaku.util.*" %>
<%@ page import="org.jdom.*" %>
<%@ page import="org.jdom.output.*" %>

<%
HashMap hm = new HashMap();
hm.put("»þÄí","Syaku");
hm.put("Site","syaku.tistory.com");
hm.put("ºí·Î±×","Blog");

Xml xml = new Xml();
Document document = (Document) xml.make(hm);

XMLOutputter outputter = new XMLOutputter();
Format format = Format.getPrettyFormat();
format.setEncoding("EUC-KR");
outputter.setFormat(format);

response.setContentType("application/xml");
outputter.output(document, response.getWriter());
// ½Ã½ºÅÛÃâ·Â
// outputter.output(document, System.out);
%>
