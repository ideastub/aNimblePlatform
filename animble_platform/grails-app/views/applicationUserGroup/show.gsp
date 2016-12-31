
<%@ page import="com.nimble.domain.security.ApplicationUserGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationUserGroupInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.active_ind.label" default="Activeind" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${applicationUserGroupInstance?.active_ind}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.create_user.label" default="Createuser" /></td>
                            
                            <td valign="top" class="value"><g:link controller="applicationUser" action="show" id="${applicationUserGroupInstance?.create_user?.id}">${applicationUserGroupInstance?.create_user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${applicationUserGroupInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationUserGroupInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.lastUpdate.label" default="Last Update" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${applicationUserGroupInstance?.lastUpdate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.update_user.label" default="Updateuser" /></td>
                            
                            <td valign="top" class="value"><g:link controller="applicationUser" action="show" id="${applicationUserGroupInstance?.update_user?.id}">${applicationUserGroupInstance?.update_user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.user.label" default="User" /></td>
                            
                            <td valign="top" class="value"><g:link controller="applicationUser" action="show" id="${applicationUserGroupInstance?.user?.id}">${applicationUserGroupInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUserGroup.user_group_ref.label" default="Usergroupref" /></td>
                            
                            <td valign="top" class="value"><g:link controller="userGroupReference" action="show" id="${applicationUserGroupInstance?.user_group_ref?.id}">${applicationUserGroupInstance?.user_group_ref?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${applicationUserGroupInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
