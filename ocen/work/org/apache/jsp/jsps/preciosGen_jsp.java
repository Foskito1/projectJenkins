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

public final class preciosGen_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function volverLista(){\r\n");
      out.write("\tparent.pieframe.document.location.href=\"./pie.jsp\";\r\n");
      out.write("\tparent.navegacion.document.location.href=\"./lateral1.jsp\";\t\r\n");
      out.write("\tdocument.location.href=\"./cenman_offer_list_index.jsp\";\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"new4\" onLoad=\"\">\r\n");
      out.write("\r\n");
      out.write("<divID=\"cuadroPrecio\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("<tr><td>&nbsp;</td></tr><td colspan=\"2\" class=\"grantabla33\">");
      out.print(traductor.getLiteral("cuadroPrecios_duplicados"));
      out.write("</td>\r\n");
      out.write("  <tr>\r\n");
      out.write("      <td class=\"introbienve3\">\r\n");
      out.write("      \r\n");
      out.write("        <table class=\"general3\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"20%\">");
      out.print(traductor.getLiteral("codigo"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"30%\">");
      out.print(traductor.getLiteral("descripcion"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"20%\">");
      out.print(traductor.getLiteral("codigo"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"30%\">");
      out.print(traductor.getLiteral("descripcion"));
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"grantabla10\" width=\"20%\">");
      out.print(_result.getCodigoCP());
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla10\" width=\"30%\">");
      out.print(_result.getDescripcionCP());
      out.write("</td>\r\n");
      out.write("            ");
if(_result.getCodOfertaUltima()==null){
      out.write("\r\n");
      out.write("   \t            <td class=\"grantabla10\" width=\"20%\">&nbsp;</td>\r\n");
      out.write("            ");
}else{
      out.write("\r\n");
      out.write("\t            <td class=\"grantabla10\" width=\"20%\">");
      out.print(_result.getCodOfertaUltima());
      out.write("</td>\r\n");
      out.write("\t        ");
}
      out.write("\r\n");
      out.write("            ");
if(_result.getDesOfertaUltima()==null){
      out.write("\r\n");
      out.write("\t            <td class=\"grantabla10\" width=\"30%\">&nbsp;</td>\r\n");
      out.write("            ");
}else{
      out.write("\r\n");
      out.write("\t            <td class=\"grantabla10\" width=\"30%\">");
      out.print(_result.getDesOfertaUltima());
      out.write("</td>\r\n");
      out.write("\t        ");
}
      out.write("\r\n");
      out.write("\r\n");
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

      out.write("\r\n");
      out.write("\t          <tr>\r\n");
      out.write("\t            <td class=\"grantabla10\" width=\"26%\">");
      out.print(listaCuadros.getDesCategoria());
      out.write("</td>\r\n");
      out.write("\t            <td class=\"grantabla10\" width=\"37%\">");
      out.print(listaCuadros.getDesTipoHora());
      out.write("</td>\r\n");
      out.write("\t            <td class=\"grantabla34\" >");
      out.print(strImpHora);
      out.write("</td>\r\n");
      out.write("\t          </tr>\r\n");

		}// end for
	}

      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
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
