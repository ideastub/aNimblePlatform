<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.report.Report; com.nimble.controller.report.ReportsController;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

<%
request.viewHelper.includeParams=[location:params.location]

println(g.include(view:'/reports/landing.gsp', params:params))
%>