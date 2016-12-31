<%@ page import="com.nimble.domain.report.ReportParameter;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'reportParameter.label', default: 'ReportParameter')}" />
<g:set var="viewHelper" value="${request.viewHelper}" scope="request" />


        <div class="body" style="width:95%;">
<%        
	request.viewHelper.setSectionTitle('Update Report Parameter')
	println(g.include(view:'/layouts/header_block.gsp', params:params))        
%>


        <div class="nav">

<% println(g.include(view:'/reportParameter/navigation.gsp', params:params)) %>

        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reportParameterInstance}">
            <div class="errors">
                <g:renderErrors bean="${reportParameterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="myform" id="${reportParameterInstance?.id}" action="update">
                <g:hiddenField name="id" value="${reportParameterInstance?.id}" />
                <g:hiddenField name="version" value="${reportParameterInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reportParamName"><g:message code="reportParameter.reportParamName.label" default="Parameter Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportParameterInstance, field: 'reportParamName', 'errors')}">
                                    <g:textField name="reportParamName" value="${reportParameterInstance?.reportParamName}" />
                                </td>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="display"><g:message code="reportParameter.display.label" default="Display" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportParameterInstance, field: 'display', 'errors')}">
                                    <g:textField name="display" value="${reportParameterInstance?.display}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="reportParameter.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportParameterInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${reportParameterInstance?.description}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="report"><g:message code="reportParameter.report.label" default="Report" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportParameterInstance, field: 'report', 'errors')}">
                                    <g:select name="report.id" from="${com.nimble.domain.report.Report.list()}" optionKey="id" value="${reportParameterInstance?.report?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="param_type_ref"><g:message code="reportParameter.param_type_ref.label" default="Parameter Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportParameterInstance, field: 'param_type_ref', 'errors')}">
                                    <g:select name="param_type_ref.id" from="${com.nimble.domain.report.ReportParamTypeReference.list()}" optionKey="id" value="${reportParameterInstance?.param_type_ref?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="x_display_sequence"><g:message code="reportParameter.x_display_sequence.label" default="X Display Sequence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportParameterInstance, field: 'x_display_sequence', 'errors')}">
                                    <g:textField name="x_display_sequence" value="${fieldValue(bean: reportParameterInstance, field: 'x_display_sequence')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="y_display_sequence"><g:message code="reportParameter.y_display_sequence.label" default="Y Display Sequence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportParameterInstance, field: 'y_display_sequence', 'errors')}">
                                    <g:textField name="y_display_sequence" value="${fieldValue(bean: reportParameterInstance, field: 'y_display_sequence')}" />
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </g:form>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %> 
        </div>
