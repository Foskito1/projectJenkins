package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.soluzionasf.ocen.man.web.domain.CenManWebQueryOfferSend;
import isf.util.log.Log;
import com.soluzionasf.ocen.man.web.domain.CenManWebShared;
import java.util.List;
import java.util.Iterator;
import com.soluzionasf.ocen.man.web.domain.CenManWebContractOffer;

public final class cumplimentar_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	// Limpia la cache
	response.setHeader("expires", "0");
	String strIdOferta	= request.getParameter("idOferta");
	String strCodOffer	= request.getParameter("codOffer");
	String strExpediente	= request.getParameter("expedient");
	String strNumVersion	= request.getParameter("numVersion");
	String strDescripcion	= request.getParameter("descripcion");
	String strFechaLimite = request.getParameter("fechaLimite");
	String strCodEstado 	= request.getParameter("codEstado"); //ICM SCI 054705
	String strDesEstado   = request.getParameter("desEstado");//ICM SCI 054705
	String strFechaEnvio = request.getParameter("fechaEnvio");//ICM SCI 054705

	session = request.getSession (true);
	session.putValue("codOffer", strCodOffer);
	session.putValue("expedient", strExpediente);
	session.putValue("numVersion", strNumVersion);
	session.putValue("descripcion", strDescripcion);
	session.putValue("fechaLimite", strFechaLimite);//ICM SCI 052234
	session.putValue("fechaEnvio", strFechaEnvio);//ICM SCI 054705	
	//ICM INICIO SCI 054705
	session.putValue("codEstado",strCodEstado); 
	boolean boo_isMod = false;
	if (strCodEstado!=null && (strCodEstado.equals(CenManWebShared.getRpSolicitada())|| strCodEstado.equals(CenManWebShared.getRpRecibidaContratista()))) {
		boo_isMod = true;
	}
	session.putValue("boo_isMod",new Boolean(boo_isMod));
	session.putValue("desEstado",strDesEstado); 
	// ICM FIN SCI 054705

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<frameset rows=\"81,*,50\" frameborder=\"NO\" border=\"0\" framespacing=\"0\">\r\n");
      out.write("  <frame name=\"topframe\" scrolling=\"NO\" noresize src=\"superior.htm\">\r\n");
      out.write("  <frameset cols=\"145,*, 0, 0, 0, 0, 0, 0\" frameborder=\"NO\" border=\"0\" framespacing=\"0\">\r\n");
      out.write("     <frame name=\"navegacion\" scrolling=\"auto\" noresize src=\"lateral1.jsp\">\r\n");
      out.write("     <frame name=\"central\" scrolling=\"auto\" noresize src=\"trabajo.jsp?idOferta=");
      out.print(strIdOferta);
      out.write("\">\r\n");
      out.write("     <frame name=\"exportar\" scrolling=\"auto\" noresize src=\"\">\r\n");
      out.write("     <frame name=\"exportarOT\" scrolling=\"auto\" noresize src=\"\">\r\n");
      out.write("     <frame name=\"exportarCuadro\" scrolling=\"auto\" noresize src=\"\">\r\n");
      out.write("     <frame name=\"exportarUO\" scrolling=\"auto\" noresize src=\"\">\r\n");
      out.write("     <frame name=\"estilo\" scrolling=\"auto\" noresize src=\"\">\r\n");
      out.write("     <frame name=\"creaExport\" scrolling=\"auto\" noresize src=\"\">\r\n");
      out.write("  </frameset>\r\n");
      out.write("  <frame name=\"pieframe\" scrolling=\"NO\" noresize src=\"pie.jsp\">\r\n");
      out.write("</frameset>\r\n");
      out.write("<noframes>\r\n");
      out.write("</noframes>\r\n");
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
