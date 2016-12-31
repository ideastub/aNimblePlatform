<%@ page import="com.nimble.domain.project.Project;com.nimble.utils.view.ViewHelper;com.nimble.utils.domain.ReferenceHelper;com.nimble.domain.reference.*;" %>
<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />
<g:set var="projectInstance" value="${request.viewHelper.project}" />
<g:set var="refHelper" value="${new ReferenceHelper(application)}" />

        <div class="body" style="float:left;">
<%
request.viewHelper.setSectionTitle('Update Project')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${projectInstance}">
            <div class="errors">
                <g:renderErrors bean="${projectInstance}" as="list" />
            </div>
            </g:hasErrors>

        <div class="nav">
<% println(g.include(view:'/project/navigation.gsp', params:params)) %>

        </div>

            <g:form method="post" name="myform" id="${projectInstance?.id}" action="update"  controller="${viewHelper.getControllerName(projectInstance)}">
                <g:hiddenField name="id" value="${projectInstance?.id}" />
                
                
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="projectName"><g:message code="project.projectName.label" default="Project Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'projectName', 'errors')}">
                                    <g:textField name="projectName" value="${projectInstance?.projectName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="projectCode"><g:message code="project.projectCode.label" default="Project Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'projectCode', 'errors')}">
                                    <g:textField name="projectCode" value="${projectInstance?.projectCode}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="projectStartDate"><g:message code="project.projectStartDate.label" default="Project Start Date" />
                                  </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'projectStartDate', 'errors')}">
                                    <input id="projectStartDate" name="projectStartDate" type="text" class="DatePicker" alt="{format:'yyyy-MM-dd 00:00:00.0'}" tabindex="1" value="${viewHelper.formateDate(projectInstance?.projectStartDate)}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="projectEndDate"><g:message code="project.projectEndDate.label" default="Project End Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'projectEndDate', 'errors')}">
                                    <input id="projectEndDate" name="projectEndDate" type="text" class="DatePicker" alt="{format:'yyyy-MM-dd 00:00:00.0'}" tabindex="1" value="${viewHelper.formateDate(projectInstance?.projectEndDate)}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="project_status_ref"><g:message code="project.project_status_ref.label" default="Project Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'project_status_ref', 'errors')}">
                                <g:select name="project_status_ref.id" from="${refHelper.getRefDataForCreateSelect(ProjectStatusReference)}" optionKey="id" value="${projectInstance?.project_status_ref?.id}"  />
                                </td>
                            </tr>   
                        
                        </tbody>
                    </table>
                </div>
            </g:form>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
        </div>
