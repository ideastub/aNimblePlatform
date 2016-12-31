<%@ page import="com.nimble.domain.report.Report;com.nimble.utils.view.ViewHelper" %>
<g:set var="viewHelper" value="${request.viewHelper}" scope="request" />
<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />


        <div class="body" style="width:95%;">
<%
request.viewHelper.setSectionTitle('Add Report')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>        


        <div class="nav">

<% println(g.include(view:'/report/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${reportInstance}">
            <div class="errors">
                <g:renderErrors bean="${reportInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="myform" action="save">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="display"><g:message code="report.display.label" default="Display" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'display', 'errors')}">
                                    <g:textField name="display" value="${reportInstance?.display}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="report.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${reportInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="file_name"><g:message code="report.file_name.label" default="File Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'file_name', 'errors')}">
                                    <g:textField name="file_name" value="${reportInstance?.file_name}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="report_location_ref"><g:message code="report.report_location_ref.label" default="Report Location" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'report_location_ref', 'errors')}">
                                    <g:select name="report_location_ref.id" from="${com.nimble.domain.report.ReportLocationReference.list(sort:'display_sequence', order:'asc')}" optionKey="id" value="${reportInstance?.report_location_ref?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="report_language_ref"><g:message code="report.report_language_ref.label" default="Report Language" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'report_language_ref', 'errors')}">
                                    <g:select name="report_language_ref.id" from="${com.nimble.domain.report.ReportLanguageReference.list()}" optionKey="id" value="${reportInstance?.report_language_ref?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="query_name"><g:message code="report.query_name.label" default="Query Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: reportInstance, field: 'query_name', 'errors')}">
                                    <g:textField name="query_name" value="${reportInstance?.query_name}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>  
        </div>
