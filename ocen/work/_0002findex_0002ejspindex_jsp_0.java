import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.util.Vector;
import org.apache.jasper.runtime.*;
import java.beans.*;
import org.apache.jasper.JasperException;
import com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper;


public class _0002findex_0002ejspindex_jsp_0 extends HttpJspBase {


    static {
    }
    public _0002findex_0002ejspindex_jsp_0( ) {
    }

    private static boolean _jspx_inited = false;

    public final void _jspx_init() throws JasperException {
    }

    public void _jspService(HttpServletRequest request, HttpServletResponse  response)
        throws IOException, ServletException {

        JspFactory _jspxFactory = null;
        PageContext pageContext = null;
        HttpSession session = null;
        ServletContext application = null;
        ServletConfig config = null;
        JspWriter out = null;
        Object page = this;
        String  _value = null;
        try {

            if (_jspx_inited == false) {
                _jspx_init();
                _jspx_inited = true;
            }
            _jspxFactory = JspFactory.getDefaultFactory();
            response.setContentType("text/html;charset=ISO-8859-1");
            pageContext = _jspxFactory.getPageContext(this, request, response,
			"jsps/cenman_error_salir.jsp", true, 8192, true);

            application = pageContext.getServletContext();
            config = pageContext.getServletConfig();
            session = pageContext.getSession();
            out = pageContext.getOut();

            // HTML // begin [file="C:\\Tomcatv6.0\\webapps\\ocen\\index.jsp";from=(0,137);to=(1,0)]
                out.write("\n");
            // end
            // HTML // begin [file="C:\\Tomcatv6.0\\webapps\\ocen\\index.jsp";from=(1,53);to=(3,0)]
                out.write("\n\n");
            // end
            // begin [file="C:\\Tomcatv6.0\\webapps\\ocen\\index.jsp";from=(3,2);to=(13,0)]
                
                	// Limpia la cache
                	response.setHeader("expires", "0");
                	// Limpia la cache
                	
                	String strRacf = CenManWebServerDataHelper.getInstance().getRacf();	
                 	
                 	System.out.println("RACF?="+strRacf+"-");
                 	
                 	if (strRacf.equals("1")){
            // end
            // HTML // begin [file="C:\\Tomcatv6.0\\webapps\\ocen\\index.jsp";from=(13,2);to=(27,0)]
                out.write("\t\n\t<script language=\"javascript\">\n\t\testado='toolbar=no,location=no,resizable=1,status=yes,directories=no,menubar=no,';<!--//ICM SCI 054705 resizable=1-->\n\t\testado+='scrollbars=yes,width=800,height=565';\n\t\tif (navigator.appName.indexOf(\"Microsoft\")>=0) {\n\t\t\testado+=',left=0,top=0'\n\t\t}\n\t\telse\n\t\t{\n\t\t\testado+=',screenX=0,screenY=0'\n\t\t}\n\t\tventana=window.open(\"./iniciocr.htm\",\"\",estado);\n\t\tself.close();\n\t</script>\n");
            // end
            // begin [file="C:\\Tomcatv6.0\\webapps\\ocen\\index.jsp";from=(27,2);to=(30,0)]
                
                	}
                	else {
            // end
            // HTML // begin [file="C:\\Tomcatv6.0\\webapps\\ocen\\index.jsp";from=(30,2);to=(44,0)]
                out.write("\n\t<script language=\"javascript\">\n\t\testado='toolbar=no,location=no,resizable=1,status=yes,directories=no,menubar=no,';<!--//ICM SCI 054705 resizable=1-->\n\t\testado+='scrollbars=yes,width=800,height=565';\n\t\tif (navigator.appName.indexOf(\"Microsoft\")>=0) {\n\t\t\testado+=',left=0,top=0'\n\t\t}\n\t\telse\n\t\t{\n\t\t\testado+=',screenX=0,screenY=0'\n\t\t}\n\t\tventana=window.open(\"./iniciosr.htm\",\"\",estado);\n\t\tself.close();\n\t</script>\n");
            // end
            // begin [file="C:\\Tomcatv6.0\\webapps\\ocen\\index.jsp";from=(44,2);to=(46,0)]
                
                	}
            // end
            // HTML // begin [file="C:\\Tomcatv6.0\\webapps\\ocen\\index.jsp";from=(46,2);to=(47,1)]
                out.write("\n\t");
            // end

        } catch (Exception ex) {
            if (out != null && out.getBufferSize() != 0)
                out.clearBuffer();
            if (pageContext != null) pageContext.handlePageException(ex);
        } finally {
            if (out != null) out.flush();
            if (_jspxFactory != null) _jspxFactory.releasePageContext(pageContext);
        }
    }
}
