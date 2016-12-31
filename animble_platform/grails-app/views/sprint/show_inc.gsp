<%@ page import="com.nimble.domain.sprint.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" scope="request"/>
<g:set var="refHelper" value="${new ReferenceHelper(application)}" />        
<g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}" />

        <div class="body" style="width:100%;">

       
        <div class="nav">

<% println(g.include(view:'/sprint/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="width:100%;">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.sprintName.label" default="Sprint Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sprintInstance, field: "sprintName")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.sprintCode.label" default="Sprint Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sprintInstance, field: "sprintNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.sprintStartDate.label" default="Sprint Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${sprintInstance?.sprintStartDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.sprintEndDate.label" default="Sprint End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${sprintInstance?.sprintEndDate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.status.label" default="Sprint Status" /></td>
                            
                            <td valign="top" class="value">${sprintInstance?.sprint_status_ref}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${sprintInstance?.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${sprintInstance?.create_user}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${sprintInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sprint.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${sprintInstance?.update_user}</td>
                            
                        </tr>
             
                    </tbody>
                </table>
            </div>
    
        </div>     
        