<%@page language="java" import="com.soluzionasf.ocen.man.web.domain.CenManWebServerDataHelper"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<%	
	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache
				
	//INICIO SCI 054320 Se elimina la información de la sessión y se obtiene el dominio de la aplicación
	// para poder eliminar posteriormente la cookies antes de salir
	String[] atributos = session.getValueNames() ;
	int i=0;
	
	while (i<atributos.length) {	
		String atributo = (String)atributos[i++];		
		session.removeValue(atributo);
	}
	String strDomain = CenManWebServerDataHelper.getInstance().getDomain();		
	// FIN SCI 054320
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">

	function DeleteCookie (name,path,domain) {
	    document.cookie = name + "=" +
	      ((path) ? "; path=" + path : "") +
	      ((domain) ? "; domain=" + domain : "") +
	      "; expires=Thu, 01-Jan-70 00:00:01 GMT";	     
	}
	
	function cleanUp()
	{		
		DeleteCookie ("RojUser","/","<%=strDomain%>");		
		DeleteCookie ("RojPassword","/","<%=strDomain%>");
		
	}
</script>
</head>
<body>
<script language="JavaScript">
	cleanUp();<!--ICM SCI 054320 Se eliminan las cookies-->
	top.location ='../index.jsp';	
</script>
</body>