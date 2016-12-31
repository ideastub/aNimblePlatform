<%@ page import="com.nimble.domain.project.Project;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.project.*;" %>

<g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request"/>

<%
	request.viewHelper.includeParams=[parent_id:params.parent_id] 	
%>


<% println(g.include(view:'/artifact/show_inc.gsp')) %>