<%@ page language="java" errorPage="jsps/cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<%
	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache
	
	String strRacf = CenManWebServerDataHelper.getInstance().getRacf();	
 	
 	System.out.println("RACF?="+strRacf+"-");
 	
 	if (strRacf.equals("1")){
%>	
	<script language="javascript">
		estado='toolbar=no,location=no,resizable=1,status=yes,directories=no,menubar=no,';<!--//ICM SCI 054705 resizable=1-->
		estado+='scrollbars=yes,width=800,height=565';
		if (navigator.appName.indexOf("Microsoft")>=0) {
			estado+=',left=0,top=0'
		}
		else
		{
			estado+=',screenX=0,screenY=0'
		}
		ventana=window.open("./iniciocr.htm","",estado);
		self.close();
	</script>
<%
	}
	else {
%>
	<script language="javascript">
		estado='toolbar=no,location=no,resizable=1,status=yes,directories=no,menubar=no,';<!--//ICM SCI 054705 resizable=1-->
		estado+='scrollbars=yes,width=800,height=565';
		if (navigator.appName.indexOf("Microsoft")>=0) {
			estado+=',left=0,top=0'
		}
		else
		{
			estado+=',screenX=0,screenY=0'
		}
		ventana=window.open("./iniciosr.htm","",estado);
		self.close();
	</script>
<%
	}
%>
	