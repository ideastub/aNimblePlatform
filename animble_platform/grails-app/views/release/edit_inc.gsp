<%@ page import="com.nimble.domain.project.Project;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.domain.reference.*;" %>
<g:set var="entityName" value="${message(code: 'release.label', default: 'Release')}" />
<g:set var="viewHelper" value="${request.viewHelper}" />
<g:set var="releaseInstance" value="${request.viewHelper.nimbleDomain}" />
<g:set var="refHelper" value="${new ReferenceHelper(application)}" />  

        <div class="body" style="float:left;">
<%
request.viewHelper.setSectionTitle('Update Release')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${releaseInstance}">
            <div class="errors">
                <g:renderErrors bean="${releaseInstance}" as="list" />
            </div>
            </g:hasErrors>

        <div class="nav">
<% println(g.include(view:'/release/navigation.gsp', params:params)) %>

        </div>

            <g:form method="post" name="myform" id="${releaseInstance?.id}" action="update"  controller="${viewHelper.getControllerName(releaseInstance)}">
                <g:hiddenField name="id" value="${releaseInstance?.id}" />
                
                
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="releaseName"><g:message code="release.releaseName.label" default="Release Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: releaseInstance, field: 'releaseName', 'errors')}">
                                    <g:textField name="releaseName" value="${releaseInstance?.releaseName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="releaseNumber"><g:message code="release.releaseNumber.label" default="Release Number" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: releaseInstance, field: 'releaseNumber', 'errors')}">
                                    <g:textField name="releaseNumber" value="${releaseInstance?.releaseNumber}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="releaseDate"><g:message code="release.releaseDate.label" default="Release Date" />
                                  </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: releaseInstance, field: 'releaseDate', 'errors')}">
                                    <input id="releaseDate" name="releaseDate" type="text" class="DatePicker" alt="{format:'yyyy-MM-dd 00:00:00.0'}" tabindex="1" value="${viewHelper.formateDate(releaseInstance?.releaseDate)}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="release_status_ref"><g:message code="release.release_status_ref.label" default="Release Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: releaseInstance, field: 'release_status_ref', 'errors')}">
                                <g:select name="release_status_ref.id" from="${refHelper.getRefDataForCreateSelect(ReleaseStatusReference)}" optionKey="id" value="${releaseInstance?.release_status_ref?.id}"  />
                                </td>
                            </tr>   
                        
                        </tbody>
                    </table>
                </div>
            </g:form>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
        </div>
