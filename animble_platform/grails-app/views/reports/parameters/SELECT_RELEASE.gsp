<%@ page import="com.nimble.domain.report.Report;com.nimble.utils.domain.report.ReportHelper;com.nimble.utils.domain.view.*;com.nimble.utils.view.SelectListTransport;com.nimble.domain.release.*;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<g:select name="${params.reportParamName}" id="${params.reportParamName}" from="${ReleaseQuery.getReleasesSelectList(viewHelper.getProjectId())}" optionKey="id"/>