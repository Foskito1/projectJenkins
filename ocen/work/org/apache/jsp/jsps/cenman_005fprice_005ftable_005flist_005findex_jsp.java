package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cenman_005fprice_005ftable_005flist_005findex_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<HTML>\r\n");
      out.write("<HEAD>\r\n");
      out.write("<TITLE>:: Bienvenidos a GURU ::</title>\r\n");
      out.write("</HEAD>\r\n");
      out.write("<META http-equiv=Content-Type content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<frameset rows=\"*,50\" frameborder=\"NO\" border=\"0\" framespacing=\"0\">\r\n");
      out.write("\t<frameset name=\"contenido\" border=0 frameSpacing=0 scrolling=yes frameBorder=NO rows=\"120,*\">\r\n");
      out.write("\t\t<frame name=\"filtro\" scrolling=auto src=\"cenman_price_table_list.jsp\" frameBorder=\"NO\"/>\t\r\n");
      out.write("\t\t<frame name=\"resultado\" scrolling=auto src=\"vacio.htm\" frameBorder=\"NO\"/>\r\n");
      out.write("\t</frameset>\r\n");
      out.write("<frame name=\"pieframe\" scrolling=\"NO\" noresize src=\"pie_precios_gen.jsp\">\r\n");
      out.write("</frameset>\r\n");
      out.write("<noframes>\r\n");
      out.write("<body bgcolor='#FFFFFF' text='#000000'></body>\r\n");
      out.write("</noframes>\r\n");
      out.write("</HTML>\r\n");
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
