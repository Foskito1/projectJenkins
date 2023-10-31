<%@ page language="java" import="java.sql.*, java.io.*, javax.servlet.*,javax.servlet.http.*"%>
<HTML>
<HEAD>
  <TITLE>Resultado de la b&uacute;squeda de Documentos</TITLE>
</HEAD>
<BODY bgcolor="#FFFFFF" link="#000073">




<form name = "lista_usuarios" method='POST' action="lista_usuarios_para_grupoAC.jsp?IdGrupo=<%=request.getParameter("IdGrupo")%>" target="main3">

<table width="100%" border="0">
<%
    String 			Str_path=null;
    Str_path=System.getProperty("java.class.path");
%>
  <tr> 
    <td width="85"><font color="#000073"><b><font face="Arial, Helvetica, sans-serif" size="2">Classpath:</font></b></font></td>
    <td width="300">
			<%=Str_path%>
    </td>
  <tr>
  </table>
</form>
 
</BODY>
</HTML>
