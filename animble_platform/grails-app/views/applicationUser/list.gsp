<%@ page import="com.nimble.domain.security.ApplicationUser;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'applicationUser.label', default: 'ApplicationUser')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />


        <div class="body" style="width:95%;">
<%
request.viewHelper.setSectionTitle('List Users')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>

        <div class="nav">

<% println(g.include(view:'/applicationUser/navigation.gsp', params:params)) %>

        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="padding-left:10px;">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn action="index" property="id" title="${message(code: 'applicationUser.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn action="index" property="last_name" title="${message(code: 'applicationUser.last_name.label', default: 'Last Name')}" />

                            <g:sortableColumn action="index" property="first_name" title="${message(code: 'applicationUser.first_name.label', default: 'First Name')}" />
                        
                            <g:sortableColumn action="index" property="email" title="${message(code: 'applicationUser.email.label', default: 'Email')}" />
                            
                            <g:sortableColumn action="index" property="username" title="${message(code: 'applicationUser.username.label', default: 'User Login')}" />                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${applicationUserInstanceList}" status="i" var="applicationUserInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td align="center"><a ${(i % 2) == 0 ? "class='oddLink'" : ""} href="#" onClick="location.href = '/${grailsApplication.metadata['app.name']}/applicationUser/show/${applicationUserInstance.id}'">${applicationUserInstance.id}</a></td>                        
                        
                            <td>&nbsp;${fieldValue(bean: applicationUserInstance, field: "last_name")}</td>                        
                        
                            <td>&nbsp;${fieldValue(bean: applicationUserInstance, field: "first_name")}</td>
                        
                            <td>&nbsp;${fieldValue(bean: applicationUserInstance, field: "email")}</td>

                            <td>&nbsp;${fieldValue(bean: applicationUserInstance, field: "username")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons" >
                <g:paginate total="${applicationUserInstanceTotal}" action="index" />
            </div>
            
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>              
        </div>
