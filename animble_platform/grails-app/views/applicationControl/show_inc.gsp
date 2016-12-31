<%@ page import="com.nimble.domain.view.ApplicationControl;com.nimble.utils.view.ViewHelper" %>
<g:set var="viewHelper" value="${request.viewHelper}" scope="request" />
<g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />

        <div class="body" style="width:95%;float:left;">
<%        
	request.viewHelper.setSectionTitle('Field Control Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))        
%>

        <div class="nav">

		<% println(g.include(view:'/applicationControl/navigation.gsp', params:params)) %>   
		
        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.control.label" default="Control" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationControlInstance, field: "control")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.control_text.label" default="Control Label" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationControlInstance, field: "control_text")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.control_description.label" default="Control Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationControlInstance, field: "control_description")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.display_sequence.label" default="Display Sequence" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationControlInstance, field: "display_sequence")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.default_value.label" default="Default Value" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationControlInstance, field: "default_value")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.unit_height.label" default="Unit Height" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationControlInstance, field: "unit_height")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.unit_width.label" default="Unit Width" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationControlInstance, field: "unit_width")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.visible_ind.label" default="Is Visible" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${applicationControlInstance?.visible_ind}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${applicationControlInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${applicationControlInstance?.create_user}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${applicationControlInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationControl.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${applicationControlInstance?.update_user}</td>
                            
                        </tr>


                    
                    
                    </tbody>
                </table>
            </div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>            
         </div>
