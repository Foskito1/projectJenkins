<%@ page language="java" errorPage="cenman_error_salir.jsp"%>
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<html>
<head>
<title><%=traductor.getLiteral("OCEN-Mantenimiento")%>...OCEN - Mantenimiento</title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
<body class="bodyInformacion" onload="javascript:opener.cargarInformacionDetalle();">
<table class="generalInformacion" border="0" cellspacing="0">
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0">			
				<tr>
					<td  class="cabeceraAzul" ><%=traductor.getLiteral("descripcionOrdenTrabajo")%></td>
				</tr>
				<tr>
					<td id="detalleOT" class="informacion"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>	
</body>
</html>