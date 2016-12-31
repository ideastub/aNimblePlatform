<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.project.Project; com.nimble.controller.project.ProjectController;" %>
<g:set var="viewHelper" value="${new ViewHelper(projectInstance)}" scope="request" />

<%
	request.viewHelper.includeController = "project"
	request.viewHelper.includeAction="landing"
	request.viewHelper.includeId=projectInstance.id
	request.viewHelper.projectId=projectInstance.id
	request.viewHelper.includeParams=params
%>

<g:render template="/layouts/nimble_main" />

<script language="JavaScript" someProperty="text/javascript">
setBreadCrumbs('Projects','project');
</script>
