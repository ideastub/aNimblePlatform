<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />
        
<%
	request.viewHelper.includeView = "/artifactTree/create_inc.gsp"
	request.viewHelper.includeParams=params
%>


<g:render template="/layouts/nimble_main" />  