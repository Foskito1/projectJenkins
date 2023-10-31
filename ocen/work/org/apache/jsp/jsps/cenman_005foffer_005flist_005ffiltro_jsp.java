package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import isf.util.log.Log;
import java.util.ArrayList;
import com.soluzionasf.ocen.man.web.domain.CenManWebShared;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import com.soluzionasf.ocen.man.web.domain.CenManWebContractOffer;

public final class cenman_005foffer_005flist_005ffiltro_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Lista de ofertas</title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<script language=\"javascript\" src=\"js/util_ocen.js\"></script>\r\n");
      out.write("<script language=\"javascript\" src=\"js/fechas.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("// Funcion que comprueba si la fecha tiene formato correcto\r\n");
      out.write("function validarFecha (fecha) {\r\n");
      out.write("\tif (!(fecha.value=='' || fecha.value=='00/00/0000')  && comprobarFecha(fecha.value, \"dd/MM/yyyy\") != \"\") {\r\n");
      out.write("\t\treturn false;\t\t\r\n");
      out.write("\t}\r\n");
      out.write("\treturn true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("// Funcion que comprueba si la fecha desde es menos o igual que la fecha hasta\r\n");
      out.write("function checkFechas (dateFrom,dateTo) {\t\r\n");
      out.write("\r\n");
      out.write("\tif (dateFrom!='00/00/0000' &&  dateTo!='00/00/0000' &&  compararFechas(dateTo, dateFrom)<0){\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\telse return true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function mostrarResultados(){\r\n");
      out.write("\tif (!validarFecha(document.formulario.dateFrom)) {\r\n");
      out.write("\t\talert('");
      out.print(traductor.getLiteral("msgFechaDesdeIncorrecta"));
      out.write("');\r\n");
      out.write("\t\tdocument.formulario.dateFrom.focus();\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tif (!validarFecha(document.formulario.dateTo)) {\r\n");
      out.write("\t\talert('");
      out.print(traductor.getLiteral("msgFechaHastaIncorrecta"));
      out.write("');\r\n");
      out.write("\t\tdocument.formulario.dateTo.focus()\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tif (!checkFechas(document.formulario.dateFrom.value,document.formulario.dateTo.value)) \t{\r\n");
      out.write("\t\talert('");
      out.print(traductor.getLiteral("msgFechasNoCorrectas"));
      out.write("');\r\n");
      out.write("\t\tdocument.formulario.dateFrom.focus();\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tif (!isChecked('state')){\r\n");
      out.write("\t\talert('");
      out.print(traductor.getLiteral("msgSeleccionEstado"));
      out.write("');\t\t\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\tdocument.formulario.submit();\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"new4\" onload=\"javascript:mostrarResultados();\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("\t<tr>\r\n");
      out.write("  \t<td width=\"100%\">\r\n");
      out.write("    \t<table border=\"0\" cellspacing=\"0\">\r\n");
      out.write("    \t\t<tr>\r\n");
      out.write("    \t\t\t<td class=\"paracabeceralista\" nowrap>");
      out.print(traductor.getLiteral("criteriosSeleccion"));
      out.write("</td>\r\n");
      out.write("      \t\t<td class=\"introbienve2\" colspan=\"2\">\r\n");
      out.write("        \t\t<table class=\"introbienve\" cellspacing=\"0\">\r\n");
      out.write("          \t\t<tr>\r\n");
      out.write("            \t\t<td class=\"parabienve\" >");
      out.print(traductor.getLiteral("empresaUnionFenosa"));
      out.write("<td>\r\n");
      out.write("          \t\t</tr>\r\n");
      out.write("        \t\t</table>\r\n");
      out.write("      \t\t</td>\r\n");
      out.write("      \t</tr>\r\n");
      out.write("    \t</table>    \t\r\n");
      out.write("    </td>    \t\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");
 
	//Si alguno de los criterios de filtrado es nulo se pone por defecto en dichos campos "00/00/0000"
	String str_dateFromFilter,str_dateToFilter;
	SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");       
	
	if (contractor.getDateFromFilter()==null)  {
			str_dateFromFilter="00/00/0000";			
	}else {
	 		str_dateFromFilter= formatDate.format(contractor.getDateFromFilter());
	}
	if (contractor.getDateToFilter()==null)  {
			str_dateToFilter="00/00/0000";			
	}else {
		str_dateToFilter= formatDate.format(contractor.getDateToFilter());
	}
	
      out.write("\r\n");
      out.write("  <tr>\r\n");
      out.write("  \t<td  width=\"100%\">\r\n");
      out.write("  \t<form name=\"formulario\" target=\"resultado\" method=\"post\" action=\"cenman_offer_list.jsp\">\r\n");
      out.write("    \t<table width=\"95%\" cellspacing=\"0\" border=\"0\" >\t\t\t   \r\n");
      out.write("      \t<tr>\r\n");
      out.write("      \t\t<td width=\"100%\">\r\n");
      out.write("\t      \t\t<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" >\t\t\t   \r\n");
      out.write("\t\t\t\t\t\t\t<tr><td>&nbsp;</td></tr>\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"left\" class=\"labelfiltro\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"button\" class=\"interior\" value=\"");
      out.print(traductor.getLiteral("buscar"));
      out.write("\" onclick=\"javascript:mostrarResultados();\"/>&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"labelfiltro\">");
      out.print(traductor.getLiteral("fSolicitudDesde"));
      out.write(":</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input name=\"dateFrom\" class=\"inputfiltro\" type=\"text\" value=\"");
      out.print(str_dateFromFilter);
      out.write("\" maxlength=\"10\" size=\"21\" onfocus=\"javascript:if (this.value=='00/00/0000') this.value='';\" lostfocus=\"javascript:this.value='';\" onBlur=\"javascript:if (this.value=='') this.value='00/00/0000'\"; this.value='00/00/0000';\" onkeypress=\"if (caracteresNumericos()) escribirBarra(this); else return false;\" onChange=\"javascript:validarFecha(this);\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"javascript:void(0)\">\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img title=\"");
      out.print(traductor.getLiteral("fSolicitudDesde"));
      out.write("\" align=\"absmiddle\" src=\"../images/lupa.gif\" border=\"0\" onClick=\"x=event.screenX + 10;y=event.screenY;win = window.open('cenman_calendario.jsp?originField=dateFrom&miframe=filtro&loadDate=thisDate','winCalendario','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=175,height=215');win.moveTo(x,y)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"labelfiltro\">");
      out.print(traductor.getLiteral("fSolicitudHasta"));
      out.write(":</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"left\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input  name=\"dateTo\" class=\"inputfiltro\" type=\"text\" value=\"");
      out.print(str_dateToFilter);
      out.write("\" maxlength=\"10\" size=\"21\" onfocus=\"javascript:if (this.value=='00/00/0000') this.value='';\" onBlur=\"javascript:if (this.value=='') this.value='00/00/0000'\"; onkeypress=\"if (caracteresNumericos()) escribirBarra(this); else return false;\" onChange=\"validarFecha(this)\"/>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"javascript:void(0)\">\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<img title=\"");
      out.print(traductor.getLiteral("fSolicitudHasta"));
      out.write("\" align=\"absmiddle\" src=\"../images/lupa.gif\" border=\"0\" onClick=\"x=event.screenX + 10;y=event.screenY;win = window.open('cenman_calendario.jsp?originField=dateTo&miframe=filtro&loadDate=thisDate','winCalendario','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=175,height=215');win.moveTo(x,y)\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<tr><td>&nbsp;</td></tr>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t");
 //Si no hay ningun estado seleccionado por defecto se selecciona el estado solicitada y recibida contratista
							if (contractor.getStatesFilter()==null || contractor.getStatesFilter().size()==0) {
								ArrayList arrayStates=new ArrayList();
								arrayStates.add(CenManWebShared.getRpSolicitada());
								arrayStates.add(CenManWebShared.getRpRecibidaContratista());
								contractor.setStatesFilter(arrayStates);
							}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"left\" class=\"labelfiltro\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input name=\"state\" type=\"checkbox\" value=\"");
      out.print(CenManWebShared.getRpSolicitada());
      out.write('"');
      out.write(' ');
if (contractor.hasStatesFilter(CenManWebShared.getRpSolicitada())){
      out.write("checked ");
}
      out.write('>');
      out.write(' ');
      out.print(traductor.getLiteral("solicitada"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td> \r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"left\" class=\"labelfiltro\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input name=\"state\" type=\"checkbox\" value=\"");
      out.print(CenManWebShared.getRpRecibidaContratista());
      out.write('"');
      out.write(' ');
if (contractor.hasStatesFilter(CenManWebShared.getRpRecibidaContratista())){
      out.write("checked ");
}
      out.write('>');
      out.write(' ');
      out.print(traductor.getLiteral("recibida"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td> \r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"left\" class=\"labelfiltro\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input name=\"state\" type=\"checkbox\" value=\"");
      out.print(CenManWebShared.getRpOfertadaContratista());
      out.write('"');
      out.write(' ');
if (contractor.hasStatesFilter(CenManWebShared.getRpOfertadaContratista())){
      out.write("checked ");
}
      out.write('>');
      out.write(' ');
      out.print(traductor.getLiteral("ofertada"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td align=\"left\" class=\"labelfiltro\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input name=\"state\" type=\"checkbox\" value=\"");
      out.print(CenManWebShared.getRpAdjudicada());
      out.write('"');
      out.write(' ');
if (contractor.hasStatesFilter(CenManWebShared.getRpAdjudicada())){
      out.write("checked ");
}
      out.write('>');
      out.write(' ');
      out.print(traductor.getLiteral("adjudicada"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td name=\"state\" align=\"left\" class=\"labelfiltro\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input name=\"state\" type=\"checkbox\" value=\"");
      out.print(CenManWebShared.getRpDenegada());
      out.write('"');
      out.write(' ');
if (contractor.hasStatesFilter(CenManWebShared.getRpDenegada())){
      out.write("checked ");
}
      out.write('>');
      out.write(' ');
      out.print(traductor.getLiteral("denegada"));
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>      \t\t\r\n");
      out.write("\t\t\t</table>\t\t    \r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
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
