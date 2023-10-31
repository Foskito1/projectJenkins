<%@ page language="java" import="java.io.*,java.util.*,java.lang.*"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<html>
<!--
  Copyright (c) 1999 The Apache Software Foundation.  All rights 
  reserved.
-->
<head>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Información del Servidor</title>
</head>

<body bgcolor="#00FFFF">

<%@ page session="false" %>

<TABLE border = 4 cellspacing = 4 cellpadding = 4 width=80% bgcolor="#EEFFFF"> 

<TH align = center colspan = 2><h1> Request Information </h1>
<TR>
    <TD align = LEFT width="39%" > <B>JSP Request Method, request.getMethod(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getMethod() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Request URI, request.getRequestURI(): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getRequestURI() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Request getContextPath, request.getContextPath(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getContextPath() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Request Protocol, request.getProtocol(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getProtocol() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Servlet path, request.getServletPath(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getServletPath() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Path info, request.getPathInfo(): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getPathInfo() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Path translated, request.getPathTranslated(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getPathTranslated() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Query string, request.getQueryString(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getQueryString() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Content length, request.getContentLength(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"> <%= request.getContentLength() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="61%"> <B> Content type, request.getContentType(): 
      </B> 
    <TD align = CENTER width="39%"> <FONT color="blue"><%= request.getContentType() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Server name, request.getServerName(): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getServerName() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Server port, request.getServerPort(): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getServerPort() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Remote user, request.getRemoteUser(): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getRemoteUser() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Remote address, request.getRemoteAddr(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getRemoteAddr() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Remote host, request.getRemoteHost(): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getRemoteHost() %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Authorization scheme, request.getAuthType(): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getAuthType() %></FONT> 
      &nbsp; 
  <TR>

<TH align = center colspan = 2><h1> Request Headers </h1>
<TR>
    <TD align = LEFT width="39%"> <B> The browser you are using is, request.getHeader("User-Agent") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("User-Agent") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Los Tipos MIME que prefiere el Navegador, request.getHeader("Accept") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Accept") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El conjunto de caracteres que espera el Navegador, request.getHeader("Accept-Charset") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Accept-Charset") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Los tipos de codificación de datos, request.getHeader("Accept-Encoding") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Accept-Encoding") %></FONT> 
      &nbsp; 
  <TR>
  <TD align = LEFT width="39%"> <B> El idioma que espera el Navegador, request.getHeader("Accept-Language") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Accept-Language") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Información de Autorización, request.getHeader("Authorization") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Authorization") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Conexiones persistentes Keep-Alive, request.getHeader("Connection") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Connection") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Peticiones Post, ctos datos se han añadido, request.getHeader("Content-Length") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Content-Length") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Cookies, request.getHeader("Cookies") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Cookies") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Direccion e-mail del peticionario, request.getHeader("From") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("From") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Host y puerto escuchado en la URL original, request.getHeader("Host") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Host") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Devuelve documentos mas nuevos que este, request.getHeader("If-Modified-Since") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("If-Modified-Since") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El valor No-Cache devuelve un doc nuevo, request.getHeader("Pragma") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Pragma") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> La URL de la pag que contiene el enlace que siguio el usur, request.getHeader("Referer") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("Referer") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Cabecera no estandar Tam pantalla, request.getHeader("UA-Pixels") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("UA-Pixels") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Cabecera no estandar Profundidad del Color, request.getHeader("UA-Color") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("UA-Color") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Cabecera no estandar Sistema Operativo, request.getHeader("UA-OS") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("UA-OS") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Cabecera no estandar Tipo de CPU, request.getHeader("UA-CPU") 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= request.getHeader("UA-CPU") %></FONT> 
      &nbsp; 
  <TR>

<TH align = center colspan = 2><h1> System Information </h1>
  <TR>
    <TD align = LEFT width="39%"> <B>El file separator utilizado es, System.getProperty("file.separator"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("file.separator") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El Java class version number utilizado es, 
      System.getProperty("java.class.version"): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("java.class.version") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B>El Java Installation Directory es, System.getProperty("java.home"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("java.home") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El Java vendor-specific string utilizado 
      es, System.getProperty("java.vendor"): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("java.vendor") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> La Java vendor URL utilizado es, System.getProperty("java.vendor.url"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("java.vendor.url") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El Java version number utilizado es, System.getProperty("java.version"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("java.version") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El Line Separator utilizado es, System.getProperty("line.separator"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("line.separator") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> Operating System Architecture es, System.getProperty("os.arch"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("os.arch") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El Operating System Name utilizado es, System.getProperty("os.name"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("os.name") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El Operating System Version utilizado es, 
      System.getProperty("os.version"): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("os.version") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El Path Separator utilizado es, System.getProperty("path.separator"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("path.separator") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El User's Current Working Directory utilizado 
      es, System.getProperty("user.dir"): </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("user.dir") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El User Home Directory utilizado es, System.getProperty("user.home"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("user.home") %></FONT> 
      &nbsp; 
  <TR>
    <TD align = LEFT width="39%"> <B> El User Account Name utilizado es, System.getProperty("user.name"): 
      </B> 
    <TD align = CENTER width="61%"> <FONT color="blue"><%= System.getProperty("user.name") %></FONT> 
      &nbsp; 
  
  </TABLE>

  <BR>
  <BR>

  <TABLE border = 4 cellspacing = 4 cellpadding = 4 width=80% bgcolor="#EEFFFF">
     
    <TD align = LEFT > 
       <B> El classpath de la aplicación utilizado es, System.getProperty("java.class.path"): </B>
           <a href="http://java.sun.com/j2se/1.2/docs/tooldocs/findingclasses.html"><font size=2>&nbsp;(Referencia)</font></a> 
    <TR>   
    <TD align = CENTER > 
       <FONT color="blue">
        <% String ClassPath = System.getProperty("java.class.path");
           int indice=0;
           if ( ClassPath.length() < 30 ) 
               // out.println ( " <= 30 <BR>");
               out.println ( ClassPath );
           else
             {
               // out.println ( "El ClassPath es > 30 <BR> " );
               // out.println ( "El separador ':' se encuentra en la posic: " + ClassPath.indexOf(":", indice) + "<BR>");
               // out.println ( "El valor del indice antes del while es: " + indice +"<BR>");
               // out.println ( "La longitud del ClassPath es: " + ClassPath.length() +"<BR>");
               int longitud = ClassPath.length();
               // out.println ("El valor de longitud es " + longitud + "<BR>");
                
               while (longitud > 0 )
               { 
               out.println(ClassPath.substring(indice, (ClassPath.indexOf(":", indice)+1)) + "<BR>");
               ClassPath = ClassPath.substring((ClassPath.indexOf(":", indice)+1), longitud);
               // ClassPath = ClassPath2;
	       longitud = ClassPath.length();
               // out.println( "El nuevo valor de longitud es " + longitud +"<BR>");
                 
               }
             }
 %></FONT> &nbsp;
   <TR>
     <TD align = LEFT > 
       <B> El classpath de bootstrap utilizado es, System.getProperty("sun.boot.class.path"): </B>
    <TR>   
    <TD align = CENTER > 
       <FONT color="blue">
       <%= System.getProperty("sun.boot.class.path") %>
       </FONT> &nbsp;
    <TR>
      <TD align = LEFT > 
       <B> El extension directories utilizado es, System.getProperty("java.ext.dirs"): </B>
    <TR>   
    <TD align = CENTER > 
       <FONT color="blue">
       <%= System.getProperty("java.ext.dirs") %>
       </FONT> &nbsp;
    <TR>
      <TD align = LEFT > 
       <B> El que carga la clase Info es: </B>
    <TR>   
    <TD align = CENTER > 
       <FONT color="blue">
       <%
       Class cl=isf.db.Pool.class;
	java.net.URL url=cl.getClassLoader().getResource("isf/db/Info.class");
	
       %>
       <%= url %>
       </FONT> &nbsp;   
  </TABLE>

  <% /* ORDEN EN EL QUE SE CARGAN LAS CLASES JAVA ( PLATAFORMA Java 1.2 )
      EL Java Launcher, Java, inicializa la JVM. La JVM busca y carga las clases en el 
      siguiente orden:
       - Bootstrap classes: Clases que comprime la plataforma Java, incluye las clases que
              se encuentran en el rt.jar, i18n.jar y otros ficheros jar importantes.
       - Extension classes: Clases que utiliza el Mecanismo de Extensión de Java. Estos están 
              empaquetados en ficheros .jar que se localizan en el directorio de extensiones.
       - User Classes: Clases definidas por los desarrolladores y terceras partes que no se
              benefician del mecanismo de extensión. La localización de estas clases se
              identifica en la linea de comandos mediante la opción -classpath (manera mas 
              aconsejable ) o mediante la variable de entorno CLASSPATH. 
      Para mas información consultar la información que se encuentra en las sgte URL:
	http://java.sun.com/j2se/1.2/docs/tooldocs/findingclasses.html
    */ %>
</body>
</html>
