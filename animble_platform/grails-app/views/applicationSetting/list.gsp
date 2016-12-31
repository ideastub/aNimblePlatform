<%@ page import="com.nimble.domain.security.ApplicationSetting;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'applicationSetting.label', default: 'ApplicationSetting')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

        <div class="body" style="float:left;width:95%;">

<%
request.viewHelper.setSectionTitle('List Application Settings')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>
        <div class="nav">

		<% println(g.include(view:'/applicationSetting/navigation.gsp', params:params)) %>

        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="padding-left:10px;">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn action="index" property="id" title="${message(code: 'applicationSetting.id.label', default: 'Id')}" />

                            <g:sortableColumn action="index" property="setting_ref" title="Setting Name" />                        

                            <th>Setting Value</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${applicationSettingInstanceList}" status="i" var="applicationSettingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td align="center">&nbsp;<a ${(i % 2) == 0 ? "class='oddLink'" : ""} href="#" onClick="location='/${grailsApplication.metadata['app.name']}/applicationSetting/show/${applicationSettingInstance.id}'">${applicationSettingInstance.id}</a></td>
                        
                            <td>&nbsp;${applicationSettingInstance.setting_ref}</td>
                        
                            <td>&nbsp;${applicationSettingInstance.displayValue()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${applicationSettingInstanceTotal}" action="index"/>
            </div>
            
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>             
        </div>
