<%@ page import="com.nimble.utils.view.ViewHelper" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<%
	request.viewHelper.includeView = "/error_inc.gsp"
%>

<g:render template="/layouts/nimble_main" />