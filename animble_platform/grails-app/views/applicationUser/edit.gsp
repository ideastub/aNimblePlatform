<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.security.ApplicationUser;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<%
	request.viewHelper.includeController = "applicationUser"
	request.viewHelper.includeAction="edit_inc"
	request.viewHelper.includeParams=params
%>

<g:render template="/layouts/nimble_main" />

<script language="JavaScript" someProperty="text/javascript">
setBreadCrumbs('Administration','administration');
addToBreadCrumbs('Users','applicationUser');
</script>