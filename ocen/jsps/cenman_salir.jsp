<%@ page language="java" errorPage="cemef_error_salir.jsp" import="com.soluzionassf.cemef.negocio.*, ssf.util.LogAll, com.soluzionassf.cemef.configuracion.Seguridad"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>
<jsp:useBean id="usuariosDentro" scope="application" class="java.util.Vector" />

<%
	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache
	//Seguridad.eliminarUsuariosDelBean(usuariosDentro, session.getId());
	session.invalidate();

%>
<form name="inicio" action="index.html">

</form>

<script language="JavaScript">
<!--
	//document.location='cemef_control_acceso.jsp';
	document.inicio.submit();
//-->
</script>
