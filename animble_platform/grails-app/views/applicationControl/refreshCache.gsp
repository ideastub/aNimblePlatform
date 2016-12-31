<%@ page import="com.nimble.domain.view.ApplicationControl;com.nimble.utils.view.ViewHelper;" %>
<g:set var="entityName" value="${message(code: 'applicationControl.label', default: 'ApplicationControl')}" />
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />


        <div class="body" style="width:95%;float:left;">
<%
request.viewHelper.setSectionTitle('Refresh Application Controls')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>     
        
        <div class="nav">

		<% println(g.include(view:'/applicationControl/navigation.gsp', params:params)) %>

        </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

            <div class="dialog">

            </div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>             
         </div>
