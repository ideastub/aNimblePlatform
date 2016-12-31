<%@ page import="com.nimble.domain.project.Project;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.project.*;" %>

<g:set var="viewHelper" value="${new ViewHelper()}" scope="request"/>
<% 
	request.viewHelper.includeParams=[project_id:params.project_id]
	request.viewHelper.nimbleDomain = releaseInstance
%>

<% println(g.include(view:'/release/show_inc.gsp')) %>