<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>

<g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request"/>



<div class="wrapper" style="position:relative;padding-top:3px;padding-bottom:3px;padding-right:3px;padding-left:3px;width:100%;height:100%;background-color:gray;">



	<div class="left" style="position:relative;top:0px;left:0%;width:49%;">
	<%
		request.viewHelper.artifactOverride = artifactInstance
		request.viewHelper.setSectionTitle('Current - Artifact Detail - Version ' + artifactInstance.version)
	%>
		<div style="width:95%;">
			<%	println(g.include(view:'/layouts/header_block.gsp', params:params)) %>
		</div>
			<% 	println(g.include(view:'/artifact/show_inc.gsp')) %>
		<div style="width:95%;">
			<%	println(g.include(view:'/layouts/footer_block.gsp', params:params))	%>
		</div>
	</div>

	<div class="divider" style="position:absolute;top:0px;left:49%;width:2%;height:100%;"></div>

	<div class="right" style="position:absolute;top:0px;left:51%;width:49%;">
	<%
		request.viewHelper.artifactOverride = artifactHistoryInstance
		request.viewHelper.setSectionTitle('History - Artifact Detail - Version ' + artifactHistoryInstance.version)
	%>
		<div style="width:95%;">
			<%	println(g.include(view:'/layouts/header_block.gsp', params:params)) %>
		</div>
			<% 	println(g.include(view:'/artifact/show_inc.gsp')) %>
		<div style="width:95%;">
			<%	println(g.include(view:'/layouts/footer_block.gsp', params:params))	%>
		</div>
	</div>

	<div class="footer_divider" style="position:relative;top:0px;left:0px;width:100%;height:100%;background-color:gray;"></div>

</div>

<%
	println(g.include(view:'/artifactHistory/modal_navigation.gsp'))
%>
