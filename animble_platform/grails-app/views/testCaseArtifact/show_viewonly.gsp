<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>

<g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request"/>

<%
	request.viewHelper.includeParams=[parent_id:params.parent_id] 

	println(g.include(view:'/artifact/show_inc.gsp'))
	
%>