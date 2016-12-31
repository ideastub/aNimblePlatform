
<%@ page import="com.nimble.domain.reference.Reference" %>
        <g:set var="entityName" value="${message(code: 'reference.label', default: 'Reference')}" />

        <div class="body">
        <div class="nav">

		<% println(g.include(view:'/reference/navigation.gsp', params:params)) %>

        </div>

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'reference.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="display" title="${message(code: 'reference.display.label', default: 'Display')}" />
                        
                            <g:sortableColumn property="display_code" title="${message(code: 'reference.display_code.label', default: 'Displaycode')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'reference.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="display_sequence" title="${message(code: 'reference.display_sequence.label', default: 'Displaysequence')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${referenceInstanceList}" status="i" var="referenceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><a href="#" onClick="dijit.byId('Landing').setHref('/${grailsApplication.metadata['app.name']}/reference/show/${referenceInstance.id}')">${referenceInstance?.id}</a></td>
                        
                            <td>${fieldValue(bean: referenceInstance, field: "display")}</td>
                        
                            <td>${fieldValue(bean: referenceInstance, field: "display_code")}</td>
                        
                            <td>${fieldValue(bean: referenceInstance, field: "description")}</td>

                            <td>${fieldValue(bean: referenceInstance, field: "display_sequence")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${referenceInstanceTotal}" />
            </div>
        </div>
