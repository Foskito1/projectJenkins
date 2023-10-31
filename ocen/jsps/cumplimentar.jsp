<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManWebQueryOfferSend, isf.util.log.Log, com.soluzionasf.ocen.man.web.domain.CenManWebShared, java.util.List, java.util.Iterator, com.soluzionasf.ocen.man.web.domain.CenManWebContractOffer"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<%
	// Limpia la cache
	response.setHeader("expires", "0");
	String strIdOferta	= request.getParameter("idOferta");
	String strCodOffer	= request.getParameter("codOffer");
	String strExpediente	= request.getParameter("expedient");
	String strNumVersion	= request.getParameter("numVersion");
	String strDescripcion	= request.getParameter("descripcion");
	String strFechaLimite = request.getParameter("fechaLimite");
	String strCodEstado 	= request.getParameter("codEstado"); //ICM SCI 054705
	String strDesEstado   = request.getParameter("desEstado");//ICM SCI 054705
	String strFechaEnvio = request.getParameter("fechaEnvio");//ICM SCI 054705

	session = request.getSession (true);
	session.putValue("codOffer", strCodOffer);
	session.putValue("expedient", strExpediente);
	session.putValue("numVersion", strNumVersion);
	session.putValue("descripcion", strDescripcion);
	session.putValue("fechaLimite", strFechaLimite);//ICM SCI 052234
	session.putValue("fechaEnvio", strFechaEnvio);//ICM SCI 054705	
	//ICM INICIO SCI 054705
	session.putValue("codEstado",strCodEstado); 
	boolean boo_isMod = false;
	if (strCodEstado!=null && (strCodEstado.equals(CenManWebShared.getRpSolicitada())|| strCodEstado.equals(CenManWebShared.getRpRecibidaContratista()))) {
		boo_isMod = true;
	}
	session.putValue("boo_isMod",new Boolean(boo_isMod));
	session.putValue("desEstado",strDesEstado); 
	// ICM FIN SCI 054705
%>
<html>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>

<frameset rows="81,*,50" frameborder="NO" border="0" framespacing="0">
  <frame name="topframe" scrolling="NO" noresize src="superior.htm">
  <frameset cols="145,*, 0, 0, 0, 0, 0, 0" frameborder="NO" border="0" framespacing="0">
     <frame name="navegacion" scrolling="auto" noresize src="lateral1.jsp">
     <frame name="central" scrolling="auto" noresize src="trabajo.jsp?idOferta=<%=strIdOferta%>">
     <frame name="exportar" scrolling="auto" noresize src="">
     <frame name="exportarOT" scrolling="auto" noresize src="">
     <frame name="exportarCuadro" scrolling="auto" noresize src="">
     <frame name="exportarUO" scrolling="auto" noresize src="">
     <frame name="estilo" scrolling="auto" noresize src="">
     <frame name="creaExport" scrolling="auto" noresize src="">
  </frameset>
  <frame name="pieframe" scrolling="NO" noresize src="pie.jsp">
</frameset>
<noframes>
</noframes>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>