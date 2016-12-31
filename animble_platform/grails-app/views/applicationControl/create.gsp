
<%@ page import="com.nimble.domain.view.ApplicationControl" %>
        <g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />
        <div class="body">
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${applicationControlInstance}">
            <div class="errors">
                <g:renderErrors bean="${applicationControlInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="control_ref"><g:message code="applicationControl.control_ref.label" default="Controlref" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'control_ref', 'errors')}">
                                    <g:select name="control_ref.id" from="${com.nimble.domain.reference.ArtifactReference.list()}" optionKey="id" value="${applicationControlInstance?.control_ref?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="control"><g:message code="applicationControl.control.label" default="Control" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'control', 'errors')}">
                                    <g:textField name="control" value="${applicationControlInstance?.control}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="update_user"><g:message code="applicationControl.update_user.label" default="Updateuser" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'update_user', 'errors')}">
                                    <g:select name="update_user.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${applicationControlInstance?.update_user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="display_sequence"><g:message code="applicationControl.display_sequence.label" default="Displaysequence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'display_sequence', 'errors')}">
                                    <g:textField name="display_sequence" value="${fieldValue(bean: applicationControlInstance, field: 'display_sequence')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="default_value"><g:message code="applicationControl.default_value.label" default="Defaultvalue" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'default_value', 'errors')}">
                                    <g:textField name="default_value" value="${applicationControlInstance?.default_value}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated"><g:message code="applicationControl.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'dateCreated', 'errors')}">
                                    <g:datePicker name="dateCreated" precision="day" value="${applicationControlInstance?.dateCreated}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unit_width"><g:message code="applicationControl.unit_width.label" default="Unitwidth" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'unit_width', 'errors')}">
                                    <g:textField name="unit_width" value="${fieldValue(bean: applicationControlInstance, field: 'unit_width')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="create_user"><g:message code="applicationControl.create_user.label" default="Createuser" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'create_user', 'errors')}">
                                    <g:select name="create_user.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${applicationControlInstance?.create_user?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="active_ind"><g:message code="applicationControl.active_ind.label" default="Activeind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'active_ind', 'errors')}">
                                    <g:checkBox name="active_ind" value="${applicationControlInstance?.active_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="visible_ind"><g:message code="applicationControl.visible_ind.label" default="Visibleind" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'visible_ind', 'errors')}">
                                    <g:checkBox name="visible_ind" value="${applicationControlInstance?.visible_ind}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unit_height"><g:message code="applicationControl.unit_height.label" default="Unitheight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'unit_height', 'errors')}">
                                    <g:textField name="unit_height" value="${fieldValue(bean: applicationControlInstance, field: 'unit_height')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="control_text"><g:message code="applicationControl.control_text.label" default="Controltext" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'control_text', 'errors')}">
                                    <g:textField name="control_text" value="${applicationControlInstance?.control_text}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdate"><g:message code="applicationControl.lastUpdate.label" default="Last Update" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'lastUpdate', 'errors')}">
                                    <g:datePicker name="lastUpdate" precision="day" value="${applicationControlInstance?.lastUpdate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="control_description"><g:message code="applicationControl.control_description.label" default="Controldescription" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'control_description', 'errors')}">
                                    <g:textField name="control_description" value="${applicationControlInstance?.control_description}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>
        </div>