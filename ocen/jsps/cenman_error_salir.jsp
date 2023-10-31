<%@page language="java" isErrorPage="true" import="isf.util.log.Log"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<%	
	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache
			
	exception.printStackTrace();
	
%>

<script language="JavaScript">
	top.location ='./layout.jsp';	<!--ICM SCI 054320 antes se llamaba a index.html-->
</script>
