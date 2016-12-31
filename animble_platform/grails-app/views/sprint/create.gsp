<%@ page import="com.nimble.domain.project.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.project.*;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />
        
<%
	request.viewHelper.nimbleDomain = sprintInstance
	request.viewHelper.projectId = project_id
	request.viewHelper.includeView = "/sprint/create_inc.gsp"
	request.viewHelper.includeParams=[project_id:params.project_id]
%>

<g:render template="/layouts/nimble_main" />          