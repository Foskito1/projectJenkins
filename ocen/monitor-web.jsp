<%@page contentType="text/html;charset=ISO-8859-1"%>

<%@page
	import="javax.servlet.ServletContext"
	import="java.util.Collections"
	import="java.util.Enumeration"
	import="java.util.Iterator"
	import="java.util.TreeSet"
	import="java.util.StringTokenizer"
	import="java.lang.reflect.Method"
	import="java.util.ArrayList"
	import="java.lang.reflect.InvocationTargetException"
	import="java.lang.reflect.Modifier"
	import="java.lang.reflect.Array"
	import="java.util.Comparator"
%>

<%!
/*############################################################
#             INICIO CLASE ArbolAtributo
##############################################################*/
class ArbolAtributo 
{

	private String raiz;
	private String atributo;
	private String[] arrMetodos;

	public static final String SEPARADOR = "[#]";
	public static final String SESSION = "session";
	public static final String REQUEST = "reqest";
	public static final String APPLICATION = "application";
	public static final String PAGE = "pageContext";	

	public ArbolAtributo (String cadena)
	{
		StringTokenizer st = new StringTokenizer(cadena,SEPARADOR);
		raiz = st.nextToken();
		atributo = st.nextToken();
		arrMetodos = new String[st.countTokens()];
		for (int i = 0; st.hasMoreTokens(); i++)
		{
			arrMetodos[i] = st.nextToken();
		}
	}
	
	public String getRaiz()
	{
		return raiz;
	}
	
	public String getAtributo()
	{
		return atributo;
	}
	
	public String getLocalizadorPadre()
	{
		if (arrMetodos.length != 0)
		{	
			StringBuffer sb = new StringBuffer();
			sb.append(raiz).append(SEPARADOR).append(atributo);
			for (int i = 0; i < arrMetodos.length - 1; i++) sb.append(SEPARADOR).append(arrMetodos[i]);
			return sb.toString();
		}
		else return null;		
	}
	
	public String getNomPadrePresenta()
	{
		if (arrMetodos.length != 0)	return getNomPadre();
		else return null;		
	}

	private String getNomPadre()
	{
		StringBuffer sb = new StringBuffer();
		sb.append(raiz).append(".getAttribute(\"").append(atributo).append("\")");
		for (int i = 0; i < arrMetodos.length - 1; i++) sb.append(".").append(arrMetodos[i]).append("()");
		return sb.toString();
	}	
	
 	public String getNomPresenta()
	{
		String nombrePadre = getNomPadre();
		if (arrMetodos.length != 0)	nombrePadre = nombrePadre + "." + arrMetodos[arrMetodos.length - 1] + "()";
		return nombrePadre;	
	}

	public Object getObjFinal(Object obj) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
	{
		Method metodo = null;
		for (int i = 0; i < arrMetodos.length; i++)
		{
			metodo = obj.getClass().getMethod(arrMetodos[i],null);
			obj = metodo.invoke(obj,null);
		}
		return obj;
	}
}	
/*############################################################
#             FIN CLASE ArbolAtributo
##############################################################*/



/*############################################################
#             INICIO CLASE OrdenadorMetodos
##############################################################*/
class OrdenadorMetodos implements Comparator
{	
	public int compare(Object obj1, Object obj2) 
	{
		return ((Method)obj1).getName().compareTo(((Method)obj2).getName());	
	}
	
	public boolean equals(Object obj) 
	{
		return (obj instanceof OrdenadorMetodos);
	}
}
/*############################################################
#             FIN CLASE OrdenadorMetodos
##############################################################*/



/*############################################################
#             INICIO METODOS DE CLASE
##############################################################*/
protected static ArrayList getMetodos(Object obj)	
{
	Method[] arrMetodos = obj.getClass().getMethods();
	ArrayList arlMetodos = new ArrayList();
	for (int i = 0; i < arrMetodos.length; i++)
	{
		if (esMetodoGet(arrMetodos[i])) arlMetodos.add(arrMetodos[i]);
	}
	return arlMetodos;
}

protected static boolean esMetodoGet(Method metodo)
{
	if ((metodo.getName().startsWith("get")) &&
		(metodo.getParameterTypes().length == 0) &&
		!(metodo.getReturnType().equals(Void.TYPE)) &&
		!(Modifier.isStatic(metodo.getModifiers())) &&
		!(Modifier.isAbstract(metodo.getModifiers())) )			
			return true;
	else
			return false;
}

protected static String formatear(Object obj)
{
	if (obj == null) return "null";
	if (obj.getClass().isArray())
	{
		StringBuffer resultado = new StringBuffer("{");
		for (int i = 0; i < Array.getLength(obj); i++)
		{
			resultado = resultado.append(formatear(Array.get(obj,i))).append(",");  
		}
		if (resultado.length() > 1) resultado = resultado.deleteCharAt(resultado.length() - 1);
		return resultado.append("}").toString();
	}
	else
	{
		return obj.toString().replaceAll("&","&amp;").replaceAll("<","&lt;");
	}
}

protected static String formatearExcepcion (Throwable ex)
{
	StringBuffer resultado = new StringBuffer(ex.getClass().getName() + ": ");
	if ((ex.getMessage() != null) && !(ex.getMessage().equals("")))	resultado.append(ex.getMessage());
	else resultado.append("no message");
	
	if (ex.getCause() == null) return resultado.toString();
	else return resultado.append("|||").append(formatearExcepcion(ex.getCause())).toString();
}
/*############################################################
#             FIN METODOS DE CLASE 
##############################################################*/
%>

<html>
<head>
<title>Monitorización Web</title>

<style type="text/css">
	table {width: 100%; background-color: ivory; border-spacing: 1px 2px;}
	th {text-align: center; background-color: lightgrey; color: black; font-family: verdana; font-size: 8pt; padding: 0 0 1px 0;}	
	td {font-family: verdana; font-size: 8pt; padding: 0 0 1px 0;}
	a.titulo {border: solid 2px darkgrey; font-family: verdana; font-size: 10pt; font-weight: bold; background-color: gray; color: white;}
</style>

<script type="text/javascript">
function mostrarOcultarTabla(identificador,campoRecarga)
{
	var table = document.getElementById(identificador);
	var hidden = document.getElementById(campoRecarga);
	var nuevoValor = (table.style.display=="" ? "none" : "");
	table.style.display = nuevoValor;
	hidden.value = nuevoValor;
	return;
}

function detalle(elemento)
{
	var formulario = document.getElementById("form");
	formulario.obj_introsp.value = elemento; 
	formulario.display_introsp.value = ""; 	
	formulario.submit();
	return false;	
}
</script>
</head>

<body>

<%
	String nomAtrib;
	Object objValor;
	String clase;
	String inicioArea;
	String finArea;
%>

<div>
	<form id="form" name="form" action="<%=request.getRequestURI()%>" method="post">
		<input type="hidden" name="obj_introsp" value="<%=(request.getParameter("obj_introsp") != null ? request.getParameter("obj_introsp") : "")%>"/>
		<%
		String display_atri_sesion = ((request.getParameter("display_atri_sesion") != null) ? request.getParameter("display_atri_sesion") : "none");
		String display_atri_contexto = ((request.getParameter("display_atri_contexto") != null) ? request.getParameter("display_atri_contexto") : "none");
		String display_atri_peticion = ((request.getParameter("display_atri_peticion") != null) ? request.getParameter("display_atri_peticion") : "none");		
		String display_param_contexto = ((request.getParameter("display_param_contexto") != null) ? request.getParameter("display_param_contexto") : "none");
		String display_param_peticion = ((request.getParameter("display_param_peticion") != null) ? request.getParameter("display_param_peticion") : "none");
		String display_cabeceras = ((request.getParameter("display_cabeceras") != null) ? request.getParameter("display_cabeceras") : "none");
		String display_info_extra = ((request.getParameter("display_info_extra") != null) ? request.getParameter("display_info_extra") : "none");
		String display_prop_sistema = ((request.getParameter("display_prop_sistema") != null) ? request.getParameter("display_prop_sistema") : "none");
		String display_introsp = ((request.getParameter("display_introsp") != null) ? request.getParameter("display_introsp") : "none");
		String display_param_servlet = ((request.getParameter("display_param_servlet") != null) ? request.getParameter("display_param_servlet") : "none");
		String display_atri_page = ((request.getParameter("display_atri_page") != null) ? request.getParameter("display_atri_page") : "none");
		%>
		<input type="hidden" id="display_atri_sesion" name="display_atri_sesion" value="<%=display_atri_sesion%>"/>		
		<input type="hidden" id="display_atri_contexto" name="display_atri_contexto" value="<%=display_atri_contexto%>"/>
		<input type="hidden" id="display_atri_peticion" name="display_atri_peticion" value="<%=display_atri_peticion%>"/>			
		<input type="hidden" id="display_param_contexto" name="display_param_contexto" value="<%=display_param_contexto%>"/>
		<input type="hidden" id="display_param_peticion" name="display_param_peticion" value="<%=display_param_peticion%>"/>			
		<input type="hidden" id="display_cabeceras" name="display_cabeceras" value="<%=display_cabeceras%>"/>					
		<input type="hidden" id="display_info_extra" name="display_info_extra" value="<%=display_info_extra%>"/>					
		<input type="hidden" id="display_prop_sistema" name="display_prop_sistema" value="<%=display_prop_sistema%>"/>		
		<input type="hidden" id="display_introsp" name="display_introsp" value="<%=display_introsp%>"/>				
		<input type="hidden" id="display_param_servlet" name="display_param_servlet" value="<%=display_param_servlet%>"/>						
		<input type="hidden" id="display_atri_page" name="display_atri_page" value="<%=display_atri_page%>"/>								
	</form>
	
<!-- ############################################################
#             INICIO INTRSOPECCION
############################################################## -->
	<%if (request.getParameter("obj_introsp") != null) 
	{
		ArbolAtributo arbol = new ArbolAtributo(request.getParameter("obj_introsp"));				
		Object obj = null;
		if (arbol.getRaiz().equals(ArbolAtributo.SESSION)) 
			obj = arbol.getObjFinal(session.getAttribute(arbol.getAtributo())); 
		else if (arbol.getRaiz().equals(ArbolAtributo.REQUEST)) 
			obj = arbol.getObjFinal(request.getAttribute(arbol.getAtributo())); 
		else if (arbol.getRaiz().equals(ArbolAtributo.APPLICATION)) 
			obj = arbol.getObjFinal(application.getAttribute(arbol.getAtributo())); 			
		else if (arbol.getRaiz().equals(ArbolAtributo.PAGE)) 
			obj = arbol.getObjFinal(pageContext.getAttribute(arbol.getAtributo())); 						
	%>
	<div>
	<%if (arbol.getLocalizadorPadre() != null) {%> <a class="titulo" href="javascript:void(0)" onclick="return detalle('<%=arbol.getLocalizadorPadre()%>');"><%=arbol.getNomPadrePresenta()%></a>&nbsp;<%}%>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_introspeccion','display_introsp');"><%=obj.getClass().getName()%>&nbsp;<%=arbol.getNomPresenta()%></a>
	<table id="tab_introspeccion" border="1" style="<%=(display_introsp.equals("") ? "" : "display:" + display_introsp) + ";"%>">
		<thead>
			<tr>
				<th>metodo</th>
				<th>clase ret.</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			Method metodo = null;
			Object objRetornado = null;
			boolean retornaObj;			
			ArrayList arlMetodos = getMetodos(obj);
			Collections.sort(arlMetodos,new OrdenadorMetodos());
			for (Iterator iteMetodos = arlMetodos.iterator(); iteMetodos.hasNext();)
			{
				metodo = (Method)iteMetodos.next();
				try
				{
					objRetornado = metodo.invoke(obj,null);
					retornaObj = (objRetornado != null);
					objRetornado = "<td>" + formatear(objRetornado) + "</td>";
				}
				catch (Exception ex)
				{
					objRetornado = "<td style=\"color: Red;\">EXCEPCION AL EJECUTAR METODO: " + formatearExcepcion(ex) + "</td>";
					retornaObj = false;
				}
				clase = metodo.getReturnType().getName();
				if ( !(clase.equals("java.lang.String")) && 
					 !(metodo.getReturnType().isPrimitive()) &&
					 retornaObj                                 )
				{
					inicioArea = "<a href=\"javascript:void(0)\" onclick=\"return detalle('" + request.getParameter("obj_introsp") + ArbolAtributo.SEPARADOR + metodo.getName() + "');\">";
					finArea = "</a>";
				}
				else
				{
					inicioArea = "";
					finArea = "";
				}			
			%>				
				<tr>
					<td><%=inicioArea + metodo.getName() + finArea%></td>
					<td><%=clase%></td>
					<%=objRetornado%>
				</tr>
			<%}%>					
		</tbody>
	</table>
	</div></br>
	<%}%>	
<!-- ############################################################
#             FIN INTROSPECCION
############################################################## -->
	
	
	
<!-- ############################################################
#             INICIO ATRIBUTOS SESION
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_atri_sesion','display_atri_sesion');">Atributos de la sesión</a>
	<table id="tab_atri_sesion" border="1" style="<%=(display_atri_sesion.equals("") ? "" : "display:" + display_atri_sesion) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>clase</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Iterator nombres = new TreeSet(Collections.list(session.getAttributeNames())).iterator(); nombres.hasNext();)
			{
				nomAtrib = (String)nombres.next();
				objValor = session.getAttribute(nomAtrib);
				if ( !(objValor == null) &&
					 !(objValor.getClass().getName().equals("java.lang.String")) && 
					 !(objValor.getClass().isPrimitive()) )
				{
					clase = objValor.getClass().getName();
					inicioArea = "<a href=\"javascript:void(0)\" onclick=\"return detalle('" + ArbolAtributo.SESSION + ArbolAtributo.SEPARADOR + nomAtrib + "');\">";
					finArea = "</a>";
				}
				else
				{
					clase = ((objValor != null) ? objValor.getClass().getName() : "-");
					inicioArea = "";
					finArea = "";
				}
			%>
				<tr>
					<td><%=inicioArea%><%=nomAtrib%><%=finArea%></td>
					<td><%=clase%></td>
					<td><%=formatear(objValor)%></td>
				</tr>
			<%}%>
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN ATRIBUTOS SESION
############################################################## -->


<!-- ############################################################
#             INICIO ATRIBUTOS CONTEXTO 
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_atri_contexto','display_atri_contexto');">Atributos del contexto</a>
	<table id="tab_atri_contexto" border="1" style="<%=(display_atri_contexto.equals("") ? "" : "display:" + display_atri_contexto) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>clase</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Iterator nombres = new TreeSet(Collections.list(application.getAttributeNames())).iterator(); nombres.hasNext();)
			{
				nomAtrib = (String)nombres.next();
				objValor = application.getAttribute(nomAtrib);
				if ( !(objValor == null) &&
					 !(objValor.getClass().getName().equals("java.lang.String")) && 
					 !(objValor.getClass().isPrimitive()) )
				{
					clase = objValor.getClass().getName();
					inicioArea = "<a href=\"javascript:void(0)\" onclick=\"return detalle('" + ArbolAtributo.APPLICATION + ArbolAtributo.SEPARADOR + nomAtrib + "');\">";
					finArea = "</a>";
				}
				else
				{
					clase = ((objValor != null) ? objValor.getClass().getName() : "-");
					inicioArea = "";
					finArea = "";
				}
			%>
				<tr>
					<td><%=inicioArea%><%=nomAtrib%><%=finArea%></td>
					<td><%=clase%></td>
					<td><%=formatear(objValor)%></td>
				</tr>
			<%}%>	
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN ATRIBUTOS CONTEXTO
############################################################## -->	



<!-- ############################################################
#             INICIO PARAMETROS CONTEXTO 
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_param_contexto','display_param_contexto');">Parámetros del contexto</a>
	<table id="tab_param_contexto" border="1" style="<%=(display_param_contexto.equals("") ? "" : "display:" + display_param_contexto) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			String nomParamContexto;
			for (Iterator nombres = new TreeSet(Collections.list(application.getInitParameterNames())).iterator(); nombres.hasNext();)
			{
				nomParamContexto = (String)nombres.next();
			%>
				<tr>
					<td><%=nomParamContexto%></td>
					<td><%=formatear(application.getInitParameter(nomParamContexto))%></td>
				</tr>
			<%}%>
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN PARAMETROS CONTEXTO
############################################################## -->	



<!-- ############################################################
#             INICIO ATRIBUTOS PETICION 
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_atri_peticion','display_atri_peticion');">Atributos de la petición</a>
	<table id="tab_atri_peticion" border="1" style="<%=(display_atri_peticion.equals("") ? "" : "display:" + display_atri_peticion) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>clase</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Iterator nombres = new TreeSet(Collections.list(request.getAttributeNames())).iterator(); nombres.hasNext();)
			{
				nomAtrib = (String)nombres.next();
				objValor = request.getAttribute(nomAtrib);
				if ( !(objValor == null) &&
					 !(objValor.getClass().getName().equals("java.lang.String")) && 
					 !(objValor.getClass().isPrimitive()) )
				{
					clase = objValor.getClass().getName();
					inicioArea = "<a href=\"javascript:void(0)\" onclick=\"return detalle('" + ArbolAtributo.REQUEST + ArbolAtributo.SEPARADOR + nomAtrib + "');\">";
					finArea = "</a>";
				}
				else
				{
					clase = ((objValor != null) ? objValor.getClass().getName() : "-");
					inicioArea = "";
					finArea = "";
				}
			%>
				<tr>
					<td><%=inicioArea%><%=nomAtrib%><%=finArea%></td>
					<td><%=clase%></td>
					<td><%=formatear(objValor)%></td>
				</tr>
			<%}%>
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN ATRIBUTOS PETICION
############################################################## -->	



<!-- ############################################################
#             INICIO PARAMETROS PETICION
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_param_peticion','display_param_peticion');">Parámetros de la petición</a>
	<table id="tab_param_peticion" border="1" style="<%=(display_param_peticion.equals("") ? "" : "display:" + display_param_peticion) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			String nomParamPeticion;
			for (Iterator nombres = new TreeSet(Collections.list(request.getParameterNames())).iterator(); nombres.hasNext();)
			{
				nomParamPeticion = (String)nombres.next();
			%>
				<tr>
					<td><%=nomParamPeticion%></td>
					<td><%=formatear(request.getParameter(nomParamPeticion))%></td>
				</tr>
			<%}%>
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN PARAMETROS PETICION
############################################################## -->	



<!-- ############################################################
#             INICIO CABERAS DE PETICION
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_cabeceras','display_cabeceras');">Cabeceras de la petición</a>
	<table id="tab_cabeceras" border="1" style="<%=(display_cabeceras.equals("") ? "" : "display:" + display_cabeceras) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			String nomCabecera;
			String valoresCabecera;
			for (Iterator nombres = new TreeSet(Collections.list(request.getHeaderNames())).iterator(); nombres.hasNext();)
			{
				nomCabecera = (String)nombres.next();
				valoresCabecera = "";
				for (Enumeration enume = request.getHeaders(nomCabecera); enume.hasMoreElements();)
				{
					valoresCabecera	= valoresCabecera + (String)enume.nextElement() + ";";
				}													 
			%>
				<tr><td><%=nomCabecera%></td>
				<td><%=formatear(valoresCabecera)%></td></tr>
			<%}%>
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN CABERAS DE PETICION
############################################################## -->	



<!-- ############################################################
#             INICIO INFORMACIÓN EXTRA
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_info_extra','display_info_extra');">Información adicional</a>
	<table id="tab_info_extra" border="1" style="<%=(display_info_extra.equals("") ? "" : "display:" + display_info_extra) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<tr><td>application.getAPIVersion()</td><td><%=application.getMajorVersion() + "." + application.getMinorVersion()%></td></tr>
			<tr><td>application.getRealPath()</td><td><%=formatear(application.getRealPath(request.getServletPath()))%></td></tr>						
			<tr><td>application.getServerInfo()</td><td><%=formatear(application.getServerInfo())%></td></tr>
			<tr><td>application.getServletContextName()</td><td><%=formatear(application.getServletContextName())%></td></tr>			
			
			<tr><td>config.getServletName()</td><td><%=formatear(config.getServletName())%></td></tr>			
			
			<tr><td>request.getAuthType()</td><td><%=formatear(request.getAuthType())%></td></tr>
			<tr><td>request.getContextPath()</td><td><%=formatear(request.getContextPath())%></td></tr>
			<tr><td>request.getHTTPMethod()</td><td><%=formatear(request.getMethod())%></td></tr>
			<tr><td>request.getQueryString()</td><td><%=formatear(request.getQueryString())%></td></tr>			
			<tr><td>request.getRequestURI()</td><td><%=formatear(request.getRequestURI())%></td></tr>				
			<tr><td>request.getRequestURL()</td><td><%=formatear(request.getRequestURL())%></td></tr>									
			<tr><td>request.getServletPath()</td><td><%=formatear(request.getServletPath())%></td></tr>
			
			<tr><td>response.getBufferSize()</td><td><%=response.getBufferSize()%></td></tr>
			<tr><td>response.getCharacterEncoding()</td><td><%=formatear(response.getCharacterEncoding())%></td></tr> 
			<%--<tr><td>response.getContentType()</td><td><%=formatear(response.getContentType())%></td></tr> parece que existe un problema de versiones con este método y produce un error de compilación en Bea Weblogic 8.1 --%>
			<tr><td>response.getLocale()</td><td><%=response.getLocale()%></td></tr> 						

			<tr><td>servlet.getServletInfo()</td><td><%=formatear(getServletInfo())%></td></tr>

			<tr><td>session.getCreationTime()</td><td><%=session.getCreationTime()%>&nbsp;(<%=(new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss.SSS")).format(new java.util.Date(session.getCreationTime()))%>)</td></tr>
			<tr><td>session.getId()</td><td><%=formatear(session.getId())%></td></tr> 			
			<tr><td>session.getLastAccessedTime()</td><td><%=session.getLastAccessedTime()%>&nbsp;(<%=(new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss.SSS")).format(new java.util.Date(session.getLastAccessedTime()))%>)</td></tr>
			<tr><td>session.getMaxInactiveInterval()</td><td><%=session.getMaxInactiveInterval()%></td></tr>									
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN INFORMACIÓN EXTRA
############################################################## -->	

<!-- request.Cookie[] getCookies() -->

<!-- ############################################################
#             INICIO PROPIEDADES SISTEMA
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_prop_sistema','display_prop_sistema');">Propiedades del sistema</a>
	<table id="tab_prop_sistema" border="1" style="<%=(display_prop_sistema.equals("") ? "" : "display:" + display_prop_sistema) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			String nomPropSistema;
			for (Iterator nombres = new TreeSet(System.getProperties().keySet()).iterator(); nombres.hasNext();)
			{
				nomPropSistema = (String)nombres.next();
			%>
				<tr>
					<td><%=nomPropSistema%></td>
					<td><%=formatear(System.getProperty(nomPropSistema))%></td>
				</tr>
			<%}%>
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN PROPIEDADES SISTEMA
############################################################## -->	



<!-- ############################################################
#             INICIO PARAMETROS INICIALIZACION SERVLET
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_param_servlet','display_param_servlet');">Parámetros de inicialización del servlet</a>
	<table id="tab_param_servlet" border="1" style="<%=(display_param_servlet.equals("") ? "" : "display:" + display_param_servlet) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			String nomParamServlet;
			for (Iterator nombres = new TreeSet(Collections.list(config.getInitParameterNames())).iterator(); nombres.hasNext();)
			{
				nomParamServlet = (String)nombres.next();
			%>
				<tr>
					<td><%=nomParamServlet%></td>
					<td><%=formatear(config.getInitParameter(nomParamServlet))%></td>
				</tr>
			<%}%>
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN PARAMETROS INICIALIZACION SERVLET
############################################################## -->	



<!-- ############################################################
#             INICIO ATRIBUTOS PAGINA 
############################################################## -->
	<div>
	<a class="titulo" href="javascript:void(0)" onclick="mostrarOcultarTabla('tab_atri_page','display_atri_page');">Atributos de la pagina</a>
	<table id="tab_atri_page" border="1" style="<%=(display_atri_page.equals("") ? "" : "display:" + display_atri_page) + ";"%>">	
		<thead>
			<tr>
				<th>nombre</th>
				<th>clase</th>
				<th>valor</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Iterator nombres = new TreeSet(Collections.list(pageContext.getAttributeNamesInScope(PageContext.PAGE_SCOPE))).iterator(); nombres.hasNext();)
			{
				nomAtrib = (String)nombres.next();
				objValor = pageContext.getAttribute(nomAtrib);
				if ( !(objValor == null) &&
					 !(objValor.getClass().getName().equals("java.lang.String")) && 
					 !(objValor.getClass().isPrimitive()) )
				{
					clase = objValor.getClass().getName();
					inicioArea = "<a href=\"javascript:void(0)\" onclick=\"return detalle('" + ArbolAtributo.PAGE + ArbolAtributo.SEPARADOR + nomAtrib + "');\">";
					finArea = "</a>";
				}
				else
				{
					clase = ((objValor != null) ? objValor.getClass().getName() : "-");
					inicioArea = "";
					finArea = "";
				}
			%>
				<tr>
					<td><%=inicioArea%><%=nomAtrib%><%=finArea%></td>
					<td><%=clase%></td>
					<td><%=formatear(objValor)%></td>
				</tr>
			<%}%>
		</tbody>
	</table>
	</div></br>
<!-- ############################################################
#             FIN ATRIBUTOS PAGINA
############################################################## -->	

</div>
</body>
</html>