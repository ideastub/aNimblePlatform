<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>
        <g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request" />
        
<%
	request.viewHelper.includeView = "/artifact/edit_inc.gsp"
	request.viewHelper.includeParams=[project_id:params.project_id] 
%>

<g:render template="/layouts/nimble_main" />     
