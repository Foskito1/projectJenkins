<%@ page language="java" errorPage="cenman_error_salir.jsp" import="java.util.ArrayList, java.util.Date, java.util.Arrays, java.util.List,com.soluzionasf.ocen.man.web.domain.CenManWebPriceTableSend, isf.util.log.Log, java.util.List, java.util.Calendar, java.util.Iterator, java.text.SimpleDateFormat, com.soluzionasf.ocen.man.web.domain.CenManWebContractPriceTable"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<jsp:useBean id="cuadroBean" scope="session" class="java.util.Vector" />
<jsp:useBean id="cuadroPreciosBean" scope="session" class="java.util.HashMap" />
<%
	List					listOfPriceTables = null;
	Iterator 				iterator = null;
	CenManWebContractPriceTable	priceTable = null;
	
	long	loIdCuadro	= 0;
	
	// Limpia la cache
	response.setHeader("expires", "0");
	session = request.getSession (true);
	
	CenManWebPriceTableSend sendQueryPriceTable = new CenManWebPriceTableSend();
		
	listOfPriceTables = sendQueryPriceTable.sendQueryPriceTable(
                   		contractor.getContractCode());
	
%>
<script type="text/javascript">
function actualizaCategorias(idCuadro){
	document.formulario.idCuadro.value = idCuadro;
	document.formulario.submit();
}
</script>
<html>
<head>
<title>Cuadro de Precios</title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

<body class="new4">
<form name="formulario" target="resultado" method="post" action="cenman_price_table_importe_list.jsp">
<INPUT TYPE="HIDDEN" name="idCuadro">
<table class="general" cellspacing="0" border="0">
<tr><td>&nbsp;</td></tr><td colspan="2" class="grantabla33"><%=traductor.getLiteral("Cuadro de Precios")%></td>
        <table class="general3" cellspacing="0" border="0">
          <tr>
            <td class="grantabla29" width="20%"><%=traductor.getLiteral("Codigo")%></td>
            <td class="grantabla29" width="60%"><%=traductor.getLiteral("Descripcion")%></td>
          </tr>
<%
	if (listOfPriceTables.size()>0) {
		iterator = listOfPriceTables.iterator();
	  String strDesCuadro="";
	  String strCodCuadro="";
	 for(int i = 0; i< listOfPriceTables.size(); i++){
		  strDesCuadro="&nbsp;";
	      strCodCuadro="&nbsp;";
		 priceTable = (CenManWebContractPriceTable) listOfPriceTables.get(i);
		 loIdCuadro =priceTable.getIdCuadro();
		 if (priceTable.getDesCuadro()!=null) {
	      	strDesCuadro = priceTable.getDesCuadro();
	      }
		if (priceTable.getCodCuadro()!=null) {
	      	strCodCuadro = priceTable.getCodCuadro();
	      }
%>  	<tr>
			<td class="grantabla10" width="20%"><a href="#" onClick="actualizaCategorias('<%=priceTable.getIdCuadro()%>')" class="resaltar"><%=strCodCuadro%></a></td>
			<td class="grantabla10" width="60%">&nbsp;<%=strDesCuadro%></td>  	        </tr>

      </td>
    </tr>

<%
	 }
	}
%>
</table>
</form>
</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>
