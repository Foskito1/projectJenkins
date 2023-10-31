<%@page language="java" isErrorPage="true" %>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<%	
	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache

/*	Incidencias	i	= 	Incidencias.getInstance();
		
	i.enviar((Exception) exception);
		
	exception.printStackTrace();
	String Str_mensajeDeError = exception.getMessage();
	
	if(!(exception instanceof CemefException)){
		// Si no es un error contrlado por el sistema se 
		// le muestra al usuario un mensaje generico
	
		LogAll.println(exception);*/
%>
<script language="JavaScript" type="text/javascript">
	alert('Error interno del servidor');
	// Se vuelve a la pantalla inicial
	top.location ='./cemef_salir.jsp';
</script>
<%
	/*}
	else{
		if (((CemefException) exception).getCodigo() == CemefException.ERROR_SESION_CADUCADA){*/
%>
<script language="JavaScript" type="text/javascript">
	alert('<%=Str_mensajeDeError%>');
	// Se vuelve a la pantalla inicial
	top.location ='./index.html';
</script>

<%
/*		}
		else{*/
%>
<script language="JavaScript" type="text/javascript">
	alert('<%=Str_mensajeDeError%>');
	window.history.back();
	// Se vuelve a la pantalla inicial
</script>
<%
	/*		LogAll.println(Str_mensajeDeError);	
		}
	}*/
%>

