
<%@ page import="com.nimble.domain.report.ReportParameter" %>

        <g:set var="entityName" value="${message(code: 'reportParameter.label', default: 'ReportParameter')}" />

        <div class="body" style="width:95%;">
<%        
	request.viewHelper.setSectionTitle('Report Parameter Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))        
%>        
        
        <div class="nav">

<% println(g.include(view:'/reportParameter/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.reportParamName.label" default="Parameter Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportParameterInstance, field: "reportParamName")}</td>
                            
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.display.label" default="Display" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportParameterInstance, field: "display")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportParameterInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.param_type_ref.label" default="Parameter Type" /></td>
                            
                            <td valign="top" class="value">${reportParameterInstance?.param_type_ref?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.report.label" default="Report" /></td>
                            
                            <td valign="top" class="value">${reportParameterInstance?.report?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.x_display_sequence.label" default="X Display Sequence" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportParameterInstance, field: "x_display_sequence")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.y_display_sequence.label" default="Y Display Sequence" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: reportParameterInstance, field: "y_display_sequence")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${reportParameterInstance?.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${reportParameterInstance?.create_user}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${reportParameterInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reportParameter.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${reportParameterInstance?.update_user}</td>
                            
                        </tr>
                   
                    </tbody>
                </table>
            </div>
            
            
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
        </div>