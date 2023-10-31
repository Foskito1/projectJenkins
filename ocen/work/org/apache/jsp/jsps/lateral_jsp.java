package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class lateral_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

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
      out.write("<title>Untitled Document</title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction salir(){\r\n");
      out.write("\t\tif (confirm('");
      out.print(traductor.getLiteral("confirmSalirAplicacion"));
      out.write("'))\r\n");
      out.write("\t\t\tdocument.location.href='./close.jsp';\r\n");
      out.write("\t}\r\n");
      out.write("\tfunction cuadrosGen(){\r\n");
      out.write("\t\tparent.central.document.location.href=\"./cenman_price_table_list_index.jsp\";\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body class=\"new3\">\t\r\n");
      out.write("  <table width=\"100%\" height=\"28\" class=\"opcioneslaterales\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
      out.write("    <!--ICM INICIO SCI 054705 \r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"nueva1\"><a href=\"#\" onClick=\"actualiza()\" class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp;Cumplimentar</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    ICM FIN SCI 054705\r\n");
      out.write("    -->\r\n");
      out.write("\t<tr>\r\n");
      out.write("      <td class=\"nueva1\"><a href=\"#\" onClick=\"javascript:cuadrosGen();\" class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp;");
      out.print(traductor.getLiteral("C.P. Genérico"));
      out.write("</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("     <tr>\r\n");
      out.write("      <td class=\"nueva1\"><a href=\"#\" onClick=\"javascript:salir();\" class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp;");
      out.print(traductor.getLiteral("salir"));
      out.write("</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("  <form name=\"irADetalle\" target=\"_top\" action=\"./cumplimentar.jsp\">\r\n");
      out.write("\t<INPUT TYPE=\"HIDDEN\" name=\"idOferta\">\r\n");
      out.write("\t<input type=\"hidden\" name =\"codOffer\">\r\n");
      out.write("\t<input type=\"hidden\" name =\"expedient\">\r\n");
      out.write("\t<input type=\"hidden\" name =\"numVersion\">\r\n");
      out.write("\t<input type=\"hidden\" name =\"descripcion\">\r\n");
      out.write("\t<input type=\"hidden\" name =\"fechaLimite\">");
//ICM SCI 052234
      out.write("\r\n");
      out.write("\t<input type=\"hidden\" name =\"codEstado\">");
//ICM SCI 054705
      out.write("\r\n");
      out.write("\t<input type=\"hidden\" name =\"desEstado\">");
//ICM SCI 054705
      out.write("\r\n");
      out.write("\t<input type=\"hidden\" name =\"fechaEnvio\">");
//ICM SCI 054705
      out.write("\r\n");
      out.write("  </form>\r\n");
      out.write("<!--ICM INICIO SCI 054705  Se elimina el formulario  irAVer porque ya que no es utilizado-->\r\n");
      out.write("  \r\n");
      out.write("</form>\r\n");
      out.write(" </body>\r\n");
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
