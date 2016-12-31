<%@ page import="com.nimble.controller.project.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>
<g:set var="viewHelper" value="${new ViewHelper(projectInstance)}" scope="request" />
<g:set var="projectInstance" value="${request.viewHelper.project}" />

<% 

	request.viewHelper.includeView = "/project/edit_inc.gsp"
%>

<g:render template="/layouts/nimble_main" />          