<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.revisions_stops.servlets.CenManRPWebDataOfferRequestDOMImpl, com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest, com.soluzionasf.ocen.man.web.domain.CenManWebDetailOffer"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="cuadroBean" scope="session" class="java.util.Vector" />
<%
	// Limpia la cache
	response.setHeader("expires", "0");

	CenManWebDetailOffer offerData = new CenManWebDetailOffer();

	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.Elemento elemento = null;

	CenManRPWebDataOfferRequestDOMImpl _result = null;

	_result = (CenManRPWebDataOfferRequestDOMImpl)cuadroBean.elementAt(0);

	cuadroBean.removeElementAt(0);
	
	String strIdOferta = _result.getIdOferta();
	String strIdOferContrat = _result.getIdOferContrat();
	String strOptimistLock = _result.getOptimistLockContrat();

	offerData.callContractSendOffer (strIdOferContrat,
                                     strOptimistLock);
%>
<html>
<head>
  <title></title>
  <link rel=stylesheet href="css/ocen.css" type="text/css">
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<script language="JavaScript">
function mensajeConfirmacion()
{
	alert ("Su oferta ha sido enviada para ser procesada");
	parent.navegacion.document.location.href="./lateral.jsp";
	document.location.href="./cenman_offer_list.jsp";

}
</script>
</head>
<body class="new4" onLoad="mensajeConfirmacion()">
<table>
<tr>
<td>
</td>
</tr>
</table>
</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>