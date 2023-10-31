<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />

<%
%>
<script type="text/javascript">
function actualizaCategorias(idCuadro){
	document.formulario.idCuadro.value = idCuadro;
	document.formulario.submit();
}
function volverLista()
{
	parent.navegacion.document.botonera.location.href="./lateral.jsp";
	parent.pieframe.document.botonera.location.href="./pievacio.htm";
	document.botonera.submit();
}
function salvaOfertaCliente() {

     document.enviaOferta.flgSalvarEnviar.value='S'; <%// ICM SCI 054705 %>
     document.enviaOferta.submit();<%// ICM SCI 054705 %>
}

</script>
<html>
<head>
<title></title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">

<body class="new4">
<form name="botonera" target="pieframe" method="post" action="cenman_offer_list_index.jsp">
<table class="general" cellspacing="0" border="0">
        <table class="general3" cellspacing="0" border="0">
          <tr>
           <td class="grantabla2" width="33%">
            <div align="center">
                <input type="button" onClick="salvaOfertaCliente()" name="Salvar" value="<%=traductor.getLiteral("Salvar")%>" class="interior">
            </div>
		   </td>          
           <td class="grantabla2" width="33%">
            <div align="center">
                <input type="button" onClick="volverLista()" name="Anterior" value="<%=traductor.getLiteral("Anterior")%>" class="interior">
            </div>
           </td>
          </tr>
</table>
</form>
</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>
