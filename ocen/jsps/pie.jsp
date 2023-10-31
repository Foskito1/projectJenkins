<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<html>
<head>
<title></title>
<html>
<head>
<title></title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
<%// ICM SCI 054705	
	boolean boo_isMod = false;
	if (session.getValue("boo_isMod")!=null){
		boo_isMod =((Boolean)session.getValue("boo_isMod")).booleanValue();
	}
%>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
      <table cellspacing="0" border="0" width="100%" class="introcentro" >
        <tr>
          <td class="grantabla2" width="33%">
            <div align="center">
                <%if (boo_isMod) {%><input type="button" onClick="parent.central.salvaOfertaCliente()" name="Salvar" value="<%=traductor.getLiteral("salvar")%>" class="interior"><%}%>
            </div>
          </td>
          <td class="grantabla2" width="33%">
            <div align="center">
                <%if (boo_isMod) {%><input type="button" onClick="parent.central.enviaOfertaCliente()" name="Enviar" value="<%=traductor.getLiteral("enviar")%>" class="interior"><%}%>
            </div>
          </td>
          <td class="grantabla2" width="33%">
            <div align="center">
                <input type="button" onClick="parent.central.volverLista()" name="Anterior" value="<%=traductor.getLiteral("anterior")%>" class="interior">
            </div>
          </td>
        </tr>
      </table>
</body>
