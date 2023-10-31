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
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
      <table cellspacing="0" border="0" width="100%" class="introcentro" >
        <tr>
          <td class="grantabla2" width="50%">
            <div align="center">
			<input type="button" onClick="parent.central.copiar()" name="Copiar" value="<%=traductor.getLiteral("copiar")%>" class="interior">
            </div>
          </td>
          <td class="grantabla2" width="50%">
            <div align="center">
                <input type="button" onClick="parent.central.volverLista()" name="Cancelar" value="<%=traductor.getLiteral("cancelar")%>" class="interior">
            </div>
          </td>
        </tr>
      </table>
</body>
