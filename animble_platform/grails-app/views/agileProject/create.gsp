<%@ page import="com.nimble.domain.project.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.project.*;" %>
<g:set var="viewHelper" value="${new ViewHelper(projectInstance)}" scope="request" />
        
<%
	request.viewHelper.includeView = "/project/create_inc.gsp"
%>

<g:render template="/layouts/nimble_main" />          