<%@ page import="com.nimble.utils.view.ViewHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<%
	request.viewHelper.includeView = "/search/index_inc.gsp"
	request.viewHelper.includeParams=params
%>

<g:render template="/layouts/nimble_main" />    