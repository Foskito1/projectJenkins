package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper;

public final class layout_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
	
	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache
				
	//INICIO SCI 054320 Se elimina la información de la sessión y se obtiene el dominio de la aplicación
	// para poder eliminar posteriormente la cookies antes de salir
	String[] atributos = session.getValueNames() ;
	int i=0;
	
	while (i<atributos.length) {	
		String atributo = (String)atributos[i++];		
		session.removeValue(atributo);
	}
	String strDomain = CenManWebServerDataHelper.getInstance().getDomain();		
	// FIN SCI 054320

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Untitled Document</title>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("\r\n");
      out.write("\tfunction DeleteCookie (name,path,domain) {\r\n");
      out.write("\t    document.cookie = name + \"=\" +\r\n");
      out.write("\t      ((path) ? \"; path=\" + path : \"\") +\r\n");
      out.write("\t      ((domain) ? \"; domain=\" + domain : \"\") +\r\n");
      out.write("\t      \"; expires=Thu, 01-Jan-70 00:00:01 GMT\";\t     \r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction cleanUp()\r\n");
      out.write("\t{\t\t\r\n");
      out.write("\t\tDeleteCookie (\"RojUser\",\"/\",\"");
      out.print(strDomain);
      out.write("\");\t\t\r\n");
      out.write("\t\tDeleteCookie (\"RojPassword\",\"/\",\"");
      out.print(strDomain);
      out.write("\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
      out.write("\tcleanUp();<!--ICM SCI 054320 Se eliminan las cookies-->\r\n");
      out.write("\ttop.location ='../index.jsp';\t\r\n");
      out.write("</script>\r\n");
      out.write("</body>");
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
