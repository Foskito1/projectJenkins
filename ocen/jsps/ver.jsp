<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManWebQueryOfferSend, isf.util.log.Log, java.util.List, java.util.Iterator, com.soluzionasf.ocen.man.web.domain.CenManWebContractOffer"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<%
	// Limpia la cache
	response.setHeader("expires", "0");
	String strCodOffer	= request.getParameter("codOffer");
	String strExpedient	= request.getParameter("expedient");
	String strNumVersion	= request.getParameter("numVersion");
	String strCreationDate	= request.getParameter("creationDate");

	String strRequest = "codOffer="+strCodOffer+"&expedient="+strExpedient+"&numVersion="+strNumVersion+"&creationDate="+strCreationDate;
%>
<html>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
<frameset rows="81,*" frameborder="NO" border="0" framespacing="0">
  <frame name="topframe" scrolling="NO" noresize src="superior.htm">
  <frameset cols="150,*" frameborder="NO" border="0" framespacing="0">
     <frame name="navegacion" scrolling="auto" noresize src="lateral4.htm">
     <frame name="central" scrolling="auto" noresize src="entrada1.jsp?<%=strRequest%>">
  </frameset>
</frameset>
<noframes>
</noframes>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>