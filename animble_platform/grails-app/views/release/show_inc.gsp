<%@ page import="com.nimble.domain.release.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" scope="request"/>
<g:set var="refHelper" value="${new ReferenceHelper(application)}" />        
<g:set var="entityName" value="${message(code: 'release.label', default: 'Release')}" />

        <div class="body" style="width:100%;">

       
        <div class="nav">

<% println(g.include(view:'/release/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="width:100%;">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="release.releaseName.label" default="Release Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: releaseInstance, field: "releaseName")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="release.releaseCode.label" default="Release Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: releaseInstance, field: "releaseNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="release.releaseDate.label" default="Release Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${releaseInstance?.releaseDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="release.status.label" default="Release Status" /></td>
                            
                            <td valign="top" class="value">${releaseInstance?.release_status_ref}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="release.dateCreated.label" default="Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${releaseInstance?.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="release.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value">${releaseInstance?.create_user}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="release.lastUpdate.label" default="Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${releaseInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="release.update_user.label" default="Updated By" /></td>
                            
                            <td valign="top" class="value">${releaseInstance?.update_user}</td>
                            
                        </tr>
             
                    </tbody>
                </table>
            </div>
    
        </div>     
        