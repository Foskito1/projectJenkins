<%@page contentType="text/html;charset=ISO-8859-1" %>
<%@page errorPage="cenman_error_salir.jsp"%>
<jsp:useBean id="traductor" scope="session" class="com.soluzionasf.ocen.man.web.domain.CenManWebTraductorUser" />
<html><head><title>Calendario</title>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<script>
	if (navigator.appName != "Netscape")
	{
		document.write("<style>");
		document.write("INPUT{background-color:white;border-width:1;border-style:solid;border-color: #0E9AAD;color:#000000;font-size:9px;font-family:Verdana;font-weight:bold;}");
		document.write("</style>");
	}
</script>

<script language="JavaScript">
//javascript:setDate(); setToday(); setpreviousMonth(); 
	function iniPreviousMonth() {	
		setToday();
		setPreviousMonth();
	}
	
	function iniNextMonth() {	
		setToday();
		setNextMonth();
	}
	
	function iniToday() {
		setToday();
	}

<!--


var styleFlag;
var numeroCelda = 0;

function setDate() {
	
	
    styleFlag = document.calControl.style?1:0;
    //this.dateField = opener.dateField;
    <% if (request.getParameter("derecha")!=null){ %>
    
    	//this.dateField = window.opener.parent.frames["derecha"].document.forms[0].<%=request.getParameter("originField")%>
    <%} else {%>
    //
       // this.dateField = window.opener.parent.frames["busqueda"].document.forms[0].<%=request.getParameter("originField")%>
    <%}%>
    var dateField = window.opener.parent.frames['<%=request.getParameter("miframe")%>'].document.forms[0].<%=request.getParameter("originField")%>.value;
    //this.inDate = dateField.value;
    var inDate = dateField;    

	var now = new Date();

    var day   = now.getDate();
    var month = now.getMonth();
    var year  = now.getFullYear();
	var today = true;
	var existia = false;

    if (inDate.indexOf('/')) {
	    var inDay = inDate.substring(0,inDate.indexOf("/"));
	    if (inDay.substring(0,1) == "0" && inDay.length > 1)
	    inDay = inDay.substring(1,inDay.length);
	    inDay = parseInt(inDay);
	    var inMonth   = inDate.substring(inDate.indexOf("/") + 1, inDate.lastIndexOf("/"));
	    if (inMonth.substring(0,1) == "0" && inMonth.length > 1)
	    inMonth = inMonth.substring(1,inMonth.length);
	    inMonth = parseInt(inMonth);
	    var inYear  = parseInt(inDate.substring(inDate.lastIndexOf("/") + 1, inDate.length));
	    if (inDay) {
			day = inDay;
			if (inMonth) {
				month = inMonth-1;
				if (inYear) {
					year = inYear;
					today=false;
					existia = true;
				}
			}
		}
	}
    this.focusDay = day;    
    document.calControl.month.selectedIndex = month;
    document.calControl.year.value = year;
    
    displayCalendar(day, month, year, today, existia);
    }

function setToday() {
    var now   = new Date();
    var day   = now.getDate();
    var month = now.getMonth();
    var year  = now.getFullYear();
	var today = true;

    this.focusDay = day;
    document.calControl.month.selectedIndex = month;
    document.calControl.year.value = year;
    displayCalendar(day, month, year, today);
    returnDate(day);
    }
function isFourDigitYear(year) {
    if (year.length != 4) {
    alert ("<%=traductor.getLiteral("msgAno4digitos")%>");//78
    document.calControl.year.select();
    document.calControl.year.focus();
    }
    else {return true;
    }
    }
function selectDate() {
    var year  = document.calControl.year.value;
	var today = false;
    if (isFourDigitYear(year)) {
    var day   = 0;
    var month = document.calControl.month.selectedIndex;
    displayCalendar(day, month, year, today);
    }
}
function setPreviousYear() {
    var year  = document.calControl.year.value;
	var today = false;
    if (isFourDigitYear(year)) {
    var day   = 0;
    var month = document.calControl.month.selectedIndex;
    year--;
    document.calControl.year.value = year;
    displayCalendar(day, month, year, today);
    }
}
function setPreviousMonth() {
    var year  = document.calControl.year.value;
	var today = false;
    if (isFourDigitYear(year)) {
//    var now   = new Date();
//    var day   = now.getDate();
    var day   = this.focusDay;
    var month = document.calControl.month.selectedIndex;
    if (month == 0) {
    month = 11;
    if (year > 1000) {
    year--;
    document.calControl.year.value = year;
    }
    }
    else {
    month--;
    }
    document.calControl.month.selectedIndex = month;
    displayCalendar(day, month, year, today);
//    returnDate(day);  
    }
}
function setNextMonth() {
		var year  = document.calControl.year.value;
		var today = false;
		if (isFourDigitYear(year)) {
		var day   = this.focusDay ;
		var month = document.calControl.month.selectedIndex;
		if (month == 11) {
		month = 0;
		year++;
       document.calControl.year.value = year;
        }
        else {
        month++;
        }
        document.calControl.month.selectedIndex = month;
        displayCalendar(day, month, year, today);
//        returnDate(day);
    }
}
function setNextYear() {
    var year  = document.calControl.year.value;
	var today = false;
    if (isFourDigitYear(year)) {
    var day   = 0;
    var month = document.calControl.month.selectedIndex;
    year++;
    document.calControl.year.value = year;
    displayCalendar(day, month, year, today);
    }
}
function displayCalendar(day, month, year, today, existia) {       
    day     = parseInt(day);
    month   = parseInt(month);
    year    = parseInt(year);
    var i   = 0;
    var now = new Date(year,month,day);
    if (day == 0) {
      var nowDay = now.getDate();
      day=nowDay;
    } else {
      var nowDay = day;
    }
    var days = getDaysInMonth(month+1,year);
    
    var firstOfMonth = new Date (year, month, 1);
    var startingPos  = firstOfMonth.getDay() - 1;
    
    //si el primero de mes fuera domingo nos habria salido un -1, con lo cual al intentar referirnos a este callButtoms[element] cascaría
    //cuando lo que hay que hacer es reservar las 6 primeras posiciones, esto es, de lunes a sabado primeros elements, esto es:
    if (startingPos==-1)
    	startingPos=6;
    
    days += startingPos;

//MAKE BEGINNING NON-DATE BUTTONS BLANK
    for (i = 0; i < startingPos; i++) {
        document.calButtons.elements[i].value = "   ";
        if (styleFlag) document.calButtons.elements[i].style.visibility="hidden";
    }
    // SET VALUES FOR DAYS OF THE MONTH
    for (i = startingPos; i < days; i++){
      document.calButtons.elements[i].value = i-startingPos+1;
      document.calButtons.elements[i].onClick = "returnDate";
	  if (navigator.appName != "Netscape") {
	 	document.calButtons.elements[i].style.color = "black";
	  }
      if (styleFlag) document.calButtons.elements[i].style.visibility="visible";
    }
    // MAKE REMAINING NON-DATE BUTTONS BLANK
    for (i=days; i<42; i++)  {
        document.calButtons.elements[i].value= "   ";
        if (styleFlag) document.calButtons.elements[i].style.visibility="hidden";
    }
    // GIVE FOCUS TO CORRECT DAY
    var nDays = getDaysInMonth(month+1,year);
    if ( day > nDays ) {
    	focusDay = nDays;
    	day = nDays;
    }
    	if (navigator.appName != "Netscape"){
			if (today == true) {
				numeroCelda = focusDay+startingPos-1;
				document.calButtons.elements[numeroCelda].style.color="red";
			    document.calButtons.elements[focusDay+startingPos-1].focus();
			} else {
				if (existia == true)
				{							
					numeroCelda = focusDay + startingPos -1;
					document.calButtons.elements[numeroCelda].style.color="blue";
					document.calButtons.elements[numeroCelda].focus();
				} else {												
					numeroCelda = focusDay + startingPos - 1;
					document.calButtons.elements[numeroCelda].style.color="black";
					document.calButtons.elements[numeroCelda].focus();
				}
			}
			    
		}
	
//	returnDate(day);
}
// GET NUMBER OF DAYS IN MONTH
function getDaysInMonth(month,year)  {
var days;
if (month==1 || month==3 || month==5 || month==7 || month==8 ||
month==10 || month==12)  days=31;
else if (month==4 || month==6 || month==9 || month==11) days=30;
else if (month==2)  {
if (isLeapYear(year)) {days=29;}
else {
days=28;
}
}
return (days);
}
// CHECK TO SEE IF YEAR IS A LEAP YEAR
function isLeapYear (Year) {
    if (((Year % 4)==0) && ((Year % 100)!=0) || ((Year % 400)==0)) {
    return (true);
    }
    else {
    return (false);
    }
}
// SET FORM FIELD VALUE TO THE DATE SELECTED
function returnDate(inDay){
	if(inDay == "   "){
		alert("<%=traductor.getLiteral("msgDiaObligatorio")%>");
		return false;
	}

	var day   = inDay;
	var month = (document.calControl.month.selectedIndex);
	var year  = document.calControl.year.value;
	
	if( year < 1900){
		alert("<%=traductor.getLiteral("msgAnoValido")%>");
		return false;
	}

	var now = new Date();
	var fecha = new Date(year,month,day);
	var diaH = Date.parse(now);
	var diaS = Date.parse(fecha);
	month = month + 1;

	diaH = diaH + (5*86400000);	
	
	if ((""+month).length == 1)
	{
	month="0"+month;
	}
	if ((""+day).length == 1)
	{
	day="0"+day;
	}
	
	<% if (request.getParameter("derecha")!=null){ %>
	//window.opener.parent.frames["derecha"].document.forms[0].<%=request.getParameter("originField")%>.value = day + "/" + month + "/" + year;
	<%}else{%>
	//window.opener.parent.frames["busqueda"].document.forms[0].<%=request.getParameter("originField")%>.value = day + "/" + month + "/" + year;
	<%}%>	
	window.opener.parent.frames['<%=request.getParameter("miframe")%>'].document.forms[0].<%=request.getParameter("originField")%>.value = day + "/" + month + "/" + year;
	
	return true;
}

function closeWindow(){
	window.close();
	<%
	String andSubmit = request.getParameter("andSubmit");
	if((andSubmit!=null)&&(andSubmit.equals("true"))){
	%>
	<% if (request.getParameter("derecha")!=null){ %>
//	window.opener.parent.frames["derecha"].document.forms[0].target.value='content';
	//window.opener.parent.frames["derecha"].document.forms[0].submit();
	<%}else{%>
	//window.opener.parent.frames["busqueda"].document.forms[0].submit();
	<%}%>
	window.opener.parent.frames['<%=request.getParameter("miframe")%>'].document.forms[0].submit();
	<%
	}
	%>
}
// -->
</script>
<link href="css/ocen.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<% 
	if (request.getParameter("loadDate").equals("previousMonth")) { 
%>
<body  class="cuerpocalen" onload="iniPreviousMonth()" text="#990000" link="#CC3333" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<% 
	} else if (request.getParameter("loadDate").equals("nextMonth")) { 
%>
<body  class="cuerpocalen" onload="iniNextMonth()" text="#990000" link="#CC3333" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<%
	} else if (request.getParameter("loadDate").equals("thisDate")) { 
%>
<body class="cuerpocalen"  onload="setDate()" text="#990000" link="#CC3333" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<%
	} else { 
%>
<body class="cuerpocalen" onload="iniToday()" text="#990000" link="#CC3333" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<% 
	}
%>

<table cellpadding=0 cellspacing=0 border=0 width="170" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF">
	<tr>
		<td>
		<form name="calControl" onSubmit="return false;">
			<table cellpadding=0 cellspacing=0 border=1 width="100%" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF">
			   <tr bgcolor="#FFFFFF"> 
			   		<td COLSPAN=5 ALIGN=center>
			   			<script>
			   				if (navigator.appName != "Netscape")
			   				{
								document.write("<select name='month' onChange='selectDate()' class='formularioP'>");
							} else {
								document.write("<select name='month' onChange='selectDate()'>"); 
							}
						</script>
			            <option class="texto1"><%=traductor.getLiteral("enero")%>
			            <option class="texto1"><%=traductor.getLiteral("febrero")%>
			            <option class="texto1"><%=traductor.getLiteral("marzo")%>
			            <option class="texto1"><%=traductor.getLiteral("abril")%>
			            <option class="texto1"><%=traductor.getLiteral("mayo")%>
			            <option class="texto1"><%=traductor.getLiteral("junio")%>
			            <option class="texto1"><%=traductor.getLiteral("julio")%>
			            <option class="texto1"><%=traductor.getLiteral("agosto")%>
			            <option class="texto1"><%=traductor.getLiteral("septiembre")%>
			            <option class="texto1"><%=traductor.getLiteral("octubre")%>
			            <option class="texto1"><%=traductor.getLiteral("noviembre")%>
			            <option class="texto1"><%=traductor.getLiteral("diciembre")%>
			          </select>
			          &nbsp;<input name="year" type=text size=4 maxlength=4 onChange="selectDate()" >
			      </td>
			 </tr>
			 <tr> 
			  	<td>
					  <script>
					  if (navigator.appName != "Netscape")
					  {
						  document.write("<input type=button style='background-color:#0A98AC;color:white;border-color:black;border-width:1' name='previousYear' value='<%=traductor.getLiteral("anoAnterior")%>' onClick='setPreviousYear()'>");
					  } else {
						  document.write("<input type=button name='previousYear' value='-A' onClick='setPreviousYear()'>");
					  }
					  </script>
				</td>
				<td align=center>
					  <script>
					  if (navigator.appName != "Netscape")
					  {
						  document.write("<input type=button style='background-color:#0A98AC;color:white;border-color:black;border-width:1' name='previousYear' value='<%=traductor.getLiteral("mesAnterior")%>' onClick='setPreviousMonth()'>");
					  } else {
						  document.write("<input type=button name='previousYear' value='-M' onClick='setPreviousMonth()'>");
					  }
					  </script>
			  </td>
		      <td align=center>
					  <script>
					  if (navigator.appName != "Netscape")
					  {
						  document.write("<input type=button style='background-color:#0A98AC;color:white;border-color:black;border-width:1' name='previousYear' value='<%=traductor.getLiteral("hoy")%>' onClick='setToday()'>");
					  } else {
						  document.write("<input type=button name='previousYear' value='Hoy' onClick='setToday()'>");
					  }
					  </script>
				</td>
				<td align=center>
					  <script>
					  if (navigator.appName != "Netscape")
					  {
						  document.write("<input type=button style='background-color:#0A98AC;color:white;border-color:black;border-width:1' name='previousYear' value='<%=traductor.getLiteral("mesPosterior")%>' onClick='setNextMonth()'>");
					  } else {
						  document.write("<input type=button name='previousYear' value='+M' onClick='setNextMonth()'>");
					  }
					  </script>
			  </td>
		      <td align=center>
					  <script>
					  if (navigator.appName != "Netscape")
					  {
						  document.write("<input type=button style='background-color:#0A98AC;color:white;border-color:black;border-width:1' name='previousYear' value='<%=traductor.getLiteral("anoPosterior")%>' onClick='setNextYear()'>");
					  } else {
						  document.write("<input type=button name='previousYear' value='+A' onClick='setNextYear()'>");
					  }
					  </script>
				</td>
			</tr>
		</TABLE>
		</form>
		</TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER>
			<form name="calButtons">
			<table cellpadding=0 cellspacing=0 border=1 width="100%" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
			     <tr align="center" class="tituloformulario"> 
			        <td height="2"> 
			            <%=traductor.getLiteral("lunesA")%>
			        </td>
			        <td height="2"> 
			            <%=traductor.getLiteral("martesA")%> 
			        </td>
			        <td height="2"> 
			           <%=traductor.getLiteral("miercolesA")%> 
			        </td>
			        <td height="2"> 
			            <%=traductor.getLiteral("juevesA")%> 
			        </td>
			        <td height="2"> 
			            <%=traductor.getLiteral("viernesA")%> 
			        </td>
			        <td height="2"> 
			            <%=traductor.getLiteral("sabadoA")%> 
			        </td>
					<td height="2"> 
			            <%=traductor.getLiteral("domingoA")%>
			        </td>
			     </tr>
			     <tr bgcolor="#FFFFFF"> 
        <td height="2"> 
          <input type="button" name="but0"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32" height="2"> 
          <input type="button" name="but1"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32" height="2"> 
          <input type="button" name="but2"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32" height="2"> 
          <input type="button" name="but3"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32" height="2"> 
          <input type="button" name="but4"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32" height="2"> 
          <input type="button" name="but5"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32" height="2"> 
          <input type="button" name="but6"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
      </tr>
      <tr> 
        <td> 
          <input type="button" name="but7"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but8"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but9"  value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but10" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but11" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but12" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but13" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
      </tr>
      <tr> 
        <td> 
          <input type="button" name="but14" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but15" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but16" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but17" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but18" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but19" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but20" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
      </tr>
      <tr> 
        <td> 
          <input type="button" name="but21" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but22" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but23" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but24" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but25" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but26" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but27" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
      </tr>
      <tr> 
        <td> 
          <input type="button" name="but28" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but29" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but30" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but31" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but32" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but33" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but34" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
      </tr>
      <tr> 
        <td> 
          <input type="button" name="but35" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but36" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but37" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but38" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but39" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but40" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
        <td width="32"> 
          <input type="button" name="but41" value="    " onClick="if(returnDate(this.value)){closeWindow();}" style="width:22px" width=22>
        </td>
      </tr>
      </table>
  </form>
	</TD>
	</TR>
</TABLE>
</body>
<head>
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</head>
</html>