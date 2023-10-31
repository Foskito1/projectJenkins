<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper,com.soluzionasf.ocen.man.web.domain.CenManContractSecurity"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />


<% // Limpia la cache
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
%>
	<script>
		parent.navegacion.document.location.href="./lateral.jsp";
		document.location.href="./cenman_offer_list_index.jsp"; <!--//ICM SCI 054705 -->
	</script>

	

<%
	System.out.println("Validado2");
	} else {
		//-1=CenManShared.getWebNotUser()
		if (lonContractorCode == -1) {
%>
	<script>
		alert("No esta dado de alta como usuario");
		document.location.href="./layout.jsp";
	</script>
<%
		} else {
			//-2=CenManShared.getWebWrongPass()
			if (lonContractorCode == -2) {
%>
	<script>
		alert("Password incorrecta");
		document.location.href="./layout.jsp";
	</script>
<%
			}
			else{
%>
	<script>
		alert("No esta dado de alta como usuario o password incorrecta");
		document.location.href="./layout.jsp";
	</script>
<%
			}
		}
	}
%>

