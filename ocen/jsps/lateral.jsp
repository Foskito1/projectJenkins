<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<html>
<head>
<title>Untitled Document</title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<script>
	function salir(){
		if (confirm('<%=traductor.getLiteral("confirmSalirAplicacion")%>'))
			document.location.href='./close.jsp';
	}
	function cuadrosGen(){
		parent.central.document.location.href="./cenman_price_table_list_index.jsp";
	}
</script>

<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

</head>

<body class="new3">	
  <table width="100%" height="28" class="opcioneslaterales" cellspacing="0" cellpadding="0" border="0">
    <!--ICM INICIO SCI 054705 
    <tr>
      <td class="nueva1"><a href="#" onClick="actualiza()" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;Cumplimentar</a><td>
    </tr>
    ICM FIN SCI 054705
    -->
	<tr>
      <td class="nueva1"><a href="#" onClick="javascript:cuadrosGen();" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("C.P. Genérico")%></a><td>
    </tr>
     <tr>
      <td class="nueva1"><a href="#" onClick="javascript:salir();" class="enlacesprincipales1"><img src="../images/expand.gif" border="0">&nbsp;&nbsp;<%=traductor.getLiteral("salir")%></a><td>
    </tr>
  </table>
  <form name="irADetalle" target="_top" action="./cumplimentar.jsp">
	<INPUT TYPE="HIDDEN" name="idOferta">
	<input type="hidden" name ="codOffer">
	<input type="hidden" name ="expedient">
	<input type="hidden" name ="numVersion">
	<input type="hidden" name ="descripcion">
	<input type="hidden" name ="fechaLimite"><%//ICM SCI 052234%>
	<input type="hidden" name ="codEstado"><%//ICM SCI 054705%>
	<input type="hidden" name ="desEstado"><%//ICM SCI 054705%>
	<input type="hidden" name ="fechaEnvio"><%//ICM SCI 054705%>
  </form>
<!--ICM INICIO SCI 054705  Se elimina el formulario  irAVer porque ya que no es utilizado-->
  
</form>
 </body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>
