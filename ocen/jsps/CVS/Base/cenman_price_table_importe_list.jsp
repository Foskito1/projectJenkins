<%@ page language="java" errorPage="cenman_error_salir.jsp" import="java.util.ArrayList, java.util.Date, java.util.Arrays, java.util.List,com.soluzionasf.ocen.man.web.domain.CenManWebPriceTableImporteSend, isf.util.log.Log, java.util.List, java.util.Calendar, java.util.Iterator, java.text.SimpleDateFormat, com.soluzionasf.ocen.man.web.domain.CenManWebContractPriceTableImporte,com.soluzionasf.ocen.man.web.domain.CenManWebFormatoNumerosHelper"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<jsp:useBean id="cuadroBean" scope="session" class="java.util.Vector" />
<jsp:useBean id="cuadroPreciosBean" scope="session" class="java.util.HashMap" />
<%
	List					listOfPriceTablesImportes = null;
	Iterator 				iterator = null;
	CenManWebContractPriceTableImporte	priceTableImporte = null;
	
	// Limpia la cache
	response.setHeader("expires", "0");
	session = request.getSession (true);
	String strIdCuadro=request.getParameter("idCuadro");
	
	CenManWebPriceTableImporteSend sendQueryPriceTableImporte = new CenManWebPriceTableImporteSend();
		
	System.out.println("Cuadro de precios:" + strIdCuadro);
	
	listOfPriceTablesImportes = sendQueryPriceTableImporte.sendQueryPriceTableImporte(Long.parseLong(strIdCuadro));
	
	String strFormatterAmount = null;
    strFormatterAmount = "###,##0";	
	String strDecimalSeparator = CenManWebFormatoNumerosHelper.getDecimalSeparator();
	String strMilesSeparator = CenManWebFormatoNumerosHelper.getMilesSeparator();   
	String strSalvar = "N";
%>
<html>
<head>
<title>Cuadro de Precios</title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

<script type="text/javascript">
var REDONDEO_DEFECTO = 2; // Redondea a 2 decimales por defecto.
var DECIMAL = '<%=strDecimalSeparator%>'; // Caracteres usados como separador de decimales y de miles. No deben ser
var MILES = '<%=strMilesSeparator%>'; // iguales entre sí. Se puede omitir el separador de miles, con MILES = "".
var MSG_NUMERO_INCORRECTO = '<%=traductor.getLiteral("msgNumeroIncorrecto")%>';
var MSG_FALTA_CAMBIO = '<%=traductor.getLiteral("msgFaltaCambio")%>';
var HAY_CAMBIO = false; 

function parseNumero(numero) {

	var REDONDEO_DEFECTO = 2; // Redondea a 2 decimales por defecto.
	var DECIMAL = "."; // Caracteres usados como separador de decimales y de miles. No deben ser
	var MILES = " "; // iguales entre sí. Se puede omitir el separador de miles, con MILES = "".
	var esNegativo;
	var strNumero = String(numero).split(DECIMAL); // <Parte_entera DECIMAL Parte_decimal>

	// A la parte entera: Recorta espacios iniciales y separadores de miles
	eval("var strEntero = strNumero[0].replace(/^\s*/, '').replace(/[" + MILES + "]/g,'')");

	if (esNegativo = (strEntero.charAt(0) == '-'))
		strEntero = strEntero.substr(1);

	// Elimina ceros a la izquierda
	if ((strEntero = strEntero.replace(/^0*/,'')) == '')
		strEntero = '0';

	// A la parte decimal: Si existe, recorta espacios finales.
	var strDecimal = strNumero.length > 1 ? strNumero[1].replace(/\s*$/, "").replace(/0+$/g,"") : "";

	// <Parte_entera . Parte_decimal>>, o <Parte_entera> si Parte_decimal no existe
	var numFormateado = strDecimal.length == 0 ? strEntero : strEntero + "." + strDecimal;
	if (esNegativo) numFormateado = "-" + numFormateado;

	var valor = parseFloat(numFormateado); // Pasa a Float.

	// Si se ha convertido el valor completo, se devuelve el Float. Si no es correcto, NaN.
	return (valor.toString() != numFormateado) ? Number.NaN : valor;
}

/*
	Función formatNumero:
		Método para devolver el valor formateado de un número. Es el inverso a parseNumero.
	Parámetros:
		numero: Numero a formatear.
		decimales: Número de decimales. Si se omite, se usa REDONDEO_DEFECTO.
	Retorna:
		Cadena con el número formateado.
*/
function formatNumero(numero, decimales) {
	
	var dec = (decimales != null ? decimales : REDONDEO_DEFECTO);
	var strNumero = String(redondea(numero, dec)).split('.'); // <Parte_entera . Parte_decimal>
	var strEntero = strNumero[0].split("").reverse().join(""); // Le damos la vuelta al entero
	var strDecimal = strNumero.length > 1 ? strNumero[1] : "";

	strEntero = strEntero.replace(/(\d{3})/g, "$1" + MILES); // coloca MILES cada tres dígitos
	strEntero = strEntero.split("").reverse().join(""); // Le damos otra vuelta

	// Eliminamos los casos <.Numero> y <-.NUMERO>
	if (strEntero.charAt(0) == MILES) strEntero = strEntero.slice(1);
	else if (strEntero.substr(0,2) == "-" + MILES) strEntero = "-" + strEntero.slice(2);

	for (var i = strDecimal.length; i < dec; i++) // Rellenar los decimales que faltan con 0
		strDecimal += '0';
	// <Parte_entera DECIMAL Parte_decimal>, o <Parte_entera> si Parte_decimal no existe
	return strDecimal.length == 0 ? strEntero : strEntero + DECIMAL + strDecimal;
}

/*
	Función redondea:
		Método de redondeo de cifras.
	Parámetros:
		numero: Cifra a redondear.
		decimales: Número de decimales. Si se omite, se usa REDONDEO_DEFECTO.
	Retorna:
		Número redondeado.
*/
function redondea (numero, decimales) {
	var dec = (decimales != null ? decimales : REDONDEO_DEFECTO);
	var multip = Math.pow(10, dec);
	return Math.round(numero * multip) / multip;
}


function checkDecimal(valorIN,entero,decimal) {
	var valor;
	var maximo;
	maximo=10;
	for (i=1;i<entero;i++) {
		maximo=maximo*10;
	}
	maximo = maximo-1;	
	valor = valorIN.value;	
	//valor = valor.replace('.', "").replace(',', ".");		
	valor = getNumber(valor)	
	if (isNaN(valor)) {	
		valor='0.0';		
	}
	// Recorta espacios
	valor.value = valor.replace(/^\s*/, "").replace(/\s*$/, "");		
	var parteEntera=''+parseFloat(valor);	
	if (parteEntera.indexOf(".", 0) != -1) {		
		parteEntera = parteEntera.substring(0,parteEntera.indexOf(".", 0));			
	}
	
	if (parteEntera.length>entero) { alert 
	('<%=traductor.getLiteral("msgNumeroNoMayor")%>'+maximo); valor = '0.0'; 
	valorIN.value= formatNumero(0.0); valorIN.focus(); return false; }	if (valor 
	== '') return; else if (isNaN(valor = parseNumero(valor))) { alert 
	(MSG_NUMERO_INCORRECTO); valorIN.value = ''; valorIN.focus(); return false; } 
	else		valorIN.value = formatNumero(valor, decimal);		

}


function getNumber(numberFormat) {
 	var strNumber;
	strNumber= numberFormat;
	System.out.println(strNumber);
	
 	while (strNumber.indexOf('<%=strMilesSeparator%>')!= -1 ) {
 		strNumber = strNumber.replace('<%=strMilesSeparator%>', "")
 	}
 strNumber = strNumber.replace('<%=strDecimalSeparator%>', ".");		
 return strNumber;

}
function getNumberFormateadoDecimal(numberFormat) {
 	var strNumber;
 	strNumber= numberFormat;
 	
 	while (strNumber.indexOf('<%=strMilesSeparator%>')!= -1 ) {
 		strNumber = strNumber.replace('<%=strMilesSeparator%>', "")
 	}  
 return strNumber;

}

function soloCifras() {
	keyChar = window.event.keyCode;
	return (((keyChar > 47 && keyChar < 58)
		|| keyChar == DECIMAL.charCodeAt(0)
		|| keyChar == 8 || keyChar == 13 || keyChar == 45));
}


function  modoEdicion(elem) {
	//elem.value=elem.value.replace('<%=strMilesSeparator%>','' );		
	elem.value = getNumberFormateadoDecimal(elem.value)
}

function salvar(){
		document.cuadroprecios.submit();
}
</script>
	
<body class="new4">
<table class="general" cellspacing="0" border="0">
<form name='cuadroprecios' action='savePriceTable.jsp' method='post'>
<tr><td>&nbsp;</td></tr>
        <table class="general3" cellspacing="0" border="0">
          <tr>
            <td class="grantabla29" width="50%"><%=traductor.getLiteral("Categoria")%></td>
            <td class="grantabla29" width="50%"><%=traductor.getLiteral("Tipo Hora")%></td>
			<td class="grantabla29" width="30%"><%=traductor.getLiteral("Importe")%></td>
          </tr>
<%
	if (listOfPriceTablesImportes.size()>0) {
		iterator = listOfPriceTablesImportes.iterator();
	  String strDesCategoria="";
	  String strDesTipoHora="";
	  String strImporte= "";
	  Long loIdTarifa=null;
	  Long loOptimistLock =null;
	  while (iterator.hasNext()){
		  strDesCategoria="&nbsp;";
	      strDesTipoHora="&nbsp;";
		 priceTableImporte = (CenManWebContractPriceTableImporte) iterator.next();
		 loIdTarifa = priceTableImporte.getIdTarifa();
			loOptimistLock= priceTableImporte.getOptimistLock();
		 if (priceTableImporte.getDesCategoria()!=null) {
	      	strDesCategoria = priceTableImporte.getDesCategoria();
	      }
		  if (priceTableImporte.getDesTipoHora()!=null) {
	      strDesTipoHora = priceTableImporte.getDesTipoHora();
	      }
		 if ((priceTableImporte.getImporte()!=null) && (priceTableImporte.getImporte().longValue()!= 0)) {
				strImporte=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,priceTableImporte.getImporte().doubleValue());
		}
%>  	<tr> 
			<input type="hidden" name="idTarifa" value="<%=priceTableImporte.getIdTarifa()%>">
			<input type="hidden" name="optimistLock" value="<%=priceTableImporte.getOptimistLock()%>">
			<input type="hidden" name="cod_contratista" value="<%=contractor.getContractCode()%>">
			<td class="grantabla10" width="50%">&nbsp;<%=strDesCategoria%></td>           
			<td class="grantabla10" width="50%">&nbsp;<%=strDesTipoHora%></td>
			<td class="grantabla34"><input type="text" name="importe" value="<%=strImporte%>" onblur="checkDecimal(this,7,2)" onfocus="modoEdicion(this);" onChange="HAY_CAMBIO = true;" onkeypress="HAY_CAMBIO = true; return soloCifras();" class="inputformulario"  tabindex="3" ></td>
         </tr>
      </td>
    </tr>
<%
	 }
	}
%>
</table>
</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>
