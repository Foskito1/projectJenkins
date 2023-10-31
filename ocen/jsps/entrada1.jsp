<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.revisions_stops.servlets.CenManRPWebDataOfferRequestDOMImpl, com.soluzionasf.ocen.man.revisions_stops.servlets.ICenManRPWebDataOfferRequest, com.soluzionasf.ocen.man.web.domain.CenManWebDetailOffer"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="cuadroBean" scope="session" class="java.util.Vector" />
<%
	// Limpia la cache
	response.setHeader("expires", "0");

	String strCodOffer	= request.getParameter("codOffer");
	String strExpedient	= request.getParameter("expedient");
	String strNumVersion	= request.getParameter("numVersion");
	String strCreationDate	= request.getParameter("creationDate");

	if (strCodOffer.equals("null")) {
		strCodOffer="";
	}

	if (strExpedient.equals("null")) {
		strExpedient="";
	}

	if (strNumVersion.equals("null")) {
		strNumVersion="";
	}

	if (strCreationDate.equals("null")) {
		strCreationDate="";
	}	
		
%>
<html>
<head>
<title></title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
 <body class="new4">
   <table class="general" cellspacing="0" border="0">   
    <tr>   
      <td class="introbienve3">
        <table class="generalnew" cellspacing="0" border="0" height="50%">   
          <tr> 
            <td class="datosoferta" width="20%">Oferta:</td>
            <td class="datosoferta1" width="80%"><%=strCodOffer%></td>   
          </tr>
          <tr>
            <td class="datosoferta" width="20%">Expediente:</td>
            <td class="datosoferta1" width="80%"><%=strExpedient%></td>
          </tr>
          <tr>
            <td class="datosoferta" width="20%">Versi&oacute;n:</td>
            <td class="datosoferta1" width="80%"><%=strNumVersion%></td>
          </tr>
            <tr>
            <td class="datosoferta" width="20%">Fecha:</td>
            <td class="datosoferta1" width="80%"><%=strCreationDate%></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="3">
      </td>
    </tr>  
  </table>      
</body>
</html>