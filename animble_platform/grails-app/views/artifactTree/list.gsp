<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.artifact.*; com.nimble.controller.artifact.*;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<% 
request.viewHelper.includeParams=[artifact_id:params.artifact_id] 
%>

<%
					println(g.include(view:'/artifactTree/list_landing.gsp', params:params))
%>