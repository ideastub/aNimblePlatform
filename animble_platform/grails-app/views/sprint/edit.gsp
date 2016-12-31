<%@ page import="com.nimble.domain.release.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<%
	request.viewHelper.nimbleDomain = sprintInstance
	request.viewHelper.projectId = project_id
	request.viewHelper.includeView = "/sprint/edit_inc.gsp"
	request.viewHelper.includeParams=[project_id:sprintInstance.agileProject.id]
%>

<g:render template="/layouts/nimble_main" />     
