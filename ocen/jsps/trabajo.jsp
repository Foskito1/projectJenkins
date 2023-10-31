<%@ page language="java" errorPage="cenman_error_salir.jsp" import="java.util.HashMap,com.soluzionasf.ocen.man.revisions_stops.servlets.CenManRPWebDataOfferRequestDOMImpl, com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest, com.soluzionasf.ocen.man.web.domain.CenManWebDetailOffer , com.soluzionasf.ocen.man.web.domain.CenManWebDocumentsOffer, isf.util.log.Log, com.soluzionasf.ocen.man.web.domain.CenManWebShared, com.soluzionasf.ocen.man.web.domain.CenManWebFormatoNumerosHelper"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<jsp:useBean id="cuadroBean" scope="session" class="java.util.Vector" />
<jsp:useBean id="cuadroPreciosBean" scope="session" class="java.util.HashMap" />


<%
	// Limpia la cache
  
	response.setHeader("expires", "0");

	CenManWebDetailOffer offerData = new CenManWebDetailOffer();

	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.Elemento elemento = null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.CuadroPrecio cuadroPrecio= null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.PrecioUO precioUO= null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.Elemento.NHorasAD horas = null;
	//18.12.2007	rsanchezl	
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.ListaCuadros listaCuadros = null;

	CenManRPWebDataOfferRequestDOMImpl _result = null;
	// ICM SCI 055827
	/*
	java.text.DecimalFormat dcfFormatterHours  = null;
	java.text.DecimalFormat dcfFormatterPeople = null;
	java.text.DecimalFormat dcfFormatterAmount = null;
	java.text.DecimalFormat dcfFormatterUnits  = null;
	java.text.DecimalFormat dcfFormatterUnitsTA = null;	
	*/
	java.text.DecimalFormatSymbols dcfSymbols  = null;
	
	String strFormatterHours  = null;
	String strFormatterPeople = null;
	String strFormatterAmount = null;
	String strFormatterUnits  = null;
	String strFormatterUnitsTA = null;	
	// FIN SCI 055827
	
	
	dcfSymbols = new java.text.DecimalFormatSymbols();
	dcfSymbols.setGroupingSeparator('.');
        // ICM SCI 055827 Se modifica la configuración de numeros (Separación de miles y decimales)
				String strDecimalSeparator = CenManWebFormatoNumerosHelper.getDecimalSeparator();
				String strMilesSeparator = CenManWebFormatoNumerosHelper.getMilesSeparator();           
/*
        dcfFormatterAmount = new java.text.DecimalFormat ("###,###.00");
        dcfFormatterPeople = new java.text.DecimalFormat ("###,###");
        dcfFormatterHours  = new java.text.DecimalFormat ("###,###.0");
        dcfFormatterUnits  = new java.text.DecimalFormat ("###,###.00");
        dcfFormatterUnitsTA = new java.text.DecimalFormat ("###,###");                
*/
        strFormatterAmount = "###,##0.00";
        strFormatterPeople = "###,##0";
        strFormatterHours  = "###,##0.0";
        strFormatterUnits  = "###,##0.00";
        strFormatterUnitsTA = "###,##0";        
				// FIN SCI 055827       
	


	String strIdOferta=request.getParameter("idOferta");
	
	_result = offerData.obtainOffer(Long.parseLong(strIdOferta),""+contractor.getContractCode());
	
	//18.12.2007	rsanchezl
	String precios = "No";
	if(request.getParameter("Precios")!=null){
		precios = (String)request.getParameter("Precios");
	}
	String copia = "No";
	if(request.getParameter("copia")!=null){
		copia = (String)request.getParameter("copia");
	}
	String strImpHoraOferta = "";
	if(precios.equals("Si") && copia.equals("Si")){
		//Actualizamos precio oferta con los de la copia
		int cont = _result.getListaCuadrosCount();
		for (int i=0;i < cont ;i++ ) {
			listaCuadros = _result.getListaCuadros(i);
			//Actualizamos el HashMap		
			strImpHoraOferta = "";		
			if ((listaCuadros.getImpHora()!=null)&&(!listaCuadros.getImpHora().equals("null"))) {
				strImpHoraOferta=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,listaCuadros.getImpHora().doubleValue());
			}
			cuadroPreciosBean.put(listaCuadros.getDesCategoria(),strImpHoraOferta);
		}
	}else if(precios.equals("No")){
		//Actualizamos precio oferta con los que venía por defecto
		cuadroPreciosBean = new HashMap();
		int cont = _result.getCuadroPrecioCount();
		for (int i=0;i < cont ;i++ ) {
			cuadroPrecio = _result.getCuadroPrecio(i);
			//Actualizamos el HashMap		
			strImpHoraOferta = "";	
			if ((cuadroPrecio.getImpHora()!=null)&&(!cuadroPrecio.getImpHora().equals("null"))) {
				strImpHoraOferta=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(cuadroPrecio.getImpHora()));
			}
			cuadroPreciosBean.put(cuadroPrecio.getCategoria(),strImpHoraOferta);
		}
	}
	//18.12.2007	FIN rsanchezl
		
	// ICM  SCI 054705 	  
  String strCodEstado;   
  strCodEstado = _result.getCodEstado ();
  // ICM  SCI 054705 
  
	//cuadroBean.addElement(_result);
	cuadroBean.insertElementAt(_result,0);

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
	String strFechaEnvio = (String)session.getValue("fechaEnvio");
	boolean boo_isMod   	= ((Boolean)session.getValue("boo_isMod")).booleanValue();
	// ICM SCI 055827
	String strNombreContratista = contractor.getContractName();
	
		System.out.println("errrrrrrrrr9");

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
	if (strFechaLimite == null || strFechaLimite.equals("") ){
		strFechaLimite="";		
	}
	// FIN SCI 052234
	
	// ICM SCI 054705
	if (strDesEstado == null || strDesEstado.equals("") ){
		strDesEstado="";		
	}
	// FIN SCI 054705

	// ICM SCI 052234
		if (strFechaEnvio == null || strFechaEnvio.equals("") ){
			strFechaEnvio="";		
	}
	// FIN SCI 052234
	// AMY (Parte de obtención de documentos de una oferta)
	
	CenManWebDocumentsOffer dataDocuments = new CenManWebDocumentsOffer();
	String strDocuments[][] = dataDocuments.obtainDocuments(Long.parseLong(strIdOferta));
	
%>
<html>
<head>
<title></title>
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
var totales = new Array (<%=intNElemento%>);
	<%
		for (int i=0;i<intNElemento;i++) {
/* SCI ICM 052244 Se añade una nueva posición en el array de totales. Dicha posición contiene el importe total de las unidades de obra de un elemento */
			%>
totales [<%=i%>] = new Array (<%=douTotales[i][0]%>,<%=douTotales[i][1]%>,<%=douTotales[i][2]%>,<%=douTotales[i][3]%>,<%=douTotales[i][4]%>,<%=douTotales[i][5]%>,<%=douTotales[i][6]%>);	<%
		}
	%>

<%// ICM SCI 060095%>
var ventanaDetalle; // ventana emergente
var strDetalleElementoOferta; // detalle del elemento de la oferta
function abrirVentanaDetalle (x1,y1, strDetalle ) { 
	strDetalleElementoOferta = strDetalle; 
	ventanaDetalle=window.open('cenman_inf_ot.jsp','winDetalleOt','toolbar=no,resizable=yes,status=no,location=no,scrollbars=auto,menubar=no,width=450,height=60');			
	ventanaDetalle.moveTo(x1,y1);
	ventanaDetalle.focus();	
	
}
function cargarInformacionDetalle(){
	ventanaDetalle.detalleOT.innerText=strDetalleElementoOferta;
}

function cambiarImagen (obj,urlImg){
	obj.src = urlImg;
	
}
<%// FIN SCI 060095%>

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
		String strTotalParcial = "0";
		for (int i=0;i<intNElemento;i++) {
			if (douTotales[i][5]==1) {
			/* SCI ICM 052244 Se suma al elemento que contiene la suma de los totales el importe  de las unidades de obra de cada uno de los elementos */
				strTotalParcial = " + parseFloat(totales["+ i +"][2])+parseFloat(totales[ " + i + "][3])+parseFloat(totales[" + i + "][4])+parseFloat(totales["+i+"][6])";   
			%>					
			
			elemento<%=i%>.innerText =formatNumero(parseFloat(totales[<%=i%>][2])+parseFloat(totales[<%=i%>][3])+parseFloat(totales[<%=i%>][4])+parseFloat(totales[<%=i%>][6]),2);			
			<%			
			
			//ICM SCI 055830. Permite cacular el coste total de la oferta realizada por el contratista
			//strTotalTotal = strTotalTotal + "  + parseFloat(elemento" + i+ ".innerText) ";	
			strTotalTotal = strTotalTotal + strTotalParcial;
			}
		}
	// ICM SCI 055830. Permite cacular el coste total de la oferta realizada por el contratista
	%>		
	TotalTotal.innerText =formatNumero(<%=strTotalTotal%>,2);
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

				   elemento<%=i%>.innerText= formatNumero(<%=strTotalColumna%>,2); <%				   
					strTotalColumna= "0";
				}
				if (!strCadenaSumaMaterial.equals("0")) {
					strTotalMaterial += ("+"+strCadenaSumaMaterial);
			%>
				   material<%=i%>.innerText = formatNumero(<%=strCadenaSumaMaterial%>,2); <%
					strCadenaSumaMaterial="0";
				}
				if (!strCadenaSumaOtros.equals("0")) {
					strTotalOtros += ("+"+strCadenaSumaOtros);
			%>
				   otros<%=i%>.innerText = formatNumero(<%=strCadenaSumaOtros%>,2); <%
					strCadenaSumaOtros="0";
				}
				if (!strCadenaSumaMO.equals("0")) {
					strTotalMO += ("+"+strCadenaSumaMO);

			%>
				   mo<%=i%>.innerText = formatNumero(<%=strCadenaSumaMO%>,2); <%
					strCadenaSumaMO="0";
				}
				if (!strCadenaSumaHoras.equals("0")) {
					strTotalHoras += ("+"+strCadenaSumaHoras);
			%>
				   horas<%=i%>.innerText = formatNumero(<%=strCadenaSumaHoras%>,1); <%
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
	TotalHoras.innerText = formatNumero(<%=strTotalHoras%>,1);
	TotalUO.innerText = formatNumero(<%=strTotalUO%>,2);
	TotalMO.innerText = formatNumero(<%=strTotalMO%>,2);
	TotalMaterial.innerText = formatNumero(<%=strTotalMaterial%>,2);
	TotalOtros.innerText = formatNumero(<%=strTotalOtros%>,2);	

}

function actualizarInicial() {	
	parent.creaExport.document.location.href="creaExport.jsp?idOferta=<%=strIdOferta%>";	

}
function actualizarInicialDetalle() {	
	parent.creaExport.document.location.href="creaExport.jsp?idOferta=<%=strIdOferta%>";
	actualizaColumnaTotales();
	actualizaFilasCabecera();

}

function actualizar (fila,columna,valor) {
	//var strNumero = valor.replace('<%=strMilesSeparator%>', '').replace('<%=strDecimalSeparator%>','.');
	var strNumero = getNumber(valor);
	if (isNaN(strNumero)) {		
		valor='0'+'<%=strDecimalSeparator%>'+'0';
	}
	if (valor =='') {		
		valor='0'+'<%=strDecimalSeparator%>'+'0';
	}	
	totales[fila][columna]=strNumero;
	actualizaColumnaTotales();
	actualizaFilasCabecera();

}

function enviaOfertaCliente() {
	if (confirm ('<%=traductor.getLiteral("msgConfirmarEnvioOferta")%>')) {
		document.enviaOferta.flgSalvarEnviar.value='E'
		document.enviaOferta.submit();
	}
}


function salvaOfertaCliente() {

        document.enviaOferta.flgSalvarEnviar.value='S'; <%// ICM SCI 054705 %>
        document.enviaOferta.submit();<%// ICM SCI 054705 %>
}

function volverLista()
{
	parent.navegacion.document.location.href="./lateral.jsp";
	parent.pieframe.document.location.href="./pievacio.htm";
	document.location.href="./cenman_offer_list_index.jsp"; <%// ICM SCI 054705 %>
}
//18.12.2007	rsanchezl Acceso a ventana de precios
function verPrecios(){
	parent.pieframe.document.location.href="./pie_precios.jsp";
	parent.navegacion.document.location.href="./lateral1_precios.jsp";
	document.enviaOferta.action="precios.jsp?idOferta=<%=strIdOferta%>";
	
	document.enviaOferta.submit();
}
//FIN 18.12.2007	rsanchezl Acceso a ventana de precios

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
//18.12.2007	rsanchezl	Al volver de precios, movernos a la pestaña Cuadro de Precios
function seleccionaPestanya(){
	if('<%=precios%>'=='Si'){
		document.getElementById("ordenTrabajo").style.display = 'none'
		document.getElementById("cuadroPrecio").style.display = ''
		document.getElementById("unidadObra").style.display = 'none'
		document.getElementById("documentos").style.display = 'none'
	}
}
//FIN 18.12.2007	rsanchezl	Al volver de precios, movernos a la pestaña Cuadro de Precios
</script>

</head>
<%
//INICIO ICM SCI 054705. Unicamente hay que mostrar el detalle completo de una oferta si
// no se encuentra en estado denegada
boolean booMostrarDetalle = true;
if ( strCodEstado.equals(CenManWebShared.getRpDenegada())  ) {
 booMostrarDetalle = false;
}
%>
<!--18.12.2007	rsanchezl	en el onLoad, seleccionar la pestaña de Cuadro de Precios-->
<body class="new4" onLoad="seleccionaPestanya();actualizarInicial<%if (booMostrarDetalle) {%>Detalle<%}%>()">
<!--FIN 18.12.2007	rsanchezl	en el onLoad, seleccionar la pestaña de Cuadro de Precios-->

<div ID="ordenTrabajo">
<form name='showdoc' action='/servlet/com.soluzionasf.ocen.man.web.servlets.CenManWebShowDocServlet' target="_blank" method='post'>
	<input type="hidden" name="doc" value="">
</form>
<form name='enviaOferta' action='saveOffer.jsp' method='post'>
<input type="hidden" name="flgSalvarEnviar" value="S">



<table class="general" cellspacing="0" border="0">
  <tr><td>&nbsp;</td></tr>
  <tr>
  	</tr><td colspan="2" class="grantabla27"><%=traductor.getLiteral("cabeceraDetalle")%>&nbsp;&nbsp;<%=strCodOffer%></td>
  </tr>
  </tr>
</table>

<table class="general" cellspacing="0" border="0">
<!--  <tr>
  	</tr><td colspan="2">&nbsp;</td>
  </tr> -->
  <tr>
  	<td width="2%" >&nbsp;</td>  
    <td width="15%" class="grantabla"><%=traductor.getLiteral("codigo")%>:</td>
    <td width="1%" class="grantabla28">&nbsp;</td>    
		<td width="35%" class="grantabla28"><%=strCodOffer%></td>		  
  	<td width="1%" class="grantabla">&nbsp;</td>  
		<td width="15%" class="grantabla"><%=traductor.getLiteral("version")%>:</td>
    <td width="1%" class="grantabla28">&nbsp;</td>    
		<td width="35%" class="grantabla28"><%=strNumVersion%>	
	</td>  
  <tr>
    <td width="2%" >&nbsp;</td>  
    <td width="15%" class="grantabla"><%=traductor.getLiteral("descripcion")%>:</td>
    <td width="1%" class="grantabla28">&nbsp;</td>    
		<td width="35%" class="grantabla28"><%=strDescripcion%></td>	
		<td width="1%" class="grantabla">&nbsp;</td>  
		<td width="15%" class="grantabla"><%=traductor.getLiteral("expediente")%>:</td>
    <td width="1%" class="grantabla28">&nbsp;</td>
    <td width="35%" class="grantabla28"><%=strExpediente%></td>    
  </tr>  
  <tr>  
  	<%// INICIO ICM SCI 054705%>
    <td width="2%" >&nbsp;</td>  
    <td width="15%" class="grantabla"><%=traductor.getLiteral("fechaEnvio")%>:</td>
    <td width="1%" class="grantabla28">&nbsp;</td>    
		<td width="35%" class="grantabla28"><%=strFechaEnvio%></td>  	
    <td width="1%" class="grantabla">&nbsp;</td>      
		<td width="15%" class="grantabla"><%=traductor.getLiteral("estado")%>:</td>
    <td width="1%" class="grantabla28">&nbsp;</td>    
		<td width="35%" class="grantabla28"><%=strDesEstado%></td>  					
		<%// FIN ICM SCI 054705%> 
	</tr>  	
	<tr>   	
		<%// INICIO ICM SCI 052234%> 		
		<td width="2%" >&nbsp;</td>  
    <td width="15%" class="grantabla"><%=traductor.getLiteral("fechaLimite")%>:</td>
    <td width="1%" class="grantabla28">&nbsp;</td>    
		<td width="35%" class="grantabla28"><%=strFechaLimite%></td>
		<td width="1%" class="grantabla">&nbsp;</td>  
		<%//ICM SCI 055827 - Se añade Nombre Contratista en el detalle%>
    <td width="15%" class="grantabla"><%=traductor.getLiteral("contratista")%>:</td>
    <td width="1%" class="grantabla28">&nbsp;</td>    
		<td width="35%" class="grantabla28"><%=strNombreContratista%></td>  			
		<%// FIN ICM SCI 052234%>       
</table>


<%
// INICIO ICM SCI 054705. Si la oferta esta denegada no hay que mostrar toda la información
// únicamente los totales
if (booMostrarDetalle){
%>

<table class="general" cellspacing="0" border="0">
  <tr>
    <td colspan="3" class="introbienve3">
      <table class="general5" cellspacing="0" border="0">        
        <tr>
          <td colspan="5">&nbsp;</td>
          <td colspan="3" class="grantabla30"><%=traductor.getLiteral("unidades")%></td>
          <td colspan="4" class="grantabla30"><%=traductor.getLiteral("importe")%></td>
        </tr>        
        <tr>
          <td width="7%" class="grantabla29"><%=traductor.getLiteral("codigo")%></td>
          <td width="7%" class="grantabla29"><%=traductor.getLiteral("gama")%></td>
          <td width="26%" class="grantabla29"><%=traductor.getLiteral("descripcionElemento")%></td>
          <td width="15%" class="grantabla29"><%=traductor.getLiteral("equipo")%></td>
          <td width="2%" class="grantabla29"><%=traductor.getLiteral("tip")%></td>
          <td width="6%" class="grantabla29"><%=traductor.getLiteral("numPersonas")%></td>
          <td width="6%" class="grantabla29"><%=traductor.getLiteral("horas")%></td>
          <td width="6%" class="grantabla29"><%=traductor.getLiteral("uds")%></td>
          <td width="6%" class="grantabla29"><%=traductor.getLiteral("mo")%></td>
          <td width="6%" class="grantabla29"><%=traductor.getLiteral("uds")%></td>
          <td width="6%" class="grantabla29"><%=traductor.getLiteral("otros")%></td>
          <td width="6%" class="grantabla31"><%=traductor.getLiteral("total")%></td>
        </tr>
<%
	for (int i=0;i < intNElemento ;i++ ) {

		elemento = _result.getElemento(i);

		String strTipo = elemento.getTipo();
		String strStyle = "grantabla5";
	boolean boo_isOt = false;
		if ((strTipo==null)||(strTipo.equals("null"))) {
			// NO es una OT
			strTipo="&nbsp;";
		}
		else {
			// es una OT
			strStyle = "grantabla10";
			boo_isOt= true;
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
          <td width="7%" class="<%=strStyle%>"><%=elemento.getCodigo()%></td>
          <td width="7%" class="<%=strStyle%>"><%=strGama%></td>
          
          <%// ICM SCI 060095 Se crea un enlace cuando la descripción supera el limite establecido%>
          <td width="26%" class="<%=strStyle%>"><%if(elemento.getDescripcion().length() > DESCRIPTION_VIEW_MAXLENGTH){out.print(elemento.getDescripcion().substring(0,DESCRIPTION_VIEW_MAXLENGTH));%><a class="enlaceOT" href="javascript:void(0);"  onclick="x=event.screenX + 50;y=event.screenY;  abrirVentanaDetalle(x,y,'<%=elemento.getDescripcion()%>');">&nbsp;<img border="0" align="absmiddle" src="../images/mas.gif" onMouseOver="cambiarImagen(this,'../images/mas2.gif');" onMouseOut="javascript:cambiarImagen(this,'../images/mas.gif');" height="13" alt="<%=traductor.getLiteral("verDescripcionCompleta")%>"></a><%}else{out.print(elemento.getDescripcion());}%></a></td>
          <td width="15%" class="<%=strStyle%>"><%=strEquipo%></td>
          <td width="4%" class="<%=strStyle%>"><%=strTipo%></td>
<%
		if (!strTipo.equals("&nbsp;")) {
			if (strTipo.equals("T")) {
			// Tanto Alzado

			String strNPersonasTA="";
			if ((elemento.getNPersonasTA()!=null)&&(!elemento.getNPersonasTA().equals("null"))) {
				//strNPersonasTA=dcfFormatterPeople.format(Double.parseDouble(elemento.getNPersonasTA()));
				strNPersonasTA=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterPeople,Double.parseDouble(elemento.getNPersonasTA()));
			}
			String strHorasTA="";
			if ((elemento.getHorasTA()!=null)&&(!elemento.getHorasTA().equals("null"))) {				
				//strHorasTA=dcfFormatterHours.format(Double.parseDouble(elemento.getHorasTA()));
				strHorasTA=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterHours,Double.parseDouble(elemento.getHorasTA()));				
			}
			String strUnidadesTA="";
			if ((elemento.getUnidadesTA()!=null)&&(!elemento.getUnidadesTA().equals("null"))) {
				//strUnidadesTA=dcfFormatterUnitsTA.format(Double.parseDouble(elemento.getUnidadesTA()));
				strUnidadesTA=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterUnitsTA,Double.parseDouble(elemento.getUnidadesTA()));
			}
			String strManoObraTA="";
			if ((elemento.getManoObraTA()!=null)&&(!elemento.getManoObraTA().equals("null"))) {
				//strManoObraTA=dcfFormatterAmount.format(Double.parseDouble(elemento.getManoObraTA()));
				strManoObraTA=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(elemento.getManoObraTA()));
			}
%>
<input type="hidden" name="idOferElemTA" value="<%=elemento.getIdOferElem()%>">
<input type="hidden" name="idOferTA" value="<%=elemento.getIdOferTA()%>">
<input type="hidden" name="optimistLockTA" value="<%=elemento.getOptimistLockTA()%>">
	  <td width="4%" class="campotexto"><input type="text" value ="<%=strNPersonasTA%>" name="numPersonasTA" maxlength="3" onChange="HAY_CAMBIO = true;" onblur="checkDecimal(this,3,0)"  onfocus="modoEdicion(this);" onkeypress="HAY_CAMBIO = true; return soloCifras();" class="inputformulario4" <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
          <td width="4%" class="campotexto"><input type="text" value ="<%=strHorasTA%>" name="numHorasTA" onChange="HAY_CAMBIO = true;" onblur="checkDecimal(this,4,1);actualizar(<%=i%>,0,value)" onfocus="modoEdicion(this);" onkeypress="HAY_CAMBIO = true; return soloCifras(); " maxlength="6" class="inputformulario4" <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
          <td width="4%" class="campotexto"><input type="text" onChange="HAY_CAMBIO = true;" onblur="checkDecimal(this,3,0);actualizar(<%=i%>,1,value)"  onfocus="modoEdicion(this);"  value ="<%=strUnidadesTA%>" name="unidadesTA" onkeypress="HAY_CAMBIO = true;return soloCifras(); " maxlength="3" class="inputformulario4"  <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
          <td width="7%" class="campotexto"><input type="text" onChange="HAY_CAMBIO = true;" onblur="checkDecimal(this,11,2);actualizar(<%=i%>,2,value)"  onfocus="modoEdicion(this);"  value ="<%=strManoObraTA%>" name="manoObraTA" onkeypress="HAY_CAMBIO = true; return soloCifras();" maxlength="15" class="inputformulario4"  <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
          <td width="8%" class="<%=strStyle%>">&nbsp;</td>
          <td width="7%" class="<%=strStyle%>">&nbsp;</td>
          <td width="7%" class="grantabla7" id="elemento<%=i%>">&nbsp;</td>
<%			}
			else {
			if (strTipo.equals ("U")) {
			// Unidades Obra

			String strNumUO="&nbsp;";
			if ((elemento.getNumUO()!=null)&&(!elemento.getNumUO().equals("null"))) {
				//strNumUO = dcfFormatterUnits.format(Double.parseDouble(elemento.getNumUO())); // ICM SCI 055818 Se modifica el objeto utilizado para dar formato
				strNumUO=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterUnits,Double.parseDouble(elemento.getNumUO()));
			}

			String strNumPersonasUO="";
			if ((elemento.getNPersonasUO()!=null)&&(!elemento.getNPersonasUO().equals("null"))) {
				//strNumPersonasUO = dcfFormatterPeople.format(Double.parseDouble(elemento.getNPersonasUO()));
				strNumPersonasUO=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterPeople,Double.parseDouble(elemento.getNPersonasUO()));
			}

			String strNumHorasUO="";
			if ((elemento.getHorasUO()!=null)&&(!elemento.getHorasUO().equals("null"))) {
				//strNumHorasUO = dcfFormatterHours.format(Double.parseDouble(elemento.getHorasUO()));
				strNumHorasUO=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterHours,Double.parseDouble(elemento.getHorasUO()));				
			}
%>
<input type="hidden" name="idOferElemUO" value="<%=elemento.getIdOferElem()%>">
<input type="hidden" name="idOferUO" value="<%=elemento.getIdOferUO()%>">
<input type="hidden" name="optimistLockUUOO" value="<%=elemento.getOptimistLockUO()%>">
	      <td width="4%" class="campotexto"><input type="text" value ="<%=strNumPersonasUO%>" name="numPersonasUO" onblur="checkDecimal(this,3,0)"  onfocus="modoEdicion(this);"  onkeypress="return soloCifras();" maxlength="3" class="inputformulario4"  <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
          <td width="4%" class="campotexto"><input type="text" onblur="checkDecimal(this,4,1);actualizar(<%=i%>,0,value)"  onfocus="modoEdicion(this);" value ="<%=strNumHorasUO%>" onkeypress="return soloCifras();" maxlength="6" name="numHorasUO" class="inputformulario4"  <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
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
				String strNHorasTotAD = "";
				String strNPersonasTotAD = "";
				if (elemento.getNHorasADCount()>0) {

					for (int j=0;j<elemento.getNHorasADCount();j++) {
						horas=elemento.getNHorasAD(j);

						douNHorasTotAD += (new Double(""+horas.getNumHorasAD())).doubleValue();
						douNPersonasTotAD += (new Double(""+horas.getNumPersonasAD())).doubleValue();
						douImpManoObraAD += ((new Double (""+horas.getNumHorasAD())).doubleValue()*(new Double (""+horas.getImpHoraAD())).doubleValue());

					}// end for
					//strNHorasTotAD += dcfFormatterHours.format(Double.parseDouble(""+douNHorasTotAD));
					strNHorasTotAD=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterHours,Double.parseDouble(""+douNHorasTotAD));
					//strNPersonasTotAD += dcfFormatterPeople.format(Double.parseDouble(""+douNPersonasTotAD));					
					strNPersonasTotAD=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterPeople,Double.parseDouble(""+douNPersonasTotAD));
					if (douImpManoObraAD!=0) {
						//strImpManoObraAD=dcfFormatterAmount.format(Double.parseDouble(""+douImpManoObraAD));
						strImpManoObraAD=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(""+douImpManoObraAD));
					}
				}
				String strMaterialAD = "";
				if ((elemento.getMaterialAD()!=null)&&(!elemento.getMaterialAD().equals("null"))) {
					//strMaterialAD = dcfFormatterAmount.format(Double.parseDouble(elemento.getMaterialAD()));
					strMaterialAD=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(elemento.getMaterialAD()));
				}
				String strOtrosAD = "";
				if ((elemento.getOtrosAD()!=null)&&(!elemento.getOtrosAD().equals("null"))) {
					//strOtrosAD = dcfFormatterAmount.format(Double.parseDouble(elemento.getOtrosAD()));
					strOtrosAD=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(elemento.getOtrosAD()));											
				}
%>
<input type="hidden" name="idOferElemAD" value="<%=elemento.getIdOferElem()%>">
<input type="hidden" name="idOferAD" value="<%=elemento.getIdOferAD()%>">
<input type="hidden" name="optimistLockAD" value="<%=elemento.getOptimistLockAD()%>">

          <td width="4%" class="grantabla11"><%=strNPersonasTotAD%></td>
          <td width="4%" class="grantabla11"><%=strNHorasTotAD%></td>
          <td width="4%" class="<%=strStyle%>">&nbsp;</td>
          <td width="7%" class="grantabla11"><%=strImpManoObraAD%></td>
          <td width="8%" class="campotexto"><input type="text" onblur="checkDecimal(this,7,2);actualizar(<%=i%>,3,value)"  onfocus="modoEdicion(this);" maxlength="11" value="<%=strMaterialAD%>" onkeypress="return soloCifras();" name="materialAD" class="inputformulario4"  <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
          <td width="7%" class="campotexto"><input type="text" onblur="checkDecimal(this,7,2);actualizar(<%=i%>,4,value)"  onfocus="modoEdicion(this);" maxlength="11" value="<%=strOtrosAD%>" onkeypress="return soloCifras();" name="otrosAD" class="inputformulario4"  <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
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
        <tr>
          <td width="7%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
          <td width="26%">&nbsp;</td>
          <td width="15%">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
        </tr>
        <tr>
          <td width="7%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
          <td width="26%" class="grantabla19"><%=traductor.getLiteral("tiposDePartidas")%></td>
          <td width="15%" class="grantabla20"><%=traductor.getLiteral("aAdministracion")%></td>
          <td width="4%">&nbsp;</td>
          <td colspan="7" class="grantabla32"><%=traductor.getLiteral("totales")%></td>
        </tr>
        <tr>
          <td width="7%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
          <td width="26%" class="grantabla19">&nbsp;</td>
          <td width="15%" class="grantabla20"><%=traductor.getLiteral("uUO")%></td>
          <td width="4%">&nbsp;</td>
          <td colspan="3" class="grantabla22"><%=traductor.getLiteral("unidades")%></td>
          <td colspan="4" class="grantabla23"><%=traductor.getLiteral("importe")%></td>
        </tr>
        <tr>
          <td width="7%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
          <td width="26%" class="grantabla19">&nbsp;</td>
          <td width="15%" class="grantabla20"><%=traductor.getLiteral("tTantoAlzado")%></td>
          <td width="4%">&nbsp;</td>
          <td width="4%" class="grantabla20">&nbsp;</td>
          <td width="4%" class="grantabla24"><%=traductor.getLiteral("horas")%></td>
          <td width="4%" class="grantabla24"><%=traductor.getLiteral("uO")%></td>
          <td width="7%" class="grantabla24"><%=traductor.getLiteral("mObra")%></td>
          <td width="4%" class="grantabla24"><%=traductor.getLiteral("material")%></td>
          <td width="4%" class="grantabla24"><%=traductor.getLiteral("otros")%></td>
          <td width="7%" class="grantabla25"><%=traductor.getLiteral("TOTAL")%></td>
        </tr>
        <tr>
          <td width="7%">&nbsp;</td>
          <td width="7%">&nbsp;</td>
          <td width="26%" class="grantabla20">&nbsp;</td>
          <td width="15%" class="grantabla20">&nbsp;</td>
          <td width="4%">&nbsp;</td>
          <td width="4%" class="grantabla20">&nbsp;</td>
          <td width="4%" class="grantabla17" id="TotalHoras" >&nbsp;</td>
          <td width="4%" class="grantabla17" id="TotalUO" >&nbsp;</td>
          <td width="7%" class="grantabla17" id="TotalMO" >&nbsp;</td>
          <td width="4%" class="grantabla17" id="TotalMaterial" >&nbsp;</td>
          <td width="4%" class="grantabla17" id="TotalOtros" >&nbsp;</td>
          <td width="7%" class="grantabla18" id="TotalTotal" >&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%} //fin mostrar Detalle
// si el estado es denegada se muestran unicamente los elementos de la oferta y los totales
	else {
%>
<table class="general" cellspacing="0" border="0">
  <tr>
    <td colspan="3" class="introbienve3">
      <table class="general5" cellspacing="0" border="0">                
        <tr>
          <td width="10%" class="grantabla29"><%=traductor.getLiteral("codigo")%></td>
          <td width="15%" class="grantabla29"><%=traductor.getLiteral("gama")%></td>
          <td width="40%" class="grantabla29"><%=traductor.getLiteral("descripcionElemento")%></td>
          <td width="25%" class="grantabla29"><%=traductor.getLiteral("equipo")%></td>
          <td width="10%" class="grantabla29"><%=traductor.getLiteral("tip")%></td>          
        </tr>
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
          <td width="10%" class="<%=strStyle%>"><%=elemento.getCodigo()%></td>
          <td width="15%" class="<%=strStyle%>"><%=strGama%></td>
          <td width="40%" class="<%=strStyle%>"><%if(elemento.getDescripcion().length() > DESCRIPTION_VIEW_MAXLENGTH){out.print(elemento.getDescripcion().substring(0,DESCRIPTION_VIEW_MAXLENGTH)+"...");}else{out.print(elemento.getDescripcion());}%></td>
          <td width="25%" class="<%=strStyle%>"><%=strEquipo%></td>
          <td width="10%" class="<%=strStyle%>R"><%=strTipo%></td>
        </tr>
<%
 } // del for
 %>
        <tr>
          <td width="10%" >&nbsp;</td>
          <td width="15%" >&nbsp;</td>
          <td width="40%" >&nbsp;</td>
          <td width="25%" >&nbsp;</td>
          <td width="10%" >&nbsp;</td>          
        </tr>      
      </table>
    </td>
  </tr>
  <tr>
  <%
  String strNumHorasTotalResumen, strImporteTotalResumen; 
  // ICM SCI strNumHorasTotalResumen = _result.getNumHorasTotal();
  //ICM SCI strImporteTotalResumen = _result.getImporteTotal();
  strNumHorasTotalResumen=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterHours,Double.parseDouble(_result.getNumHorasTotal()));
  strImporteTotalResumen=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(_result.getImporteTotal()));
  %>  
  	<td colspan="3" class="introbienve3">
      <table class="general5" cellspacing="0" border="0">                        
         <tr>          
          <td width="5%">&nbsp;</td>
          <td width="25%" class="grantabla19"><%=traductor.getLiteral("tiposDePartidas")%></td>
          <td width="25%" class="grantabla20"><%=traductor.getLiteral("aAdministracion")%></td>
          <td width="5%">&nbsp;</td>
          <td colspan="2" class="grantabla32"><%=traductor.getLiteral("totales")%></td>
          <td width="5%">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%">&nbsp;</td>
          <td width="25%" class="grantabla19">&nbsp;</td>          
          <td width="25%" class="grantabla20"><%=traductor.getLiteral("uUO")%></td>
          <td width="5%">&nbsp;</td>
          <td width="20%" class="grantabla22" align="center"><%=traductor.getLiteral("importeTotal")%></td>
          <td width="20%" class="grantabla23" align="center"><%=traductor.getLiteral("numHoras")%></td>
          <td width="5%">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%">&nbsp;</td>
          <td width="25%" class="grantabla19">&nbsp;</td>          
          <td width="25%" class="grantabla20"><%=traductor.getLiteral("tTantoAlzado")%></td>
          <td width="5%">&nbsp;</td>
          <td width="20%" class="grantabla17"><%=strImporteTotalResumen%></td>
          <td width="20%" class="grantabla18"><%=strNumHorasTotalResumen%></td>
          <td width="5%">&nbsp;</td>
        </tr>        
      </table>
  </tr>
</table>
<%}%>
</div>

<div STYLE="display:'none'" ID="cuadroPrecio">
<table class="general" cellspacing="0" border="0">
<tr><td>&nbsp;</td></tr><td colspan="2" class="grantabla33"><%=traductor.getLiteral("cuadroPrecios")%></td>
  <tr>
      <td class="introbienve3">
      
        <table class="general3" cellspacing="0" border="0">
          <tr>
            <td class="grantabla29" width="20%"><%=traductor.getLiteral("codigo")%></td>
            <td class="grantabla29" width="15%"><%=traductor.getLiteral("flagCP")%></td>
            <td class="grantabla29" width="30%"><%=traductor.getLiteral("descripcion")%></td>
          </tr>
          <tr>
          <%--18.12.2007 rsanchezl	Enlace a pantalla de precios--%>
          <%if (_result.getFlagCPG().equals("1")) {%>
            <td class="grantabla10" width="20%"><a href="#" onClick="verPrecios()" class="resaltar"><%=_result.getCodigoCP()%></a></td>
          <%}else{%>
            <td class="grantabla10" width="20%"><%=_result.getCodigoCP()%></td>          
          <%}%>
          <%--FIN 18.12.2007 rsanchezl	Enlace a pantalla de precios--%>            
            <td class="grantabla10" width="15%">
            <input type="checkbox" name="flgDuplicado" disabled="true"value="" <%if (_result.getFlagCP().equals("1")) {%>checked<%}%>>
            </td>
            <td class="grantabla10" width="65%"><%=_result.getDescripcionCP()%></td>
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
	intNElemento = _result.getCuadroPrecioCount();
	for (int i=0;i < intNElemento ;i++ ) {

		cuadroPrecio = _result.getCuadroPrecio(i);
		String strImpHora = "";
		strImpHoraOferta = "";
		if ((cuadroPrecio.getImpHora()!=null)&&(!cuadroPrecio.getImpHora().equals("null"))) {
				//strImpHora=dcfFormatterAmount.format(Double.parseDouble(cuadroPrecio.getImpHora()));
				strImpHora=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(cuadroPrecio.getImpHora()));
		}
		strImpHoraOferta = (String)cuadroPreciosBean.get(cuadroPrecio.getCategoria());
		
%>
          <tr>

			<input type="hidden" name="idCuadroCont" value="<%=cuadroPrecio.getIdCuadroCont()%>">
			<input type="hidden" name="optimistLockCP" value="<%=cuadroPrecio.getOptimistLock()%>">
			<input type="hidden" name="idOferCuadro" value="<%=cuadroPrecio.getIdOferCuadro()%>">
			<input type="hidden" name="impHora" value="<%=strImpHora%>">
			<input type="hidden" name="categoria" value="<%=cuadroPrecio.getCategoria()%>">
            <td class="grantabla10" width="26%"><%=cuadroPrecio.getCategoria()%></td>
            <td class="grantabla10" width="37%"><%=cuadroPrecio.getTipoHora()%></td>
            <td class="grantabla34" ><input type="text" name="impHoraContr" value="<%=strImpHora%>" onblur="checkDecimal(this,7,2)" onfocus="modoEdicion(this);" onChange="HAY_CAMBIO = true;" onkeypress="HAY_CAMBIO = true; return soloCifras();" class="inputformulario"  <%if (!boo_isMod) {%> disabled <%}%> tabindex="3" ></td>
          </tr>
<%
	}// end for
%>


        </table>
      </td>
    </tr>
</table>
</div>

<div STYLE="display:'none'" ID="unidadObra">
<table class="general" cellspacing="0" border="0">
<tr><td>&nbsp;</td></tr><td colspan="2" class="grantabla33"><%=traductor.getLiteral("unidadesObra")%></td>
    <tr >
      <td class="introbienve3">
        <table class="general3" cellspacing="0" border="0">
          <tr>
            <td class="grantabla29" width="42%"><%=traductor.getLiteral("unidadObra")%></td>
            <td class="grantabla29" width="58%"><%=traductor.getLiteral("importe")%></td>
          </tr>

<%
	intNElemento = _result.getPrecioUOCount();
	for (int i=0;i < intNElemento ;i++ ) {

		precioUO = _result.getPrecioUO(i);
		String strImpUnidad = "";
		if ((precioUO.getImpUnidad()!=null)&&(!precioUO.getImpUnidad().equals("null"))) {
			//strImpUnidad = dcfFormatterAmount.format(Double.parseDouble(precioUO.getImpUnidad()));
			strImpUnidad=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(precioUO.getImpUnidad()));
		}
%>
          <tr>
			<input type="hidden" name="idOferUuoo" value="<%=precioUO.getIdOferUuoo()%>">
			<input type="hidden" name="idOferContrat" value="<%=precioUO.getIdOferContrat()%>">
			<input type="hidden" name="idUuooContr" value="<%=precioUO.getIdUuooContr()%>">
			<input type="hidden" name="optimistLockUO" value="<%=precioUO.getOptimistLock()%>">
			<input type="hidden" name="impUnidad" value="<%=strImpUnidad%>">
            <td class="grantabla10" width="42%"><%=precioUO.getDescripcion()%></td>
            <td class="grantabla34" width="58%"><input type="text" value="<%=strImpUnidad%>" onblur="checkDecimal(this,7,2)" onfocus="modoEdicion(this);" name="impUnidadContr" onChange="HAY_CAMBIO = true;" onkeypress="HAY_CAMBIO = true; return soloCifras();" class="inputformulario"  <%if (!boo_isMod) {%> disabled <%}%>  tabindex="3"></td>
          </tr>
<%
	}// end for
%>
        </table>
      </td>
    </tr>
</table>
</div>

<div STYLE="display:'none'" ID="documentos">
<table class="general" cellspacing="0" border="0">
<tr><td>&nbsp;</td></tr><td colspan="2" class="grantabla33"><%=traductor.getLiteral("documentos")%></td>
    <tr >
      <td class="introbienve3">
        <table class="general3" cellspacing="0" border="0">
          <tr>
            <td class="grantabla29" width="30%"><%=traductor.getLiteral("codigoDocumento")%></td>
            <td class="grantabla29" width="70%"><%=traductor.getLiteral("tituloDocumento")%></td>
          </tr>

<%
	for (int i=0;i < strDocuments.length ;i++ ) {
%>
	<tr>
		<input type="hidden" name="idDocum<%=i%>" value="<%=strDocuments[i][CenManWebDocumentsOffer._ID_DOCUM]%>">
		<input type="hidden" name="optimistLockDoc<%=i%>" value="<%=strDocuments[i][CenManWebDocumentsOffer._OPTLOCK_DOCUM]%>">
            	<td class="campotexto" width="42%"><a  href="" onClick="muestraDocumento('<%=strDocuments[i][CenManWebDocumentsOffer._ID_DOCUM]%>'); return false;">  <%=strDocuments[i][CenManWebDocumentsOffer._COD_DOCUM]%></a></td>
		<td class="campotexto" width="58%"><%=strDocuments[i][CenManWebDocumentsOffer._TITLE_DOCUM]%></td>
	</tr>	
	
<%
	}// end for
%>

          <tr>
		<input type="hidden" name="idOfer" value="<%=(strDocuments!=null && strDocuments.length>0 ? strDocuments[0][CenManWebDocumentsOffer._ID_OFERTA] : "")%>">
		<input type="hidden" name="optimistLockOfer" value="<%=(strDocuments!=null && strDocuments.length>0 ? strDocuments[0][CenManWebDocumentsOffer._OPTLOCK_OFERTA] : "")%>">
          </tr>
        </table>
      </td>
    </tr>
</table>
</div>


</form>
<div STYLE="display:none" ID="botonera">
<table class="general" cellspacing="0" border="0">
  <tr>
    <td colspan="3">
      <table class="general1" cellspacing="0" border="0" width="100%">
        <tr>
          <td class="boton" width="33%">
            <div align="center">
                <input type="button" onClick="salvaOfertaCliente()" name="Salvar" value="Salvar" class="interior">
            </div>
          </td>
          <td class="boton" width="33%">
            <div align="center">
                <input type="button" onClick="enviaOfertaCliente()" name="Enviar" value="Enviar" class="interior">
            </div>
          </td>

          <td class="boton" width="33%">
            <div align="center">
                <input type="button" onClick="volverLista()" name="Anterior" value="Anterior" class="interior">
            </div>
			<td class="boton" width="33%">
          </td>
          </td>
        </tr>
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