<%@page language="java" import="com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<%	
	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache
				
	// Se elimina la información de la sessión y se obtiene el dominio de la aplicación
	// para poder eliminar posteriormente la cookies antes de salir
	String[] atributos = session.getValueNames() ;
	int i=0;
	
	while (i<atributos.length) {	
		String atributo = (String)atributos[i++];		
		session.removeValue(atributo);
	}
	
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">

	
</script>
</head>
<body>
<script language="JavaScript">	
	parent.close();
</script>
</body>