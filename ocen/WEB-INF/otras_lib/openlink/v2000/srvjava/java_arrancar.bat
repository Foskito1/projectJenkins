set CLASSPATH=C:\jdk1.3.1_04\lib\tools.jar;c:\jdk1.3.1_04\jre\lib\rt.jar;c:\jdk1.3.1_04\jre\lib\i18n.jar
set PROP_PATH=c:\projects_new\server\properties
set OCEN_PATH=c:\projects_new\server\classes\jar\ocenbdi.jar;c:\projects_new\server\classes\jar\ocencmb.jar;c:\projects_new\server\classes\jar\ocendomain.jar;c:\projects_new\server\classes\jar\ocenman.jar;c:\projects_new\server\classes\jar\ocenope.jar;c:\projects_new\server\classes\jar\ocensap.jar;c:\projects_new\server\classes\jar\ocenutil.jar
set OPLINK_PATH=c:\projects_new\server\openlink\v2000\clases;c:\projects_new\server\rojuef\servlet;c:\projects_new\server\rojuef
set DESAR_PATH=C:\win32app\jakarta-tomcat-3.2.4\webapps\desar\WEB-INF\classes;C:\win32app\jakarta-tomcat-3.2.4\classes\properties_desar;.;c:\projects_new\server\properties
set ARQV10_PATH=c:\projects_new\server\jarv10;c:\projects_new\server\jarv10\activation.jar;c:\projects_new\server\jarv10\jndi.jar;c:\projects_new\server\jarv10\isfv10.jar;c:\projects_new\server\jarv10\isfv10-owf.jar;c:\projects_new\server\jarv10\mail.jar;c:\projects_new\server\jarv10\metakernel.jar;c:\projects_new\server\jarv10\v10PoolMon.jar;c:\projects_new\server\jarv10\classes12.zip
set J2EE_PATH=C:\win32app\jakarta-tomcat-3.2.4\lib\crimson.jar;C:\win32app\jakarta-tomcat-3.2.4\lib\jasper.jar;C:\win32app\jakarta-tomcat-3.2.4\lib\jaxp.jar;C:\win32app\jakarta-tomcat-3.2.4\lib\servlet.jar;C:\win32app\jakarta-tomcat-3.2.4\lib\webserver.jar
set CLASSPATH=%DESAR_PATH%;%PROP_PATH%;%ARQV10_PATH%;%OPLINK_PATH%;%OCEN_PATH%;%J2EE_PATH%;%CLASSPATH%

set OPENLINK_HOME=C:\projects_new\server\openlink\v2000
set OPENLINK_TMP=C:\projects_new\server\openlink\v2000\tmp
set
java OplJavaServer
pause