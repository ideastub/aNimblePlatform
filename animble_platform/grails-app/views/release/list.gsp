<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.project.Project; com.nimble.controller.release.ReleaseController;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<%
					println(g.include(view:'/release/list_landing.gsp', params:params))
%>