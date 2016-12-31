<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.report.Report; com.nimble.controller.report.ReportsController;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<div id="pageBody" class="landing" style="background-color: #808080;width:30%;">

<% 
viewHelper.setSectionTitle('Search')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>

	<div class="messages" style="background-color:#FFFFFF;">
            <g:if test="${flash.message}">
            <span class="message">${flash.message}</span><br><br>
            </g:if>
	</div>   

	<div class="nav" style="">
		<% println(g.include(view:'/search/navigation.gsp', params:params)) %>
	</div>

	        
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>	        

</div>