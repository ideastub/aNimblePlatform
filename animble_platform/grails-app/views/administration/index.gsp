<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<%
	request.viewHelper.includeView = "/administration/landing.gsp"
%>

<g:render template="/layouts/nimble_main" />

<script language="JavaScript" someProperty="text/javascript">
setBreadCrumbs('Administration','administration');
</script>
