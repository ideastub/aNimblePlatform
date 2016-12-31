
<%@ page import="com.nimble.domain.view.ApplicationControl" %>
        <g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />

        <div class="body" style="width:95%;float:left;">
        
<%
request.viewHelper.setSectionTitle('List Field Controls')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>        
        <div class="nav">
        
		<% println(g.include(view:'/applicationControl/navigation.gsp', params:params)) %>

		</div>        

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="padding-left:10px;">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn action="index" property="id" title="${message(code: 'applicationControl.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn action="index" property="control" title="${message(code: 'applicationControl.control.label', default: 'Control')}" />
                   	    
                            <g:sortableColumn action="index" property="control_text" title="${message(code: 'applicationControl.control_text.label', default: 'Control Label')}" />
                        
                            <th><g:message code="applicationControl.control_description.label" default="Control Description" /></th>
                   	    
                            <g:sortableColumn action="index" property="display_sequence" title="${message(code: 'applicationControl.display_sequence.label', default: 'Display Sequence')}" />

                            <th><g:message code="applicationControl.unit_height.label" default="Unit Height" /></th>

                            <th><g:message code="applicationControl.visible_ind.label" default="Is Visible" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${applicationControlInstanceList}" status="i" var="applicationControlInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td align="center"><a ${(i % 2) == 0 ? "class='oddLink'" : ""} href="#" onClick="location = '/${grailsApplication.metadata['app.name']}/applicationControl/show/${applicationControlInstance.id}'">${applicationControlInstance?.id}</a></td>                        
                        
                            <td>&nbsp;${fieldValue(bean: applicationControlInstance, field: "control")}</td>

                            <td>&nbsp;${fieldValue(bean: applicationControlInstance, field: "control_text")}</td>
                        
                            <td>&nbsp;${fieldValue(bean: applicationControlInstance, field: "control_description")}</td>
                        
                            <td>&nbsp;${fieldValue(bean: applicationControlInstance, field: "display_sequence")}</td>

                            <td>&nbsp;${fieldValue(bean: applicationControlInstance, field: "unit_height")}</td>

                            <td>&nbsp;${fieldValue(bean: applicationControlInstance, field: "visible_ind")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <% if (params?.filter == null || params?.filter.equals('')) { %>
                <g:paginate total="${applicationControlInstanceTotal}" action="index" />
                <% } %>
            </div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>   
        </div>
