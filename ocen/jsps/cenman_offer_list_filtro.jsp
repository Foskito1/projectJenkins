<%@ page language="java" errorPage="cenman_error_salir.jsp" import="isf.util.log.Log,java.util.ArrayList, com.soluzionasf.ocen.man.web.domain.CenManWebShared, java.util.Calendar,java.text.SimpleDateFormat,  com.soluzionasf.ocen.man.web.domain.CenManWebContractOffer"%>
<%@ page contentType="text/html;charset=ISO-8859-1"%>

<jsp:useBean id="contractor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManContractBean" />
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<html>
<head>
<title>Lista de ofertas</title>
<link rel=stylesheet href="css/ocen.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="javascript" src="js/util_ocen.js"></script>
<script language="javascript" src="js/fechas.js"></script>
<script language="JavaScript">
// Funcion que comprueba si la fecha tiene formato correcto
function validarFecha (fecha) {
	if (!(fecha.value=='' || fecha.value=='00/00/0000')  && comprobarFecha(fecha.value, "dd/MM/yyyy") != "") {
		return false;		
	}
	return true;
}

// Funcion que comprueba si la fecha desde es menos o igual que la fecha hasta
function checkFechas (dateFrom,dateTo) {	

	if (dateFrom!='00/00/0000' &&  dateTo!='00/00/0000' &&  compararFechas(dateTo, dateFrom)<0){
			return false;
	}
	else return true;
}

function mostrarResultados(){
	if (!validarFecha(document.formulario.dateFrom)) {
		alert('<%=traductor.getLiteral("msgFechaDesdeIncorrecta")%>');
		document.formulario.dateFrom.focus();
		return;
	}
	
	if (!validarFecha(document.formulario.dateTo)) {
		alert('<%=traductor.getLiteral("msgFechaHastaIncorrecta")%>');
		document.formulario.dateTo.focus()
		return;
	}
	if (!checkFechas(document.formulario.dateFrom.value,document.formulario.dateTo.value)) 	{
		alert('<%=traductor.getLiteral("msgFechasNoCorrectas")%>');
		document.formulario.dateFrom.focus();
		return;
	}
	if (!isChecked('state')){
		alert('<%=traductor.getLiteral("msgSeleccionEstado")%>');		
		return;
	}
	document.formulario.submit();	
	
}

</script>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
<body class="new4" onload="javascript:mostrarResultados();">
<table class="general" cellspacing="0" border="0">
	<tr>
  	<td width="100%">
    	<table border="0" cellspacing="0">
    		<tr>
    			<td class="paracabeceralista" nowrap><%=traductor.getLiteral("criteriosSeleccion")%></td>
      		<td class="introbienve2" colspan="2">
        		<table class="introbienve" cellspacing="0">
          		<tr>
            		<td class="parabienve" ><%=traductor.getLiteral("empresaUnionFenosa")%><td>
          		</tr>
        		</table>
      		</td>
      	</tr>
    	</table>    	
    </td>    	
	</tr>
	<% 
	//Si alguno de los criterios de filtrado es nulo se pone por defecto en dichos campos "00/00/0000"
	String str_dateFromFilter,str_dateToFilter;
	SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy");       
	
	if (contractor.getDateFromFilter()==null)  {
			str_dateFromFilter="00/00/0000";			
	}else {
	 		str_dateFromFilter= formatDate.format(contractor.getDateFromFilter());
	}
	if (contractor.getDateToFilter()==null)  {
			str_dateToFilter="00/00/0000";			
	}else {
		str_dateToFilter= formatDate.format(contractor.getDateToFilter());
	}
	%>
  <tr>
  	<td  width="100%">
  	<form name="formulario" target="resultado" method="post" action="cenman_offer_list.jsp">
    	<table width="95%" cellspacing="0" border="0" >			   
      	<tr>
      		<td width="100%">
	      		<table width="100%" cellspacing="0" cellpadding="0" border="0" >			   
							<tr><td>&nbsp;</td></tr>		
							<tr>
								<td align="left" class="labelfiltro">
									<input type="button" class="interior" value="<%=traductor.getLiteral("buscar")%>" onclick="javascript:mostrarResultados();"/>&nbsp;
								</td>
								<td class="labelfiltro"><%=traductor.getLiteral("fSolicitudDesde")%>:</td>
								<td align="left">
									<input name="dateFrom" class="inputfiltro" type="text" value="<%=str_dateFromFilter%>" maxlength="10" size="21" onfocus="javascript:if (this.value=='00/00/0000') this.value='';" lostfocus="javascript:this.value='';" onBlur="javascript:if (this.value=='') this.value='00/00/0000'"; this.value='00/00/0000';" onkeypress="if (caracteresNumericos()) escribirBarra(this); else return false;" onChange="javascript:validarFecha(this);"/>
									<a href="javascript:void(0)">						
										<img title="<%=traductor.getLiteral("fSolicitudDesde")%>" align="absmiddle" src="../images/lupa.gif" border="0" onClick="x=event.screenX + 10;y=event.screenY;win = window.open('cenman_calendario.jsp?originField=dateFrom&miframe=filtro&loadDate=thisDate','winCalendario','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=175,height=215');win.moveTo(x,y)">
									</a>
								</td>								
								<td class="labelfiltro"><%=traductor.getLiteral("fSolicitudHasta")%>:</td>
								<td align="left">
									<input  name="dateTo" class="inputfiltro" type="text" value="<%=str_dateToFilter%>" maxlength="10" size="21" onfocus="javascript:if (this.value=='00/00/0000') this.value='';" onBlur="javascript:if (this.value=='') this.value='00/00/0000'"; onkeypress="if (caracteresNumericos()) escribirBarra(this); else return false;" onChange="validarFecha(this)"/>
									<a href="javascript:void(0)">						
										<img title="<%=traductor.getLiteral("fSolicitudHasta")%>" align="absmiddle" src="../images/lupa.gif" border="0" onClick="x=event.screenX + 10;y=event.screenY;win = window.open('cenman_calendario.jsp?originField=dateTo&miframe=filtro&loadDate=thisDate','winCalendario','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=175,height=215');win.moveTo(x,y)">
									</a>
								</td>
							</tr>			
							<tr><td>&nbsp;</td></tr>							
							<% //Si no hay ningun estado seleccionado por defecto se selecciona el estado solicitada y recibida contratista
							if (contractor.getStatesFilter()==null || contractor.getStatesFilter().size()==0) {
								ArrayList arrayStates=new ArrayList();
								arrayStates.add(CenManWebShared.getRpSolicitada());
								arrayStates.add(CenManWebShared.getRpRecibidaContratista());
								contractor.setStatesFilter(arrayStates);
							}
							%>
							<tr>														
								<td align="left" class="labelfiltro" >
									<input name="state" type="checkbox" value="<%=CenManWebShared.getRpSolicitada()%>" <%if (contractor.hasStatesFilter(CenManWebShared.getRpSolicitada())){%>checked <%}%>> <%=traductor.getLiteral("solicitada")%>
								</td> 
								<td align="left" class="labelfiltro" >
									<input name="state" type="checkbox" value="<%=CenManWebShared.getRpRecibidaContratista()%>" <%if (contractor.hasStatesFilter(CenManWebShared.getRpRecibidaContratista())){%>checked <%}%>> <%=traductor.getLiteral("recibida")%>
								</td> 
								<td align="left" class="labelfiltro" >
									<input name="state" type="checkbox" value="<%=CenManWebShared.getRpOfertadaContratista()%>" <%if (contractor.hasStatesFilter(CenManWebShared.getRpOfertadaContratista())){%>checked <%}%>> <%=traductor.getLiteral("ofertada")%>
								</td>
								<td align="left" class="labelfiltro" >
									<input name="state" type="checkbox" value="<%=CenManWebShared.getRpAdjudicada()%>" <%if (contractor.hasStatesFilter(CenManWebShared.getRpAdjudicada())){%>checked <%}%>> <%=traductor.getLiteral("adjudicada")%>
								</td>
								<td name="state" align="left" class="labelfiltro">
									<input name="state" type="checkbox" value="<%=CenManWebShared.getRpDenegada()%>" <%if (contractor.hasStatesFilter(CenManWebShared.getRpDenegada())){%>checked <%}%>> <%=traductor.getLiteral("denegada")%>
								</td>
							</tr>																								
						</table>
					</td>
				</tr>      		
			</table>		    
		</form>
		</td>
	</tr>
</table>
</body>
