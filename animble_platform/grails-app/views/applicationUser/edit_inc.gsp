<%@ page import="com.nimble.domain.security.ApplicationUser;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'applicationUser.label', default: 'ApplicationUser')}" />
<g:set var="viewHelper" value="${request.viewHelper}" scope="request" />

        <div class="body" style="width:95%;">
<%        
	request.viewHelper.setSectionTitle('Update User')
	println(g.include(view:'/layouts/header_block.gsp', params:params))        
%>
        
        <div class="nav">

<% println(g.include(view:'/applicationUser/navigation.gsp', params:params)) %>

        </div>
        
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${applicationUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${applicationUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="myform" id="${applicationUserInstance?.id}" action="update">            
                <g:hiddenField name="id" value="${applicationUserInstance?.id}" />
                <g:hiddenField name="version" value="${applicationUserInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="first_name"><g:message code="applicationUser.first_name.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserInstance, field: 'first_name', 'errors')}">
                                    <g:textField name="first_name" value="${applicationUserInstance?.first_name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="last_name"><g:message code="applicationUser.last_name.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserInstance, field: 'last_name', 'errors')}">
                                    <g:textField name="last_name" value="${applicationUserInstance?.last_name}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="username"><g:message code="applicationUser.username.label" default="User Login" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${applicationUserInstance?.username}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="applicationUser.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${applicationUserInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="applicationUser.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${applicationUserInstance?.password}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="roles"><g:message code="applicationUser.roles.label" default="Roles" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserInstance, field: 'applicationRoles', 'errors')}">
                                    <g:select name="appRoles" from="${com.nimble.domain.security.ApplicationRole.findAll()}" multiple="true"
                                     value="${applicationRolesInstance?.collect{it.toLong()}}" optionKey="id"/> 
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enabled"><g:message code="applicationUser.enabled.label" default="Is Active" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationUserInstance, field: 'enabled', 'errors')}">
                                    <g:checkBox name="enabled" value="${applicationUserInstance?.enabled}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %> 
        </div>
