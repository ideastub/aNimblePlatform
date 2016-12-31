<%@ page import="com.nimble.domain.release.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<%
	request.viewHelper.nimbleDomain = releaseInstance
	request.viewHelper.projectId = project_id
	request.viewHelper.includeView = "/release/edit_inc.gsp"

%>

<g:render template="/layouts/nimble_main" />     
