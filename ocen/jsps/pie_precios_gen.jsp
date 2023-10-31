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
<script type="text/javascript">
function volverLista(){
	parent.document.location.href="./cenman_offer_list_index.jsp";
}
</script>
</head>
<%
%>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<form name='cuadroprecios' action='saveOffer.jsp' method='post'>
      <table cellspacing="0" border="0" width="100%" class="introcentro" >
        <tr>
          <td class="grantabla2" width="33%">
            <div align="center">
                <input type="button" onClick="parent.resultado.salvar()" name="Salvar" value="<%=traductor.getLiteral("Salvar")%>" class="interior">
            </div>
          </td>          
          <td class="grantabla2" width="33%">
            <div align="center">
                <input type="button" onClick="volverLista()" name="Anterior" value="<%=traductor.getLiteral("Anterior")%>" class="interior">
            </div>
          </td>
        </tr>
      </table>
</body>
