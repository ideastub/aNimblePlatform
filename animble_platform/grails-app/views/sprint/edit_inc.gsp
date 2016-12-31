<%@ page import="com.nimble.domain.project.Project;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.domain.reference.*;" %>
<g:set var="entityName" value="${message(code: 'sprint.label', default: 'Sprint')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />
<g:set var="sprintInstance" value="${request.viewHelper.nimbleDomain}" />
<g:set var="refHelper" value="${new ReferenceHelper(application)}" />  

        <div class="body" style="float:left;">
<%
request.viewHelper.setSectionTitle('Update Sprint')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sprintInstance}">
            <div class="errors">
                <g:renderErrors bean="${sprintInstance}" as="list" />
            </div>
            </g:hasErrors>

        <div class="nav">
<% println(g.include(view:'/sprint/navigation.gsp', params:params)) %>

        </div>

            <g:form method="post" name="myform" id="${sprintInstance?.id}" action="update"  controller="${viewHelper.getControllerName(sprintInstance)}">
                <g:hiddenField name="id" value="${sprintInstance?.id}" />
                
                
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sprintName"><g:message code="sprint.sprintName.label" default="Sprint Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sprintInstance, field: 'sprintName', 'errors')}">
                                    <g:textField name="sprintName" value="${sprintInstance?.sprintName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sprintNumber"><g:message code="sprint.sprintNumber.label" default="Sprint Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sprintInstance, field: 'sprintNumber', 'errors')}">
                                    <g:textField name="sprintNumber" value="${sprintInstance?.sprintNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sprintStartDate"><g:message code="sprint.sprintStartDate.label" default="Sprint Start Date" />
                                  </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sprintInstance, field: 'sprintStartDate', 'errors')}">
                                    <input id="sprintStartDate" name="sprintStartDate" type="text" class="DatePicker" alt="{format:'yyyy-MM-dd 00:00:00.0'}" tabindex="1" value="${viewHelper.formateDate(sprintInstance?.sprintStartDate)}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sprintEndDate"><g:message code="sprint.sprintEndDate.label" default="Sprint End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sprintInstance, field: 'sprintEndDate', 'errors')}">
                                    <input id="sprintEndDate" name="sprintEndDate" type="text" class="DatePicker" alt="{format:'yyyy-MM-dd 00:00:00.0'}" tabindex="1" value="${viewHelper.formateDate(sprintInstance?.sprintEndDate)}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sprint_status_ref"><g:message code="sprint.sprint_status_ref.label" default="Sprint Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sprintInstance, field: 'sprint_status_ref', 'errors')}">
                                <g:select name="sprint_status_ref.id" from="${refHelper.getRefDataForCreateSelect(SprintStatusReference)}" optionKey="id" value="${sprintInstance?.sprint_status_ref?.id}"  />
                                </td>
                            </tr>   
                        
                        </tbody>
                    </table>
                </div>
            </g:form>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
        </div>
