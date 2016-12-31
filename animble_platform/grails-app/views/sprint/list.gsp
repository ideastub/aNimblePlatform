<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.project.Project; com.nimble.controller.release.SprintController;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />
<% request.viewHelper.projectId = params.id %>

<%
					println(g.include(view:'/sprint/list_landing.gsp', params:params))
%>