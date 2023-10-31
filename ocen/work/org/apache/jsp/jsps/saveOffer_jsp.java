package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.soluzionasf.ocen.man.revisions_stops.servlets.CenManRPWebDataOfferRequestDOMImpl;
import com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest;
import com.soluzionasf.ocen.man.web.domain.CenManWebDetailOffer;

public final class saveOffer_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	// Limpia la cache
	response.setHeader("expires", "0");


	CenManWebDetailOffer offerData = new CenManWebDetailOffer();

	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.Elemento elemento = null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.CuadroPrecio cuadroPrecio= null;
	com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest.PrecioUO precioUO= null;

	CenManRPWebDataOfferRequestDOMImpl _result = null;



	_result = (CenManRPWebDataOfferRequestDOMImpl)cuadroBean.elementAt(0);

	cuadroBean.removeElementAt(0);

	String str_flgSalvarEnviar = request.getParameter("flgSalvarEnviar");

	String str_idOferta = _result.getIdOferta();
	String str_idOferContrat = _result.getIdOferContrat();
	String str_optimistLock = _result.getOptimistLockContrat();

/****************/
	String [] str_idOferUuoo = request.getParameterValues("idOferUuoo");
	String [] str_optimistLockUO = request.getParameterValues("optimistLockUO");
	String [] str_idUuooContr = request.getParameterValues("idUuooContr");
	String [] str_impUnidad = request.getParameterValues("impUnidad");
	String [] str_impUnidadContr = request.getParameterValues("impUnidadContr");

/******************/
	String [] str_idCuadroCont = request.getParameterValues("idCuadroCont");
	String [] str_optimistLockCP = request.getParameterValues("optimistLockCP");
	String [] str_idOferCuadro = request.getParameterValues("idOferCuadro");
	String [] str_impHora = request.getParameterValues("impHora");
	String [] str_impHoraContr = request.getParameterValues("impHoraContr");

/******************/
	String [] str_idOferElemTA = request.getParameterValues("idOferElemTA");
	String [] str_idOferTA = request.getParameterValues("idOferTA");
	String [] str_optimistLockTA = request.getParameterValues("optimistLockTA");
	String [] str_numPersonasTA = request.getParameterValues("numPersonasTA");
	String [] str_numHorasTA = request.getParameterValues("numHorasTA");
	String [] str_unidadesTA = request.getParameterValues("unidadesTA");
	String [] str_manoObraTA = request.getParameterValues("manoObraTA");

/******************/
	String [] str_idOferElemAD = request.getParameterValues("idOferElemAD");
	String [] str_idOferAD = request.getParameterValues("idOferAD");
	String [] str_optimistLockAD = request.getParameterValues ("optimistLockAD");
	String [] str_materialAD = request.getParameterValues ("materialAD");
	String [] str_otrosAD = request.getParameterValues ("otrosAD");

/******************/
	String [] str_idOferElemUO = request.getParameterValues("idOferElemUO");
	String [] str_idOferUO = request.getParameterValues("idOferUO");
	String [] str_optimistLockUUOO = request.getParameterValues("optimistLockUUOO");
	String [] str_numPersonasUO = request.getParameterValues("numPersonasUO");
	String [] str_numHorasUO = request.getParameterValues("numHorasUO");

	offerData.insertWebOffer (str_idOferta,
                    str_idOferContrat,
                    str_idOferUuoo,
	                str_optimistLockUO,
	                str_idUuooContr,
	                str_impUnidad,
	                str_impUnidadContr,
	                str_idCuadroCont,
	                str_optimistLockCP,
	                str_idOferCuadro,
	                str_impHora,
	                str_impHoraContr,
	                str_idOferElemTA,
	                str_idOferTA,
	                str_optimistLockTA,
	                str_numPersonasTA,
	                str_numHorasTA,
	                str_unidadesTA,
	                str_manoObraTA,
					str_idOferElemAD,
					str_idOferAD,
					str_optimistLockAD,
					str_materialAD,
					str_otrosAD,
					str_idOferElemUO,
					str_idOferUO,
					str_optimistLockUUOO,
					str_numPersonasUO,
					str_numHorasUO);

	String strMensajeAlert = "";					
					
	if (str_flgSalvarEnviar.equals("S")) {
		strMensajeAlert=traductor.getLiteral("msgOfertaSalvada");
	}
	else{
	
		offerData.callContractSendOffer (str_idOferContrat,
                                     str_optimistLock);	
		strMensajeAlert=traductor.getLiteral("msgOfertaProcesada");
	}


      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("  <title></title>\r\n");
      out.write("  <link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("  <META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("function mensajeConfirmacion()\r\n");
      out.write("{\r\n");
      out.write("\talert (\"");
      out.print(strMensajeAlert);
      out.write("\");\r\n");

	if (str_flgSalvarEnviar.equals("S")) {
	
      out.write("\r\n");
      out.write("\tdocument.location.href=\"./trabajo.jsp?idOferta=");
      out.print(str_idOferContrat);
      out.write("\";\r\n");
      out.write("\t");

	}
	else{
	
      out.write("\r\n");
      out.write("\tparent.pieframe.document.location.href=\"./pievacio.htm\";");
// ICM SCI 054705 
      out.write("\t\r\n");
      out.write("\tparent.navegacion.document.location.href=\"./lateral.jsp\";\r\n");
      out.write("\tdocument.location.href=\"./cenman_offer_list_index.jsp\";\r\n");
      out.write("\t");

	}

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"new4\" onLoad=\"mensajeConfirmacion()\">\r\n");
      out.write("<table>\r\n");
      out.write("<tr>\r\n");
      out.write("<td>\r\n");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</table>\r\n");
      out.write("</body>\r\n");
      out.write("<head>\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write("</html>");
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
