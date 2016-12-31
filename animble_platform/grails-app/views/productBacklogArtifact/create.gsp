<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>
         <g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request" />

       
<%
	request.viewHelper.includeView = "/artifact/create_inc.gsp"
	request.viewHelper.artifactParentId = artifactParentId
	request.viewHelper.includeParams=[project_id:params.project_id,parent_id:params.parent_id]
%>

<g:render template="/layouts/nimble_main" />          