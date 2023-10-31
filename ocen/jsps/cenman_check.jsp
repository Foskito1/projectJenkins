<%@ page language="java" errorPage="cenman_error_salir.jsp" import="com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper"%>
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<html>
<%
String strUser,strPassword,strLanguage;
strUser			= request.getParameter("Usuario")==null?"":request.getParameter("Usuario");
strLanguage = request.getParameter("language")==null?CenManWebServerDataHelper.getInstance().getLanguageCodeDefault():request.getParameter("language");
traductor.setLanguageUser(strLanguage);

%>
<head>
<title></title>
<link rel=stylesheet href="css/ocen.css" type="text/css">

<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<script language="javascript">
	
 function traducir(){
 	document.formulario.action='./cenman_check.jsp';
 	document.formulario.submit();
 }
</script>
</head>
<body class="new" >
<form name="formulario"  action="./cenman_check_access_sr.jsp" method="POST" name="Datos">
<table class="introcentro" cellspacing="0" width="80%" border="0">

  <tr>
    <td class="otrageneralnew4"   colspan=2> <h1><%=traductor.getLiteral("cumplimentacionOfertas")%></h1></td>
  </tr>
</table>
  <table class="introcentro" cellspacing="0" width="68%" border="0">
  <tr>
    <td class="otrageneralnew4" width="50%">&nbsp;</td>
  </tr>
			<tr>
        <td class="otrageneralnew1" width="50%">
          <div ><%=traductor.getLiteral("idioma")%>:</div>
        </td>
        <td class="otrageneralnew" width="50%">
            <select name="language" class="inputformularioM" onchange="javascript:traducir();">
            	<option value="es" <%if (strLanguage.equals("es")) {%>selected<%}%>><%=traductor.getLiteral("espanol")%></option>
            	<option value="en" <%if (strLanguage.equals("en")) {%>selected<%}%>><%=traductor.getLiteral("ingles")%></option>
						</select>
        </td>
      </tr>
      <tr>
        <td class="otrageneralnew1" width="50%">
          <div ><%=traductor.getLiteral("usuario")%>:</div>
        </td>
        <td class="otrageneralnew" width="50%">

            <input type="text" name="Usuario" size="15"  maxlength="8" class="inputformularioM" value="<%=strUser%>">

        </td>
      </tr>
      <tr>
        <td class="otrageneralnew1" width="50%">
          <div><%=traductor.getLiteral("password")%>:</div>
        </td>
        <td class="otrageneralnew" width="50%">
            <input type="password" name="password" size="15"  maxlength="8" class="inputformularioM" value="">
        </td>
      </tr>      
     <tr>
    		<td class="otrageneralnew4" width="50%">&nbsp;</td>
  	 </tr>
  </table>
  <table class="introcentro" cellspacing="0" width="100%" border="0">
  	<tr>
  	<td class="otrageneralnew1" width="20%">
           &nbsp;
        </td>
        <td   width="25%" align=right>
           <INPUT TYPE="submit" NAME="enviar" VALUE="<%=traductor.getLiteral("enviar")%>">
        </td>
         <td class="otrageneralnew1" width="10%">
          &nbsp;
        </td>
        <td   width="25%"  align=left>

            <INPUT TYPE="reset" NAME="borrar" VALUE="<%=traductor.getLiteral("limpiar")%>">



        </td>
        <td class="otrageneralnew1" width="20%">
          &nbsp;
        </td>
      </tr>
  </table>
</form>
</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>

 