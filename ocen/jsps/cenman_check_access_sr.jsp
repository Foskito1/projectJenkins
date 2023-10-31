<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManContractSecurity, com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />

<% // Limpia la cache
	response.setHeader("expires", "0");

	String strLogUser = request.getParameter ("Usuario");
	String strPass = request.getParameter ("password");    
	
	session.putValue ("Usuario",strLogUser.toUpperCase());
	/**ICM SCI 054705 */
	String strLanguage = request.getParameter("language");
	traductor.setLanguageUser(strLanguage);		
	/**ICM SCI 054705 */
	String 	StrLogin = (String)session.getValue("Usuario");
	long	lonContractorCode = 0;
	

	
	String strRacf = CenManWebServerDataHelper.getInstance().getRacf();	        
	

	
	if (strRacf.equals("0")){
		// Consultar si la persona es usuario del sistema
		CenManContractSecurity.checkUser(StrLogin, strPass, contractor);
		lonContractorCode = contractor.getContractCode();
	}
	
	System.out.println("El ID del contratista es " + lonContractorCode);
	
	if (lonContractorCode > 0){
		System.out.println("Validado");
%>
	<script>
		parent.navegacion.document.location.href="./lateral.jsp";
		document.location.href="./cenman_offer_list_index.jsp";
	</script>



<%
	} else {
		//-1=CenManShared.getWebNotUser()
		if (lonContractorCode == -1) {
%>
	<script>
		alert("<%=traductor.getLiteral("msgNoEsUsuario")%>");
		document.location.href="./layout.jsp";
	</script>
<%
		} else {
			//-2=CenManShared.getWebWrongPass()
			if (lonContractorCode == -2) {
%>
	<script>
		alert("<%=traductor.getLiteral("msgPasswordIncorrecta")%>");
		document.location.href="./layout.jsp";
	</script>
<%
			}
			else{
%>
	<script>
		alert("<%=traductor.getLiteral("msgNoEsUsuarioPasswordIncorrecta")%>");
		document.location.href="./layout.jsp";
	</script>
<%
			}
		}
	}
%>

