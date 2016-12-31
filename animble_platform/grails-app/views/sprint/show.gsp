<%@ page import="com.nimble.domain.project.Project;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.project.*;" %>

<g:set var="viewHelper" value="${new ViewHelper(projectInstance)}" scope="request"/>

<% println(g.include(view:'/sprint/show_inc.gsp')) %>        