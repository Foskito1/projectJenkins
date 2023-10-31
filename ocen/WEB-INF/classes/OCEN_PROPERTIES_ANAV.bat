@echo off
copy C:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\OCEN.PROPERTIES\ocen.properties_ANAV.xml ocen.properties.xml*
attrib -r C:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\ocen.properties.xml
copy kernel.properties.xml C:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\
@echo on