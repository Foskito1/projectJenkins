// OpenLink Server 2.001 Release 1 (26/01/2001) for Java
// Ultima Actualizaci�n: 12/02/2001
// 
// Esta librer�a contiene los ejemplos de como hacer actualizaciones
// contra una Base de Datos, m�s concretamente tiene un ejemplos para
// insertar, recuperar, modificar y eliminar registros en una tabla
// de una base de datos Oracle.

package roj.shlib;

import java.sql.*;
import oracle.jdbc.driver.*;
import OPLServicios.*;
import java.util.Vector;
import Roj.Utilities.*;

public class FNObjComm {
    
    // La funci�n FNGETREC devuelve n registros obtenidos a partir de una consulta a una 
    // Base de Datos Oracle. Cada uno de los campos del resultado de la consulta
    // se iran concatenando hasta formar un registro, y as� sucesivamente hasta que
    // se hayan leido todas las filas de la consulta. El String que resulta de esta
    // consulta ser� devuelto al cliente a trav�s de OpenLink
    //
    // Entrada: Codigo del Sistema (30 caracteres)
    // Salida : la concatenaci�n de n registros de 134 caracteres con los 
    //          siguientes campos:
    //        CAMPO               Tama�o
    //    - cod_tarea           :   30
    //    - cod_grupo           :   12
    //    - cod_sistema         :   20
    //    - cod_empresa         :   20
    //    - empresa_generadora  :   20
    //    - sistema_generador   :   20
    //    - usuario_generador   :   12
    
    public void FNGETREC(OplFunServices opServices) throws Exception
    {
       Connection conn = null;
       
       // Con la finalidad de poder devolver al cliente cualquier excepci�n que se pueda producir
       // durante la ejecuci�n de la funci�n, se aconseja desarrollar la funci�n dentro de una
       // �nica sentencia try ... catch,
       try {
	      Statement stmt;
	      ResultSet rs;
	      String szSQL = new String();
	      
	      //Se captura el C�digo de Sistema que viene como dato desde el cliente
	      String szCodSistema = opServices.getDataRec();
	      
          //Clase del Repositorio de Objetos que permite concatenar String�s.
	      RojString opRegistros = new RojString();
	      String  cadenaConexion="jdbc:oracle:oci8:@AGENDA_ENTDES_DESARROLLO_V8";
	      
	      // Conexi�n a la base de datos
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      //conn = DriverManager.getConnection(cadenaConexion,opServices.getUser(),opServices.getPassword());
	      conn = DriverManager.getConnection(cadenaConexion,"agend001","agend001");
	      stmt = conn.createStatement();
	      
	      // Ejecuci�n de la consulta
	      szSQL = "SELECT cod_tarea, cod_grupo, cod_sistema, cod_empresa, empresa_generadora, sistema_generador, usuario_generador FROM OYE_AGE_TAREA_GRUPO WHERE cod_sistema='" + szCodSistema+ "' ORDER BY cod_tarea";
	      rs = stmt.executeQuery(szSQL);
	      
	      // Se van concatenando todos los campos obtenidos que se encuentran en el ResultSet
	      // Es recomendable usar en el m�todo getString del objeto ResultSet el n�mero de columna
	      // en vez de su nombre, ya que esto �ltimo ralentiza la ejecuci�n.
	      // Ver documentaci�n de OpenLink para detalles acerca del uso del Objeto RojString
	      while (rs.next()) {
	         opRegistros.concat(rs.getString(1), 30, ' ', 1) ;
		     opRegistros.concat(rs.getString(2), 12, ' ', 1) ;
		     opRegistros.concat(rs.getString(3), 20, ' ', 1) ;
		     opRegistros.concat(rs.getString(4), 20, ' ', 1) ;
		     opRegistros.concat(rs.getString(5), 20, ' ', 1) ;
		     opRegistros.concat(rs.getString(6), 20, ' ', 1) ;
		     opRegistros.concat(rs.getString(7), 12, ' ', 1) ;
	      }
	      
	      // Se cierran la conexiones
	      stmt.close();
	      conn.close();
	      
	      // Se env�a el contenido del String al cliente. No es necesario
	      // dividir la cadena en tramas.
	      opServices.setDataSend(opRegistros.getString());
          opServices.setReturnCode(00000000);
          return;
       }
	   catch (Exception e)
	   {
	      // En caso de alguna excepci�n no controlada, debemos cerrar la 
	      // conexi�n a la base de datos, en caso de que hubiese sido abierta
          if (conn != null) {
	         conn.close();
	      }
	      // Importante: Se recomienda no quedarse con la excepci�n, lo ideal
	      // es reenviarla al servidor, de manera de que este a su vez la trate
	      // y la env�e al cliente
	      throw e;
	   }
    }
    
    
    // La funci�n FNINSREC inserta n registros a una Base de Datos Oracle.
    //
    //Registro(s) de salida:
    //        CAMPO               Tama�o
    //    - cod_tarea           :   30
    //    - cod_grupo           :   12
    //    - cod_sistema         :   20
    //    - cod_empresa         :   20
    //    - empresa_generadora  :   20
    //    - sistema_generador   :   20
    //    - usuario_generador   :   12
    //
    // Tama�o del Registro: 139
    
    public void FNINSREC(OplFunServices opServices) throws Exception
    {
       Connection conn = null;
       
       // Con la finalidad de poder devolver al cliente cualquier excepci�n que se pueda producir
       // durante la ejecuci�n de la funci�n, se aconseja desarrollar la funci�n dentro de una
       // �nica sentencia try ... catch,
       try {

	      Statement stmt;
	      String szCodTarea, szCodGrupo, szCodSistema, szCodEmpresa;
          String szTipoTarea, szEmpGen, szSisGen,szUsuGen;
          String szRegistro, szSQL;
   	      int i;
          
          String  cadenaConexion="jdbc:oracle:oci8:@AGENDA_ENTDES_DESARROLLO_V8";
	      Class.forName("oracle.jdbc.driver.OracleDriver");
          conn = DriverManager.getConnection(cadenaConexion,"agend001","agend001");
	      
	      if (conn.getAutoCommit())
	         conn.setAutoCommit(false);
	      
	      stmt = conn.createStatement();
	      
	      //Se invoca el m�todo getRecords, el cual genera un vector de registros
	      //con los datos recibidos del cliente, del tama�o que se indique en el
	      //par�metro del m�todo
	      Vector vRecords = opServices.getRecords(139);
	      
          //Leemos el(los) registro(s)
          for(i=0; i<vRecords.size();i++) {
            
             //Se obtiene del vector el registro
             szRegistro = (String) vRecords.elementAt(i);
             szCodTarea   = szRegistro.substring(0,29).trim();
             szCodGrupo   = szRegistro.substring(30,41).trim();
             szCodSistema = szRegistro.substring(42,61).trim();
             szCodEmpresa = szRegistro.substring(62,81).trim();
             szTipoTarea  = szRegistro.substring(82,86).trim();
             szEmpGen     = szRegistro.substring(87,106).trim();
             szSisGen     = szRegistro.substring(107,126).trim();
             szUsuGen     = szRegistro.substring(127,138).trim();
       
             
  	         szSQL = "INSERT INTO OYE_AGE_TAREA_GRUPO ";
	         szSQL = szSQL + "(cod_tarea, cod_grupo, cod_sistema, cod_empresa, tipo_tarea, empresa_generadora, sistema_generador, usuario_generador,fecha_generacion,hora_generacion) VALUES";
	         szSQL = szSQL + "('"+ szCodTarea +"','"+ szCodGrupo +"','"+ szCodSistema +"','"+ szCodEmpresa +"','"+ szTipoTarea +"','"+ szEmpGen +"','"+ szSisGen +"','"+ szUsuGen +"',SYSDATE,SYSDATE)";
	         stmt.addBatch(szSQL);
	         opServices.writeDebFile("Registro["+i+"]: " + szRegistro);
	      }
	      stmt.executeBatch();
	      conn.commit();
	      conn.close();
	      opServices.setDataSend("("+i+") Registro(s) insertado(s)");
          opServices.setReturnCode(00000000);
          
          return;
	   }
	   catch (Exception e)
	   {
	      // En caso de alguna excepci�n no controlada, debemos cerrar la 
	      // conexi�n a la base de datos, en caso de que hubiese sido abierta
	      System.out.println("EXCEPCION: " + e.getMessage());
	      if (conn != null) {
	         conn.rollback();
	         conn.close();
	      }
   	      // Importante: Se recomienda no quedarse con la excepci�n, lo ideal
	      // es reenviarla al servidor, de manera de que este a su vez la trate
	      // y la env�e al cliente
	      throw e;
	   }
    }
    
    // La funci�n FNMODREC modifica n registros de una Base de Datos Oracle.
    // Funcionalidad: modifica el usuario generador de la tarea
    //
    // Registro(s) de entrada:
    //        CAMPO               Tama�o
    //    - cod_tarea           :   30
    //    - usuario_generador   :   12
    //
    // Tama�o del Registro: 42
    
    public void FNMODREC(OplFunServices opServices) throws Exception
    {
       Connection conn = null; 
       
       // Con la finalidad de poder devolver al cliente cualquier excepci�n que se pueda producir
       // durante la ejecuci�n de la funci�n, se aconseja desarrollar la funci�n dentro de una
       // �nica sentencia try ... catch,
       try {

	      Statement stmt;
  	      
	      String szCodTarea, szCodGrupo, szCodSistema, szCodEmpresa;
          String szTipoTarea, szEmpGen, szSisGen, szUsuGen;
          String szRegistro, szSQL;
          int i;
          
          String  cadenaConexion="jdbc:oracle:oci8:@AGENDA_ENTDES_DESARROLLO_V8";
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      conn = DriverManager.getConnection(cadenaConexion,"agend001","agend001");
	      if (conn.getAutoCommit())
	         conn.setAutoCommit(false);

	      //Se invoca el m�todo getRecords, el cual genera un vector de registros
	      //con los datos recibidos del cliente, del tama�o que se indique en el
	      //par�metro del m�todo
	      Vector vRecords = opServices.getRecords(42);
       
	      stmt = conn.createStatement();
          
          //Leemos el(los) registro(s)
          for(i=0; i<vRecords.size();i++) {
            
             //Se obtiene del vector el registro
             szRegistro = (String) vRecords.elementAt(i);
             szCodTarea   = szRegistro.substring(0,29).trim();
             szUsuGen     = szRegistro.substring(30,41).trim();
       
             szSQL = "UPDATE OYE_AGE_TAREA_GRUPO SET ";
	         szSQL = szSQL + " usuario_generador='"+szUsuGen+"' WHERE tipo_tarea ='OPL1' AND cod_tarea='"+szCodTarea+"' AND cod_grupo='GROPL1' AND cod_sistema='OPLINK1' AND cod_empresa='EMPOPL1'";
   	         stmt.addBatch(szSQL);
	      }
	      stmt.executeBatch();
	      conn.commit();
	      conn.close();
	      opServices.setDataSend("("+ i + ") Registro(s) modificados(s)");
          opServices.setReturnCode(00000000);
          
          return;
	   }
	   catch (Exception e)
	   {
	      // En caso de alguna excepci�n no controlada, debemos cerrar la 
	      // conexi�n a la base de datos, en caso de que hubiese sido abierta
	      if (conn != null) {
	         conn.rollback();
	         conn.close();
	      }
   	      // Importante: Se recomienda no quedarse con la excepci�n, lo ideal
	      // es reenviarla al servidor, de manera de que este a su vez la trate
	      // y la env�e al cliente
	      throw e;
	   }
       
    }

    // La funci�n FNDELREC elimina los n registros de una Base de Datos Oracle
    // que vienen en los datos de ida.
    // Funcionalidad: elimina la(s) tarea(s) que vienen con los datos
    //
    // Registro(s) de entrada:
    //        CAMPO               Tama�o
    //    - cod_tarea           :   30
    //
    // Tama�o del Registro: 30

    public void FNDELREC(OplFunServices opServices) throws Exception
    {
       Connection conn = null; 
       
       // Con la finalidad de poder devolver al cliente cualquier excepci�n que se pueda producir
       // durante la ejecuci�n de la funci�n, se aconseja desarrollar la funci�n dentro de una
       // �nica sentencia try ... catch,
       try {

	      Statement stmt;
  	
          String szCodTarea;
          String szRegistro, szSQL;
          int i;
	      
	      String  cadenaConexion="jdbc:oracle:oci8:@AGENDA_ENTDES_DESARROLLO_V8";
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      conn = DriverManager.getConnection(cadenaConexion,"agend001","agend001");
	      if (conn.getAutoCommit())
	         conn.setAutoCommit(false);
	      
	      //Se invoca el m�todo getRecords, el cual genera un vector de registros
	      //con los datos recibidos del cliente, del tama�o que se indique en el
	      //par�metro del m�todo
	      Vector vRecords = opServices.getRecords(30);

   	      stmt = conn.createStatement();
           
          //Leemos el(los) registro(s)
          for(i=0; i<vRecords.size();i++) {
            
             //Se obtiene del vector el registro
             szRegistro = (String) vRecords.elementAt(i);
             szCodTarea   = szRegistro.substring(0,29).trim();
          
             szSQL = "DELETE FROM OYE_AGE_TAREA_GRUPO WHERE ";
	         szSQL = szSQL + " tipo_tarea ='OPL1' AND cod_tarea='"+szCodTarea+"' AND cod_grupo='GROPL1' AND cod_sistema='OPLINK1' AND cod_empresa='EMPOPL1'";
   	         stmt.addBatch(szSQL);
	      }
	      stmt.executeBatch();
	      conn.commit();
	      conn.close();
	      
	      opServices.setDataSend("("+ i + ") Registro(s) borrados(s)");
          opServices.setReturnCode(00000000);
          
          return;
	   }
	   catch (Exception e)
	   {
	      // En caso de alguna excepci�n no controlada, debemos cerrar la 
	      // conexi�n a la base de datos, en caso de que hubiese sido abierta
	      if (conn != null) {
	         conn.rollback();
	         conn.close();
	      }
   	      // Importante: Se recomienda no quedarse con la excepci�n, lo ideal
	      // es reenviarla al servidor, de manera de que este a su vez la trate
	      // y la env�e al cliente
	      throw e;
	   }
    }
}


