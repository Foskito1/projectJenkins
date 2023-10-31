@echo off
copy D:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\KERNEL.PROPERTIES\kernel.properties_PRODUCCION_RNV.xml kernel.properties.xml*
attrib -r D:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\kernel.properties.xml
copy kernel.properties.xml D:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\
@echo on