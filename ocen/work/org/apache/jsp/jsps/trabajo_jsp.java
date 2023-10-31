package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashMap;
import com.soluzionasf.ocen.man.revisions_stops.servlets.CenManRPWebDataOfferRequestDOMImpl;
import com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest;
import com.soluzionasf.ocen.man.web.domain.CenManWebDetailOffer;
import com.soluzionasf.ocen.man.web.domain.CenManWebDocumentsOffer;
import isf.util.log.Log;
import com.soluzionasf.ocen.man.web.domain.CenManWebShared;
import com.soluzionasf.ocen.man.web.domain.CenManWebFormatoNumerosHelper;

public final class trabajo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"cenman_error_salir.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      com.soluzionasf.ocen.man.web.domain.CenManContractBean contractor = null;
      synchronized (session) {
        contractor = (com.soluzionasf.ocen.man.web.domain.CenManContractBean) _jspx_page_context.getAttribute("contractor", PageContext.SESSION_SCOPE);
        if (contractor == null){
          contractor = new com.soluzionasf.ocen.man.web.domain.CenManContractBean();
          _jspx_page_context.setAttribute("contractor", contractor, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser traductor = null;
      synchronized (session) {
        traductor = (com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser) _jspx_page_context.getAttribute("traductor", PageContext.SESSION_SCOPE);
        if (traductor == null){
          traductor = new com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser();
          _jspx_page_context.setAttribute("traductor", traductor, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      java.util.Vector cuadroBean = null;
      synchronized (session) {
        cuadroBean = (java.util.Vector) _jspx_page_context.getAttribute("cuadroBean", PageContext.SESSION_SCOPE);
        if (cuadroBean == null){
          cuadroBean = new java.util.Vector();
          _jspx_page_context.setAttribute("cuadroBean", cuadroBean, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      java.util.HashMap cuadroPreciosBean = null;
      synchronized (session) {
        cuadroPreciosBean = (java.util.HashMap) _jspx_page_context.getAttribute("cuadroPreciosBean", PageContext.SESSION_SCOPE);
        if (cuadroPreciosBean == null){
          cuadroPreciosBean = new java.util.HashMap();
          _jspx_page_context.setAttribute("cuadroPreciosBean", cuadroPreciosBean, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

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
	

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("var REDONDEO_DEFECTO = 2; // Redondea a 2 decimales por defecto.\r\n");
      out.write("var DECIMAL = '");
      out.print(strDecimalSeparator);
      out.write("'; // Caracteres usados como separador de decimales y de miles. No deben ser\r\n");
      out.write("var MILES = '");
      out.print(strMilesSeparator);
      out.write("'; // iguales entre sí. Se puede omitir el separador de miles, con MILES = \"\".\r\n");
      out.write("var MSG_NUMERO_INCORRECTO = '");
      out.print(traductor.getLiteral("msgNumeroIncorrecto"));
      out.write("';\r\n");
      out.write("var MSG_FALTA_CAMBIO = '");
      out.print(traductor.getLiteral("msgFaltaCambio"));
      out.write("';\r\n");
      out.write("var HAY_CAMBIO = false; \r\n");
      out.write("var totales = new Array (");
      out.print(intNElemento);
      out.write(");\r\n");
      out.write("\t");

		for (int i=0;i<intNElemento;i++) {
/* SCI ICM 052244 Se añade una nueva posición en el array de totales. Dicha posición contiene el importe total de las unidades de obra de un elemento */
			
      out.write("\r\n");
      out.write("totales [");
      out.print(i);
      out.write("] = new Array (");
      out.print(douTotales[i][0]);
      out.write(',');
      out.print(douTotales[i][1]);
      out.write(',');
      out.print(douTotales[i][2]);
      out.write(',');
      out.print(douTotales[i][3]);
      out.write(',');
      out.print(douTotales[i][4]);
      out.write(',');
      out.print(douTotales[i][5]);
      out.write(',');
      out.print(douTotales[i][6]);
      out.write(')');
      out.write(';');
      out.write('	');

		}
	
      out.write("\r\n");
      out.write("\r\n");
// ICM SCI 060095
      out.write("\r\n");
      out.write("var ventanaDetalle; // ventana emergente\r\n");
      out.write("var strDetalleElementoOferta; // detalle del elemento de la oferta\r\n");
      out.write("function abrirVentanaDetalle (x1,y1, strDetalle ) { \r\n");
      out.write("\tstrDetalleElementoOferta = strDetalle; \r\n");
      out.write("\tventanaDetalle=window.open('cenman_inf_ot.jsp','winDetalleOt','toolbar=no,resizable=yes,status=no,location=no,scrollbars=auto,menubar=no,width=450,height=60');\t\t\t\r\n");
      out.write("\tventanaDetalle.moveTo(x1,y1);\r\n");
      out.write("\tventanaDetalle.focus();\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("function cargarInformacionDetalle(){\r\n");
      out.write("\tventanaDetalle.detalleOT.innerText=strDetalleElementoOferta;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function cambiarImagen (obj,urlImg){\r\n");
      out.write("\tobj.src = urlImg;\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
// FIN SCI 060095
      out.write("\r\n");
      out.write("\r\n");
      out.write("function imprimir(){\r\n");
      out.write("\t\tif(HAY_CAMBIO){\r\n");
      out.write("\t\t\talert(\"");
      out.print(traductor.getLiteral("msgCondicion1Imprimir"));
      out.write("\");\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t\telse{\r\n");
      out.write("\t\t\tself.print();\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("}\t\r\n");
      out.write("function actualizaColumnaTotales()\r\n");
      out.write("{\r\n");
      out.write("\r\n");
      out.write("checkNaN();\r\n");
      out.write("\t");

		String strTotalTotal="0";
		String strTotalParcial = "0";
		for (int i=0;i<intNElemento;i++) {
			if (douTotales[i][5]==1) {
			/* SCI ICM 052244 Se suma al elemento que contiene la suma de los totales el importe  de las unidades de obra de cada uno de los elementos */
				strTotalParcial = " + parseFloat(totales["+ i +"][2])+parseFloat(totales[ " + i + "][3])+parseFloat(totales[" + i + "][4])+parseFloat(totales["+i+"][6])";   
			
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\telemento");
      out.print(i);
      out.write(".innerText =formatNumero(parseFloat(totales[");
      out.print(i);
      out.write("][2])+parseFloat(totales[");
      out.print(i);
      out.write("][3])+parseFloat(totales[");
      out.print(i);
      out.write("][4])+parseFloat(totales[");
      out.print(i);
      out.write("][6]),2);\t\t\t\r\n");
      out.write("\t\t\t");
			
			
			//ICM SCI 055830. Permite cacular el coste total de la oferta realizada por el contratista
			//strTotalTotal = strTotalTotal + "  + parseFloat(elemento" + i+ ".innerText) ";	
			strTotalTotal = strTotalTotal + strTotalParcial;
			}
		}
	// ICM SCI 055830. Permite cacular el coste total de la oferta realizada por el contratista
	
      out.write("\t\t\r\n");
      out.write("\tTotalTotal.innerText =formatNumero(");
      out.print(strTotalTotal);
      out.write(",2);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function checkNaN (){\r\n");
      out.write("\tfor (i=0;i< ");
      out.print(intNElemento);
      out.write(" ;i++) {\r\n");
      out.write("\t\tif (isNaN(totales[i][0])) {\r\n");
      out.write("\t\t\talert (\"Hay un nan en \"+i);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function actualizaFilasCabecera () {\r\n");
      out.write("checkNaN();\r\n");
      out.write("\t");
	String strCadenaSumaMaterial="0";
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
			
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t   elemento");
      out.print(i);
      out.write(".innerText= formatNumero(");
      out.print(strTotalColumna);
      out.write(",2); ");
				   
					strTotalColumna= "0";
				}
				if (!strCadenaSumaMaterial.equals("0")) {
					strTotalMaterial += ("+"+strCadenaSumaMaterial);
			
      out.write("\r\n");
      out.write("\t\t\t\t   material");
      out.print(i);
      out.write(".innerText = formatNumero(");
      out.print(strCadenaSumaMaterial);
      out.write(",2); ");

					strCadenaSumaMaterial="0";
				}
				if (!strCadenaSumaOtros.equals("0")) {
					strTotalOtros += ("+"+strCadenaSumaOtros);
			
      out.write("\r\n");
      out.write("\t\t\t\t   otros");
      out.print(i);
      out.write(".innerText = formatNumero(");
      out.print(strCadenaSumaOtros);
      out.write(",2); ");

					strCadenaSumaOtros="0";
				}
				if (!strCadenaSumaMO.equals("0")) {
					strTotalMO += ("+"+strCadenaSumaMO);

			
      out.write("\r\n");
      out.write("\t\t\t\t   mo");
      out.print(i);
      out.write(".innerText = formatNumero(");
      out.print(strCadenaSumaMO);
      out.write(",2); ");

					strCadenaSumaMO="0";
				}
				if (!strCadenaSumaHoras.equals("0")) {
					strTotalHoras += ("+"+strCadenaSumaHoras);
			
      out.write("\r\n");
      out.write("\t\t\t\t   horas");
      out.print(i);
      out.write(".innerText = formatNumero(");
      out.print(strCadenaSumaHoras);
      out.write(",1); ");

					strCadenaSumaHoras="0";
				}
				if (!strCadenaSumaUD.equals("0")) {
					strTotalUO += ("+"+strCadenaSumaUD);
			
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t   uds");
      out.print(i);
      out.write(".innerText = formatNumero(");
      out.print(strCadenaSumaUD);
      out.write(",2)\t; ");
 // ICM SCI 055818 Se añade un decimal
					strCadenaSumaUD="0";
				}
							
			}
		}// for		
	
      out.write("\r\n");
      out.write("\tTotalHoras.innerText = formatNumero(");
      out.print(strTotalHoras);
      out.write(",1);\r\n");
      out.write("\tTotalUO.innerText = formatNumero(");
      out.print(strTotalUO);
      out.write(",2);\r\n");
      out.write("\tTotalMO.innerText = formatNumero(");
      out.print(strTotalMO);
      out.write(",2);\r\n");
      out.write("\tTotalMaterial.innerText = formatNumero(");
      out.print(strTotalMaterial);
      out.write(",2);\r\n");
      out.write("\tTotalOtros.innerText = formatNumero(");
      out.print(strTotalOtros);
      out.write(",2);\t\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function actualizarInicial() {\t\r\n");
      out.write("\tparent.creaExport.document.location.href=\"creaExport.jsp?idOferta=");
      out.print(strIdOferta);
      out.write("\";\t\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("function actualizarInicialDetalle() {\t\r\n");
      out.write("\tparent.creaExport.document.location.href=\"creaExport.jsp?idOferta=");
      out.print(strIdOferta);
      out.write("\";\r\n");
      out.write("\tactualizaColumnaTotales();\r\n");
      out.write("\tactualizaFilasCabecera();\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function actualizar (fila,columna,valor) {\r\n");
      out.write("\t//var strNumero = valor.replace('");
      out.print(strMilesSeparator);
      out.write("', '').replace('");
      out.print(strDecimalSeparator);
      out.write("','.');\r\n");
      out.write("\tvar strNumero = getNumber(valor);\r\n");
      out.write("\tif (isNaN(strNumero)) {\t\t\r\n");
      out.write("\t\tvalor='0'+'");
      out.print(strDecimalSeparator);
      out.write("'+'0';\r\n");
      out.write("\t}\r\n");
      out.write("\tif (valor =='') {\t\t\r\n");
      out.write("\t\tvalor='0'+'");
      out.print(strDecimalSeparator);
      out.write("'+'0';\r\n");
      out.write("\t}\t\r\n");
      out.write("\ttotales[fila][columna]=strNumero;\r\n");
      out.write("\tactualizaColumnaTotales();\r\n");
      out.write("\tactualizaFilasCabecera();\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function enviaOfertaCliente() {\r\n");
      out.write("\tif (confirm ('");
      out.print(traductor.getLiteral("msgConfirmarEnvioOferta"));
      out.write("')) {\r\n");
      out.write("\t\tdocument.enviaOferta.flgSalvarEnviar.value='E'\r\n");
      out.write("\t\tdocument.enviaOferta.submit();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function salvaOfertaCliente() {\r\n");
      out.write("\r\n");
      out.write("        document.enviaOferta.flgSalvarEnviar.value='S'; ");
// ICM SCI 054705 
      out.write("\r\n");
      out.write("        document.enviaOferta.submit();");
// ICM SCI 054705 
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function volverLista()\r\n");
      out.write("{\r\n");
      out.write("\tparent.navegacion.document.location.href=\"./lateral.jsp\";\r\n");
      out.write("\tparent.pieframe.document.location.href=\"./pievacio.htm\";\r\n");
      out.write("\tdocument.location.href=\"./cenman_offer_list_index.jsp\"; ");
// ICM SCI 054705 
      out.write("\r\n");
      out.write("}\r\n");
      out.write("//18.12.2007\trsanchezl Acceso a ventana de precios\r\n");
      out.write("function verPrecios(){\r\n");
      out.write("\tparent.pieframe.document.location.href=\"./pie_precios.jsp\";\r\n");
      out.write("\tparent.navegacion.document.location.href=\"./lateral1_precios.jsp\";\r\n");
      out.write("\tdocument.enviaOferta.action=\"precios.jsp?idOferta=");
      out.print(strIdOferta);
      out.write("\";\r\n");
      out.write("\t\r\n");
      out.write("\tdocument.enviaOferta.submit();\r\n");
      out.write("}\r\n");
      out.write("//FIN 18.12.2007\trsanchezl Acceso a ventana de precios\r\n");
      out.write("\r\n");
      out.write("function muestraDocumento(id) {\r\n");
      out.write("\t\tparent.central.document.showdoc.doc.value=id;\r\n");
      out.write("        parent.central.document.showdoc.submit();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function parseNumero(numero) {\r\n");
      out.write("\r\n");
      out.write("\tvar REDONDEO_DEFECTO = 2; // Redondea a 2 decimales por defecto.\r\n");
      out.write("\tvar DECIMAL = \".\"; // Caracteres usados como separador de decimales y de miles. No deben ser\r\n");
      out.write("\tvar MILES = \" \"; // iguales entre sí. Se puede omitir el separador de miles, con MILES = \"\".\r\n");
      out.write("\tvar esNegativo;\r\n");
      out.write("\tvar strNumero = String(numero).split(DECIMAL); // <Parte_entera DECIMAL Parte_decimal>\r\n");
      out.write("\r\n");
      out.write("\t// A la parte entera: Recorta espacios iniciales y separadores de miles\r\n");
      out.write("\teval(\"var strEntero = strNumero[0].replace(/^\\s*/, '').replace(/[\" + MILES + \"]/g,'')\");\r\n");
      out.write("\r\n");
      out.write("\tif (esNegativo = (strEntero.charAt(0) == '-'))\r\n");
      out.write("\t\tstrEntero = strEntero.substr(1);\r\n");
      out.write("\r\n");
      out.write("\t// Elimina ceros a la izquierda\r\n");
      out.write("\tif ((strEntero = strEntero.replace(/^0*/,'')) == '')\r\n");
      out.write("\t\tstrEntero = '0';\r\n");
      out.write("\r\n");
      out.write("\t// A la parte decimal: Si existe, recorta espacios finales.\r\n");
      out.write("\tvar strDecimal = strNumero.length > 1 ? strNumero[1].replace(/\\s*$/, \"\").replace(/0+$/g,\"\") : \"\";\r\n");
      out.write("\r\n");
      out.write("\t// <Parte_entera . Parte_decimal>>, o <Parte_entera> si Parte_decimal no existe\r\n");
      out.write("\tvar numFormateado = strDecimal.length == 0 ? strEntero : strEntero + \".\" + strDecimal;\r\n");
      out.write("\tif (esNegativo) numFormateado = \"-\" + numFormateado;\r\n");
      out.write("\r\n");
      out.write("\tvar valor = parseFloat(numFormateado); // Pasa a Float.\r\n");
      out.write("\r\n");
      out.write("\t// Si se ha convertido el valor completo, se devuelve el Float. Si no es correcto, NaN.\r\n");
      out.write("\treturn (valor.toString() != numFormateado) ? Number.NaN : valor;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*\r\n");
      out.write("\tFunción formatNumero:\r\n");
      out.write("\t\tMétodo para devolver el valor formateado de un número. Es el inverso a parseNumero.\r\n");
      out.write("\tParámetros:\r\n");
      out.write("\t\tnumero: Numero a formatear.\r\n");
      out.write("\t\tdecimales: Número de decimales. Si se omite, se usa REDONDEO_DEFECTO.\r\n");
      out.write("\tRetorna:\r\n");
      out.write("\t\tCadena con el número formateado.\r\n");
      out.write("*/\r\n");
      out.write("function formatNumero(numero, decimales) {\r\n");
      out.write("\t\r\n");
      out.write("\tvar dec = (decimales != null ? decimales : REDONDEO_DEFECTO);\r\n");
      out.write("\tvar strNumero = String(redondea(numero, dec)).split('.'); // <Parte_entera . Parte_decimal>\r\n");
      out.write("\tvar strEntero = strNumero[0].split(\"\").reverse().join(\"\"); // Le damos la vuelta al entero\r\n");
      out.write("\tvar strDecimal = strNumero.length > 1 ? strNumero[1] : \"\";\r\n");
      out.write("\r\n");
      out.write("\tstrEntero = strEntero.replace(/(\\d{3})/g, \"$1\" + MILES); // coloca MILES cada tres dígitos\r\n");
      out.write("\tstrEntero = strEntero.split(\"\").reverse().join(\"\"); // Le damos otra vuelta\r\n");
      out.write("\r\n");
      out.write("\t// Eliminamos los casos <.Numero> y <-.NUMERO>\r\n");
      out.write("\tif (strEntero.charAt(0) == MILES) strEntero = strEntero.slice(1);\r\n");
      out.write("\telse if (strEntero.substr(0,2) == \"-\" + MILES) strEntero = \"-\" + strEntero.slice(2);\r\n");
      out.write("\r\n");
      out.write("\tfor (var i = strDecimal.length; i < dec; i++) // Rellenar los decimales que faltan con 0\r\n");
      out.write("\t\tstrDecimal += '0';\r\n");
      out.write("\t// <Parte_entera DECIMAL Parte_decimal>, o <Parte_entera> si Parte_decimal no existe\r\n");
      out.write("\treturn strDecimal.length == 0 ? strEntero : strEntero + DECIMAL + strDecimal;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/*\r\n");
      out.write("\tFunción redondea:\r\n");
      out.write("\t\tMétodo de redondeo de cifras.\r\n");
      out.write("\tParámetros:\r\n");
      out.write("\t\tnumero: Cifra a redondear.\r\n");
      out.write("\t\tdecimales: Número de decimales. Si se omite, se usa REDONDEO_DEFECTO.\r\n");
      out.write("\tRetorna:\r\n");
      out.write("\t\tNúmero redondeado.\r\n");
      out.write("*/\r\n");
      out.write("function redondea (numero, decimales) {\r\n");
      out.write("\tvar dec = (decimales != null ? decimales : REDONDEO_DEFECTO);\r\n");
      out.write("\tvar multip = Math.pow(10, dec);\r\n");
      out.write("\treturn Math.round(numero * multip) / multip;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function checkDecimal(valorIN,entero,decimal) {\r\n");
      out.write("\r\n");
      out.write("\tvar valor;\r\n");
      out.write("\tvar maximo;\r\n");
      out.write("\r\n");
      out.write("\tmaximo=10;\r\n");
      out.write("\tfor (i=1;i<entero;i++) {\r\n");
      out.write("\t\tmaximo=maximo*10;\r\n");
      out.write("\t}\r\n");
      out.write("\tmaximo = maximo-1;\t\r\n");
      out.write("\tvalor = valorIN.value;\t\r\n");
      out.write("\t//valor = valor.replace('.', \"\").replace(',', \".\");\t\t\r\n");
      out.write("\tvalor = getNumber(valor)\t\r\n");
      out.write("\tif (isNaN(valor)) {\t\r\n");
      out.write("\t\tvalor='0.0';\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t// Recorta espacios\r\n");
      out.write("\tvalor.value = valor.replace(/^\\s*/, \"\").replace(/\\s*$/, \"\");\t\t\r\n");
      out.write("\tvar parteEntera=''+parseFloat(valor);\t\r\n");
      out.write("\tif (parteEntera.indexOf(\".\", 0) != -1) {\t\t\r\n");
      out.write("\t\tparteEntera = parteEntera.substring(0,parteEntera.indexOf(\".\", 0));\t\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tif (parteEntera.length>entero) { alert \r\n");
      out.write("\t('");
      out.print(traductor.getLiteral("msgNumeroNoMayor"));
      out.write("'+maximo); valor = '0.0'; \r\n");
      out.write("\tvalorIN.value= formatNumero(0.0); valorIN.focus(); return false; }\tif (valor \r\n");
      out.write("\t== '') return; else if (isNaN(valor = parseNumero(valor))) { alert \r\n");
      out.write("\t(MSG_NUMERO_INCORRECTO); valorIN.value = ''; valorIN.focus(); return false; } \r\n");
      out.write("\telse\t\tvalorIN.value = formatNumero(valor, decimal);\t\t\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function getNumber(numberFormat) {\r\n");
      out.write(" \tvar strNumber;\r\n");
      out.write(" \tstrNumber= numberFormat;\r\n");
      out.write(" \t\r\n");
      out.write(" \twhile (strNumber.indexOf('");
      out.print(strMilesSeparator);
      out.write("')!= -1 ) {\r\n");
      out.write(" \t\tstrNumber = strNumber.replace('");
      out.print(strMilesSeparator);
      out.write("', \"\")\r\n");
      out.write(" \t}\r\n");
      out.write(" strNumber = strNumber.replace('");
      out.print(strDecimalSeparator);
      out.write("', \".\");\t\t\r\n");
      out.write(" return strNumber;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("function getNumberFormateadoDecimal(numberFormat) {\r\n");
      out.write(" \tvar strNumber;\r\n");
      out.write(" \tstrNumber= numberFormat;\r\n");
      out.write(" \t\r\n");
      out.write(" \twhile (strNumber.indexOf('");
      out.print(strMilesSeparator);
      out.write("')!= -1 ) {\r\n");
      out.write(" \t\tstrNumber = strNumber.replace('");
      out.print(strMilesSeparator);
      out.write("', \"\")\r\n");
      out.write(" \t}  \r\n");
      out.write(" return strNumber;\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function soloCifras() {\r\n");
      out.write("\tkeyChar = window.event.keyCode;\r\n");
      out.write("\treturn (((keyChar > 47 && keyChar < 58)\r\n");
      out.write("\t\t|| keyChar == DECIMAL.charCodeAt(0)\r\n");
      out.write("\t\t|| keyChar == 8 || keyChar == 13 || keyChar == 45));\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function  modoEdicion(elem) {\r\n");
      out.write("\t//elem.value=elem.value.replace('");
      out.print(strMilesSeparator);
      out.write("','' );\t\t\r\n");
      out.write("\telem.value = getNumberFormateadoDecimal(elem.value)\r\n");
      out.write("}\r\n");
      out.write("//18.12.2007\trsanchezl\tAl volver de precios, movernos a la pestaña Cuadro de Precios\r\n");
      out.write("function seleccionaPestanya(){\r\n");
      out.write("\tif('");
      out.print(precios);
      out.write("'=='Si'){\r\n");
      out.write("\t\tdocument.getElementById(\"ordenTrabajo\").style.display = 'none'\r\n");
      out.write("\t\tdocument.getElementById(\"cuadroPrecio\").style.display = ''\r\n");
      out.write("\t\tdocument.getElementById(\"unidadObra\").style.display = 'none'\r\n");
      out.write("\t\tdocument.getElementById(\"documentos\").style.display = 'none'\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("//FIN 18.12.2007\trsanchezl\tAl volver de precios, movernos a la pestaña Cuadro de Precios\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");

//INICIO ICM SCI 054705. Unicamente hay que mostrar el detalle completo de una oferta si
// no se encuentra en estado denegada
boolean booMostrarDetalle = true;
if ( strCodEstado.equals(CenManWebShared.getRpDenegada())  ) {
 booMostrarDetalle = false;
}

      out.write("\r\n");
      out.write("<!--18.12.2007\trsanchezl\ten el onLoad, seleccionar la pestaña de Cuadro de Precios-->\r\n");
      out.write("<body class=\"new4\" onLoad=\"seleccionaPestanya();actualizarInicial");
if (booMostrarDetalle) {
      out.write("Detalle");
}
      out.write("()\">\r\n");
      out.write("<!--FIN 18.12.2007\trsanchezl\ten el onLoad, seleccionar la pestaña de Cuadro de Precios-->\r\n");
      out.write("\r\n");
      out.write("<div ID=\"ordenTrabajo\">\r\n");
      out.write("<form name='showdoc' action='/servlet/com.soluzionasf.ocen.man.web.servlets.CenManWebShowDocServlet' target=\"_blank\" method='post'>\r\n");
      out.write("\t<input type=\"hidden\" name=\"doc\" value=\"\">\r\n");
      out.write("</form>\r\n");
      out.write("<form name='enviaOferta' action='saveOffer.jsp' method='post'>\r\n");
      out.write("<input type=\"hidden\" name=\"flgSalvarEnviar\" value=\"S\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("  <tr><td>&nbsp;</td></tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("  \t</tr><td colspan=\"2\" class=\"grantabla27\">");
      out.print(traductor.getLiteral("cabeceraDetalle"));
      out.write("&nbsp;&nbsp;");
      out.print(strCodOffer);
      out.write("</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("<!--  <tr>\r\n");
      out.write("  \t</tr><td colspan=\"2\">&nbsp;</td>\r\n");
      out.write("  </tr> -->\r\n");
      out.write("  <tr>\r\n");
      out.write("  \t<td width=\"2%\" >&nbsp;</td>  \r\n");
      out.write("    <td width=\"15%\" class=\"grantabla\">");
      out.print(traductor.getLiteral("codigo"));
      out.write(":</td>\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla28\">&nbsp;</td>    \r\n");
      out.write("\t\t<td width=\"35%\" class=\"grantabla28\">");
      out.print(strCodOffer);
      out.write("</td>\t\t  \r\n");
      out.write("  \t<td width=\"1%\" class=\"grantabla\">&nbsp;</td>  \r\n");
      out.write("\t\t<td width=\"15%\" class=\"grantabla\">");
      out.print(traductor.getLiteral("version"));
      out.write(":</td>\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla28\">&nbsp;</td>    \r\n");
      out.write("\t\t<td width=\"35%\" class=\"grantabla28\">");
      out.print(strNumVersion);
      out.write("\t\r\n");
      out.write("\t</td>  \r\n");
      out.write("  <tr>\r\n");
      out.write("    <td width=\"2%\" >&nbsp;</td>  \r\n");
      out.write("    <td width=\"15%\" class=\"grantabla\">");
      out.print(traductor.getLiteral("descripcion"));
      out.write(":</td>\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla28\">&nbsp;</td>    \r\n");
      out.write("\t\t<td width=\"35%\" class=\"grantabla28\">");
      out.print(strDescripcion);
      out.write("</td>\t\r\n");
      out.write("\t\t<td width=\"1%\" class=\"grantabla\">&nbsp;</td>  \r\n");
      out.write("\t\t<td width=\"15%\" class=\"grantabla\">");
      out.print(traductor.getLiteral("expediente"));
      out.write(":</td>\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla28\">&nbsp;</td>\r\n");
      out.write("    <td width=\"35%\" class=\"grantabla28\">");
      out.print(strExpediente);
      out.write("</td>    \r\n");
      out.write("  </tr>  \r\n");
      out.write("  <tr>  \r\n");
      out.write("  \t");
// INICIO ICM SCI 054705
      out.write("\r\n");
      out.write("    <td width=\"2%\" >&nbsp;</td>  \r\n");
      out.write("    <td width=\"15%\" class=\"grantabla\">");
      out.print(traductor.getLiteral("fechaEnvio"));
      out.write(":</td>\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla28\">&nbsp;</td>    \r\n");
      out.write("\t\t<td width=\"35%\" class=\"grantabla28\">");
      out.print(strFechaEnvio);
      out.write("</td>  \t\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla\">&nbsp;</td>      \r\n");
      out.write("\t\t<td width=\"15%\" class=\"grantabla\">");
      out.print(traductor.getLiteral("estado"));
      out.write(":</td>\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla28\">&nbsp;</td>    \r\n");
      out.write("\t\t<td width=\"35%\" class=\"grantabla28\">");
      out.print(strDesEstado);
      out.write("</td>  \t\t\t\t\t\r\n");
      out.write("\t\t");
// FIN ICM SCI 054705
      out.write(" \r\n");
      out.write("\t</tr>  \t\r\n");
      out.write("\t<tr>   \t\r\n");
      out.write("\t\t");
// INICIO ICM SCI 052234
      out.write(" \t\t\r\n");
      out.write("\t\t<td width=\"2%\" >&nbsp;</td>  \r\n");
      out.write("    <td width=\"15%\" class=\"grantabla\">");
      out.print(traductor.getLiteral("fechaLimite"));
      out.write(":</td>\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla28\">&nbsp;</td>    \r\n");
      out.write("\t\t<td width=\"35%\" class=\"grantabla28\">");
      out.print(strFechaLimite);
      out.write("</td>\r\n");
      out.write("\t\t<td width=\"1%\" class=\"grantabla\">&nbsp;</td>  \r\n");
      out.write("\t\t");
//ICM SCI 055827 - Se añade Nombre Contratista en el detalle
      out.write("\r\n");
      out.write("    <td width=\"15%\" class=\"grantabla\">");
      out.print(traductor.getLiteral("contratista"));
      out.write(":</td>\r\n");
      out.write("    <td width=\"1%\" class=\"grantabla28\">&nbsp;</td>    \r\n");
      out.write("\t\t<td width=\"35%\" class=\"grantabla28\">");
      out.print(strNombreContratista);
      out.write("</td>  \t\t\t\r\n");
      out.write("\t\t");
// FIN ICM SCI 052234
      out.write("       \r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\r\n");

// INICIO ICM SCI 054705. Si la oferta esta denegada no hay que mostrar toda la información
// únicamente los totales
if (booMostrarDetalle){

      out.write("\r\n");
      out.write("\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td colspan=\"3\" class=\"introbienve3\">\r\n");
      out.write("      <table class=\"general5\" cellspacing=\"0\" border=\"0\">        \r\n");
      out.write("        <tr>\r\n");
      out.write("          <td colspan=\"5\">&nbsp;</td>\r\n");
      out.write("          <td colspan=\"3\" class=\"grantabla30\">");
      out.print(traductor.getLiteral("unidades"));
      out.write("</td>\r\n");
      out.write("          <td colspan=\"4\" class=\"grantabla30\">");
      out.print(traductor.getLiteral("importe"));
      out.write("</td>\r\n");
      out.write("        </tr>        \r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("codigo"));
      out.write("</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("gama"));
      out.write("</td>\r\n");
      out.write("          <td width=\"26%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("descripcionElemento"));
      out.write("</td>\r\n");
      out.write("          <td width=\"15%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("equipo"));
      out.write("</td>\r\n");
      out.write("          <td width=\"2%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("tip"));
      out.write("</td>\r\n");
      out.write("          <td width=\"6%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("numPersonas"));
      out.write("</td>\r\n");
      out.write("          <td width=\"6%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("horas"));
      out.write("</td>\r\n");
      out.write("          <td width=\"6%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("uds"));
      out.write("</td>\r\n");
      out.write("          <td width=\"6%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("mo"));
      out.write("</td>\r\n");
      out.write("          <td width=\"6%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("uds"));
      out.write("</td>\r\n");
      out.write("          <td width=\"6%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("otros"));
      out.write("</td>\r\n");
      out.write("          <td width=\"6%\" class=\"grantabla31\">");
      out.print(traductor.getLiteral("total"));
      out.write("</td>\r\n");
      out.write("        </tr>\r\n");

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

      out.write("\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"7%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
      out.print(elemento.getCodigo());
      out.write("</td>\r\n");
      out.write("          <td width=\"7%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
      out.print(strGama);
      out.write("</td>\r\n");
      out.write("          \r\n");
      out.write("          ");
// ICM SCI 060095 Se crea un enlace cuando la descripción supera el limite establecido
      out.write("\r\n");
      out.write("          <td width=\"26%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
if(elemento.getDescripcion().length() > DESCRIPTION_VIEW_MAXLENGTH){out.print(elemento.getDescripcion().substring(0,DESCRIPTION_VIEW_MAXLENGTH));
      out.write("<a class=\"enlaceOT\" href=\"javascript:void(0);\"  onclick=\"x=event.screenX + 50;y=event.screenY;  abrirVentanaDetalle(x,y,'");
      out.print(elemento.getDescripcion());
      out.write("');\">&nbsp;<img border=\"0\" align=\"absmiddle\" src=\"../images/mas.gif\" onMouseOver=\"cambiarImagen(this,'../images/mas2.gif');\" onMouseOut=\"javascript:cambiarImagen(this,'../images/mas.gif');\" height=\"13\" alt=\"");
      out.print(traductor.getLiteral("verDescripcionCompleta"));
      out.write("\"></a>");
}else{out.print(elemento.getDescripcion());}
      out.write("</a></td>\r\n");
      out.write("          <td width=\"15%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
      out.print(strEquipo);
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
      out.print(strTipo);
      out.write("</td>\r\n");

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

      out.write("\r\n");
      out.write("<input type=\"hidden\" name=\"idOferElemTA\" value=\"");
      out.print(elemento.getIdOferElem());
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"idOferTA\" value=\"");
      out.print(elemento.getIdOferTA());
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"optimistLockTA\" value=\"");
      out.print(elemento.getOptimistLockTA());
      out.write("\">\r\n");
      out.write("\t  <td width=\"4%\" class=\"campotexto\"><input type=\"text\" value =\"");
      out.print(strNPersonasTA);
      out.write("\" name=\"numPersonasTA\" maxlength=\"3\" onChange=\"HAY_CAMBIO = true;\" onblur=\"checkDecimal(this,3,0)\"  onfocus=\"modoEdicion(this);\" onkeypress=\"HAY_CAMBIO = true; return soloCifras();\" class=\"inputformulario4\" ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          <td width=\"4%\" class=\"campotexto\"><input type=\"text\" value =\"");
      out.print(strHorasTA);
      out.write("\" name=\"numHorasTA\" onChange=\"HAY_CAMBIO = true;\" onblur=\"checkDecimal(this,4,1);actualizar(");
      out.print(i);
      out.write(",0,value)\" onfocus=\"modoEdicion(this);\" onkeypress=\"HAY_CAMBIO = true; return soloCifras(); \" maxlength=\"6\" class=\"inputformulario4\" ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          <td width=\"4%\" class=\"campotexto\"><input type=\"text\" onChange=\"HAY_CAMBIO = true;\" onblur=\"checkDecimal(this,3,0);actualizar(");
      out.print(i);
      out.write(",1,value)\"  onfocus=\"modoEdicion(this);\"  value =\"");
      out.print(strUnidadesTA);
      out.write("\" name=\"unidadesTA\" onkeypress=\"HAY_CAMBIO = true;return soloCifras(); \" maxlength=\"3\" class=\"inputformulario4\"  ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          <td width=\"7%\" class=\"campotexto\"><input type=\"text\" onChange=\"HAY_CAMBIO = true;\" onblur=\"checkDecimal(this,11,2);actualizar(");
      out.print(i);
      out.write(",2,value)\"  onfocus=\"modoEdicion(this);\"  value =\"");
      out.print(strManoObraTA);
      out.write("\" name=\"manoObraTA\" onkeypress=\"HAY_CAMBIO = true; return soloCifras();\" maxlength=\"15\" class=\"inputformulario4\"  ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          <td width=\"8%\" class=\"");
      out.print(strStyle);
      out.write("\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"");
      out.print(strStyle);
      out.write("\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla7\" id=\"elemento");
      out.print(i);
      out.write("\">&nbsp;</td>\r\n");
			}
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

      out.write("\r\n");
      out.write("<input type=\"hidden\" name=\"idOferElemUO\" value=\"");
      out.print(elemento.getIdOferElem());
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"idOferUO\" value=\"");
      out.print(elemento.getIdOferUO());
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"optimistLockUUOO\" value=\"");
      out.print(elemento.getOptimistLockUO());
      out.write("\">\r\n");
      out.write("\t      <td width=\"4%\" class=\"campotexto\"><input type=\"text\" value =\"");
      out.print(strNumPersonasUO);
      out.write("\" name=\"numPersonasUO\" onblur=\"checkDecimal(this,3,0)\"  onfocus=\"modoEdicion(this);\"  onkeypress=\"return soloCifras();\" maxlength=\"3\" class=\"inputformulario4\"  ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          <td width=\"4%\" class=\"campotexto\"><input type=\"text\" onblur=\"checkDecimal(this,4,1);actualizar(");
      out.print(i);
      out.write(",0,value)\"  onfocus=\"modoEdicion(this);\" value =\"");
      out.print(strNumHorasUO);
      out.write("\" onkeypress=\"return soloCifras();\" maxlength=\"6\" name=\"numHorasUO\" class=\"inputformulario4\"  ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla11\">");
      out.print(strNumUO);
      out.write("</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla11\">&nbsp;</td>\r\n");
      out.write("          <td width=\"8%\" class=\"");
      out.print(strStyle);
      out.write("\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"");
      out.print(strStyle);
      out.write("\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla7\" id=\"elemento");
      out.print(i);
      out.write("\">&nbsp;</td>\r\n");

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

      out.write("\r\n");
      out.write("<input type=\"hidden\" name=\"idOferElemAD\" value=\"");
      out.print(elemento.getIdOferElem());
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"idOferAD\" value=\"");
      out.print(elemento.getIdOferAD());
      out.write("\">\r\n");
      out.write("<input type=\"hidden\" name=\"optimistLockAD\" value=\"");
      out.print(elemento.getOptimistLockAD());
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla11\">");
      out.print(strNPersonasTotAD);
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla11\">");
      out.print(strNHorasTotAD);
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\" class=\"");
      out.print(strStyle);
      out.write("\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla11\">");
      out.print(strImpManoObraAD);
      out.write("</td>\r\n");
      out.write("          <td width=\"8%\" class=\"campotexto\"><input type=\"text\" onblur=\"checkDecimal(this,7,2);actualizar(");
      out.print(i);
      out.write(",3,value)\"  onfocus=\"modoEdicion(this);\" maxlength=\"11\" value=\"");
      out.print(strMaterialAD);
      out.write("\" onkeypress=\"return soloCifras();\" name=\"materialAD\" class=\"inputformulario4\"  ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          <td width=\"7%\" class=\"campotexto\"><input type=\"text\" onblur=\"checkDecimal(this,7,2);actualizar(");
      out.print(i);
      out.write(",4,value)\"  onfocus=\"modoEdicion(this);\" maxlength=\"11\" value=\"");
      out.print(strOtrosAD);
      out.write("\" onkeypress=\"return soloCifras();\" name=\"otrosAD\" class=\"inputformulario4\"  ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla7\" id=\"elemento");
      out.print(i);
      out.write("\" >&nbsp;</td>\r\n");

			}// administracion
			}// TA o UO
		} else {
			// No es una orden de trabajo

		 
      out.write("\r\n");
      out.write("          <td width=\"4%\" class=\"");
      out.print(strStyle);
      out.write("\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"");
      out.print(strStyle);
      out.write("\" id=\"horas");
      out.print(i);
      out.write("\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"");
      out.print(strStyle);
      out.write("\" id=\"uds");
      out.print(i);
      out.write("\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"");
      out.print(strStyle);
      out.write("\" id=\"mo");
      out.print(i);
      out.write("\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"8%\" class=\"");
      out.print(strStyle);
      out.write("\" id=\"material");
      out.print(i);
      out.write("\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"");
      out.print(strStyle);
      out.write("\" id=\"otros");
      out.print(i);
      out.write("\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla7\" id=\"elemento");
      out.print(i);
      out.write("\" >&nbsp;</td>\r\n");
 		} // del if

      out.write("\r\n");
      out.write("        </tr>\r\n");

 } // del for
 
      out.write("\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"26%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"15%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"26%\" class=\"grantabla19\">");
      out.print(traductor.getLiteral("tiposDePartidas"));
      out.write("</td>\r\n");
      out.write("          <td width=\"15%\" class=\"grantabla20\">");
      out.print(traductor.getLiteral("aAdministracion"));
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td colspan=\"7\" class=\"grantabla32\">");
      out.print(traductor.getLiteral("totales"));
      out.write("</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"26%\" class=\"grantabla19\">&nbsp;</td>\r\n");
      out.write("          <td width=\"15%\" class=\"grantabla20\">");
      out.print(traductor.getLiteral("uUO"));
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td colspan=\"3\" class=\"grantabla22\">");
      out.print(traductor.getLiteral("unidades"));
      out.write("</td>\r\n");
      out.write("          <td colspan=\"4\" class=\"grantabla23\">");
      out.print(traductor.getLiteral("importe"));
      out.write("</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"26%\" class=\"grantabla19\">&nbsp;</td>\r\n");
      out.write("          <td width=\"15%\" class=\"grantabla20\">");
      out.print(traductor.getLiteral("tTantoAlzado"));
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla20\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla24\">");
      out.print(traductor.getLiteral("horas"));
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla24\">");
      out.print(traductor.getLiteral("uO"));
      out.write("</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla24\">");
      out.print(traductor.getLiteral("mObra"));
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla24\">");
      out.print(traductor.getLiteral("material"));
      out.write("</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla24\">");
      out.print(traductor.getLiteral("otros"));
      out.write("</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla25\">");
      out.print(traductor.getLiteral("TOTAL"));
      out.write("</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"26%\" class=\"grantabla20\">&nbsp;</td>\r\n");
      out.write("          <td width=\"15%\" class=\"grantabla20\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla20\">&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla17\" id=\"TotalHoras\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla17\" id=\"TotalUO\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla17\" id=\"TotalMO\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla17\" id=\"TotalMaterial\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"4%\" class=\"grantabla17\" id=\"TotalOtros\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"7%\" class=\"grantabla18\" id=\"TotalTotal\" >&nbsp;</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
} //fin mostrar Detalle
// si el estado es denegada se muestran unicamente los elementos de la oferta y los totales
	else {

      out.write("\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td colspan=\"3\" class=\"introbienve3\">\r\n");
      out.write("      <table class=\"general5\" cellspacing=\"0\" border=\"0\">                \r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"10%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("codigo"));
      out.write("</td>\r\n");
      out.write("          <td width=\"15%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("gama"));
      out.write("</td>\r\n");
      out.write("          <td width=\"40%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("descripcionElemento"));
      out.write("</td>\r\n");
      out.write("          <td width=\"25%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("equipo"));
      out.write("</td>\r\n");
      out.write("          <td width=\"10%\" class=\"grantabla29\">");
      out.print(traductor.getLiteral("tip"));
      out.write("</td>          \r\n");
      out.write("        </tr>\r\n");

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

      out.write("\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"10%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
      out.print(elemento.getCodigo());
      out.write("</td>\r\n");
      out.write("          <td width=\"15%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
      out.print(strGama);
      out.write("</td>\r\n");
      out.write("          <td width=\"40%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
if(elemento.getDescripcion().length() > DESCRIPTION_VIEW_MAXLENGTH){out.print(elemento.getDescripcion().substring(0,DESCRIPTION_VIEW_MAXLENGTH)+"...");}else{out.print(elemento.getDescripcion());}
      out.write("</td>\r\n");
      out.write("          <td width=\"25%\" class=\"");
      out.print(strStyle);
      out.write('"');
      out.write('>');
      out.print(strEquipo);
      out.write("</td>\r\n");
      out.write("          <td width=\"10%\" class=\"");
      out.print(strStyle);
      out.write('R');
      out.write('"');
      out.write('>');
      out.print(strTipo);
      out.write("</td>\r\n");
      out.write("        </tr>\r\n");

 } // del for
 
      out.write("\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"10%\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"15%\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"40%\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"25%\" >&nbsp;</td>\r\n");
      out.write("          <td width=\"10%\" >&nbsp;</td>          \r\n");
      out.write("        </tr>      \r\n");
      out.write("      </table>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("  <tr>\r\n");
      out.write("  ");

  String strNumHorasTotalResumen, strImporteTotalResumen; 
  // ICM SCI strNumHorasTotalResumen = _result.getNumHorasTotal();
  //ICM SCI strImporteTotalResumen = _result.getImporteTotal();
  strNumHorasTotalResumen=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterHours,Double.parseDouble(_result.getNumHorasTotal()));
  strImporteTotalResumen=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(_result.getImporteTotal()));
  
      out.write("  \r\n");
      out.write("  \t<td colspan=\"3\" class=\"introbienve3\">\r\n");
      out.write("      <table class=\"general5\" cellspacing=\"0\" border=\"0\">                        \r\n");
      out.write("         <tr>          \r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"25%\" class=\"grantabla19\">");
      out.print(traductor.getLiteral("tiposDePartidas"));
      out.write("</td>\r\n");
      out.write("          <td width=\"25%\" class=\"grantabla20\">");
      out.print(traductor.getLiteral("aAdministracion"));
      out.write("</td>\r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("          <td colspan=\"2\" class=\"grantabla32\">");
      out.print(traductor.getLiteral("totales"));
      out.write("</td>\r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"25%\" class=\"grantabla19\">&nbsp;</td>          \r\n");
      out.write("          <td width=\"25%\" class=\"grantabla20\">");
      out.print(traductor.getLiteral("uUO"));
      out.write("</td>\r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"20%\" class=\"grantabla22\" align=\"center\">");
      out.print(traductor.getLiteral("importeTotal"));
      out.write("</td>\r\n");
      out.write("          <td width=\"20%\" class=\"grantabla23\" align=\"center\">");
      out.print(traductor.getLiteral("numHoras"));
      out.write("</td>\r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"25%\" class=\"grantabla19\">&nbsp;</td>          \r\n");
      out.write("          <td width=\"25%\" class=\"grantabla20\">");
      out.print(traductor.getLiteral("tTantoAlzado"));
      out.write("</td>\r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("          <td width=\"20%\" class=\"grantabla17\">");
      out.print(strImporteTotalResumen);
      out.write("</td>\r\n");
      out.write("          <td width=\"20%\" class=\"grantabla18\">");
      out.print(strNumHorasTotalResumen);
      out.write("</td>\r\n");
      out.write("          <td width=\"5%\">&nbsp;</td>\r\n");
      out.write("        </tr>        \r\n");
      out.write("      </table>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
}
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div STYLE=\"display:'none'\" ID=\"cuadroPrecio\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("<tr><td>&nbsp;</td></tr><td colspan=\"2\" class=\"grantabla33\">");
      out.print(traductor.getLiteral("cuadroPrecios"));
      out.write("</td>\r\n");
      out.write("  <tr>\r\n");
      out.write("      <td class=\"introbienve3\">\r\n");
      out.write("      \r\n");
      out.write("        <table class=\"general3\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"20%\">");
      out.print(traductor.getLiteral("codigo"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"15%\">");
      out.print(traductor.getLiteral("flagCP"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"30%\">");
      out.print(traductor.getLiteral("descripcion"));
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("          ");
      out.write("\r\n");
      out.write("          ");
if (_result.getFlagCPG().equals("1")) {
      out.write("\r\n");
      out.write("            <td class=\"grantabla10\" width=\"20%\"><a href=\"#\" onClick=\"verPrecios()\" class=\"resaltar\">");
      out.print(_result.getCodigoCP());
      out.write("</a></td>\r\n");
      out.write("          ");
}else{
      out.write("\r\n");
      out.write("            <td class=\"grantabla10\" width=\"20%\">");
      out.print(_result.getCodigoCP());
      out.write("</td>          \r\n");
      out.write("          ");
}
      out.write("\r\n");
      out.write("          ");
      out.write("            \r\n");
      out.write("            <td class=\"grantabla10\" width=\"15%\">\r\n");
      out.write("            <input type=\"checkbox\" name=\"flgDuplicado\" disabled=\"true\"value=\"\" ");
if (_result.getFlagCP().equals("1")) {
      out.write("checked");
}
      out.write(">\r\n");
      out.write("            </td>\r\n");
      out.write("            <td class=\"grantabla10\" width=\"65%\">");
      out.print(_result.getDescripcionCP());
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("      <br></br>\r\n");
      out.write("        <table class=\"general3\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"26%\">");
      out.print(traductor.getLiteral("categoria"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"37%\">");
      out.print(traductor.getLiteral("tipoHora"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"37%\">");
      out.print(traductor.getLiteral("importe"));
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");

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
		

      out.write("\r\n");
      out.write("          <tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"idCuadroCont\" value=\"");
      out.print(cuadroPrecio.getIdCuadroCont());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"optimistLockCP\" value=\"");
      out.print(cuadroPrecio.getOptimistLock());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"idOferCuadro\" value=\"");
      out.print(cuadroPrecio.getIdOferCuadro());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"impHora\" value=\"");
      out.print(strImpHora);
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"categoria\" value=\"");
      out.print(cuadroPrecio.getCategoria());
      out.write("\">\r\n");
      out.write("            <td class=\"grantabla10\" width=\"26%\">");
      out.print(cuadroPrecio.getCategoria());
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla10\" width=\"37%\">");
      out.print(cuadroPrecio.getTipoHora());
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla34\" ><input type=\"text\" name=\"impHoraContr\" value=\"");
      out.print(strImpHora);
      out.write("\" onblur=\"checkDecimal(this,7,2)\" onfocus=\"modoEdicion(this);\" onChange=\"HAY_CAMBIO = true;\" onkeypress=\"HAY_CAMBIO = true; return soloCifras();\" class=\"inputformulario\"  ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write(" tabindex=\"3\" ></td>\r\n");
      out.write("          </tr>\r\n");

	}// end for

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div STYLE=\"display:'none'\" ID=\"unidadObra\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("<tr><td>&nbsp;</td></tr><td colspan=\"2\" class=\"grantabla33\">");
      out.print(traductor.getLiteral("unidadesObra"));
      out.write("</td>\r\n");
      out.write("    <tr >\r\n");
      out.write("      <td class=\"introbienve3\">\r\n");
      out.write("        <table class=\"general3\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"42%\">");
      out.print(traductor.getLiteral("unidadObra"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"58%\">");
      out.print(traductor.getLiteral("importe"));
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("\r\n");

	intNElemento = _result.getPrecioUOCount();
	for (int i=0;i < intNElemento ;i++ ) {

		precioUO = _result.getPrecioUO(i);
		String strImpUnidad = "";
		if ((precioUO.getImpUnidad()!=null)&&(!precioUO.getImpUnidad().equals("null"))) {
			//strImpUnidad = dcfFormatterAmount.format(Double.parseDouble(precioUO.getImpUnidad()));
			strImpUnidad=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,Double.parseDouble(precioUO.getImpUnidad()));
		}

      out.write("\r\n");
      out.write("          <tr>\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"idOferUuoo\" value=\"");
      out.print(precioUO.getIdOferUuoo());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"idOferContrat\" value=\"");
      out.print(precioUO.getIdOferContrat());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"idUuooContr\" value=\"");
      out.print(precioUO.getIdUuooContr());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"optimistLockUO\" value=\"");
      out.print(precioUO.getOptimistLock());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"impUnidad\" value=\"");
      out.print(strImpUnidad);
      out.write("\">\r\n");
      out.write("            <td class=\"grantabla10\" width=\"42%\">");
      out.print(precioUO.getDescripcion());
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla34\" width=\"58%\"><input type=\"text\" value=\"");
      out.print(strImpUnidad);
      out.write("\" onblur=\"checkDecimal(this,7,2)\" onfocus=\"modoEdicion(this);\" name=\"impUnidadContr\" onChange=\"HAY_CAMBIO = true;\" onkeypress=\"HAY_CAMBIO = true; return soloCifras();\" class=\"inputformulario\"  ");
if (!boo_isMod) {
      out.write(" disabled ");
}
      out.write("  tabindex=\"3\"></td>\r\n");
      out.write("          </tr>\r\n");

	}// end for

      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div STYLE=\"display:'none'\" ID=\"documentos\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("<tr><td>&nbsp;</td></tr><td colspan=\"2\" class=\"grantabla33\">");
      out.print(traductor.getLiteral("documentos"));
      out.write("</td>\r\n");
      out.write("    <tr >\r\n");
      out.write("      <td class=\"introbienve3\">\r\n");
      out.write("        <table class=\"general3\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"30%\">");
      out.print(traductor.getLiteral("codigoDocumento"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"70%\">");
      out.print(traductor.getLiteral("tituloDocumento"));
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("\r\n");

	for (int i=0;i < strDocuments.length ;i++ ) {

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"idDocum");
      out.print(i);
      out.write("\" value=\"");
      out.print(strDocuments[i][CenManWebDocumentsOffer._ID_DOCUM]);
      out.write("\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"optimistLockDoc");
      out.print(i);
      out.write("\" value=\"");
      out.print(strDocuments[i][CenManWebDocumentsOffer._OPTLOCK_DOCUM]);
      out.write("\">\r\n");
      out.write("            \t<td class=\"campotexto\" width=\"42%\"><a  href=\"\" onClick=\"muestraDocumento('");
      out.print(strDocuments[i][CenManWebDocumentsOffer._ID_DOCUM]);
      out.write("'); return false;\">  ");
      out.print(strDocuments[i][CenManWebDocumentsOffer._COD_DOCUM]);
      out.write("</a></td>\r\n");
      out.write("\t\t<td class=\"campotexto\" width=\"58%\">");
      out.print(strDocuments[i][CenManWebDocumentsOffer._TITLE_DOCUM]);
      out.write("</td>\r\n");
      out.write("\t</tr>\t\r\n");
      out.write("\t\r\n");

	}// end for

      out.write("\r\n");
      out.write("\r\n");
      out.write("          <tr>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"idOfer\" value=\"");
      out.print((strDocuments!=null && strDocuments.length>0 ? strDocuments[0][CenManWebDocumentsOffer._ID_OFERTA] : ""));
      out.write("\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"optimistLockOfer\" value=\"");
      out.print((strDocuments!=null && strDocuments.length>0 ? strDocuments[0][CenManWebDocumentsOffer._OPTLOCK_OFERTA] : ""));
      out.write("\">\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("<div STYLE=\"display:none\" ID=\"botonera\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td colspan=\"3\">\r\n");
      out.write("      <table class=\"general1\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td class=\"boton\" width=\"33%\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                <input type=\"button\" onClick=\"salvaOfertaCliente()\" name=\"Salvar\" value=\"Salvar\" class=\"interior\">\r\n");
      out.write("            </div>\r\n");
      out.write("          </td>\r\n");
      out.write("          <td class=\"boton\" width=\"33%\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                <input type=\"button\" onClick=\"enviaOfertaCliente()\" name=\"Enviar\" value=\"Enviar\" class=\"interior\">\r\n");
      out.write("            </div>\r\n");
      out.write("          </td>\r\n");
      out.write("\r\n");
      out.write("          <td class=\"boton\" width=\"33%\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                <input type=\"button\" onClick=\"volverLista()\" name=\"Anterior\" value=\"Anterior\" class=\"interior\">\r\n");
      out.write("            </div>\r\n");
      out.write("\t\t\t<td class=\"boton\" width=\"33%\">\r\n");
      out.write("          </td>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table>\r\n");
      out.write("    </td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("<head>\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write("</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
