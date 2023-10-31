<%@ page language="java" errorPage="cenman_error_salir.jsp" import="java.util.ArrayList, java.util.Date, java.util.Arrays, java.util.List,com.soluzionasf.ocen.man.web.domain.CenManWebQueryOfferSend, isf.util.log.Log, java.util.List, java.util.Calendar, java.util.Iterator, java.text.SimpleDateFormat, com.soluzionasf.ocen.man.web.domain.CenManWebContractOffer"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />


<%
	List						listOfOffers = null;
	Iterator 				iterator = null;
	CenManWebContractOffer	offer = null;
	long	loIdOffer	= 0;	
	// Limpia la cache
	response.setHeader("expires", "0");
	session = request.getSession (true);
	
	session.removeValue("codOffer");
	session.removeValue("expedient");
	session.removeValue("numVersion");
	session.removeValue("descripcion");
	session.removeValue("fechaLimite");//ICM SCI 052234
	
	
	/* ICM INICIO SCI 054705*/
	String[] str_statesFilter=(String[])request.getParameterValues("state");
	List arrayStatesFilter = new ArrayList();

	String str_dateFromFilter, str_dateToFilter;
	Date dateFromFilter, dateToFilter;
	dateToFilter = null;
	dateFromFilter = null;
 	SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");       
	
	str_dateFromFilter = request.getParameter("dateFrom");
  str_dateToFilter = request.getParameter("dateTo");    
	if (!(str_dateFromFilter==null) && !(str_dateFromFilter.equals("00/00/0000"))) {   	  	
  	dateFromFilter= formatDate.parse(str_dateFromFilter);
  }
  contractor.setDateFromFilter(dateFromFilter);
  if (!(str_dateToFilter==null)  && !(str_dateToFilter.equals("00/00/0000"))) {   	  	
  	dateToFilter= formatDate.parse(str_dateToFilter);
  }
  contractor.setDateToFilter(dateToFilter);
		 
	arrayStatesFilter  = Arrays.asList(str_statesFilter);		
	contractor.setStatesFilter(new ArrayList(arrayStatesFilter));	
	
	
	CenManWebQueryOfferSend sendQueryOffers = new CenManWebQueryOfferSend();
	
	
	listOfOffers = sendQueryOffers.sendQueryOffer(
                   		contractor.getContractCode(),
                    	contractor.getNode(),contractor.getStatesFilter(),contractor.getDateFromFilter(),contractor.getDateToFilter());
	
	
%>
<html>
<head>
<title>Lista de ofertas</title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="js/sorttable.js"></script>
<script language="JavaScript">
<%//ICM SCI 052234 Se añade un nuevo argumento fechaLimite que contiene la fecha Limite de la oferta%>
<%//ICM SCI 054705 Se añade un nuevo argumento estado que contiene el estado en el que se encuentra la oferta con
//respecto al contratista.Tambien se añade un nuevo argumento que contiene la fecha envio%>
function actualizaOcultos(idOferta,codOferta,expediente,version,fecha,descripcion,fechaLimite,codEstado,desEstado,fechaEnvio)
{
	document.listaOfers.idOferta.value = idOferta;
	document.listaOfers.codOffer.value = codOferta;
	document.listaOfers.expedient.value = expediente;
	document.listaOfers.numVersion.value = version;
	document.listaOfers.creationDate.value = fecha;		
	
	parent.parent.navegacion.document.irADetalle.idOferta.value=document.listaOfers.idOferta.value;
	parent.parent.navegacion.document.irADetalle.codOffer.value = codOferta;
	parent.parent.navegacion.document.irADetalle.expedient.value = expediente;
	parent.parent.navegacion.document.irADetalle.numVersion.value = version;
	parent.parent.navegacion.document.irADetalle.descripcion.value = descripcion;
	parent.parent.navegacion.document.irADetalle.fechaLimite.value = fechaLimite;<%//ICM SCI 052234%>
	parent.parent.navegacion.document.irADetalle.codEstado.value = codEstado;<%//ICM SCI 054705%>
	parent.parent.navegacion.document.irADetalle.desEstado.value = desEstado;<%//ICM SCI 054705%>
	parent.parent.navegacion.document.irADetalle.fechaEnvio.value = fechaEnvio;<%//ICM SCI 054705%>

	parent.parent.navegacion.document.irADetalle.submit();
}
</script>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
 <body class="new4">

   <table class="general" cellspacing="0" border="0">    
    <tr>
      <td class="introbienve3">
<form name='listaOfers'>
<INPUT TYPE="HIDDEN" name="idOferta">
<input type="hidden" name ="codOffer">
<input type="hidden" name ="expedient">
<input type="hidden" name ="numVersion">
<input type="hidden" name ="creationDate">	
<table id="t1" class="sortable"  cellspacing="0" border="0">
		  <tr>
            <th class="datos2" width="18%"><%=traductor.getLiteral("codigo")%></th>
            <th class="datos2" width="10%"><%=traductor.getLiteral("version")%></th>
            <th class="datos2" width="36%"><%=traductor.getLiteral("descripcion")%></th>            
            <th class="datos2" width="12%"><%=traductor.getLiteral("expediente")%></th>
            <th class="datos2" width="12%"><%=traductor.getLiteral("fCreacion")%></th>
            <th class="datos2" width="12%"><%=traductor.getLiteral("fLimite")%></th>
            <th class="datos2" width="12%"><%=traductor.getLiteral("estado")%></th>
        </tr>
<%
	if (listOfOffers.size()>0) {
		iterator = listOfOffers.iterator();
	  String strDesOfer="";
	  String strCreationDate="";
	  String strFechaLimite="";//ICM SCI 052234
		String strExpediente="";
		String strDesEstado = "";
		String strFechaEnvio = "";//ICM SCI  054705
		long 	 longCodEstado ;
		Calendar cal = Calendar.getInstance();
		
		while (iterator.hasNext()){
	  		strDesOfer="&nbsp;";
	      strCreationDate="&nbsp;";
				strExpediente="&nbsp;";
	    	offer = (CenManWebContractOffer) iterator.next();
				loIdOffer = offer.getIdOffer();
	
	      if (offer.getDesOffer()!=null) {
	      	strDesOfer = offer.getDesOffer();
	      }
	      
	      if (offer.getCreationDate()!=null) {													
	         strCreationDate = formatDate.format(offer.getCreationDate());
	       }
				if ((offer.getExpedient()!=null)&&(!offer.getExpedient().equals("null"))) {
					strExpediente = offer.getExpedient();
				}		
				//ICM SCI 052234
				if ((offer.getLimitDate()!=null) && (!offer.getLimitDate().equals("null"))){						
	      	strFechaLimite = formatDate.format(offer.getLimitDate());
				}else {
					strFechaLimite="";
				}
				//FIN SCI 052234
				
				//ICM SCI 054705
				if ((offer.getSendDate()!=null) && (!offer.getSendDate().equals("null"))){						
	      	strFechaEnvio = formatDate.format(offer.getSendDate());
				}else {
					strFechaEnvio="";
				}
				//FIN SCI 054705
				
				longCodEstado= offer.getCodState();
				strDesEstado = offer.getDesState();
			
	
	%>       <tr>
							<%//ICM SCI 052234 Se añade a la función actualizaOcultos el argumento fechaLimite de la oferta%>
	            <td class="datos5" width="15%"><a href="#" onClick="actualizaOcultos('<%=loIdOffer%>','<%=offer.getCodOffer()%>','<%=offer.getExpedient()%>','<%=offer.getNumVersion()%>','<%=strCreationDate%>','<%=strDesOfer%>','<%=strFechaLimite%>','<%=longCodEstado%>','<%=strDesEstado%>','<%=strFechaEnvio%>')" class="resaltar"><%=offer.getCodOffer()%></a></td>
	            <td class="datos5" width="13%">&nbsp;<%=offer.getNumVersion()%></td>			
							<td class="datos5" width="36%">&nbsp;<%=strDesOfer%></td>           
	            <td class="datos5" width="12%">&nbsp;<%=strExpediente%></td>
	            <td class="datos5" width="12%">&nbsp;<%=strCreationDate%></td>
	            <td class="datos5" width="12%">&nbsp;<%=strFechaLimite%></td>
	            <td class="datos5" width="12%">&nbsp;<%=strDesEstado%></td>
	<%
		}
	}else {%>
		<script language="javascript">
			alert('<%=traductor.getLiteral("msgOfertasNoEncontradas")%>');
		</script>
	<%}%>
        </table>
</form>
      </td>
    </tr>
    <tr>
      <td colspan="3">
        <table class="general1" cellspacing="0" border="0" width="100%">
          <tr>
            <td class="boton" width="100%">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>