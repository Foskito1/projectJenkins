<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManWebShared"%>
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<%
	session = request.getSession (true);
	// ICM  SCI 054705 	 Dependiendo del estado en el que se encuentre la oferta
	// se mostrarán unos enlaces o no
	String strCodEstado=(String)session.getValue("codEstado")	;		
%>
<html>
<head>
<title>Untitled Document</title>
<link rel=stylesheet href="css/ocen.css" type="text/css">

<script language="JavaScript">
</script>

<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

</head>
<body class="new3">
  <table width="100%" height="110" class="opcioneslaterales" cellspacing="0" cellpadding="0" border="0">
    <tr>
      <td class="nueva2"><a href="#"  class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("oTrabajo")%></a><td>
    </tr>
    <%if (!strCodEstado.equals(CenManWebShared.getRpDenegada()) ) {%>
    <tr>
      <td class="nueva2"><a href="#" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("cPrecio")%></a><td>
    </tr>
    <tr>
      <td class="nueva2"><a href="#" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp<%=traductor.getLiteral("uObra")%></a><td>
    </tr>
    <%}%>
    <tr>
      <td class="nueva2"><a href="#" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("documentacion")%></a><td>
    </tr>
    <tr>
      <td class="nueva2"><a href="#" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("imprimir")%></a><td>
    </tr>
    <tr>
      <td class="nueva2"><a href="#" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("exportar")%></a><td>
    </tr>
  </table>

</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>
