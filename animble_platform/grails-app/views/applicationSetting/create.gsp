
<%@ page import="com.nimble.domain.security.ApplicationSetting" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'applicationSetting.label', default: 'ApplicationSetting')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${applicationSettingInstance}">
            <div class="errors">
                <g:renderErrors bean="${applicationSettingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="setting_ref"><g:message code="applicationSetting.setting_ref.label" default="Settingref" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'setting_ref', 'errors')}">
                                    <g:select name="setting_ref.id" from="${com.nimble.domain.reference.ApplicationSettingReference.list()}" optionKey="id" value="${applicationSettingInstance?.setting_ref?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data_type_ref"><g:message code="applicationSetting.data_type_ref.label" default="Datatyperef" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'data_type_ref', 'errors')}">
                                    <g:select name="data_type_ref.id" from="${com.nimble.domain.reference.DatabaseDataTypeReference.list()}" optionKey="id" value="${applicationSettingInstance?.data_type_ref?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value_date"><g:message code="applicationSetting.value_date.label" default="Valuedate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'value_date', 'errors')}">
                                    <g:datePicker name="value_date" precision="day" value="${applicationSettingInstance?.value_date}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value_double"><g:message code="applicationSetting.value_double.label" default="Valuedouble" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'value_double', 'errors')}">
                                    <g:textField name="value_double" value="${fieldValue(bean: applicationSettingInstance, field: 'value_double')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value_int"><g:message code="applicationSetting.value_int.label" default="Valueint" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'value_int', 'errors')}">
                                    <g:checkBox name="value_int" value="${applicationSettingInstance?.value_int}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="value_string"><g:message code="applicationSetting.value_string.label" default="Valuestring" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'value_string', 'errors')}">
                                    <g:textField name="value_string" value="${applicationSettingInstance?.value_string}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="update_user"><g:message code="applicationSetting.update_user.label" default="Updateuser" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'update_user', 'errors')}">
                                    <g:select name="update_user.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${applicationSettingInstance?.update_user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated"><g:message code="applicationSetting.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${applicationSettingInstance?.dateCreated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="create_user"><g:message code="applicationSetting.create_user.label" default="Createuser" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'create_user', 'errors')}">
                                    <g:select name="create_user.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${applicationSettingInstance?.create_user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active_ind"><g:message code="applicationSetting.active_ind.label" default="Activeind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'active_ind', 'errors')}">
                                    <g:checkBox name="active_ind" value="${applicationSettingInstance?.active_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdate"><g:message code="applicationSetting.lastUpdate.label" default="Last Update" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'lastUpdate', 'errors')}">
                                    <g:datePicker name="lastUpdate" precision="day" value="${applicationSettingInstance?.lastUpdate}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
