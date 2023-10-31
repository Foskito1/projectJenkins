#!/bin/csh
setenv LD_LIBRARY_PATH /opt/oracle8.1/lib:/opt/oracle8.1/jdbc/lib:/opt/openlink/v2000/shlib
setenv CLASSPATH /opt/rojuef:/opt/openlink/v2000/clases:/opt/oracle8.1/jdbc/lib/classes12.zip:/opt/oracle8.1/jdbc/lib/nls_charset12.zip:.:/soflib00/uefapp:/soflib00/uefapp/sigip/clases:/soflib00/uefapp/ocl/clases:/soflib00/uefapp/asl/clases:/soflib00/user/openlink:/soflib00/uefapp/ocl/clases/javax.jar
setenv ORACLE_HOME /opt/oracle8.1
setenv OPENLINK_HOME /opt/openlink/v2000
setenv OPENLINK_TMP /soflib00/user/openlink/tmp
java OplJavaServer &
