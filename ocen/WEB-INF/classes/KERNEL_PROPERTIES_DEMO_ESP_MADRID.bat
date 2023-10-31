@echo off
copy C:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\KERNEL.PROPERTIES\kernel.properties_DEMO_ESP_MADRID.xml kernel.properties.xml*
attrib -r C:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\kernel.properties.xml
copy kernel.properties.xml C:\Tomcatv6.0\webapps\ocen\WEB-INF\classes\
@echo on