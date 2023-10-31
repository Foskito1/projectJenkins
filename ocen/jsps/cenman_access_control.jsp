<%@ page language="java" errorPage="html/cenman_error.jsp"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<%
	// Limpia la cache
	response.setHeader("expires", "0");
	// Limpia la cache
	
%>

<html>

<head>
<title></title>
<link rel=stylesheet href="css/intranet.css" type="text/css">
</head>
<body class="new">
<table class="introcentro" cellspacing="0" width="80%" border="0">
  <tr>
    <td class="otrageneralnew4" width="50%"><img src="../images/titulo.gif"></td>
  </tr>
</table>
  <table class="introcentro" cellspacing="0" width="68%" border="0">
      <tr> 
        <td class="otrageneralnew1" width="50%"> 
          <div >Usuario:</div>
        </td>
        <td class="otrageneralnew" width="50%"> 
          <form name="checkAccess" action="cenman_check_access.jsp" method="post" >
            <input type="text" name="user" size="15"  maxlength="8" class="inputformulario1">
        </td>
      </tr>
	  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
	  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
      <tr> 
        <td class="otrageneralnew1" width="50%"> 
          <div>Password:</div>
        </td>
        <td class="otrageneralnew" width="50%" valign="top"> 
            <input type="password"  name="password" size="15" maxlength="8" class="inputformulario1">
        </td>
      </tr>
	  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
	  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
	  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
	  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
	  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
	  <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
      <tr> 
        <td class="otrageneralnew2" width="50%" valign="top"> 
          <div align="right"> 
              <input type="submit" name="Submit" value="Entrar" class="inputformulario3">
          </div>
        </td>
        <td class="otrageneralnew2" width="50%" valign="top"> 
          <div align="center"> 
              <input type="reset" name="Submit2" value="Borrar" class="inputformulario3">
          </div>
        </td>
      </tr>
    </table>
  </body>
</html>

 