package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class pie_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title></title>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
// ICM SCI 054705	
	boolean boo_isMod = false;
	if (session.getValue("boo_isMod")!=null){
		boo_isMod =((Boolean)session.getValue("boo_isMod")).booleanValue();
	}

      out.write("\r\n");
      out.write("<body bottommargin=\"0\" topmargin=\"0\" leftmargin=\"0\" rightmargin=\"0\" >\r\n");
      out.write("      <table cellspacing=\"0\" border=\"0\" width=\"100%\" class=\"introcentro\" >\r\n");
      out.write("        <tr>\r\n");
      out.write("          <td class=\"grantabla2\" width=\"33%\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                ");
if (boo_isMod) {
      out.write("<input type=\"button\" onClick=\"parent.central.salvaOfertaCliente()\" name=\"Salvar\" value=\"");
      out.print(traductor.getLiteral("salvar"));
      out.write("\" class=\"interior\">");
}
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("          </td>\r\n");
      out.write("          <td class=\"grantabla2\" width=\"33%\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                ");
if (boo_isMod) {
      out.write("<input type=\"button\" onClick=\"parent.central.enviaOfertaCliente()\" name=\"Enviar\" value=\"");
      out.print(traductor.getLiteral("enviar"));
      out.write("\" class=\"interior\">");
}
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("          </td>\r\n");
      out.write("          <td class=\"grantabla2\" width=\"33%\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                <input type=\"button\" onClick=\"parent.central.volverLista()\" name=\"Anterior\" value=\"");
      out.print(traductor.getLiteral("anterior"));
      out.write("\" class=\"interior\">\r\n");
      out.write("            </div>\r\n");
      out.write("          </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("      </table>\r\n");
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
