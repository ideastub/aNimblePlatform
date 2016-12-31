<%@ page import="com.nimble.domain.security.ApplicationUser;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'applicationUser.label', default: 'ApplicationUser')}" />
<g:set var="viewHelper" value="${request.viewHelper}" scope="request" />

         <div class="body"  style="width:95%;">
<%        
	request.viewHelper.setSectionTitle('User Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))        
%>               
         
        <div class="nav">

<% println(g.include(view:'/applicationUser/navigation.gsp', params:params)) %>

        </div>
 
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.first_name.label" default="First Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationUserInstance, field: "first_name")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.last_name.label" default="Last Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationUserInstance, field: "last_name")}</td>
                            
                        </tr>                    
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.display_name.label" default="Display Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationUserInstance, field: "display_name")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.username.label" default="User Login" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationUserInstance, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: applicationUserInstance, field: "email")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.applicationRoles.label" default="Roles" /></td>
                            
                            <td valign="top" class="value">${applicationUserInstance.getAuthorities()}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.active_ind.label" default="Is Active" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${applicationUserInstance?.active_ind}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${applicationUserInstance?.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${applicationUserInstance?.create_user}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${applicationUserInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="applicationUser.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${applicationUserInstance?.update_user}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>


<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
        </div>
