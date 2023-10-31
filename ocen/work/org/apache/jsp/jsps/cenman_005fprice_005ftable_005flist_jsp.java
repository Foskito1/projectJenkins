package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Arrays;
import java.util.List;
import com.soluzionasf.ocen.man.web.domain.CenManWebPriceTableSend;
import isf.util.log.Log;
import java.util.List;
import java.util.Calendar;
import java.util.Iterator;
import java.text.SimpleDateFormat;
import com.soluzionasf.ocen.man.web.domain.CenManWebContractPriceTable;

public final class cenman_005fprice_005ftable_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      java.util.Vector cuadroBean = null;
      synchronized (session) {
        cuadroBean = (java.util.Vector) _jspx_page_context.getAttribute("cuadroBean", PageContext.SESSION_SCOPE);
        if (cuadroBean == null){
          cuadroBean = new java.util.Vector();
          _jspx_page_context.setAttribute("cuadroBean", cuadroBean, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');
      java.util.HashMap cuadroPreciosBean = null;
      synchronized (session) {
        cuadroPreciosBean = (java.util.HashMap) _jspx_page_context.getAttribute("cuadroPreciosBean", PageContext.SESSION_SCOPE);
        if (cuadroPreciosBean == null){
          cuadroPreciosBean = new java.util.HashMap();
          _jspx_page_context.setAttribute("cuadroPreciosBean", cuadroPreciosBean, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');

	List					listOfPriceTables = null;
	Iterator 				iterator = null;
	CenManWebContractPriceTable	priceTable = null;
	
	long	loIdCuadro	= 0;
	
	// Limpia la cache
	response.setHeader("expires", "0");
	session = request.getSession (true);
	
	CenManWebPriceTableSend sendQueryPriceTable = new CenManWebPriceTableSend();
		
	listOfPriceTables = sendQueryPriceTable.sendQueryPriceTable(
                   		contractor.getContractCode());
	

      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function actualizaCategorias(idCuadro){\r\n");
      out.write("\tdocument.formulario.idCuadro.value = idCuadro;\r\n");
      out.write("\tdocument.formulario.submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Cuadro de Precios</title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("\r\n");
      out.write("<body class=\"new4\">\r\n");
      out.write("<form name=\"formulario\" target=\"resultado\" method=\"post\" action=\"cenman_price_table_importe_list.jsp\">\r\n");
      out.write("<INPUT TYPE=\"HIDDEN\" name=\"idCuadro\">\r\n");
      out.write("<table class=\"general\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("<tr><td>&nbsp;</td></tr><td colspan=\"2\" class=\"grantabla33\">");
      out.print(traductor.getLiteral("Cuadro de Precios"));
      out.write("</td>\r\n");
      out.write("        <table class=\"general3\" cellspacing=\"0\" border=\"0\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"20%\">");
      out.print(traductor.getLiteral("Codigo"));
      out.write("</td>\r\n");
      out.write("            <td class=\"grantabla29\" width=\"60%\">");
      out.print(traductor.getLiteral("Descripcion"));
      out.write("</td>\r\n");
      out.write("          </tr>\r\n");

	if (listOfPriceTables.size()>0) {
		iterator = listOfPriceTables.iterator();
	  String strDesCuadro="";
	  String strCodCuadro="";
	 for(int i = 0; i< listOfPriceTables.size(); i++){
		  strDesCuadro="&nbsp;";
	      strCodCuadro="&nbsp;";
		 priceTable = (CenManWebContractPriceTable) listOfPriceTables.get(i);
		 loIdCuadro =priceTable.getIdCuadro();
		 if (priceTable.getDesCuadro()!=null) {
	      	strDesCuadro = priceTable.getDesCuadro();
	      }
		if (priceTable.getCodCuadro()!=null) {
	      	strCodCuadro = priceTable.getCodCuadro();
	      }

      out.write("  \t<tr>\r\n");
      out.write("\t\t\t<td class=\"grantabla10\" width=\"20%\"><a href=\"#\" onClick=\"actualizaCategorias('");
      out.print(priceTable.getIdCuadro());
      out.write("')\" class=\"resaltar\">");
      out.print(strCodCuadro);
      out.write("</a></td>\r\n");
      out.write("\t\t\t<td class=\"grantabla10\" width=\"60%\">&nbsp;");
      out.print(strDesCuadro);
      out.write("</td>  \t\r        </tr>\r\n");
      out.write("\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("\r\n");

	 }
	}

      out.write("\r\n");
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
