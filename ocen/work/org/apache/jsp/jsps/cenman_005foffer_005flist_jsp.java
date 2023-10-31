package org.apache.jsp.jsps;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Arrays;
import java.util.List;
import com.soluzionasf.ocen.man.web.domain.CenManWebQueryOfferSend;
import isf.util.log.Log;
import java.util.List;
import java.util.Calendar;
import java.util.Iterator;
import java.text.SimpleDateFormat;
import com.soluzionasf.ocen.man.web.domain.CenManWebContractOffer;

public final class cenman_005foffer_005flist_jsp extends org.apache.jasper.runtime.HttpJspBase
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

	List						listOfOffers = null;
	Iterator 				iterator = null;
	CenManWebContractOffer	offer = null;
	long	loIdOffer	= 0;	
	// Limpia la cache
	response.setHeader("expires", "0");
	session = request.getSession (true);
	
	session.removeValue("codOffer");
	session.removeValue("expedient");
	session.removeValue("numVersion");
	session.removeValue("descripcion");
	session.removeValue("fechaLimite");//ICM SCI 052234
	
	
	/* ICM INICIO SCI 054705*/
	String[] str_statesFilter=(String[])request.getParameterValues("state");
	List arrayStatesFilter = new ArrayList();

	String str_dateFromFilter, str_dateToFilter;
	Date dateFromFilter, dateToFilter;
	dateToFilter = null;
	dateFromFilter = null;
 	SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");       
	
	str_dateFromFilter = request.getParameter("dateFrom");
  str_dateToFilter = request.getParameter("dateTo");    
	if (!(str_dateFromFilter==null) && !(str_dateFromFilter.equals("00/00/0000"))) {   	  	
  	dateFromFilter= formatDate.parse(str_dateFromFilter);
  }
  contractor.setDateFromFilter(dateFromFilter);
  if (!(str_dateToFilter==null)  && !(str_dateToFilter.equals("00/00/0000"))) {   	  	
  	dateToFilter= formatDate.parse(str_dateToFilter);
  }
  contractor.setDateToFilter(dateToFilter);
		 
	arrayStatesFilter  = Arrays.asList(str_statesFilter);		
	contractor.setStatesFilter(new ArrayList(arrayStatesFilter));	
	
	
	CenManWebQueryOfferSend sendQueryOffers = new CenManWebQueryOfferSend();
	
	
	listOfOffers = sendQueryOffers.sendQueryOffer(
                   		contractor.getContractCode(),
                    	contractor.getNode(),contractor.getStatesFilter(),contractor.getDateFromFilter(),contractor.getDateToFilter());
	
	

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Lista de ofertas</title>\r\n");
      out.write("<link rel=stylesheet href=\"css/ocen.css\" type=\"text/css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\r\n");
      out.write("<script language=\"JavaScript\" src=\"js/sorttable.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\">\r\n");
//ICM SCI 052234 Se añade un nuevo argumento fechaLimite que contiene la fecha Limite de la oferta
      out.write('\r');
      out.write('\n');
//ICM SCI 054705 Se añade un nuevo argumento estado que contiene el estado en el que se encuentra la oferta con
//respecto al contratista.Tambien se añade un nuevo argumento que contiene la fecha envio
      out.write("\r\n");
      out.write("function actualizaOcultos(idOferta,codOferta,expediente,version,fecha,descripcion,fechaLimite,codEstado,desEstado,fechaEnvio)\r\n");
      out.write("{\r\n");
      out.write("\tdocument.listaOfers.idOferta.value = idOferta;\r\n");
      out.write("\tdocument.listaOfers.codOffer.value = codOferta;\r\n");
      out.write("\tdocument.listaOfers.expedient.value = expediente;\r\n");
      out.write("\tdocument.listaOfers.numVersion.value = version;\r\n");
      out.write("\tdocument.listaOfers.creationDate.value = fecha;\t\t\r\n");
      out.write("\t\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.idOferta.value=document.listaOfers.idOferta.value;\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.codOffer.value = codOferta;\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.expedient.value = expediente;\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.numVersion.value = version;\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.descripcion.value = descripcion;\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.fechaLimite.value = fechaLimite;");
//ICM SCI 052234
      out.write("\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.codEstado.value = codEstado;");
//ICM SCI 054705
      out.write("\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.desEstado.value = desEstado;");
//ICM SCI 054705
      out.write("\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.fechaEnvio.value = fechaEnvio;");
//ICM SCI 054705
      out.write("\r\n");
      out.write("\r\n");
      out.write("\tparent.parent.navegacion.document.irADetalle.submit();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write(" <body class=\"new4\">\r\n");
      out.write("\r\n");
      out.write("   <table class=\"general\" cellspacing=\"0\" border=\"0\">    \r\n");
      out.write("    <tr>\r\n");
      out.write("      <td class=\"introbienve3\">\r\n");
      out.write("<form name='listaOfers'>\r\n");
      out.write("<INPUT TYPE=\"HIDDEN\" name=\"idOferta\">\r\n");
      out.write("<input type=\"hidden\" name =\"codOffer\">\r\n");
      out.write("<input type=\"hidden\" name =\"expedient\">\r\n");
      out.write("<input type=\"hidden\" name =\"numVersion\">\r\n");
      out.write("<input type=\"hidden\" name =\"creationDate\">\t\r\n");
      out.write("<table id=\"t1\" class=\"sortable\"  cellspacing=\"0\" border=\"0\">\r\n");
      out.write("\t\t  <tr>\r\n");
      out.write("            <th class=\"datos2\" width=\"18%\">");
      out.print(traductor.getLiteral("codigo"));
      out.write("</th>\r\n");
      out.write("            <th class=\"datos2\" width=\"10%\">");
      out.print(traductor.getLiteral("version"));
      out.write("</th>\r\n");
      out.write("            <th class=\"datos2\" width=\"36%\">");
      out.print(traductor.getLiteral("descripcion"));
      out.write("</th>            \r\n");
      out.write("            <th class=\"datos2\" width=\"12%\">");
      out.print(traductor.getLiteral("expediente"));
      out.write("</th>\r\n");
      out.write("            <th class=\"datos2\" width=\"12%\">");
      out.print(traductor.getLiteral("fCreacion"));
      out.write("</th>\r\n");
      out.write("            <th class=\"datos2\" width=\"12%\">");
      out.print(traductor.getLiteral("fLimite"));
      out.write("</th>\r\n");
      out.write("            <th class=\"datos2\" width=\"12%\">");
      out.print(traductor.getLiteral("estado"));
      out.write("</th>\r\n");
      out.write("        </tr>\r\n");

	if (listOfOffers.size()>0) {
		iterator = listOfOffers.iterator();
	  String strDesOfer="";
	  String strCreationDate="";
	  String strFechaLimite="";//ICM SCI 052234
		String strExpediente="";
		String strDesEstado = "";
		String strFechaEnvio = "";//ICM SCI  054705
		long 	 longCodEstado ;
		Calendar cal = Calendar.getInstance();
		
		while (iterator.hasNext()){
	  		strDesOfer="&nbsp;";
	      strCreationDate="&nbsp;";
				strExpediente="&nbsp;";
	    	offer = (CenManWebContractOffer) iterator.next();
				loIdOffer = offer.getIdOffer();
	
	      if (offer.getDesOffer()!=null) {
	      	strDesOfer = offer.getDesOffer();
	      }
	      
	      if (offer.getCreationDate()!=null) {													
	         strCreationDate = formatDate.format(offer.getCreationDate());
	       }
				if ((offer.getExpedient()!=null)&&(!offer.getExpedient().equals("null"))) {
					strExpediente = offer.getExpedient();
				}		
				//ICM SCI 052234
				if ((offer.getLimitDate()!=null) && (!offer.getLimitDate().equals("null"))){						
	      	strFechaLimite = formatDate.format(offer.getLimitDate());
				}else {
					strFechaLimite="";
				}
				//FIN SCI 052234
				
				//ICM SCI 054705
				if ((offer.getSendDate()!=null) && (!offer.getSendDate().equals("null"))){						
	      	strFechaEnvio = formatDate.format(offer.getSendDate());
				}else {
					strFechaEnvio="";
				}
				//FIN SCI 054705
				
				longCodEstado= offer.getCodState();
				strDesEstado = offer.getDesState();
			
	
	
      out.write("       <tr>\r\n");
      out.write("\t\t\t\t\t\t\t");
//ICM SCI 052234 Se añade a la función actualizaOcultos el argumento fechaLimite de la oferta
      out.write("\r\n");
      out.write("\t            <td class=\"datos5\" width=\"15%\"><a href=\"#\" onClick=\"actualizaOcultos('");
      out.print(loIdOffer);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(offer.getCodOffer());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(offer.getExpedient());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(offer.getNumVersion());
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(strCreationDate);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(strDesOfer);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(strFechaLimite);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(longCodEstado);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(strDesEstado);
      out.write('\'');
      out.write(',');
      out.write('\'');
      out.print(strFechaEnvio);
      out.write("')\" class=\"resaltar\">");
      out.print(offer.getCodOffer());
      out.write("</a></td>\r\n");
      out.write("\t            <td class=\"datos5\" width=\"13%\">&nbsp;");
      out.print(offer.getNumVersion());
      out.write("</td>\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"datos5\" width=\"36%\">&nbsp;");
      out.print(strDesOfer);
      out.write("</td>           \r\n");
      out.write("\t            <td class=\"datos5\" width=\"12%\">&nbsp;");
      out.print(strExpediente);
      out.write("</td>\r\n");
      out.write("\t            <td class=\"datos5\" width=\"12%\">&nbsp;");
      out.print(strCreationDate);
      out.write("</td>\r\n");
      out.write("\t            <td class=\"datos5\" width=\"12%\">&nbsp;");
      out.print(strFechaLimite);
      out.write("</td>\r\n");
      out.write("\t            <td class=\"datos5\" width=\"12%\">&nbsp;");
      out.print(strDesEstado);
      out.write("</td>\r\n");
      out.write("\t");

		}
	}else {
      out.write("\r\n");
      out.write("\t\t<script language=\"javascript\">\r\n");
      out.write("\t\t\talert('");
      out.print(traductor.getLiteral("msgOfertasNoEncontradas"));
      out.write("');\r\n");
      out.write("\t\t</script>\r\n");
      out.write("\t");
}
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("</form>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <td colspan=\"3\">\r\n");
      out.write("        <table class=\"general1\" cellspacing=\"0\" border=\"0\" width=\"100%\">\r\n");
      out.write("          <tr>\r\n");
      out.write("            <td class=\"boton\" width=\"100%\">\r\n");
      out.write("            </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("  </table>\r\n");
      out.write("</body>\r\n");
      out.write("<head>\r\n");
      out.write("<META HTTP-EQUIV=\"PRAGMA\" CONTENT=\"NO-CACHE\">\r\n");
      out.write("</head>\r\n");
      out.write("</html>");
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
