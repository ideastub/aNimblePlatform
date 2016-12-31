<%@ page import="com.nimble.domain.security.ApplicationSetting;com.nimble.utils.view.ViewHelper" %>
<g:set var="viewHelper" value="${request.viewHelper}" scope="request" />
<g:set var="entityName" value="${message(code: 'applicationSetting.label', default: 'ApplicationSetting')}" />

        <div class="body" style="width:95%;float:left;">
<%        
	request.viewHelper.setSectionTitle('Application Setting Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))        
%>
        <div class="nav">

<% println(g.include(view:'/applicationSetting/navigation.gsp', params:params)) %>

        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationSetting.setting_ref.label" default="Setting Name" /></td>
                            
                            <td valign="top" class="value">${applicationSettingInstance?.setting_ref}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationSetting.value_date.label" default="Setting Value" /></td>
                            
                            <td valign="top" class="value">${applicationSettingInstance.displayValue()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationSetting.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${applicationSettingInstance?.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationSetting.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${applicationSettingInstance?.create_user}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationSetting.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${applicationSettingInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationSetting.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${applicationSettingInstance?.update_user}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>

        </div>
