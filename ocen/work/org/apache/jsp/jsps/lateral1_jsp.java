package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.soluzionasf.ocen.man.web.domain.CenManWebShared;

public final class lateral1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\r');
      out.write('\n');

	session = request.getSession (true);
	// ICM  SCI 054705 	 Dependiendo del estado en el que se encuentre la oferta
	// se mostrarán unos enlaces o no
	String strCodEstado=(String)session.getValue("codEstado")	;		

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Untitled Document</title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("\r\n");
      out.write("\tfunction moverOT()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = ''\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = 'none'\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction moverCP()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = ''\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = 'none'\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction moverUO()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = ''\r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = 'none'\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction moverOD()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = ''\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction moverInforme()\r\n");
      out.write("\t{\r\n");
      out.write("\t\tvar ordenTrabajo = parent.central.document.getElementById(\"ordenTrabajo\").style.display\r\n");
      out.write("\t\tvar cuadroPrecio = parent.central.document.getElementById(\"cuadroPrecio\").style.display\r\n");
      out.write("\t\tvar unidadObra =   parent.central.document.getElementById(\"unidadObra\").style.display\r\n");
      out.write("\t\tvar documentos =   parent.central.document.getElementById(\"documentos\").style.display \r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = ''\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = 'none' \r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.focus();\r\n");
      out.write("\t\tif (confirm (\"");
      out.print(traductor.getLiteral("confirmImprimirOT"));
      out.write("\")){\r\n");
      out.write("\t\t\tparent.central.imprimir();\r\n");
      out.write("\t\t}\r\n");
if (!strCodEstado.equals(CenManWebShared.getRpDenegada()) ) {
      out.write("\r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = ''\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = 'none' \r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = 'none'\t\t\r\n");
      out.write("\t\tif (confirm (\"");
      out.print(traductor.getLiteral("confirmImprimirCPrecios"));
      out.write("\")){\r\n");
      out.write("\t\t\tparent.central.imprimir();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = '' \r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = 'none'\t\t\r\n");
      out.write("\t\tif (confirm (\"");
      out.print(traductor.getLiteral("confirmImprimirUObra"));
      out.write("\")){\r\n");
      out.write("\t\t\tparent.central.imprimir();\r\n");
      out.write("\t\t}\r\n");
}
      out.write("\r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = 'none'\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = 'none' \r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = ''\t\t\r\n");
      out.write("\t\tif (confirm (\"");
      out.print(traductor.getLiteral("confirmImprimirDocumentos"));
      out.write("\")){\r\n");
      out.write("\t\t\tparent.central.imprimir();\r\n");
      out.write("\t\t}\t\t\r\n");
      out.write("\t\tparent.central.document.getElementById(\"ordenTrabajo\").style.display = ordenTrabajo\r\n");
      out.write("\t\tparent.central.document.getElementById(\"cuadroPrecio\").style.display = cuadroPrecio\r\n");
      out.write("\t\tparent.central.document.getElementById(\"unidadObra\").style.display = unidadObra\r\n");
      out.write("\t\tparent.central.document.getElementById(\"documentos\").style.display = documentos\r\n");
      out.write("\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\r\n");
      out.write("\t}\t\r\n");
      out.write("\r\n");
      out.write("\tfunction exportar()\r\n");
      out.write("\t{\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif (parent.creaExport.document.getElementById(\"ordenTrabajo\") == null ||\r\n");
      out.write("\t\t\t\tparent.creaExport.document.getElementById(\"cuadroPrecio\")  == null ||\r\n");
      out.write("\t\t\t\tparent.creaExport.document.getElementById(\"unidadObra\") == null ) {\r\n");
      out.write("\t\t\t\talert('");
      out.print(traductor.getLiteral("msgExportar"));
      out.write("');\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\telse {\r\n");
      out.write("\t\t\t<!-- ORDEN TRABAJO -->\r\n");
      out.write("\t\t\tvar ordenTrabajo = parent.creaExport.document.getElementById(\"ordenTrabajo\").innerHTML;\r\n");
      out.write("\t\t\t<!--CUADRO PRECIO  -->\r\n");
      out.write("\t\t\tvar cuadroPrecio = parent.creaExport.document.getElementById(\"cuadroPrecio\").innerHTML;\r\n");
      out.write("\t\t\t<!-- UNIDAD OBRA -->\r\n");
      out.write("\t\t\tvar unidadObra = parent.creaExport.document.getElementById(\"unidadObra\").innerHTML;\r\n");
      out.write("\t\t\tordenTrabajo = ordenTrabajo + cuadroPrecio;\r\n");
      out.write("\t\t\tordenTrabajo = ordenTrabajo + unidadObra;\r\n");
      out.write("\t\t\tdocument.exportar2.documento.value = ordenTrabajo;\r\n");
      out.write("\t\t\tdocument.exportar2.titulo.value = \"ordenTrabajo.xls\";\r\n");
      out.write("\t\t\tdocument.exportar2.target = 'exportarOT'\t\r\n");
      out.write("\t\t\tdocument.exportar2.submit();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t}\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"new3\">\r\n");
      out.write("  <table width=\"100%\" height=\"110\" class=\"opcioneslaterales\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"nueva2\"><a href=\"#\" onclick=\"moverOT();\"  class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp;");
      out.print(traductor.getLiteral("oTrabajo"));
      out.write("</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    ");
if (!strCodEstado.equals(CenManWebShared.getRpDenegada()) ) {
      out.write("\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"nueva2\"><a href=\"#\" onclick=\"moverCP();\" class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp;");
      out.print(traductor.getLiteral("cPrecio"));
      out.write("</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"nueva2\"><a href=\"#\" onclick=\"moverUO();\" class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp");
      out.print(traductor.getLiteral("uObra"));
      out.write("</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    ");
}
      out.write("\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"nueva2\"><a href=\"#\" onclick=\"moverOD();\" class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp;");
      out.print(traductor.getLiteral("documentacion"));
      out.write("</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"nueva2\"><a href=\"#\" onclick=\"moverInforme();\" class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp;");
      out.print(traductor.getLiteral("imprimir"));
      out.write("</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"nueva2\"><a href=\"#\" onclick=\"exportar();\" class=\"enlacesprincipales1\"><img src=\"../images/expand.gif\" border=\"0\">&nbsp;&nbsp;");
      out.print(traductor.getLiteral("exportar"));
      out.write("</a><td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("\r\n");
      out.write("<form name='exportar2' action='./exportar.jsp' method='post'>\r\n");
      out.write("<input type=\"hidden\" name=\"documento\">\r\n");
      out.write("<input type=\"hidden\" name=\"titulo\">\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
