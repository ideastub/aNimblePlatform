<%@ page import="com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>
<%
if (request.viewHelper == null) { request.viewHelper = new ViewHelper() }
if (request.referenceGroup == null) { request.referenceGroup = params.reference_group }
%>

<g:set var="viewHelper" value="${request.viewHelper}" />

			<div class="body" style="width:95%;">
					<%
					request.viewHelper.setSectionTitle('Reference Data Detail')
					println(g.include(view:'/layouts/header_block.gsp', params:params))
					%>
			
			        <div class="nav">
			
					<% println(g.include(view:'/reference/navigation.gsp', params:params)) %>
			
			        </div>
			        
			        <% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
			</div>  