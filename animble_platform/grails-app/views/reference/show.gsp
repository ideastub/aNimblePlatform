<%@ page import="com.nimble.domain.reference.Reference;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'reference.label', default: 'Reference')}" />
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

        <div class="body" style="width:95%;float:left;">
<%
	request.viewHelper.setSectionTitle('Reference Data Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))
%>


        <div class="nav">
		<% println(g.include(view:'/reference/navigation.gsp', params:params)) %>
        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reference.display_code.label" default="Reference Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: referenceInstance, field: "display_code")}</td>
                            
                        </tr>

                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reference.display.label" default="Reference Label" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: referenceInstance, field: "display")}</td>
                            
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reference.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: referenceInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reference.display_sequence.label" default="Display Sequence" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: referenceInstance, field: "display_sequence")}</td>
                            
                        </tr>
                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reference.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${referenceInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reference.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${referenceInstance?.create_user}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reference.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${referenceInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="reference.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${referenceInstance?.update_user}</td>
                            
                        </tr>

                    
                    </tbody>
                </table>
            </div>
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
        </div>
