<%@ page import="com.nimble.domain.reference.Reference;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'reference.label', default: 'Reference')}" />
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />

        <div class="body" style="width:100%;">
<%
request.viewHelper.setSectionTitle('Refresh Reference Data')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>     


        <div class="nav">

		<% println(g.include(view:'/reference/navigation.gsp', params:params)) %>

        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">

            </div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>               
         </div>
