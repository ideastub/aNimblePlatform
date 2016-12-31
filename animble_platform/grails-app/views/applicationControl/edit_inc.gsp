<%@ page import="com.nimble.domain.view.ApplicationControl;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

        <div class="body" style="width:95%;float:left;">

<%
request.viewHelper.setSectionTitle('Update Field Control')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>
        
        <div class="nav">

		<% println(g.include(view:'/applicationControl/navigation.gsp', params:params)) %>

        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${applicationControlInstance}">
            <div class="errors">
                <g:renderErrors bean="${applicationControlInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="myform" id="${applicationControlInstance?.id}" action="update">
                <g:hiddenField name="id" value="${applicationControlInstance?.id}" />
                <g:hiddenField name="version" value="${applicationControlInstance?.version}" />

                <div class="dialog">
                    <table>
                        <tbody>
                        
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
                                  <label for="control_text"><g:message code="applicationControl.control_text.label" default="Control Label" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'control_text', 'errors')}">
                                    <g:textField name="control_text" value="${applicationControlInstance?.control_text}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="control_description"><g:message code="applicationControl.control_description.label" default="Control Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'control_description', 'errors')}">
                                    <g:textField name="control_description" value="${applicationControlInstance?.control_description}" />
                                </td>
                            </tr>
                        

                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="display_sequence"><g:message code="applicationControl.display_sequence.label" default="Display Sequence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'display_sequence', 'errors')}">
                                    <g:textField name="display_sequence" value="${fieldValue(bean: applicationControlInstance, field: 'display_sequence')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="default_value"><g:message code="applicationControl.default_value.label" default="Default Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'default_value', 'errors')}">
                                    <g:textField name="default_value" value="${applicationControlInstance?.default_value}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unit_height"><g:message code="applicationControl.unit_height.label" default="Unit Height" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'unit_height', 'errors')}">
                                    <g:textField name="unit_height" value="${fieldValue(bean: applicationControlInstance, field: 'unit_height')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unit_width"><g:message code="applicationControl.unit_width.label" default="Unit Width" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'unit_width', 'errors')}">
                                    <g:textField name="unit_width" value="${fieldValue(bean: applicationControlInstance, field: 'unit_width')}" />
                                </td>
                            </tr>
                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="visible_ind"><g:message code="applicationControl.visible_ind.label" default="Is Visible" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationControlInstance, field: 'visible_ind', 'errors')}">
                                    <g:checkBox name="visible_ind" value="${applicationControlInstance?.visible_ind}" />
                                </td>
                            </tr>
                        
                        

                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">

                </div>
            </g:form>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>  
        </div>