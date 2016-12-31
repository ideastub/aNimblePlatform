<%@ page import="com.nimble.domain.security.ApplicationSetting;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'applicationSetting.label', default: 'ApplicationSetting')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

        <div class="body" style="width:95%;float:left;">

<%
viewHelper.setSectionTitle('Update Application Setting')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>

        <div class="nav">

<% println(g.include(view:'/applicationSetting/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${applicationSettingInstance}">
            <div class="errors">
                <g:renderErrors bean="${applicationSettingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" name="myform" id="${applicationSettingInstance?.id}" action="update">
                <g:hiddenField name="id" value="${applicationSettingInstance?.id}" />
                <g:hiddenField name="version" value="${applicationSettingInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="setting_ref"><g:message code="applicationSetting.setting_ref.label" default="Setting Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'setting_ref', 'errors')}">
                                    <g:select name="setting_ref.id" from="${com.nimble.domain.reference.ApplicationSettingReference.list()}" optionKey="id" value="${applicationSettingInstance?.setting_ref?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="data_type_ref"><g:message code="applicationSetting.data_type_ref.label" default="Data Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'data_type_ref', 'errors')}">
                                    <g:select name="data_type_ref.id" from="${com.nimble.domain.reference.DatabaseDataTypeReference.list()}" optionKey="id" value="${applicationSettingInstance?.data_type_ref?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="value_date"><g:message code="applicationSetting.value_date.label" default="Date Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'value_date', 'errors')}">

                                    <input type="text" name="value_date" id="value_date" dojoType="dijit.form.DateTextBox" value="${applicationSettingInstance?.value_date}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="value_double"><g:message code="applicationSetting.value_double.label" default="Double Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'value_double', 'errors')}">
                                    <g:textField name="value_double" value="${fieldValue(bean: applicationSettingInstance, field: 'value_double')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="value_int"><g:message code="applicationSetting.value_int.label" default="Int Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'value_int', 'errors')}">
                                    <g:checkBox name="value_int" value="${applicationSettingInstance?.value_int}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="value_string"><g:message code="applicationSetting.value_string.label" default="String Value" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationSettingInstance, field: 'value_string', 'errors')}">
                                    <g:textField name="value_string" value="${applicationSettingInstance?.value_string}" />
                                </td>
                            </tr>
                       
                        </tbody>
                    </table>
                </div>
            </g:form>
            
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>            
        </div>