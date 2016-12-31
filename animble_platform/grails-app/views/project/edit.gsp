<%@ page import="com.nimble.domain.project.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper(projectInstance)}" scope="request" />
<g:set var="projectInstance" value="${request.viewHelper.projectInstance}" />

<%
	request.viewHelper.includeView = "/project/edit_inc.gsp"
%>

<g:render template="/layouts/nimble_main" />     
