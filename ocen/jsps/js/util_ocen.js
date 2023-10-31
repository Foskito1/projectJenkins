//***************************    JS DE UTILIDADES OCEN *****************************************
// Funcion si comprueba si hay al menos un check seleccionado con un name determinado
function isChecked(namecheck) {
	is_check_state = false;	
	for (i=0;i<document.getElementsByName(namecheck).length &&  !is_check_state ;i++) {
  	if (document.getElementsByName(namecheck)[i].checked) {
  		is_check_state = true;
  	}
  }
  return is_check_state;
}


// compara las fechas 1 y 2, si 1<2 devuelve -1, si son = devuelve 0, si 1>2 devuelve 1
function compararFechas(fecha1, fecha2)
{
	var ano1 = fecha1.substring(6,10);
	var ano2 = fecha2.substring(6,10);
	var mes1 = fecha1.substring(3,5);
	var mes2 = fecha2.substring(3,5);
	var dia1 = fecha1.substring(0,2);
	var dia2 = fecha2.substring(0,2);
	
	if (ano2 < ano1)
		return 1;
	else if (ano2 > ano1)
		return -1;
	else {	// mismo año
  		if (mes2 < mes1)
	  		return 1;
		else if (mes2 > mes1)
  			return -1;
  		else {	// mismo mes
  			if (dia2 < dia1)
  				return 1;
  			else if (dia2 > dia1)
  				return -1;
  			else return 0;
  		}
	}
}


