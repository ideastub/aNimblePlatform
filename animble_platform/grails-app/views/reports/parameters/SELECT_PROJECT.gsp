<%@ page import="com.nimble.domain.report.Report;com.nimble.utils.domain.report.ReportHelper;com.nimble.utils.view.*;com.nimble.utils.view.SelectListTransport;com.nimble.domain.project.*;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<g:select name="${params.reportParamName}" id="${params.reportParamName}" from="${ProjectQuery.getProjectsSelectList()}" optionKey="id"/>