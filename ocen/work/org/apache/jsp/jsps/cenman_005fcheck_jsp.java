package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper;

public final class cenman_005fcheck_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\r\n");

String strUser,strPassword,strLanguage;
strUser			= request.getParameter("Usuario")==null?"":request.getParameter("Usuario");
strLanguage = request.getParameter("language")==null?CenManWebServerDataHelper.getInstance().getLanguageCodeDefault():request.getParameter("language");
traductor.setLanguageUser(strLanguage);


      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<title></title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("<script language=\"javascript\">\r\n");
      out.write("\t\r\n");
      out.write(" function traducir(){\r\n");
      out.write(" \tdocument.formulario.action='./cenman_check.jsp';\r\n");
      out.write(" \tdocument.formulario.submit();\r\n");
      out.write(" }\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"new\" >\r\n");
      out.write("<form name=\"formulario\"  action=\"./cenman_check_access_sr.jsp\" method=\"POST\" name=\"Datos\">\r\n");
      out.write("<table class=\"introcentro\" cellspacing=\"0\" width=\"80%\" border=\"0\">\r\n");
      out.write("\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td class=\"otrageneralnew4\"   colspan=2> <h1>");
      out.print(traductor.getLiteral("cumplimentacionOfertas"));
      out.write("</h1></td>\r\n");
      out.write("  </tr>\r\n");
      out.write("</table>\r\n");
      out.write("  <table class=\"introcentro\" cellspacing=\"0\" width=\"68%\" border=\"0\">\r\n");
      out.write("  <tr>\r\n");
      out.write("    <td class=\"otrageneralnew4\" width=\"50%\">&nbsp;</td>\r\n");
      out.write("  </tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("        <td class=\"otrageneralnew1\" width=\"50%\">\r\n");
      out.write("          <div >");
      out.print(traductor.getLiteral("idioma"));
      out.write(":</div>\r\n");
      out.write("        </td>\r\n");
      out.write("        <td class=\"otrageneralnew\" width=\"50%\">\r\n");
      out.write("            <select name=\"language\" class=\"inputformularioM\" onchange=\"javascript:traducir();\">\r\n");
      out.write("            \t<option value=\"es\" ");
if (strLanguage.equals("es")) {
      out.write("selected");
}
      out.write('>');
      out.print(traductor.getLiteral("espanol"));
      out.write("</option>\r\n");
      out.write("            \t<option value=\"en\" ");
if (strLanguage.equals("en")) {
      out.write("selected");
}
      out.write('>');
      out.print(traductor.getLiteral("ingles"));
      out.write("</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td class=\"otrageneralnew1\" width=\"50%\">\r\n");
      out.write("          <div >");
      out.print(traductor.getLiteral("usuario"));
      out.write(":</div>\r\n");
      out.write("        </td>\r\n");
      out.write("        <td class=\"otrageneralnew\" width=\"50%\">\r\n");
      out.write("\r\n");
      out.write("            <input type=\"text\" name=\"Usuario\" size=\"15\"  maxlength=\"8\" class=\"inputformularioM\" value=\"");
      out.print(strUser);
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <td class=\"otrageneralnew1\" width=\"50%\">\r\n");
      out.write("          <div>");
      out.print(traductor.getLiteral("password"));
      out.write(":</div>\r\n");
      out.write("        </td>\r\n");
      out.write("        <td class=\"otrageneralnew\" width=\"50%\">\r\n");
      out.write("            <input type=\"password\" name=\"password\" size=\"15\"  maxlength=\"8\" class=\"inputformularioM\" value=\"\">\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>      \r\n");
      out.write("     <tr>\r\n");
      out.write("    \t\t<td class=\"otrageneralnew4\" width=\"50%\">&nbsp;</td>\r\n");
      out.write("  \t </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("  <table class=\"introcentro\" cellspacing=\"0\" width=\"100%\" border=\"0\">\r\n");
      out.write("  \t<tr>\r\n");
      out.write("  \t<td class=\"otrageneralnew1\" width=\"20%\">\r\n");
      out.write("           &nbsp;\r\n");
      out.write("        </td>\r\n");
      out.write("        <td   width=\"25%\" align=right>\r\n");
      out.write("           <INPUT TYPE=\"submit\" NAME=\"enviar\" VALUE=\"");
      out.print(traductor.getLiteral("enviar"));
      out.write("\">\r\n");
      out.write("        </td>\r\n");
      out.write("         <td class=\"otrageneralnew1\" width=\"10%\">\r\n");
      out.write("          &nbsp;\r\n");
      out.write("        </td>\r\n");
      out.write("        <td   width=\"25%\"  align=left>\r\n");
      out.write("\r\n");
      out.write("            <INPUT TYPE=\"reset\" NAME=\"borrar\" VALUE=\"");
      out.print(traductor.getLiteral("limpiar"));
      out.write("\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </td>\r\n");
      out.write("        <td class=\"otrageneralnew1\" width=\"20%\">\r\n");
      out.write("          &nbsp;\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("<head>\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write(" ");
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
