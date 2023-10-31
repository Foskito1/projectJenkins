<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManWebDetailPriceTableGen"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="cuadroBean" scope="session" class="java.util.Vector" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<%
	// Limpia la cache
	response.setHeader("expires", "0");


	CenManWebDetailPriceTableGen priceTable = new CenManWebDetailPriceTableGen();
/****************/
	String [] str_idTarifa = request.getParameterValues("idTarifa");
	String [] str_importe = request.getParameterValues("importe");
	String [] str_OptimistLock = request.getParameterValues("optimistLock");
	String strCodContratista = request.getParameter("cod_contratista");
	
	priceTable.insertWebPriceTable (str_idTarifa,
                    str_importe,
                    str_OptimistLock,strCodContratista);
					
	String strMensajeAlert = "";					
	strMensajeAlert=traductor.getLiteral("msgOfertaSalvada");
	
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