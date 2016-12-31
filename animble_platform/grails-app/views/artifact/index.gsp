<%@ page import="com.nimble.domain.project.Project; com.nimble.controller.project.ProjectController; com.nimble.controller.artifact.ArtifactController; com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>
        <g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request" />
        <g:set var="refHelper" value="${new ReferenceHelper(application)}" scope="request" />        

<%
	request.viewHelper.includeController = "artifact"
	request.viewHelper.includeAction="landing"
	request.viewHelper.includeId=artifactInstance.id
	request.viewHelper.includeParams=[parent_id:params.parent_id,tab:params.tab] 
%>

<g:render template="/layouts/nimble_main" />

<script language="JavaScript" someProperty="text/javascript">
setBreadCrumbs('Project Home','project/index/${artifactInstance.project.id}');
addToBreadCrumbs('${artifactInstance.artifact_name}','artifact/index/${artifactInstance.id}');
</script>