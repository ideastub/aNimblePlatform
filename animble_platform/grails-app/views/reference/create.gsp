<%@ page import="com.nimble.domain.reference.Reference;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>
<g:set var="refHelper" value="${new ReferenceHelper()}" />
<g:set var="entityName" value="${message(code: 'reference.label', default: 'Reference')}" />
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />   
        
        <div class="body" style="width:95%;">
<%
request.viewHelper.setSectionTitle('Add Reference Data')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>            
                
        
        <div class="nav">

		<% println(g.include(view:'/reference/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${referenceInstance}">
            <div class="errors">
                <g:renderErrors bean="${referenceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" name="myform" >
                <g:hiddenField name="referenceGroup" value="${referenceGroup}" />

                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="display_code"><g:message code="reference.display_code.label" default="Reference Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: referenceInstance, field: 'display_code', 'errors')}">
                                    <g:textField name="display_code" value="${referenceInstance?.display_code}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="display"><g:message code="reference.display.label" default="Reference Label" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: referenceInstance, field: 'display', 'errors')}">
                                    <g:textField name="display" value="${referenceInstance?.display}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="reference.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: referenceInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${referenceInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="display_sequence"><g:message code="reference.display_sequence.label" default="Display Sequence" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: referenceInstance, field: 'display_sequence', 'errors')}">
                                    <g:textField name="display_sequence" value="${fieldValue(bean: referenceInstance, field: 'display_sequence')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
            </g:form>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>  
        </div>
