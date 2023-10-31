<%
		String documento = request.getParameter("documento");
		String titulo_excel =request.getParameter("titulo");

		// Caracteristicas de la hoja excel
		response.setHeader("expires","0");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-disposition", "attachment;filename="+ titulo_excel+"");
		out.println("<HTML>");
		//out.println("<link rel=stylesheet href=\"http://swebdes1.adm.uef.es:7998/jsps/css/ocen.css\" type=\"text/css\">");
		out.println("<BODY>");
		out.println(documento);
		out.println("</BODY>");
		out.println("</HTML>");
		out.close();
%>