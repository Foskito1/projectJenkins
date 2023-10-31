<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.revisions_stops.servlets.CenManRPWebDataOfferRequestDOMImpl, com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest, com.soluzionasf.ocen.man.web.domain.CenManWebDetailOffer"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="cuadroBean" scope="session" class="java.util.Vector" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<%
	// Limpia la cache
	response.setHeader("expires", "0");


	CenManWebDetailOffer offerData = new CenManWebDetailOffer();

	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.Elemento elemento = null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.CuadroPrecio cuadroPrecio= null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.PrecioUO precioUO= null;

	CenManRPWebDataOfferRequestDOMImpl _result = null;



	_result = (CenManRPWebDataOfferRequestDOMImpl)cuadroBean.elementAt(0);

	cuadroBean.removeElementAt(0);

	String str_flgSalvarEnviar = request.getParameter("flgSalvarEnviar");

	String str_idOferta = _result.getIdOferta();
	String str_idOferContrat = _result.getIdOferContrat();
	String str_optimistLock = _result.getOptimistLockContrat();

/****************/
	String [] str_idOferUuoo = request.getParameterValues("idOferUuoo");
	String [] str_optimistLockUO = request.getParameterValues("optimistLockUO");
	String [] str_idUuooContr = request.getParameterValues("idUuooContr");
	String [] str_impUnidad = request.getParameterValues("impUnidad");
	String [] str_impUnidadContr = request.getParameterValues("impUnidadContr");

/******************/
	String [] str_idCuadroCont = request.getParameterValues("idCuadroCont");
	String [] str_optimistLockCP = request.getParameterValues("optimistLockCP");
	String [] str_idOferCuadro = request.getParameterValues("idOferCuadro");
	String [] str_impHora = request.getParameterValues("impHora");
	String [] str_impHoraContr = request.getParameterValues("impHoraContr");

/******************/
	String [] str_idOferElemTA = request.getParameterValues("idOferElemTA");
	String [] str_idOferTA = request.getParameterValues("idOferTA");
	String [] str_optimistLockTA = request.getParameterValues("optimistLockTA");
	String [] str_numPersonasTA = request.getParameterValues("numPersonasTA");
	String [] str_numHorasTA = request.getParameterValues("numHorasTA");
	String [] str_unidadesTA = request.getParameterValues("unidadesTA");
	String [] str_manoObraTA = request.getParameterValues("manoObraTA");

/******************/
	String [] str_idOferElemAD = request.getParameterValues("idOferElemAD");
	String [] str_idOferAD = request.getParameterValues("idOferAD");
	String [] str_optimistLockAD = request.getParameterValues ("optimistLockAD");
	String [] str_materialAD = request.getParameterValues ("materialAD");
	String [] str_otrosAD = request.getParameterValues ("otrosAD");

/******************/
	String [] str_idOferElemUO = request.getParameterValues("idOferElemUO");
	String [] str_idOferUO = request.getParameterValues("idOferUO");
	String [] str_optimistLockUUOO = request.getParameterValues("optimistLockUUOO");
	String [] str_numPersonasUO = request.getParameterValues("numPersonasUO");
	String [] str_numHorasUO = request.getParameterValues("numHorasUO");

	offerData.insertWebOffer (str_idOferta,
                    str_idOferContrat,
                    str_idOferUuoo,
	                str_optimistLockUO,
	                str_idUuooContr,
	                str_impUnidad,
	                str_impUnidadContr,
	                str_idCuadroCont,
	                str_optimistLockCP,
	                str_idOferCuadro,
	                str_impHora,
	                str_impHoraContr,
	                str_idOferElemTA,
	                str_idOferTA,
	                str_optimistLockTA,
	                str_numPersonasTA,
	                str_numHorasTA,
	                str_unidadesTA,
	                str_manoObraTA,
					str_idOferElemAD,
					str_idOferAD,
					str_optimistLockAD,
					str_materialAD,
					str_otrosAD,
					str_idOferElemUO,
					str_idOferUO,
					str_optimistLockUUOO,
					str_numPersonasUO,
					str_numHorasUO);

	String strMensajeAlert = "";					
					
	if (str_flgSalvarEnviar.equals("S")) {
		strMensajeAlert=traductor.getLiteral("msgOfertaSalvada");
	}
	else{
	
		offerData.callContractSendOffer (str_idOferContrat,
                                     str_optimistLock);	
		strMensajeAlert=traductor.getLiteral("msgOfertaProcesada");
	}

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
	alert ("<%=strMensajeAlert%>");
<%
	if (str_flgSalvarEnviar.equals("S")) {
	%>
	document.location.href="./trabajo.jsp?idOferta=<%=str_idOferContrat%>";
	<%
	}
	else{
	%>
	parent.pieframe.document.location.href="./pievacio.htm";<%// ICM SCI 054705 %>	
	parent.navegacion.document.location.href="./lateral.jsp";
	document.location.href="./cenman_offer_list_index.jsp";
	<%
	}
%>



	
	
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