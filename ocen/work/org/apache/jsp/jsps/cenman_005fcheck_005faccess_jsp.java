package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper;
import com.soluzionasf.ocen.man.web.domain.CenManContractSecurity;

public final class cenman_005fcheck_005faccess_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 // Limpia la cache
	response.setHeader("expires", "0");


	String 	StrLogin = (String)session.getValue("Usuario");
	String 	StrPass =  (String)session.getValue("Usuario");
	long	lonContractorCode = 0;

    System.out.println("El usuario es " + StrLogin);

	// Consultar si la persona es usuario del sistema
	CenManContractSecurity.checkUser(StrLogin,contractor );

	lonContractorCode = contractor.getContractCode();

    System.out.println("El ID del contratista es " + lonContractorCode);

	traductor.setLanguageUser(CenManWebServerDataHelper.getInstance().getLanguageCodeDefault());	
	if (lonContractorCode > 0){
		System.out.println("Validado1");

      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\tparent.navegacion.document.location.href=\"./lateral.jsp\";\r\n");
      out.write("\t\tdocument.location.href=\"./cenman_offer_list_index.jsp\"; <!--//ICM SCI 054705 -->\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\r\n");

	System.out.println("Validado2");
	} else {
		//-1=CenManShared.getWebNotUser()
		if (lonContractorCode == -1) {

      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\talert(\"No esta dado de alta como usuario\");\r\n");
      out.write("\t\tdocument.location.href=\"./layout.jsp\";\r\n");
      out.write("\t</script>\r\n");

		} else {
			//-2=CenManShared.getWebWrongPass()
			if (lonContractorCode == -2) {

      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\talert(\"Password incorrecta\");\r\n");
      out.write("\t\tdocument.location.href=\"./layout.jsp\";\r\n");
      out.write("\t</script>\r\n");

			}
			else{

      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\talert(\"No esta dado de alta como usuario o password incorrecta\");\r\n");
      out.write("\t\tdocument.location.href=\"./layout.jsp\";\r\n");
      out.write("\t</script>\r\n");

			}
		}
	}

      out.write("\r\n");
      out.write("\r\n");
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
