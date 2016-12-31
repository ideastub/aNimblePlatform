<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.artifact.*; com.nimble.controller.artifact.*;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />
<% 
request.viewHelper.projectId = params.id
//request.viewHelper.includeParams=[project_id:params.project_id] 
request.viewHelper.projectType = params.projectType
request.viewHelper.includeParams = params
%>

<%
					println(g.include(view:'/artifact/list_landing.gsp', params:params))
%>