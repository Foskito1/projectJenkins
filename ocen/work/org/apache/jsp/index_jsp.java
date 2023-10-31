package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      			"jsps/cenman_error_salir.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');
      out.write('\n');

	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache
	
	String strRacf = CenManWebServerDataHelper.getInstance().getRacf();	
 	
 	System.out.println("RACF?="+strRacf+"-");
 	
 	if (strRacf.equals("1")){

      out.write("\t\n");
      out.write("\t<script language=\"javascript\">\n");
      out.write("\t\testado='toolbar=no,location=no,resizable=1,status=yes,directories=no,menubar=no,';<!--//ICM SCI 054705 resizable=1-->\n");
      out.write("\t\testado+='scrollbars=yes,width=800,height=565';\n");
      out.write("\t\tif (navigator.appName.indexOf(\"Microsoft\")>=0) {\n");
      out.write("\t\t\testado+=',left=0,top=0'\n");
      out.write("\t\t}\n");
      out.write("\t\telse\n");
      out.write("\t\t{\n");
      out.write("\t\t\testado+=',screenX=0,screenY=0'\n");
      out.write("\t\t}\n");
      out.write("\t\tventana=window.open(\"./iniciocr.htm\",\"\",estado);\n");
      out.write("\t\tself.close();\n");
      out.write("\t</script>\n");

	}
	else {

      out.write("\n");
      out.write("\t<script language=\"javascript\">\n");
      out.write("\t\testado='toolbar=no,location=no,resizable=1,status=yes,directories=no,menubar=no,';<!--//ICM SCI 054705 resizable=1-->\n");
      out.write("\t\testado+='scrollbars=yes,width=800,height=565';\n");
      out.write("\t\tif (navigator.appName.indexOf(\"Microsoft\")>=0) {\n");
      out.write("\t\t\testado+=',left=0,top=0'\n");
      out.write("\t\t}\n");
      out.write("\t\telse\n");
      out.write("\t\t{\n");
      out.write("\t\t\testado+=',screenX=0,screenY=0'\n");
      out.write("\t\t}\n");
      out.write("\t\tventana=window.open(\"./iniciosr.htm\",\"\",estado);\n");
      out.write("\t\tself.close();\n");
      out.write("\t</script>\n");

	}

      out.write('\n');
      out.write('	');
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
