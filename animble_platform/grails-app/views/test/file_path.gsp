${grailsApplication.metadata['app.name']}<br><br>

${grailsApplication.metadata}<br><br>

<%
println new File("test").absolutePath
%><br><br>

<%
println new java.io.File("../search-index/test").canonicalPath
%><br><br>


<%

println grailsApplication.config.searchable.compassConnection
println "<br><br>"

grailsApplication.config.each(){
//	println "${it}<br>"
}

%>

