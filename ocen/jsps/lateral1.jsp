<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManWebShared"%>
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<%
	session = request.getSession (true);
	// ICM  SCI 054705 	 Dependiendo del estado en el que se encuentre la oferta
	// se mostrarán unos enlaces o no
	String strCodEstado=(String)session.getValue("codEstado")	;		
%>
<html>
<head>
<title>Untitled Document</title>
<link rel=stylesheet href="css/ocen.css" type="text/css">

<script language="JavaScript">

	function moverOT()
	{
		parent.central.document.getElementById("ordenTrabajo").style.display = ''
		parent.central.document.getElementById("cuadroPrecio").style.display = 'none'
		parent.central.document.getElementById("unidadObra").style.display = 'none'
		parent.central.document.getElementById("documentos").style.display = 'none'
		return false;
	}

	function moverCP()
	{
		parent.central.document.getElementById("ordenTrabajo").style.display = 'none'
		parent.central.document.getElementById("cuadroPrecio").style.display = ''
		parent.central.document.getElementById("unidadObra").style.display = 'none'
		parent.central.document.getElementById("documentos").style.display = 'none'
		return false;
	}

	function moverUO()
	{
		parent.central.document.getElementById("ordenTrabajo").style.display = 'none'
		parent.central.document.getElementById("cuadroPrecio").style.display = 'none'
		parent.central.document.getElementById("unidadObra").style.display = ''
		parent.central.document.getElementById("documentos").style.display = 'none'
		return false;
	}
	
	function moverOD()
	{
		parent.central.document.getElementById("ordenTrabajo").style.display = 'none'
		parent.central.document.getElementById("cuadroPrecio").style.display = 'none'
		parent.central.document.getElementById("unidadObra").style.display = 'none'
		parent.central.document.getElementById("documentos").style.display = ''
		return false;
	}
	
	function moverInforme()
	{
		var ordenTrabajo = parent.central.document.getElementById("ordenTrabajo").style.display
		var cuadroPrecio = parent.central.document.getElementById("cuadroPrecio").style.display
		var unidadObra =   parent.central.document.getElementById("unidadObra").style.display
		var documentos =   parent.central.document.getElementById("documentos").style.display 
		parent.central.document.getElementById("ordenTrabajo").style.display = ''
		parent.central.document.getElementById("cuadroPrecio").style.display = 'none'
		parent.central.document.getElementById("unidadObra").style.display = 'none' 
		parent.central.document.getElementById("documentos").style.display = 'none'
		parent.central.focus();
		if (confirm ("<%=traductor.getLiteral("confirmImprimirOT")%>")){
			parent.central.imprimir();
		}
<%if (!strCodEstado.equals(CenManWebShared.getRpDenegada()) ) {%>
		parent.central.document.getElementById("ordenTrabajo").style.display = 'none'
		parent.central.document.getElementById("cuadroPrecio").style.display = ''
		parent.central.document.getElementById("unidadObra").style.display = 'none' 
		parent.central.document.getElementById("documentos").style.display = 'none'		
		if (confirm ("<%=traductor.getLiteral("confirmImprimirCPrecios")%>")){
			parent.central.imprimir();
		}
		parent.central.document.getElementById("ordenTrabajo").style.display = 'none'
		parent.central.document.getElementById("cuadroPrecio").style.display = 'none'
		parent.central.document.getElementById("unidadObra").style.display = '' 
		parent.central.document.getElementById("documentos").style.display = 'none'		
		if (confirm ("<%=traductor.getLiteral("confirmImprimirUObra")%>")){
			parent.central.imprimir();
		}
<%}%>
		parent.central.document.getElementById("ordenTrabajo").style.display = 'none'
		parent.central.document.getElementById("cuadroPrecio").style.display = 'none'
		parent.central.document.getElementById("unidadObra").style.display = 'none' 
		parent.central.document.getElementById("documentos").style.display = ''		
		if (confirm ("<%=traductor.getLiteral("confirmImprimirDocumentos")%>")){
			parent.central.imprimir();
		}		
		parent.central.document.getElementById("ordenTrabajo").style.display = ordenTrabajo
		parent.central.document.getElementById("cuadroPrecio").style.display = cuadroPrecio
		parent.central.document.getElementById("unidadObra").style.display = unidadObra
		parent.central.document.getElementById("documentos").style.display = documentos

		return false;

	}	

	function exportar()
	{
		
		if (parent.creaExport.document.getElementById("ordenTrabajo") == null ||
				parent.creaExport.document.getElementById("cuadroPrecio")  == null ||
				parent.creaExport.document.getElementById("unidadObra") == null ) {
				alert('<%=traductor.getLiteral("msgExportar")%>');
				return false;
		}
		else {
			<!-- ORDEN TRABAJO -->
			var ordenTrabajo = parent.creaExport.document.getElementById("ordenTrabajo").innerHTML;
			<!--CUADRO PRECIO  -->
			var cuadroPrecio = parent.creaExport.document.getElementById("cuadroPrecio").innerHTML;
			<!-- UNIDAD OBRA -->
			var unidadObra = parent.creaExport.document.getElementById("unidadObra").innerHTML;
			ordenTrabajo = ordenTrabajo + cuadroPrecio;
			ordenTrabajo = ordenTrabajo + unidadObra;
			document.exportar2.documento.value = ordenTrabajo;
			document.exportar2.titulo.value = "ordenTrabajo.xls";
			document.exportar2.target = 'exportarOT'	
			document.exportar2.submit();
			return false;
	}	
}


</script>

<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

</head>
<body class="new3">
  <table width="100%" height="110" class="opcioneslaterales" cellspacing="0" cellpadding="0" border="0">
    <tr>
      <td class="nueva2"><a href="#" onclick="moverOT();"  class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("oTrabajo")%></a><td>
    </tr>
    <%if (!strCodEstado.equals(CenManWebShared.getRpDenegada()) ) {%>
    <tr>
      <td class="nueva2"><a href="#" onclick="moverCP();" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("cPrecio")%></a><td>
    </tr>
    <tr>
      <td class="nueva2"><a href="#" onclick="moverUO();" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp<%=traductor.getLiteral("uObra")%></a><td>
    </tr>
    <%}%>
    <tr>
      <td class="nueva2"><a href="#" onclick="moverOD();" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("documentacion")%></a><td>
    </tr>
    <tr>
      <td class="nueva2"><a href="#" onclick="moverInforme();" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("imprimir")%></a><td>
    </tr>
    <tr>
      <td class="nueva2"><a href="#" onclick="exportar();" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("exportar")%></a><td>
    </tr>
  </table>

<form name='exportar2' action='./exportar.jsp' method='post'>
<input type="hidden" name="documento">
<input type="hidden" name="titulo">
</form>


</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>
