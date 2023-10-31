package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Arrays;
import java.util.List;
import com.soluzionasf.ocen.man.web.domain.CenManWebPriceTableImporteSend;
import isf.util.log.Log;
import java.util.List;
import java.util.Calendar;
import java.util.Iterator;
import java.text.SimpleDateFormat;
import com.soluzionasf.ocen.man.web.domain.CenManWebContractPriceTableImporte;
import com.soluzionasf.ocen.man.web.domain.CenManWebFormatoNumerosHelper;

public final class cenman_005fprice_005ftable_005fimporte_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\r');
      out.write('\n');

	List					listOfPriceTablesImportes = null;
	Iterator 				iterator = null;
	CenManWebContractPriceTableImporte	priceTableImporte = null;
	java.text.DecimalFormatSymbols dcfSymbols  = null;
	
	String strFormatterAmount = null;
	
	
	dcfSymbols = new java.text.DecimalFormatSymbols();
	dcfSymbols.setGroupingSeparator('.');
    String strDecimalSeparator = CenManWebFormatoNumerosHelper.getDecimalSeparator();
	String strMilesSeparator = CenManWebFormatoNumerosHelper.getMilesSeparator();           
    strFormatterAmount = "###,##0.00";

	
	// Limpia la cache
	response.setHeader("expires", "0");
	session = request.getSession (true);
	String strIdCuadro=request.getParameter("idCuadro");
	
	CenManWebPriceTableImporteSend sendQueryPriceTableImporte = new CenManWebPriceTableImporteSend();
		
	System.out.println("Cuadro de precios:" + strIdCuadro);
	
	listOfPriceTablesImportes = sendQueryPriceTableImporte.sendQueryPriceTableImporte(Long.parseLong(strIdCuadro),contractor.getContractCode());
	
	String strSalvar = "N";

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Cuadro de Precios</title>\r\n");
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
      out.write("\tvar valor;\r\n");
      out.write("\tvar maximo;\r\n");
      out.write("\tmaximo=10;\r\n");
      out.write("\tfor (i=1;i<entero;i++) {\r\n");
      out.write("\t\tmaximo=maximo*10;\r\n");
      out.write("\t}\r\n");
      out.write("\tmaximo = maximo-1;\t\r\n");
      out.write("\tvalor = valorIN.value;\t\r\n");
      out.write("\t//valor = valor.replace('.', \"\").replace(',', \".\");\t\r\n");
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
      out.write("\telse\t\t\r\n");
      out.write("\tvalorIN.value = formatNumero(valor, decimal);\t\t\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function getNumber(numberFormat) {\r\n");
      out.write(" \tvar strNumber;\r\n");
      out.write("\tstrNumber= numberFormat;\r\n");
      out.write("\twhile (strNumber.indexOf('");
      out.print(strMilesSeparator);
      out.write("')!= -1 ) {\r\n");
      out.write(" \t\tstrNumber = strNumber.replace('");
      out.print(strMilesSeparator);
      out.write("', \"\")\r\n");
      out.write(" \t}\r\n");
      out.write(" strNumber = strNumber.replace('");
      out.print(strDecimalSeparator);
      out.write("', \".\");\t\r\n");
      out.write(" return strNumber;\r\n");
      out.write(" \r\n");
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
      out.write("\r\n");
      out.write("function salvar(){\r\n");
      out.write("\tdocument.cuadroprecios.submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\t\r\n");
      out.write("<body class=\"new4\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("<form name='cuadroprecios' action='savePriceTable.jsp' method='post'>\r\n");
      out.write("<tr><td>&nbsp;</td></tr>\r\n");
      out.write("        <table class=\"general3\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"50%\">");
      out.print(traductor.getLiteral("Categoria"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"50%\">");
      out.print(traductor.getLiteral("Tipo Hora"));
      out.write("</td>\r\n");
      out.write("\t\t\t<td class=\"grantabla29\" width=\"30%\">");
      out.print(traductor.getLiteral("Importe"));
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");

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
		 if ((priceTableImporte.getImporte()!=null)) {
				strImporte=CenManWebFormatoNumerosHelper.getFormatNumber(strFormatterAmount,priceTableImporte.getImporte().doubleValue());
		 }	
		 if ((priceTableImporte.getImporte() ==null)) {
				strImporte="";
		 }

      out.write("  \t<tr> \r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"idTarifa\" value=\"");
      out.print(priceTableImporte.getIdTarifa());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"optimistLock\" value=\"");
      out.print(priceTableImporte.getOptimistLock());
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"cod_contratista\" value=\"");
      out.print(contractor.getContractCode());
      out.write("\">\r\n");
      out.write("\t\t\t<td class=\"grantabla10\" width=\"50%\">&nbsp;");
      out.print(strDesCategoria);
      out.write("</td>           \r\n");
      out.write("\t\t\t<td class=\"grantabla10\" width=\"50%\">&nbsp;");
      out.print(strDesTipoHora);
      out.write("</td>\r\n");
      out.write("\t\t\t<td class=\"grantabla34\"><input type=\"text\" name=\"importe\" value=\"");
      out.print(strImporte);
      out.write("\" onblur=\"checkDecimal(this,7,2)\" onChange=\"HAY_CAMBIO = true;\" onkeypress=\"HAY_CAMBIO = true; return soloCifras();\" class=\"inputformulario\"  tabindex=\"3\" ></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");

	 }
	}

      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("<head>\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write("</html>\r\n");
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
