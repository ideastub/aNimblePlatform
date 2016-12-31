<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />
        
<%
	request.viewHelper.includeView = "/dashboard/landing.gsp"
%>

<g:render template="/layouts/nimble_main" />  