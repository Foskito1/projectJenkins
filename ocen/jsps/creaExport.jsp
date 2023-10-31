<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.revisions_stops.servlets.CenManRPWebDataOfferRequestDOMImpl, com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest, com.soluzionasf.ocen.man.web.domain.CenManWebDetailOffer , com.soluzionasf.ocen.man.web.domain.CenManWebDocumentsOffer,com.soluzionasf.ocen.man.web.domain.CenManWebShared"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<jsp:useBean id="cuadroBean_aux" scope="session" class="java.util.Vector" />


<%
	// Limpia la cache
	response.setHeader("expires", "0");

	CenManWebDetailOffer offerData = new CenManWebDetailOffer();

	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.Elemento elemento = null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.CuadroPrecio cuadroPrecio= null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.PrecioUO precioUO= null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.Elemento.NHorasAD horas = null;

	CenManRPWebDataOfferRequestDOMImpl _result = null;
	
	java.text.DecimalFormat dcfFormatterHours  = null;
	java.text.DecimalFormat dcfFormatterPeople = null;
	java.text.DecimalFormat dcfFormatterAmount = null;
	java.text.DecimalFormatSymbols dcfSymbols = null;
	
	dcfSymbols = new java.text.DecimalFormatSymbols();
	//dcfSymbols.setGroupingSeparator('.');
        dcfSymbols.setDecimalSeparator('.');
        
        dcfFormatterAmount = new java.text.DecimalFormat ("##############0.000",dcfSymbols);
        dcfFormatterPeople = new java.text.DecimalFormat ("##############0.0",dcfSymbols);
        dcfFormatterHours  = new java.text.DecimalFormat ("##############0.00",dcfSymbols);
	



	String strIdOferta=request.getParameter("idOferta");

	_result = offerData.obtainOffer(Long.parseLong(strIdOferta),""+contractor.getContractCode());
	// ICM  SCI 054705 	  
  String strCodEstado;   
  strCodEstado = _result.getCodEstado ();
  // ICM  SCI 054705 
	//cuadroBean_aux.addElement(_result);
	cuadroBean_aux.insertElementAt(_result,0);

	int intNElemento = _result.getElementoCount();

	// Creamos la matriz de totales
	double douTotales[][] = new double [intNElemento][7];
	// Col 0: Horas
	// Col 1: Unidades obra
	// Col 2: Mano Obra
	// Col 3: Material
	// Col 4: Otros
	// Col 5: Indicador OT (1=OT);
	// Col 6: Importe Total Unidades Obra SCI ICM 052244 Se añade una nueva columna que contiene el importe de todas
	// las unidades de obra que supone para cada uno de los elementos

	for (int i=intNElemento-1;i >=0;i-- ) {
		elemento = _result.getElemento(i);
		if (!((elemento.getTipo()==null)||(elemento.getTipo().equals("null")))) {
			// Hemos detectado que es una Orden de trabajo
			douTotales[i][5]=1;
			/********************/
			// CALCULO DE HORAS
			/********************/
			if ((elemento.getHorasTA()!=null)&&(!elemento.getHorasTA().equals("null"))) {
				douTotales[i][0]= Double.parseDouble(elemento.getHorasTA());
			}
			if ((elemento.getHorasUO()!=null)&&(!elemento.getHorasUO().equals("null"))) {
				douTotales[i][0]= Double.parseDouble(elemento.getHorasUO());
			}
			if (elemento.getNHorasADCount()>0) {
				for (int j=0;j<elemento.getNHorasADCount();j++) {
					horas=elemento.getNHorasAD(j);
					douTotales[i][0] += (new Double(""+horas.getNumHorasAD())).doubleValue();
				}// end for
			}
			/****************************/
			// CALCULO DE UNIDADES OBRA
			/****************************/
			if ((elemento.getUnidadesTA()!=null)&&(!elemento.getUnidadesTA().equals("null"))) {
				douTotales[i][1]= Double.parseDouble (elemento.getUnidadesTA());
			}
			if ((elemento.getNumUO()!=null)&&(!elemento.getNumUO().equals("null"))) {				
				douTotales[i][1]= Double.parseDouble (elemento.getNumUO());
			}
			/****************
			/* MANO DE OBRA*/
			/***************/
			if ((elemento.getManoObraTA()!=null)&&(!elemento.getManoObraTA().equals("null"))) {
				douTotales[i][2] = Double.parseDouble(elemento.getManoObraTA());
			}
			if (elemento.getNHorasADCount()>0) {
				for (int j=0;j<elemento.getNHorasADCount();j++) {
					horas=elemento.getNHorasAD(j);
					douTotales[i][2] += ((new Double (""+horas.getNumHorasAD())).doubleValue()*(new Double (""+horas.getImpHoraAD())).doubleValue());
				}// end for
			}
			/****************
			/* MATERIAL*/
			/***************/
			if ((elemento.getMaterialAD()!=null)&&(!elemento.getMaterialAD().equals("null"))) {
				douTotales[i][3] += Double.parseDouble (elemento.getMaterialAD());
			}
			/*********
			 * OTROS *
			 *********/
			if ((elemento.getOtrosAD()!=null)&&(!elemento.getOtrosAD().equals("null"))) {
				douTotales[i][4] += Double.parseDouble (elemento.getOtrosAD());
			}
			/************SCI ICM 052244 ************
			* IMPORTEL TOTAL UNIDADES DE OBRA*
			Se comprueba si el existe un importe de unidad de obra. Si es asi se añade en el array de totales
			********************************/
			
			if ((elemento.getImpUnidadUO()!=null) && (!elemento.getImpUnidadUO().equals("null"))){
				douTotales[i][6] = + Double.parseDouble (elemento.getImpUnidadUO());
			}
			
			
			
		}
	}// end for

	// Obtenemos los datos de la cabecera de al oferta
	session = request.getSession (true);

	String strCodOffer		= (String)session.getValue("codOffer");
	String strExpediente	= (String)session.getValue("expedient");
	String strNumVersion	= (String)session.getValue("numVersion");
	String strDescripcion	= (String)session.getValue("descripcion");
	// ICM SCI 052234
	String strFechaLimite = (String)session.getValue("fechaLimite");
	// ICM SCI 054705
	String strDesEstado 	= (String)session.getValue("desEstado");
	boolean boo_isMod   	= ((Boolean)session.getValue("boo_isMod")).booleanValue();
	String strFechaEnvio = (String)session.getValue("fechaEnvio");
	// ICM SCI 055827
	String strNombreContratista = contractor.getContractName();
	
	
	

	if (strExpediente == null) {
		strExpediente="";
	}

	if (strExpediente.equals("null")) {
		strExpediente="";
	}
	if (strExpediente.equals("null")) {
		strExpediente="";
	}

	// ICM SCI 052234
	if (strFechaLimite == null || strFechaLimite.equals("null") ){
		strFechaLimite="";		
	}
	// FIN SCI 052234
	
	// ICM SCI 054705
	if (strFechaEnvio == null || strFechaEnvio.equals("null") ){
		strFechaEnvio="";		
	}	
	if (strDesEstado == null || strDesEstado.equals("") ){
		strDesEstado="";		
	}
	// FIN SCI 054705

	// AMY (Parte de obtención de documentos de una oferta)
	
	
	
%>
<html>
<head>
<title></title>
<link rel=stylesheet href="css/ocenExport.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

<script type="text/javascript">
var REDONDEO_DEFECTO = 2; // Redondea a 2 decimales por defecto.
var DECIMAL = "."; // Caracteres usados como separador de decimales y de miles. No deben ser
var MILES = ""; // iguales entre sí. Se puede omitir el separador de miles, con MILES = "".
var MSG_NUMERO_INCORRECTO = '<%=traductor.getLiteral("msgNumeroIncorrecto")%>';
var MSG_FALTA_CAMBIO = '<%=traductor.getLiteral("msgFaltaCambio")%>';
var HAY_CAMBIO = false; 

var totales = new Array (<%=intNElemento%>);
	<%
		for (int i=0;i<intNElemento;i++) {
/* SCI ICM 052244 Se añade una nueva posición en el array de totales. Dicha posición contiene el importe total de las unidades de obra de un elemento */
			%>
totales [<%=i%>] = new Array (<%=douTotales[i][0]%>,<%=douTotales[i][1]%>,<%=douTotales[i][2]%>,<%=douTotales[i][3]%>,<%=douTotales[i][4]%>,<%=douTotales[i][5]%>,<%=douTotales[i][6]%>);	<%
		}
	%>
function imprimir(){
		if(HAY_CAMBIO){
			alert("<%=traductor.getLiteral("msgCondicion1Imprimir")%>");
		}		
		else{
			self.print();
		}

}	
function actualizaColumnaTotales()
{
checkNaN();
	<%
		String strTotalTotal="0";
		for (int i=0;i<intNElemento;i++) {
			if (douTotales[i][5]==1) {
			/* SCI ICM 052244 Se suma al elemento que contiene la suma de los totales el importe  de las unidades de obra de cada uno de los elementos */
			%>			
			elemento<%=i%>.innerText =formatNumero(parseFloat(totales[<%=i%>][2])+parseFloat(totales[<%=i%>][3])+parseFloat(totales[<%=i%>][4])+parseFloat(totales[<%=i%>][6]),3);<%
			//ICM SCI 055830. Permite cacular el coste total de la oferta realizada por el contratista
			strTotalTotal = strTotalTotal + "  + parseFloat(elemento" + i+ ".innerText) ";	
			}
		}
	// ICM SCI 055830. Permite cacular el coste total de la oferta realizada por el contratista
	%>
	TotalTotal.innerText = formatNumero(<%=strTotalTotal%>,3);
}

function checkNaN (){
	for (i=0;i< <%=intNElemento%> ;i++) {
		if (isNaN(totales[i][0])) {
			alert ("Hay un nan en "+i);
		}
	}
}

function actualizaFilasCabecera () {
checkNaN();
	<%	String strCadenaSumaMaterial="0";
		String strCadenaSumaOtros="0";
		String strCadenaSumaMO="0";
		String strCadenaSumaUD="0";
		String strCadenaSumaHoras="0";

		String strTotalColumna="0";

		String strTotalHoras ="0";
		String strTotalUO="0";
		String strTotalMO="0";
		String strTotalMaterial="0";
		String strTotalOtros="0";
		
		for (int i=intNElemento-1;i >= 0;i--) {
			if (douTotales[i][5]==1) {
			// OT
				strCadenaSumaHoras += "+parseFloat(totales["+i+"][0])";
				strCadenaSumaUD += "+parseFloat(totales["+i+"][1])";
				strCadenaSumaMO += "+parseFloat(totales["+i+"][2])";
				strCadenaSumaMaterial += "+parseFloat(totales["+i+"][3])";
				strCadenaSumaOtros += "+parseFloat(totales["+i+"][4])";
				strTotalColumna += "+parseFloat(totales["+i+"][2])"
									+"+parseFloat(totales["+i+"][3])"
									+"+parseFloat(totales["+i+"][4])"
									+"+parseFloat(totales["+i+"][6])"
									;
									// ICM SCI 052244 se suma a la columna total el subtotal de unidades de obra
									
									

			}
			else {

				if (!strTotalColumna.equals("0")) {
			%>

				   elemento<%=i%>.innerText= formatNumero(<%=strTotalColumna%>,3); <%				   
					 strTotalColumna= "0"; 
				}
				if (!strCadenaSumaMaterial.equals("0")) {
					strTotalMaterial += ("+"+strCadenaSumaMaterial);
			%>
				   material<%=i%>.innerText = formatNumero(<%=strCadenaSumaMaterial%>,3); <%
					strCadenaSumaMaterial="0";
				}
				if (!strCadenaSumaOtros.equals("0")) {
					strTotalOtros += ("+"+strCadenaSumaOtros);
			%>
				   otros<%=i%>.innerText = formatNumero(<%=strCadenaSumaOtros%>,3); <%
					strCadenaSumaOtros="0";
				}
				if (!strCadenaSumaMO.equals("0")) {
					strTotalMO += ("+"+strCadenaSumaMO);

			%>
				   mo<%=i%>.innerText = formatNumero(<%=strCadenaSumaMO%>,3); <%
					strCadenaSumaMO="0";
				}
				if (!strCadenaSumaHoras.equals("0")) {
					strTotalHoras += ("+"+strCadenaSumaHoras);
			%>
				   horas<%=i%>.innerText = formatNumero(<%=strCadenaSumaHoras%>,2); <%
					strCadenaSumaHoras="0";
				}
				if (!strCadenaSumaUD.equals("0")) {
					strTotalUO += ("+"+strCadenaSumaUD);
			%>
				   uds<%=i%>.innerText = formatNumero(<%=strCadenaSumaUD%>,2)	; <% // ICM SCI 055818 Se añade un decimal
					strCadenaSumaUD="0";
				}
			}
		}// for
	%>
	TotalHoras.innerText = formatNumero(<%=strTotalHoras%>,2);
	TotalUO.innerText = formatNumero(<%=strTotalUO%>,1);
	TotalMO.innerText = formatNumero(<%=strTotalMO%>,3);
	TotalMaterial.innerText = formatNumero(<%=strTotalMaterial%>,3);
	TotalOtros.innerText = formatNumero(<%=strTotalOtros%>,3);	
	

}

function actualizarInicial() {
	actualizaColumnaTotales();
	actualizaFilasCabecera();

}

function actualizar (fila,columna,valor) {
	if (isNaN(valor)) {
		valor=0.0;
	}
	if (valor =='') {
		valor=0.0;
	}
	totales[fila][columna]=valor;
	actualizaColumnaTotales();
	actualizaFilasCabecera();

}

function muestraDocumento(id) {
		parent.central.document.showdoc.doc.value=id;
        parent.central.document.showdoc.submit();
}

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
	var strNumero = String(redondea(numero, dec)).split("."); // <Parte_entera . Parte_decimal>
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

	if (isNaN(valorIN.value)) {
		valorIN.value='0.0';
	}

	// Recorta espacios
	valorIN.value = valorIN.value.replace(/^\s*/, "").replace(/\s*$/, "");

	var parteEntera=''+parseFloat(valorIN.value);

	if (parteEntera.indexOf(".", 0) != -1) {
		parteEntera = parteEntera.substring(0,parteEntera.indexOf(".", 0));
	}
	
	if (parteEntera.length>entero) {
		alert ('<%=traductor.getLiteral("msgNumeroNoMayor")%>'+maximo);
		valorIN.value = '0.0';
		valorIN.focus();
		return false;
	}

	if (valorIN.value == '')
		return;
	else if (isNaN(valor = parseNumero(valorIN.value))) {
		alert (MSG_NUMERO_INCORRECTO);
		valorIN.value = '';
		valorIN.focus();
		return false;
	} else
		valorIN.value = formatNumero(valor, decimal);

}

function soloCifras() {
	keyChar = window.event.keyCode;
	return (((keyChar > 47 && keyChar < 58)
		|| keyChar == DECIMAL.charCodeAt(0)
		|| keyChar == 8 || keyChar == 13 || keyChar == 45));
}



</script>

</head>
<%// INICIO ICM SCI 054705. Si la oferta esta denegada no hay que mostrar toda la información
// únicamente los totales
boolean booMostrarDetalle = true;
if ( strCodEstado.equals(CenManWebShared.getRpDenegada())  ) {
 booMostrarDetalle = false;
}%>

<body <%if (booMostrarDetalle){%>onLoad="actualizarInicial()"<%}%>>

<div ID="ordenTrabajo">

<table cellspacing="0" border="0">
  <tr><td>&nbsp;</td></tr>
  <tr>
  	</tr><td colspan="2" class="grantabla27"><%=traductor.getLiteral("cabeceraDetalle")%>&nbsp;&nbsp;<%=strCodOffer%></td>
  </tr>
  </tr>
</table>

<table cellspacing="0" border="0">
  <tr>
  	<td><b><%=traductor.getLiteral("codigo")%>:</b>&nbsp;<%=strCodOffer%></td>    
  </tr> 
  <tr>  
  	 <tr>
  	<td><b><%=traductor.getLiteral("version")%>:</b>&nbsp;<%=strNumVersion%></td>    
  </tr> 
  <tr>
  	<td><b><%=traductor.getLiteral("descripcion")%>:</b>&nbsp;<%=strDescripcion%></td>    
  </tr> 
	<tr>
  	<td><b><%=traductor.getLiteral("expediente")%>:</b>&nbsp;<%=strExpediente%></td>    
  </tr>   
	<%// INICIO ICM SCI 052234%> 
	 <tr>
  	<td><b><%=traductor.getLiteral("fechaLimite")%>:</b>&nbsp;<%=strFechaLimite%></td>    
  </tr>
  <%// INICIO ICM SCI 052234%> 
	 <tr>
  	<td><b><%=traductor.getLiteral("fechaEnvio")%>:</b>&nbsp;<%=strFechaEnvio%></td>    
  </tr>
  <%// FIN ICM SCI 052234%>      
  <%// INICIO ICM SIC 054705  %>
  <tr>
  	<td><b><%=traductor.getLiteral("estado")%>:</b>&nbsp;<%=strDesEstado%></td>    
  </tr> 
	<%// FIN ICM SIC 054705  %>
	
	<%//ICM SCI 055827 - Se añade Nombre Contratista en el detalle%>
	<tr>
    <td><b><%=traductor.getLiteral("contratista")%>:</b>&nbsp;<%=strNombreContratista%></td>  			
	</tr>
	<%// FIN ICM SCI 052234%>       
</table>
<%

if (booMostrarDetalle){
%>

<table class="general" cellspacing="0" border="0">
  <tr>
    <td colspan="3" class="introbienve3">
      <table cellspacing="0" border="0">
        <tr>
          <td colspan="5">&nbsp;</td>
          <td colspan="3" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("unidades")%></font></td>
          <td colspan="4" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("importe")%></font></td>
        </tr>
        <tr>
          <td width="7%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("codigo")%></font></td>
          <td width="7%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("gama")%></font></td>
          <td width="26%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("descripcionElemento")%></font></td>
          <td width="15%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("equipo")%></font></td>
          <td width="2%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("tip")%></font></td>
          <td width="6%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("numPersonas")%></font></td>
          <td width="6%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("horas")%></font></td>
          <td width="6%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("uds")%></font></td>
          <td width="6%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("mo")%></font></td>
          <td width="6%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("uds")%></font></td>
          <td width="6%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("otros")%></font></td>
          <td width="6%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("total")%></font></td>
        </tr>
</table>

<table  bgcolor="#f8fFD0" cellspacing="0" border="1">
<%
	for (int i=0;i < intNElemento ;i++ ) {

		elemento = _result.getElemento(i);

		String strTipo = elemento.getTipo();
		String strStyle = "grantabla5";

		if ((strTipo==null)||(strTipo.equals("null"))) {
			// NO es una OT
			strTipo="&nbsp;";
		}
		else {
			// es una OT
			strStyle = "grantabla10";
		}

		String strEquipo = elemento.getEquipo();
		if ((strEquipo==null)||(strEquipo.equals("null"))) {
			strEquipo="&nbsp;";
		}

		String strGama = elemento.getGama();
		if ((strGama==null)||(strGama.equals("null"))) {
			strGama="&nbsp;";
		}
		// [SCI 37844] Victor M. Sobrino - 25/04/2005
		int DESCRIPTION_VIEW_MAXLENGTH = 70;
%>
        <tr>
          <td width="7%"  align="center"><%=elemento.getCodigo()%></td>
          <td width="7%"  align="center"><%=strGama%></td>
          <td width="26%" align="left"><%=elemento.getDescripcion()%></td>
          <td width="15%" align="center"><%=strEquipo%></td>
          <td width="4%"  align="center"><%=strTipo%></td>
<%
		if (!strTipo.equals("&nbsp;")) {
			if (strTipo.equals("T")) {
			// Tanto Alzado

			String strNPersonasTA="";
			if ((elemento.getNPersonasTA()!=null)&&(!elemento.getNPersonasTA().equals("null"))) {
				strNPersonasTA=dcfFormatterPeople.format(Double.parseDouble(elemento.getNPersonasTA()));
			}
			String strHorasTA="";
			if ((elemento.getHorasTA()!=null)&&(!elemento.getHorasTA().equals("null"))) {
				strHorasTA=dcfFormatterHours.format(Double.parseDouble(elemento.getHorasTA()));
			}
			String strUnidadesTA="";
			if ((elemento.getUnidadesTA()!=null)&&(!elemento.getUnidadesTA().equals("null"))) {
				strUnidadesTA=dcfFormatterPeople.format(Double.parseDouble(elemento.getUnidadesTA()));
			}
			String strManoObraTA="";
			if ((elemento.getManoObraTA()!=null)&&(!elemento.getManoObraTA().equals("null"))) {
				strManoObraTA=dcfFormatterAmount.format(Double.parseDouble(elemento.getManoObraTA()));
			}
%>
	  <td width="4%" class="<%=strStyle%>"><%=strNPersonasTA%></td>
          <td width="4%" class="<%=strStyle%>"><%=strHorasTA%></td>
          <td width="4%" class="<%=strStyle%>"><%=strUnidadesTA%></td>
          <td width="7%" class="<%=strStyle%>"><%=strManoObraTA%></td>
          <td width="8%" class="<%=strStyle%>">&nbsp;</td>
          <td width="7%" class="<%=strStyle%>">&nbsp;</td>
          <td width="7%" class="grantabla7" id="elemento<%=i%>">&nbsp;</td>
<%			}
			else {
			if (strTipo.equals ("U")) {
			// Unidades Obra

			String strNumUO="&nbsp;";
			if ((elemento.getNumUO()!=null)&&(!elemento.getNumUO().equals("null"))) {
				strNumUO = dcfFormatterHours.format(Double.parseDouble(elemento.getNumUO())); // ICM SCI 055818 Se modifica el objeto utilizado para dar formato
			}

			String strNumPersonasUO="";
			if ((elemento.getNPersonasUO()!=null)&&(!elemento.getNPersonasUO().equals("null"))) {
				strNumPersonasUO = dcfFormatterPeople.format(Double.parseDouble(elemento.getNPersonasUO()));
			}

			String strNumHorasUO="";
			if ((elemento.getHorasUO()!=null)&&(!elemento.getHorasUO().equals("null"))) {
				strNumHorasUO = dcfFormatterHours.format(Double.parseDouble(elemento.getHorasUO()));
			}
%>
	      <td width="4%" class="<%=strStyle%>"><%=strNumPersonasUO%></td>
          <td width="4%" class="<%=strStyle%>"><%=strNumHorasUO%></td>
          <td width="4%" class="grantabla11"><%=strNumUO%></td>
          <td width="7%" class="grantabla11">&nbsp;</td>
          <td width="8%" class="<%=strStyle%>">&nbsp;</td>
          <td width="7%" class="<%=strStyle%>">&nbsp;</td>
          <td width="7%" class="grantabla7" id="elemento<%=i%>">&nbsp;</td>
<%
			}
			else {
			// Administracion
				double douNHorasTotAD = 0;
				double douNPersonasTotAD = 0;
				double douImpManoObraAD = 0;
				String strImpManoObraAD = "&nbsp;";
				if (elemento.getNHorasADCount()>0) {

					for (int j=0;j<elemento.getNHorasADCount();j++) {
						horas=elemento.getNHorasAD(j);

						douNHorasTotAD += (new Double(""+horas.getNumHorasAD())).doubleValue();
						douNPersonasTotAD += (new Double(""+horas.getNumPersonasAD())).doubleValue();
						douImpManoObraAD += ((new Double (""+horas.getNumHorasAD())).doubleValue()*(new Double (""+horas.getImpHoraAD())).doubleValue());

					}// end for
					if (douImpManoObraAD!=0) {
						strImpManoObraAD=dcfFormatterPeople.format(Double.parseDouble(""+douImpManoObraAD));
					}
				}
				String strMaterialAD = "";
				if ((elemento.getMaterialAD()!=null)&&(!elemento.getMaterialAD().equals("null"))) {
					strMaterialAD = dcfFormatterAmount.format(Double.parseDouble(elemento.getMaterialAD()));
				}
				String strOtrosAD = "";
				if ((elemento.getOtrosAD()!=null)&&(!elemento.getOtrosAD().equals("null"))) {
					strOtrosAD = dcfFormatterAmount.format(Double.parseDouble(elemento.getOtrosAD()));
				}
%>

          <td width="4%" class="grantabla11"><%=douNPersonasTotAD%></td>
          <td width="4%" class="grantabla11"><%=douNHorasTotAD%></td>
          <td width="4%" class="<%=strStyle%>">&nbsp;</td>
          <td width="7%" class="grantabla11"><%=strImpManoObraAD%></td>
          <td width="8%" class="<%=strStyle%>"><%=strMaterialAD%></td>
          <td width="7%" class="<%=strStyle%>"> <%=strOtrosAD%></td>
          <td width="7%" class="grantabla7" id="elemento<%=i%>" >&nbsp;</td>
<%
			}// administracion
			}// TA o UO
		} else {
			// No es una orden de trabajo

		 %>
          <td width="4%" class="<%=strStyle%>">&nbsp;</td>
          <td width="4%" class="<%=strStyle%>" id="horas<%=i%>" >&nbsp;</td>
          <td width="4%" class="<%=strStyle%>" id="uds<%=i%>" >&nbsp;</td>
          <td width="7%" class="<%=strStyle%>" id="mo<%=i%>" >&nbsp;</td>
          <td width="8%" class="<%=strStyle%>" id="material<%=i%>" >&nbsp;</td>
          <td width="7%" class="<%=strStyle%>" id="otros<%=i%>" >&nbsp;</td>
          <td width="7%" class="grantabla7" id="elemento<%=i%>" >&nbsp;</td>
<% 		} // del if
%>
        </tr>
<%
 } // del for
 %>
  </table>
       <br>
       <table cellspacing="0" border="1"> 
        <tr>                
         <td width="7%" border="0">&nbsp;</td>
          <td width="7%" border="0">&nbsp;</td>
          <td width="26%" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("tiposDePartidas")%></font></td>
          <td width="15%" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("aAdministracion")%></font></td>
          <td width="4%" border="0" bgcolor="#002751">&nbsp;</td>
          <td colspan="7" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("totales")%></font></td>
        </tr>
        <tr>
          <td width="7%"  border="0">&nbsp;</td>
          <td width="7%"  border="0">&nbsp;</td>
          <td width="26%" border="0">&nbsp;</td>
          <td width="15%" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("uUO")%></font></td>
          <td width="4%" border="0" bgcolor="#002751">&nbsp;</td>
          <td colspan="3" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("unidades")%></font></td>
          <td colspan="4" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("importes")%></font></td>
        </tr>
        <tr>
          <td width="7%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
          <td width="26%" class="grantabla19">&nbsp;</td>
          <td width="15%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("tTantoAlzado")%></b></td>
          <td width="4%">&nbsp;</td>
          <td width="4%" class="grantabla20">&nbsp;</td>
          <td width="4%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("horas")%></font></td>
          <td width="4%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("uO")%></font></td>
          <td width="7%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("mObra")%></font></td>
          <td width="4%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("material")%></font></td>
          <td width="4%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("otros")%></font></td>
          <td width="7%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("TOTAL")%></font></td>
        </tr>
        <tr>
          <td width="7%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
          <td width="26%" class="grantabla20">&nbsp;</td>
          <td width="15%" class="grantabla20">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="4%" class="grantabla20">&nbsp;</td>
          <td width="4%" bgcolor="#f8fFD0" id="TotalHoras" >&nbsp;</td>
          <td width="4%" bgcolor="#f8fFD0" id="TotalUO" >&nbsp;</td>
          <td width="7%" bgcolor="#f8fFD0" id="TotalMO" >&nbsp;</td>
          <td width="4%" bgcolor="#f8fFD0" id="TotalMaterial" >&nbsp;</td>
          <td width="4%" bgcolor="#f8fFD0" id="TotalOtros" >&nbsp;</td>
          <td width="7%" bgcolor="#f8fFD0" id="TotalTotal" >&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<%} //fin mostrar Detalle
// si el estado es denegada se muestran unicamente los elementos de la oferta y los totales
	else {%>
	
<table class="general" cellspacing="0" border="0">
  <tr>
    <td colspan="3" class="introbienve3">
      <table class="general5" cellspacing="0" border="0">                
        <tr>
          <td width="7%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("codigo")%></font></td>
          <td width="7%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("gama")%></font></td>
          <td width="26%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("descripcionElemento")%></font></td>
          <td width="15%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("equipo")%></font></td>
          <td width="15%" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("tip")%></font></td>          
        </tr>   
      </table>
      <table  bgcolor="#f8fFD0" cellspacing="0" border="1">  
  <%
	for (int i=0;i < intNElemento ;i++ ) {

		elemento = _result.getElemento(i);

		String strTipo = elemento.getTipo();
		String strStyle = "grantabla5";

		if ((strTipo==null)||(strTipo.equals("null"))) {
			// NO es una OT
			strTipo="&nbsp;";
		}
		else {
			// es una OT
			strStyle = "grantabla10";
		}

		String strEquipo = elemento.getEquipo();
		if ((strEquipo==null)||(strEquipo.equals("null"))) {
			strEquipo="&nbsp;";
		}

		String strGama = elemento.getGama();
		if ((strGama==null)||(strGama.equals("null"))) {
			strGama="&nbsp;";
		}
		// [SCI 37844] Victor M. Sobrino - 25/04/2005
		int DESCRIPTION_VIEW_MAXLENGTH = 70;
%>
        <tr>
          <td width="7%"  align="center"><%=elemento.getCodigo()%></td>
          <td width="7%"  align="center"><%=strGama%></td>
          <td width="26%"  align="left"><%if(elemento.getDescripcion().length() > DESCRIPTION_VIEW_MAXLENGTH){out.print(elemento.getDescripcion().substring(0,DESCRIPTION_VIEW_MAXLENGTH)+"...");}else{out.print(elemento.getDescripcion());}%></td>
          <td width="15%"  align="center"><%=strEquipo%></td>
          <td width="15%"  align="center"><%=strTipo%></td>
        </tr>
<%
 } // del for
 %>
 </table>
 <table cellspacing="0" border="1"> 
        <tr>
          <td width="7%" >&nbsp;</td>
          <td width="7%" >&nbsp;</td>
          <td width="26%" >&nbsp;</td>
          <td width="15%" >&nbsp;</td>
          <td width="15%" >&nbsp;</td>          
        </tr>       
  <%
  String strNumHorasTotalResumen, strImporteTotalResumen; 
  strNumHorasTotalResumen = _result.getNumHorasTotal();
  strImporteTotalResumen = _result.getImporteTotal();%>    	
         <tr>           
                 	
          <td width="7%" align="right" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("tiposDePartidas")%></font></td>          
          <td width="7%" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("aAdministracion")%></font></td>          
          <td width="26%" border="0">&nbsp;</font></td>                    
          <td colspan="2" border="0" bgcolor="#002751" align="center"><font color="#FFFFFF"><%=traductor.getLiteral("totales")%></font></td>          
        </tr>
        <tr>
          <td width="7%" >&nbsp;</td>                          
          <td width="7%" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("uUO")%></td>
          <td width="26%">&nbsp;</td>
          <td width="20" align="center"  bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("importeTotal")%></font></td>
          <td width="20" align="center"  bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("numHoras")%></font></td>          
        </tr>
        <tr>
          <td width="7%" >&nbsp;</td>
          <td width="7%" border="0" bgcolor="#002751"><font color="#FFFFFF"><%=traductor.getLiteral("tTantoAlzado")%></td>
          <td width="26%" border="0">&nbsp;</td>             
          <td width="20"  bgcolor="#f8fFD0"><%=strImporteTotalResumen%></td>
          <td width="20" bgcolor="#f8fFD0"><%=strNumHorasTotalResumen%></td>          
        </tr>        
      
</table>
<%}// fin mostrar Solo resumen%>
</div>

<div STYLE="display:'none'" ID="cuadroPrecio">
<%if (booMostrarDetalle){
%>

<table class="general" cellspacing="0" border="0">
<tr>
	<td>&nbsp;</td></tr>
	<td bgcolor="#FFFFFF"><font color="#000000"><b><%=traductor.getLiteral("cuadroPrecios")%></b></font></td>
  <tr>
      <td class="introbienve3">
      
        <table class="general3" cellspacing="0" border="1">
          <tr>
            <td  bgcolor="#002751" width="26%"><font color="#FFFFFF"><%=traductor.getLiteral("categoria")%></font></td>
           <td  bgcolor="#002751" width="37%"><font color="#FFFFFF"><%=traductor.getLiteral("tipoHora")%></font></td>
            <td  bgcolor="#002751" width="37%"><font color="#FFFFFF"><%=traductor.getLiteral("importe")%></font></td>
          </tr>
<%
	intNElemento = _result.getCuadroPrecioCount();
	for (int i=0;i < intNElemento ;i++ ) {

		cuadroPrecio = _result.getCuadroPrecio(i);
		String strImpHora = "";
		if ((cuadroPrecio.getImpHora()!=null)&&(!cuadroPrecio.getImpHora().equals("null"))) {
			strImpHora=dcfFormatterAmount.format(Double.parseDouble(cuadroPrecio.getImpHora()));
		}
%>
          <tr>

			<input type="hidden" name="idCuadroCont" value="<%=cuadroPrecio.getIdCuadroCont()%>">
			<input type="hidden" name="optimistLockCP" value="<%=cuadroPrecio.getOptimistLock()%>">
			<input type="hidden" name="idOferCuadro" value="<%=cuadroPrecio.getIdOferCuadro()%>">
			<input type="hidden" name="impHora" value="<%=strImpHora%>">
            <td class="grantabla10" width="26%"><%=cuadroPrecio.getCategoria()%></td>
            <td class="grantabla10" width="37%"><%=cuadroPrecio.getTipoHora()%></td>
            <td class="grantabla34" ><input type="text" name="impHoraContr" value="<%=strImpHora%>" onChange="HAY_CAMBIO = true;" onkeypress="HAY_CAMBIO = true; return soloCifras();" class="inputformulario"  <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
          </tr>
<%
	}// end for
%>


        </table>
      </td>
    </tr>
</table>
</br>
<%}%>
</div>

<div STYLE="display:'none'" ID="unidadObra">
<%if (booMostrarDetalle){
%>

<table class="general" cellspacing="0" border="0">
	<tr>
		<td bgcolor="#FFFFFF"><font color="#000000"><b><%=traductor.getLiteral("unidadesObra")%></td>
	</tr>
</table>
<br>
<table class="general" cellspacing="0" border="1">
    <tr >
      <td class="introbienve3">
        <table class="general3" cellspacing="0" border="1">
          <tr>
            <td  bgcolor="#002751" width="42%"><font color="#FFFFFF"><%=traductor.getLiteral("unidadObra")%></font></td>
            <td bgcolor="#002751" width="58%"><font color="#FFFFFF"><%=traductor.getLiteral("importe")%></font></td>
          </tr>
	</table>
	<table bgcolor="#f8fFD0" cellspacing="0" border="1">
<%
	intNElemento = _result.getPrecioUOCount();
	for (int i=0;i < intNElemento ;i++ ) {

		precioUO = _result.getPrecioUO(i);
		String strImpUnidad = "";
		if ((precioUO.getImpUnidad()!=null)&&(!precioUO.getImpUnidad().equals("null"))) {
			strImpUnidad = dcfFormatterAmount.format(Double.parseDouble(precioUO.getImpUnidad()));
		}
%>
          <tr>			
            <td class="grantabla10" width="42%"><%=precioUO.getDescripcion()%></td>
            <td class="grantabla34" width="58%"><%=strImpUnidad%></td>
          </tr>
<%
	}// end for
%>
        </table>
      </td>
    </tr>
</table>
<%}%>
</div>

</form>
</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              