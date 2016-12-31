<%@ page import="com.nimble.domain.report.Report;com.nimble.utils.view.ViewHelper" %>
<g:set var="viewHelper" value="${request.viewHelper}" scope="request" />
<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
       

        <div class="body" style="width:95%;">
<%        
	request.viewHelper.setSectionTitle('Report Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))        
%>

        <div class="nav">

<% println(g.include(view:'/report/navigation.gsp', params:params)) %>

        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.display.label" default="Display" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportInstance, field: "display")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportInstance, field: "description")}</td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.file_name.label" default="File Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportInstance, field: "file_name")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.report_location_ref.label" default="Report Location" /></td>
                            
                            <td valign="top" class="value">${reportInstance.report_location_ref.display}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.report_language_ref.label" default="Report Language" /></td>
                            
                            <td valign="top" class="value">${reportInstance.report_language_ref.display}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.query_name.label" default="Query Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportInstance, field: "query_name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.reportParameters.label" default="Report Parameters" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${reportInstance.reportParameters}" var="r">
                                    <li>${r?.encodeAsHTML()}</li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${reportInstance?.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${reportInstance?.create_user}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${reportInstance?.lastUpdate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="report.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${reportInstance?.update_user}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
        </div>
