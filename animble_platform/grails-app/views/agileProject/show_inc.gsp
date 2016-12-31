<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request"/>

<% println(g.include(view:'/project/show_inc.gsp')) %>