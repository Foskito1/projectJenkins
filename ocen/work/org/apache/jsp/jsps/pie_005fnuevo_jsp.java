package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class pie_005fnuevo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

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
      out.write("\r\n");


      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function actualizaCategorias(idCuadro){\r\n");
      out.write("\tdocument.formulario.idCuadro.value = idCuadro;\r\n");
      out.write("\tdocument.formulario.submit();\r\n");
      out.write("}\r\n");
      out.write("function volverLista()\r\n");
      out.write("{\r\n");
      out.write("\tparent.navegacion.document.botonera.location.href=\"./lateral.jsp\";\r\n");
      out.write("\tparent.pieframe.document.botonera.location.href=\"./pievacio.htm\";\r\n");
      out.write("\tdocument.botonera.submit();\r\n");
      out.write("}\r\n");
      out.write("function salvaOfertaCliente() {\r\n");
      out.write("\r\n");
      out.write("     document.enviaOferta.flgSalvarEnviar.value='S'; ");
// ICM SCI 054705 
      out.write("\r\n");
      out.write("     document.enviaOferta.submit();");
// ICM SCI 054705 
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("\r\n");
      out.write("<body class=\"new4\">\r\n");
      out.write("<form name=\"botonera\" target=\"pieframe\" method=\"post\" action=\"cenman_offer_list_index.jsp\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("        <table class=\"general3\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("           <td class=\"grantabla2\" width=\"33%\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                <input type=\"button\" onClick=\"salvaOfertaCliente()\" name=\"Salvar\" value=\"");
      out.print(traductor.getLiteral("Salvar"));
      out.write("\" class=\"interior\">\r\n");
      out.write("            </div>\r\n");
      out.write("\t\t   </td>          \r\n");
      out.write("           <td class=\"grantabla2\" width=\"33%\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                <input type=\"button\" onClick=\"volverLista()\" name=\"Anterior\" value=\"");
      out.print(traductor.getLiteral("Anterior"));
      out.write("\" class=\"interior\">\r\n");
      out.write("            </div>\r\n");
      out.write("           </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("</table>\r\n");
      out.write("</form>\r\n");
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
