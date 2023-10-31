<%@ page language="java" errorPage="cenman_error_salir.jsp" import="java.util.HashMap,com.soluzionasf.ocen.man.revisions_stops.servlets.CenManRPWebDataOfferRequestDOMImpl, com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest, com.soluzionasf.ocen.man.web.domain.CenManWebDetailOffer , com.soluzionasf.ocen.man.web.domain.CenManWebDocumentsOffer, isf.util.log.Log, com.soluzionasf.ocen.man.web.domain.CenManWebShared, com.soluzionasf.ocen.man.web.domain.CenManWebFormatoNumerosHelper"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<jsp:useBean id="cuadroBean" scope="session" class="java.util.Vector" />
<jsp:useBean id="cuadroPreciosBean" scope="session" class="java.util.HashMap" />

<%
	// Limpia la cache
	response.setHeader("expires", "0");
	
	String strFormatterAmount = null;
    strFormatterAmount = "###,##0.00";
	
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.ListaCuadros listaCuadros = null;
	
	CenManRPWebDataOfferRequestDOMImpl _result = null;
	_result	 = (CenManRPWebDataOfferRequestDOMImpl)cuadroBean.elementAt(0);
	
	String id_oferta = 	(String)request.getParameter("idOferta");
	
	//Recuperamos las ofertas para actualizar el hashmap de precios
	String [] str_categoria = request.getParameterValues("categoria");
	String [] str_impHoraContr = request.getParameterValues("impHoraContr");
	if(str_categoria!=null &&str_categoria.length>0){
		for(int i=0;i<str_categoria.length;i++){
			cuadroPreciosBean.put(str_categoria[i],str_impHoraContr[i]);
		}
	}
	
	//Inicializamos variables de retorno
	String precios = "Si";
	String copia = "Si";
%>
<html>
<head>
<title></title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

<script type="text/javascript">
function volverLista(){
	parent.pieframe.document.location.href="./pie.jsp";
	parent.navegacion.document.location.href="./lateral1.jsp";	
	document.location.href="./trabajo.jsp?Precios=<%=precios%>&idOferta=<%=id_oferta%>";
}
function copiar(){
	parent.pieframe.document.location.href="./pie.jsp";
	parent.navegacion.document.location.href="./lateral1.jsp";		
	parent.central.document.location.href="./trabajo.jsp?Precios=<%=precios%>&idOferta=<%=id_oferta%>&copia=<%=copia%>";
}

</script>

</head>

<body class="new4" onLoad="">

<divID="cuadroPrecio">
<table class="general" cellspacing="0" border="0">
<tr><td>&nbsp;</td></tr><td colspan="2" class="grantabla33"><%=traductor.getLiteral("cuadroPrecios_duplicados")%></td>
  <tr>
      <td class="introbienve3">
      
        <table class="general3" cellspacing="0" border="0">
          <tr>
            <td class="grantabla29" width="20%"><%=traductor.getLiteral("codigo")%></td>
            <td class="grantabla29" width="30%"><%=traductor.getLiteral("descripcion")%></td>
            <td class="grantabla29" width="20%"><%=traductor.getLiteral("codigo")%></td>
            <td class="grantabla29" width="30%"><%=traductor.getLiteral("descripcion")%></td>
          </tr>
          <tr>
            <td class="grantabla10" width="20%"><%=_result.getCodigoCP()%></td>
            <td class="grantabla10" width="30%"><%=_result.getDescripcionCP()%></td>
            <%if(_result.getCodOfertaUltima()==null){%>
   	            <td class="grantabla10" width="20%">&nbsp;</td>
            <%}else{%>
	            <td class="grantabla10" width="20%"><%=_result.getCodOfertaUltima()%></td>
	        <%}%>
            <%if(_result.getDesOfertaUltima()==null){%>
	            <td class="grantabla10" width="30%">&nbsp;</td>
            <%}else{%>
	            <td class="grantabla10" width="30%"><%=_result.getDesOfertaUltima()%></td>
	        <%}%>

          </tr>
				</table>
      <br></br>
        <table class="general3" cellspacing="0" border="0">
          <tr>
            <td class="grantabla29" width="26%"><%=traductor.getLiteral("categoria")%></td>
            <td class="grantabla29" width="37%"><%=traductor.getLiteral("tipoHora")%></td>
            <td class="grantabla29" width="37%"><%=traductor.getLiteral("importe")%></td>
          </tr>
<%
	if(_result!=null){
		System.out.println("ENTRA AQUÍ");
		int intNElemento = _result.getListaCuadrosCount();
		System.out.println("NÚMERO DE ELEMENTOS -----------------"+intNElemento);
		for (int i=0;i < intNElemento ;i++ ) {
	
			listaCuadros = _result.getListaCuadros(i);
			String strImpHora = "";
			if ((listaCuadros.getImpHora()!=null)&&(!listaCuadros.getImpHora().equals("null"))) {
				strImpHora=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,listaCuadros.getImpHora().doubleValue());
			}
%>
	          <tr>
	            <td class="grantabla10" width="26%"><%=listaCuadros.getDesCategoria()%></td>
	            <td class="grantabla10" width="37%"><%=listaCuadros.getDesTipoHora()%></td>
	            <td class="grantabla34" ><%=strImpHora%></td>
	          </tr>
<%
		}// end for
	}
%>
        </table>
      </td>
    </tr>
</table>
</div>

</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             