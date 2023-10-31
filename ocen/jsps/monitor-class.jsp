<%@page contentType="text/html;charset=ISO-8859-1"
	import="java.net.URL"
%><html>
<head>
<title>Classes monitor</title>
</head>
<body>
<form>
<%
String className=request.getParameter("class");
%>
Class name: <input type="text" name="class" value="<%=className==null ? "" : className%>" size="100">
<input type="submit" value="test"/>
</form>
<%
	if (className!=null)
	{
		try
		{
			Class cl=Class.forName(className);
			int p=className.lastIndexOf('.');
			String suffix=(p>=0)
				? className.substring(p+1)
				: className
			;
			URL url=cl.getResource(suffix+".class");
			%>URL: <input type="text" size="100" value="<%=url%>"><%
		}
		catch (ClassNotFoundException ex)
		{
			%><strong>Class not found</strong><%
		}
	}
%>
</body>
</html>
