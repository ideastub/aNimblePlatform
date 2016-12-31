<%@ page import="com.nimble.domain.report.Report;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

        <div class="body" style="width:95%;">
<%
request.viewHelper.setSectionTitle('List Reports')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>


        <div class="nav">

<% println(g.include(view:'/report/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="padding-left:10px;">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn action="index" property="id" title="${message(code: 'report.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn action="index" property="display" title="${message(code: 'report.display.label', default: 'Display')}" />
                        
                            <th><g:message code="report.description.label" default="Description" /></th>

                            <g:sortableColumn action="index" property="file_name" title="${message(code: 'report.file_name.label', default: 'File Name')}" />
                        
                            <th><g:message code="report.report_location_ref.label" default="Report Location" /></th>
                        
                            <th><g:message code="report.report_language_ref.label" default="Report Language" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reportInstanceList}" status="i" var="reportInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td align="center"><a ${(i % 2) == 0 ? "class='oddLink'" : ""} href="#" onClick="location='/${grailsApplication.metadata['app.name']}/report/show/${reportInstance.id}'">${reportInstance.id}</a></td>

                            <td>&nbsp;${fieldValue(bean: reportInstance, field: "display")}</td>
                        
                            <td>&nbsp;${fieldValue(bean: reportInstance, field: "description")}</td>
                        
                            <td>&nbsp;${fieldValue(bean: reportInstance, field: "file_name")}</td>
                        
                            <td>&nbsp;${reportInstance.report_location_ref.display}</td>
                        
                            <td>&nbsp;${reportInstance.report_language_ref.display}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reportInstanceTotal}"  action="index"/>
            </div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %> 
        </div>
