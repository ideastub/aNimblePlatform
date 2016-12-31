<%@ page import="com.nimble.domain.security.ApplicationUserGroup;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'applicationUserGroup.label', default: 'ApplicationUserGroup')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

        <div class="body"  style="width:100%;">
<%
request.viewHelper.setSectionTitle('List User Groups')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>        
        
        <div class="nav">

<% println(g.include(view:'/applicationUserGroup/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="padding-left:10px;">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn action="index" property="id" title="${message(code: 'applicationUserGroup.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn action="index" property="user_group_ref" title="${message(code: 'applicationUserGroup.user_group_ref.label', default: 'User Group')}" />
                        
                            <g:sortableColumn action="index" property="email" title="${message(code: 'applicationUserGroup.email.label', default: 'Email')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${applicationUserGroupInstanceList}" status="i" var="applicationUserGroupInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td align="center"><g:link action="show" id="${applicationUserGroupInstance.id}">${fieldValue(bean: applicationUserGroupInstance, field: "id")}</g:link></td>
                        
                            <td>&nbsp;${applicationUserGroupInstance.user_group_ref}</td>
                        
                            <td>&nbsp;${applicationUserGroupInstance.email}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${applicationUserGroupInstanceTotal}"  action="index" />
            </div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>              
        </div>
