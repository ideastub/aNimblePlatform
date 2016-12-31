

<%@ page import="com.nimble.domain.security.ApplicationUserGroup" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${applicationUserGroupInstance}">
            <div class="errors">
                <g:renderErrors bean="${applicationUserGroupInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${applicationUserGroupInstance?.id}" />
                <g:hiddenField name="version" value="${applicationUserGroupInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="active_ind"><g:message code="applicationUserGroup.active_ind.label" default="Activeind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserGroupInstance, field: 'active_ind', 'errors')}">
                                    <g:checkBox name="active_ind" value="${applicationUserGroupInstance?.active_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="create_user"><g:message code="applicationUserGroup.create_user.label" default="Createuser" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserGroupInstance, field: 'create_user', 'errors')}">
                                    <g:select name="create_user.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${applicationUserGroupInstance?.create_user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="applicationUserGroup.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserGroupInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${applicationUserGroupInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastUpdate"><g:message code="applicationUserGroup.lastUpdate.label" default="Last Update" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserGroupInstance, field: 'lastUpdate', 'errors')}">
                                    <g:datePicker name="lastUpdate" precision="day" value="${applicationUserGroupInstance?.lastUpdate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="update_user"><g:message code="applicationUserGroup.update_user.label" default="Updateuser" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserGroupInstance, field: 'update_user', 'errors')}">
                                    <g:select name="update_user.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${applicationUserGroupInstance?.update_user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="applicationUserGroup.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserGroupInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${applicationUserGroupInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user_group_ref"><g:message code="applicationUserGroup.user_group_ref.label" default="Usergroupref" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserGroupInstance, field: 'user_group_ref', 'errors')}">
                                    <g:select name="user_group_ref.id" from="${com.nimble.domain.reference.UserGroupReference.list()}" optionKey="id" value="${applicationUserGroupInstance?.user_group_ref?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
