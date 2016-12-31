<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>

currentArtifactId1=${params}<br>

<% println(g.include(view:'/artifact/show_inc.gsp')) %>