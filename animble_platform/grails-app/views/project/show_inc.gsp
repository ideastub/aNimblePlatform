<%@ page import="com.nimble.domain.project.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" scope="request"/>
<g:set var="projectInstance" value="${request.viewHelper.project}" />
<g:set var="refHelper" value="${new ReferenceHelper(application)}" />        
<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />

        <div class="body" style="float:left;">

<%

if (actionName.equals('show_viewonly')) {        
	request.viewHelper.setSectionTitle('Project Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))
}

%>
        
        <div class="nav">

<% println(g.include(view:'/project/navigation.gsp', params:params)) %>

        </div>


            <div class="dialog" style="width:100%;">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.projectName.label" default="Project Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "projectName")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.projectCode.label" default="Project Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "projectCode")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.projectStartDate.label" default="Project Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${projectInstance?.projectStartDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.projectEndDate.label" default="Project End Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${projectInstance?.projectEndDate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.project_status_ref.label" default="Project Status" /></td>
                            
                            <td valign="top" class="value">${projectInstance?.project_status_ref}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${projectInstance?.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${projectInstance?.create_user}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${projectInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${projectInstance?.update_user}</td>
                            
                        </tr>
<%--
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="project.baseLines.label" default="Base Lines" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${projectInstance.baseLines}" var="b">
                                    <li><g:link controller="baseline" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
--%>                    
                    </tbody>
                </table>
            </div>
    
<% if (actionName.equals('show_viewonly')) { %>
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
<% } %>
        </div>     
        