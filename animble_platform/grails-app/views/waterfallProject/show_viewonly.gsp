<%@ page import="com.nimble.domain.project.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>

<g:set var="viewHelper" value="${new ViewHelper(projectInstance)}" scope="request"/>

<%
	println(g.include(view:'/project/show_inc.gsp'))
	
%>