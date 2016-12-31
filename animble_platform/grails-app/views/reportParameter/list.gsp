
<%@ page import="com.nimble.domain.report.ReportParameter;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'reportParameter.label', default: 'ReportParameter')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

        <div class="body" style="width:95%;">
<%
request.viewHelper.setSectionTitle('List Report Parameters')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>


        <div class="nav">

<% println(g.include(view:'/reportParameter/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="padding-left:10px;">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn action="index" property="id" title="${message(code: 'reportParameter.id.label', default: 'Id')}" />

                            <g:sortableColumn action="index" property="report.display" title="${message(code: 'reportParameter.report.display.label', default: 'Report')}" />

                            <g:sortableColumn action="index" property="display" title="${message(code: 'reportParameter.display.label', default: 'Display')}" />

                            <th>${message(code: 'reportParameter.description.label', default: 'Description')}</th>
                        
                            <g:sortableColumn action="index" property="param_type_ref.display" title="${message(code: 'reportParameter.param_type_ref.display.label', default: 'Parameter Type')}" />
                        
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reportParameterInstanceList}" status="i" var="reportParameterInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td align="center"><a ${(i % 2) == 0 ? "class='oddLink'" : ""} href="#" onClick="location.href = '/${grailsApplication.metadata['app.name']}/reportParameter/show/${reportParameterInstance.id}'">${reportParameterInstance.id}</a></td>

                            <td>&nbsp;${reportParameterInstance.report.display}</td>

                            <td>&nbsp;${fieldValue(bean: reportParameterInstance, field: "display")}</td>

                            <td>&nbsp;${fieldValue(bean: reportParameterInstance, field: "description")}</td>                        

                            <td>&nbsp;${reportParameterInstance.param_type_ref.display}</td>

                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reportParameterInstanceTotal}" action="index"/>
            </div>
            
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>             
        </div>