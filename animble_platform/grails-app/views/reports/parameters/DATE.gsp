<%@ page import="com.nimble.domain.report.Report;com.nimble.utils.domain.report.ReportHelper;com.nimble.utils.domain.view.*;com.nimble.utils.view.SelectListTransport;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<input type="text" name="${params.reportParamName}" id="${params.reportParamName}" dojoType="dijit.form.DateTextBox"/>