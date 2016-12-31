call set_anp_env.bat
grails -DXms=2048m -DXmx=2048m -DXX:PermSize=1024m -DXX:MaxPermSize=1024m -Dserver.host=localhost -Dserver.port=8080 -server dev run-app