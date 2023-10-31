/*
	Funciones para el manejo de fechas. Acepta todo tipo de formatos, introduciendo el patr�n
	correspondiente. Est� creado para manejar hasta el nivel de detalle de d�as. Para mayor
	precisi�n se deber�an ampliar lo m�todos existentes hasta el nivel de detalle deseado.

	Para definir los patrones se utilizan los siguientes c�digos:

	'dd' -> D�a del mes.
	'MM' -> Mes del a�o en formato num�rico.
	'MMM' -> Mes del a�o en formato texto corto ('ene', 'feb', ...)
	'MMMM' -> Mes del a�o en formato texto completo ('enero', 'febrero', ...)
	'yy' -> A�o con 2 d�gitos (99, 00, 01, ...)
	'yyyy' -> A�o completo (1999, 2000, 2001, ...)

	Ejemplos de patrones:

	"dd/MM/yyyy" -> '03/08/1977', '1/4/2000' (lo acepta y lo convierte a '01/04/2000')
	"MMM'yy" -> ene'99, jun'01
	"dd de MMMM de yyyy" -> 14 de mayo de 2002, 5 de enero de 1999 (lo convierte a 05 de enero de 1999)

	Cuando se define un objeto de tipo Fecha, se le introduce un patr�n asociado de manera
	opcional, pero cuando el objeto est� creado puede funcionar indistintamente con cualquier
	tipo de patron (permite mostrar o cambiar la fecha en cualquier tipo de formato). Aunque,
	por defecto, trabajar� siempre con el patr�n introducido en la creaci�n del objeto Fecha.
*/

/* CONSTANTES */
var PATRON_DEFECTO = "dd/MM/yyyy"; // Patr�n a asignar si no se indica ninguno.
var MESES = ["enero", "febrero", "marzo", "abril", "mayo", "junio",
	"julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"]; // Texto para meses.
var MSG_FECHA_INCORRECTA = "Fecha incorrecta";
var MSG_PATRON_INCORRECTO = "Patr�n incorrecto";
var MSG_FORMATO_CORRECTO = "El formato correcto de fecha es";
var MSG_FECHA_INEXISTENTE = "La fecha no existe";

// FIN de CONSTANTES

/* CONSTRUCTORES */
/*
	Funci�n Fecha:
		Objeto para el manejo de fechas. Puede inicializarse con un texto con una fecha y el
		patr�n con el que est� escrito.
	Par�metros:
		fecha: Objeto para inicializar la fecha. Puede ser:
			- Cadena de texto con un patr�n indicado por 'patron'.
			- Objeto de tipo Date.
			- Otro objeto de tipo Fecha.
			- Un entero con el n�mero de milisegundos desde el 1 de Enero de 1970, a las 00:00:00.
			- Omitirlo. Se inicializa entonces a la fecha actual del sistema.
		patron: Patr�n en el que est� escrita la fecha (si se usa una cedan de texto como inicializador),
			y que ser� usada en operaciones en las cuales no se indique expl�citamente otro patr�n.
			Si se omite, usa PATRON_DEFECTO.
*/
function Fecha(fecha, patron) {
	// Variables de clase
	this.patron = null;
	this.fecha = null;

	// Declaraci�n de los m�todos de clase
	this.toString = Fecha_toString;
	this.get = Fecha_get;
	this.getDate = Fecha_getDate;
	this.getDia = Fecha_getDia;
	this.getMes = Fecha_getMes;
	this.getAnno = Fecha_getAnno;
	this.getPatron = Fecha_getPatron;
	this.set = Fecha_set;
	this.setDia = Fecha_setDia;
	this.setMes = Fecha_setMes;
	this.setAnno = Fecha_setAnno;
	this.setPatron = Fecha_setPatron;
	this.comparar = Fecha_comparar;
	this.moverMilisegundos = Fecha_moverMilisegundos;
	this.moverDias = Fecha_moverDias;
	this.moverMeses = Fecha_moverMeses;
	this.moverAnnos = Fecha_moverAnnos;
	this.getUltimoDiaMes = Fecha_getUltimoDiaMes;

	// Constructor
	if (this.setPatron(patron)) this.set(fecha);
}

// FIN de CONSTRUCTORES

/* M�TODOS DE CLASE */
/*
	Funci�n Fecha_toString:
		Sobreescribe al m�todo por defecto.
	Retorna:
		Cadena de texto con la fecha formateada con el patr�n asignado.
*/
function Fecha_toString() {
	return this.get();
}

/*
	Funci�n Fecha_get:
		Devuelve la fecha formateada con el patr�n indicado.
	Par�metros:
		patron: Patr�n deseado para devolver la fecha. Si se omite, usa el patr�n por defecto
			usado por la fecha.
	Retorna:
		Cadena de texto con la fecha formateada, o null si el patr�n no es correcto.
*/
function Fecha_get(patron) {
	var cadPatron = patron || this.patron;
	var msgError;

	if ((msgError = comprobarPatron(cadPatron)) != '') {
		alert (msgError);
		return null;
	}

	return formatFecha(this.fecha, cadPatron);

}

/*
	Funci�n Fecha_getDate:
		Devuelve el objeto Date de la fecha.
	Retorna:
		Objeto Date con la fecha.
*/
function Fecha_getDate() {
	return this.fecha;
}

/*
	Funci�n Fecha_getDia:
		Devuelve el d�a del mes.
	Retorna:
		D�a del mes.
*/
function Fecha_getDia() {
	return this.fecha.getDate();
}

/*
	Funci�n Fecha_getMes:
		Devuelve el n�mero de mes. Es un numero entre 0 (enero) y 11 (diciembre).
	Retorna:
		N�mero de mes.
*/
function Fecha_getMes() {
	return this.fecha.getMonth();
}

/*
	Funci�n Fecha_getAnno:
		Devuelve el a�o, en formato completo (4 d�gitos).
	Retorna:
		A�o.
*/
function Fecha_getAnno() {
	return this.fecha.getFullYear();
}

/*
	Funci�n Fecha_getPatron:
		Devuelve el patr�n usado por defecto.
	Retorna:
		Patr�n por defecto.
*/
function Fecha_getPatron() {
	return this.patron;
}


/*
	Funci�n Fecha_set:
		Establece la fecha del objeto y el patr�n usado para escribir la fecha y usar por defecto.
	Par�metros:
		fecha: Par�metro para inicializar la fecha. Se puede usar:
			- Cadena de texto con un patr�n indicado por 'patron'.
			- Objeto de tipo Date.
			- Otro objeto de tipo Fecha.
			- Un entero con el n�mero de milisegundos desde el 1 de Enero de 1970, a las 00:00:00.
			- Omitirlo. Se inicializa entonces a la fecha actual del sistema.
		patron: Solo aplicable si se introduce fecha como cadena de texto. Patr�n en el que
			est� escrita la fecha. Si se omite, usa el patr�n existente en el objeto.
	Retorna:
		'true' si no hubo errores, 'false' si fall�.
*/
function Fecha_set(fecha, patron) {
	if (fecha == null)
		this.fecha = new Date();
	else if (fecha.constructor == Date)
		this.fecha = fecha;
	else if (fecha.constructor == Fecha)
		this.fecha = fecha.getDate();
	else if (fecha.constructor == Number)
		this.fecha = new Date(fecha);
	else if (fecha.constructor == String) {
		var cadPatron = patron || this.patron;
		var datos, msgError;

		if ((msgError = comprobarPatron(cadPatron)) != '' ||
			(msgError = comprobarFecha(fecha, cadPatron)) != '') {

			alert (msgError);
			return false;
		}

		datos = parseFecha(fecha, cadPatron);
		this.fecha = new Date(datos[0], datos[1], datos[2]);
	} else
		return false;

	return true;
}

/*
	Funci�n Fecha_setDia:
		Establece el d�a del mes.
	Par�metros:
		dia: D�a del mes. Si se introduce un n�mero mayor del permitido, har� un ajuste de la
			fecha por el n�mero de d�as sobrantes. Por tanto, no dar� error, pero podr�a resultar
			una fecha inesperada.
*/
function Fecha_setDia(dia) {
	this.fecha.setDate(dia);
}

/*
	Funci�n Fecha_setMes:
		Establece el mes. Es un numero entre 0 (enero) y 11 (diciembre). Si se introduce un
		n�mero mayor del permitido, har� un ajuste de la fecha por el n�mero de meses sobrantes.
		Por tanto, no dar� error, pero podr�a resultar una fecha inesperada.
	Par�metros:
		mes: N�mero de mes (0-11).
*/
function Fecha_setMes(mes) {
	this.fecha.setMonth(mes);
}

/*
	Funci�n Fecha_setMes:
		Establece el a�o.
	Par�metros:
		anno: A�o.
*/
function Fecha_setAnno(anno) {
	this.fecha.setFullYear(anno);
}

/*
	Funci�n Fecha_setPatron:
		Establece el patr�n usado por defecto.
	Par�metros:
		patron: Patr�n por defecto.
	Retorna:
		'true' si el patr�n es correcto; 'false' si no.
*/
function Fecha_setPatron(patron) {
	var msgError;

	if ((msgError = comprobarPatron(patron)) != '') {
		alert (msgError);
		return false;
	}

	this.patron = patron;
	return true;
}

/*
	Funci�n Fecha_comparar:
		Compara la fecha del objeto con una fecha determinada.
	Par�metros:
		fecha: Fecha para comparar con la del objeto.
		patron: Patr�n usado por la fecha introducida. Si se omite, usa el patr�n del objeto.
	Retorna:
		La diferencia entre la fecha del objeto y la fecha introducida, expresado en milisegundos.
		Retorna nulo si el patr�n introducido no es correcto.
		Este valor puede ser dividido entre:
			/ 1000 para saber la diferencia en segundos.
			/ 60000 para saber la diferencia en minutos.
			/ 3600000 para saber la diferencia en horas.
			/ 86400000 para saber la diferencia en d�as.
			...
*/
function Fecha_comparar(fecha, patron) {
	var cadPatron = patron || this.patron;
	
	return compararFechas(this.fecha, fecha, this.patron, cadPatron);
}

/*
	Funci�n Fecha_moverMilisegundos:
		Desplaza la fecha actual del objeto una cantidad de miliseguntos determinada. Si es un
		valor positivo, desplaza hacia adelante; si es negativo, retrasa la fecha.
	Par�metros:
		milisegundos: N�mero de milisegundos a adelantar (+) o a retrasar (-).
*/
function Fecha_moverMilisegundos(milisegundos) {
	this.fecha.setMilliseconds(this.fecha.getMilliseconds() + milisegundos);
}

/*
	Funci�n Fecha_moverDias:
		Desplaza la fecha actual del objeto una cantidad de d�as determinada. Si es un
		valor positivo, desplaza hacia adelante; si es negativo, retrasa la fecha.
	Par�metros:
		dias: N�mero de d�as a adelantar (+) o a retrasar (-).
*/
function Fecha_moverDias(dias) {
	this.fecha.setDate(this.fecha.getDate() + dias);
}

/*
	Funci�n Fecha_moverMeses:
		Desplaza la fecha actual del objeto una cantidad de mese determinada. Si es un
		valor positivo, desplaza hacia adelante; si es negativo, retrasa la fecha.
	Par�metros:
		meses: N�mero de meses a adelantar (+) o a retrasar (-).
*/
function Fecha_moverMeses(meses) {
	this.fecha.setMonth(this.fecha.getMonth() + meses);
}

/*
	Funci�n Fecha_moverAnnos:
		Desplaza la fecha actual del objeto una cantidad de a�os determinada. Si es un
		valor positivo, desplaza hacia adelante; si es negativo, retrasa la fecha.
	Par�metros:
		annos: N�mero de a�os a adelantar (+) o a retrasar (-).
*/
function Fecha_moverAnnos(annos) {
	this.fecha.setFullYear(this.fecha.getFullYear() + annos);
}

/*
	Funci�n Fecha_getUltimoDiaMes:
		Devuelve el �ltimo d�a del mes y a�o de la fecha actual.
	Retorna:
		El �ltimo d�a del mes (28, 29, 30 � 31).
*/
function Fecha_getUltimoDiaMes() {
	return getUltimoDiaMes(this.fecha.getMonth(), this.fecha.getFullYear());
}

// FIN de M�TODOS DE CLASE

/* FUNCIONES AUXILIARES */
/*
	Funci�n parseFecha:
		Recoge una cadena de texto y su patr�n de escritura y devuelve un vector de enteros con
		esta informaci�n: [a�o, mes, d�a]. El rango del mes es 0-11. No es necesario que existan
		todos los datos, solo aquellos que est�n indicados en el patr�n.
	Par�metros:
		fecha: Cadena de texto con la fecha a interpretar.
		patron: Patr�n usado por la fecha introducida. Si se omite, usa PATRON_DEFECTO.
	Retorna:
		Vector de enteros: [a�o, mes, dia].
*/
function parseFecha(fecha, patron) {
	var datos = [-1, -1, -1];
	var cadFecha = fecha;
	var cadPatron = patron || PATRON_DEFECTO;
	var token;

	if (cadFecha == null) return null;

	/*
		Para traducir la cadena de texto se usa un aut�mata de tokens. Va consumiendo la
		cadena con la fecha y la cadena con el patr�n, para intentar dejarlas vac�as. Si
		llega a un estado de error o las cadenas no han sido consumidas, el aut�mata da fallo
		de reconocimiento.
	*/
	while (cadFecha.length > 0 && cadPatron.length > 0) {
		// A�o (4 d�gitos)
		if (cadPatron.search(/yyyy/) == 0) {
			if (datos[0] == -1 && cadFecha.search(/\d+/) == 0 &&
				(token = cadFecha.match(/\d+/)[0].substr(0, 4)).length == 4 &&
				!isNaN(datos[0] = parseInt(token.replace(/^0*/,'')))) {

				cadFecha = cadFecha.substr(4);
				cadPatron = cadPatron.substr(4);
			} else {
				break;
			}

		// A�o (2 d�gitos)
		} else if (cadPatron.search(/yy/) == 0) {
			if (datos[0] == -1 && cadFecha.search(/\d+/) == 0 &&
				(token = cadFecha.match(/\d+/)[0].substr(0, 2)).length == 2 &&
				!isNaN(datos[0] = parseInt(token.replace(/^0*/,'')))) {

				cadFecha = cadFecha.substr(2);
				cadPatron = cadPatron.substr(2);
			} else
				break;

		// Mes (texto completo)
		} else if (cadPatron.search(/MMMM/) == 0) {
			if (datos[1] != -1) break;

			for (j = 0; j < MESES.length; j++)
				if (cadFecha.substr(0, MESES[j].length).toUpperCase() == MESES[j].toUpperCase()) {
					datos[1] = j;
					cadFecha = cadFecha.substr(MESES[j].length);
					cadPatron = cadPatron.substr(4);
					break;
				}

			if (j == MESES.length) break;

		// Mes (texto 3 caracteres)
		} else if (cadPatron.search(/MMM/) == 0) {
			if (datos[1] != -1) break;

			for (j = 0; j < MESES.length; j++)
				if (cadFecha.substr(0, 3).toUpperCase() == MESES[j].substr(0, 3).toUpperCase()) {
					datos[1] = j;
					cadFecha = cadFecha.substr(3);
					cadPatron = cadPatron.substr(3);
					break;
				}

			if (j == MESES.length) break;

		// Mes (1 � 2 cifras)
		} else if (cadPatron.search(/MM/) == 0) {
			if (datos[1] == -1 && cadFecha.search(/\d+/) == 0 &&
				(token = cadFecha.match(/\d+/)[0].substr(0, 2)).length < 3 &&
				!isNaN(datos[1] = parseInt(token.replace(/^0*/,'') - 1))) {

				cadFecha = cadFecha.substr(token.length);
				cadPatron = cadPatron.substr(2);
			} else
				break;

		// D�a (1 � 2 cifras)
		} else if (cadPatron.search(/dd/) == 0) {
			if (datos[2] == -1 && cadFecha.search(/\d+/) == 0 &&
				(token = cadFecha.match(/\d+/)[0].substr(0, 2)).length < 3 &&
				!isNaN(datos[2] = parseInt(token.replace(/^0*/,'')))) {

				cadFecha = cadFecha.substr(token.length);
				cadPatron = cadPatron.substr(2);
			} else
				break;

		// Separadores
		} else if (cadPatron.charAt(0) == cadFecha.charAt(0)) {
			cadFecha = cadFecha.substr(1);
			cadPatron = cadPatron.substr(1);

		// Caracter no esperado
		} else
			break;
	}

	// �xito s�lo si las cadenas est�n vac�as (totalmente consumidas).
	if (cadFecha.length != 0 || cadPatron.length != 0)
		return null;

	// Inicializar valores por defecto si no han aparecido
	datos = [datos[0] == -1 ? 0 : datos[0],
		datos[1] == -1 ? 0 : datos[1],
		datos[2] == -1 ? 1 : datos[2]];

	return datos;
}

/*
	Funci�n formatFecha:
		Funci�n que recoge un objeto de tipo Date y un patr�n de fechas y devuelve una cadena
		de texto con la fecha escrita tal y como indica el patr�n.
	Par�metros:
		fecha: Objeto Date con la fecha a convertir a texto.
		patron: Patr�n a usar en la conversi�n. Si se omite, usa PATRON_DEFECTO.
	Retorna:
		Cadena de texto formateada con el patr�n indicado.
*/
function formatFecha(fecha, patron) {
	var dia = fecha.getDate();
	var mes = fecha.getMonth();
	var anno = fecha.getFullYear();
	var cadPatron = patron || PATRON_DEFECTO;
	var cadFecha = "";

	/*
		Se usa un aut�mata de token semejante al usado en parseFecha. En este caso, consume solo
		la cadena del patr�n. Va reemplazando los tokens detectados por los valores de la fecha.
	*/
	while (cadPatron.length > 0) {
		// A�o (4 d�gitos)
		if (cadPatron.search(/yyyy/) == 0) {
			if (anno != -1) {
				cadFecha = cadFecha.concat(anno);
				cadPatron = cadPatron.substr(4);
				anno = -1;
			} else
				break;

		// A�o (2 d�gitos)
		} else if (cadPatron.search(/yy/) == 0) {
			if (anno != -1) {
				cadFecha = cadFecha.concat((new String(anno)).substr(2));
				cadPatron = cadPatron.substr(2);
				anno = -1;
			} else
				break;

		// Mes (texto completo)
		} else if (cadPatron.search(/MMMM/) == 0) {
			if (mes != -1) {
				cadFecha = cadFecha.concat(MESES[mes]);
				cadPatron = cadPatron.substr(4);
				mes = -1;
			} else
				break;

		// Mes (texto 3 caracteres)
		} else if (cadPatron.search(/MMM/) == 0) {
			if (mes != -1) {
				cadFecha = cadFecha.concat(MESES[mes].substr(0, 3));
				cadPatron = cadPatron.substr(3);
				mes = -1;
			} else
				break;

		// Mes (1 � 2 cifras)
		} else if (cadPatron.search(/MM/) == 0) {
			if (mes != -1) {
				cadFecha = cadFecha.concat((mes++ < 9) ? "0" + mes : mes);
				cadPatron = cadPatron.substr(2);
				mes = -1;
			} else
				break;

		// D�a (1 � 2 cifras)
		} else if (cadPatron.search(/dd/) == 0) {
			if (dia != -1) {
				cadFecha = cadFecha.concat((dia < 10) ? "0" + dia : dia);
				cadPatron = cadPatron.substr(2);
				dia = -1;
			} else
				break;

		// Separadores
		} else {
			cadFecha = cadFecha.concat(cadPatron.charAt(0));
			cadPatron = cadPatron.substr(1);
		}
	}

	// �xito solo si la cadena patr�n fue totalmente consumida.
	return (cadPatron.length != 0) ? null : cadFecha;
}

/*
	Funci�n comprobarPatron:
		Comprueba si un patr�n tiene un formato correcto para poder ser usado.
	Par�metros:
		patron: Patr�n a comprobar. Si se omite, comprueba PATRON_DEFECTO.
	Retorna:
		'' si el patr�n es correcto, o mensaje de error si no es correcto.
*/
function comprobarPatron(patron) {
	var cadPatron = patron || PATRON_DEFECTO;

	return formatFecha(new Date(), cadPatron) == null ? MSG_PATRON_INCORRECTO + ': ' + cadPatron : '';
}

/*
	Funci�n comprobarFecha:
		Comprueba si una fecha est� bien escrita seg�n el patr�n usado, y si corresponde
		a una fecha que existe realmente.
	Par�metros:
		fecha: Cadena de texto con la fecha a comprobar.
		patron: Patr�n para examinar. Si se omite, usa el PATRON_DEFECTO.
	Retorna:
		'' si la fecha es correcta, o mensaje de error si no es correcta.
*/
function comprobarFecha(fecha, patron) {
	var cadPatron = patron || PATRON_DEFECTO;
	var datos, objDate;
	var msgError;

	if ((datos = parseFecha(fecha, cadPatron)) == null)
		return MSG_FECHA_INCORRECTA + ': ' + fecha + '\n' + MSG_FORMATO_CORRECTO + ': ' + cadPatron;

	objDate = new Date(datos[0], datos[1], datos[2]);

	if (objDate.getDate() != datos[2] || objDate.getMonth() != datos[1])
		return MSG_FECHA_INEXISTENTE + ': ' + datos[2] + '/' + (datos[1] + 1) + '/' + datos[0];

	return '';
}

/*
	Funci�n compararFechas:
		Compara dos fechas. Admite que estas fechas sean cadenas de texto con patrones aplicados,
		objetos de tipo Fecha u objetos de tipo Date.
	Par�metros:
		fecha1: Fecha de comparaci�n 1.
		fecha1: Fecha de comparaci�n 2.
		patron1: Patr�n usado por la fecha 1. Si se omite, se usa PATRON_DEFECTO. Solo tiene efecto
			si fecha1 es una cadena de texto, ya que si es un Date o Fecha este argumento no se usa.
		patron2: Patr�n usado por la fecha 2. Si se omite, se usa PATRON_DEFECTO. Solo tiene efecto
			si fecha2 es una cadena de texto, ya que si es un Date o Fecha este argumento no se usa.
	Retorna:
		La diferencia entre la fecha 1 y la fecha 2, expresado en milisegundos.
		Este valor puede ser dividido entre:
			/ 1000 para saber la diferencia en segundos.
			/ 60000 para saber la diferencia en minutos.
			/ 3600000 para saber la diferencia en horas.
			/ 86400000 para saber la diferencia en d�as.
			...
*/
function compararFechas(fecha1, fecha2, patron1, patron2) {
	return (new Fecha(fecha1, patron1)).getDate().getTime() -
		(new Fecha(fecha2, patron2)).getDate().getTime();
}

/*
	Funci�n getUltimoDiaMes:
		Devuelve el �ltimo d�a del mes y a�o indicados.
	Par�metros:
		mes: N�mero de mes. El rango del mes es 0 - 11.
		anno: A�o completo (4 d�gitos).
	Retorna:
		El �ltimo d�a del mes (28, 29, 30 � 31).
*/
function getUltimoDiaMes(mes, anno) {
	switch(mes) {
		case 1: // Febrero
			return anno % 400 == 0 || (anno % 4 == 0 && anno % 100 != 0) ? 29 : 28;
		case 3:	case 5:	case 8:	case 10:
			return 30;
		default:
			return 31;
	}
}

/*
	Funci�n esBisiesto:
		Devuelve si el a�o es bisiesto o no.
	Par�metros:
		anno: A�o completo (4 d�gitos).
	Retorna:
		valor booleano (true o false).
*/
function esBisiesto(anno) {
	return anno % 400 == 0 || (anno % 4 == 0 && anno % 100 != 0) ? true : false;
}

/*
	Funci�n caracteresNumericos:
		Devuelve si se ha pulsado una tecla correspondiente a un n�mero
	Retorna:
		valor booleano (true o false).
*/
function caracteresNumericos() 
{
	keyChar = window.event.keyCode;
	
	if (keyChar < 48 || keyChar > 57) 
		return false;

	return true;
}

/*
	Funci�n escribirBarra:
		Formatea una fecha sin necesidad de escribir los separadores.
	Par�metros:
		control: Objeto HTML
*/
function escribirBarra(control) 
{
	var formatofecha='dd/mm/yyyy';
	
	if(formatofecha.charCodeAt(control.value.length) < 97 || formatofecha.charCodeAt(control.value.length) > 122)
		control.value+=formatofecha.charAt(control.value.length).toString();
}

