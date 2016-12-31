<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;" %>

<g:set var="viewHelper" value="${new ViewHelper(artifactInstance)}" scope="request"/>

<div class="wrapper" style="background-color:gray;width:100%;height:100%;">

	<div class="wrapper_center" style="position:absolute;width:34%;left:33%;">

		<% request.viewHelper.setSectionTitle('History - Artifact Detail - Version ' + artifactInstance.version) %>
		<div style="width:95%;">
			<%	println(g.include(view:'/layouts/header_block.gsp', params:params)) %>
		</div>
			<% 	println(g.include(view:'/artifact/show_inc.gsp')) %>
		<div style="width:95%;">
			<%	println(g.include(view:'/layouts/footer_block.gsp', params:params))	%>
		</div>

	</div>

</div>

<%
	println(g.include(view:'/artifactHistory/modal_navigation.gsp'))
%>