<%@ page import="com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<div class="body" style="position:relative;padding-right:37%;padding-left:37%;width:350px;" dojoType="dijit.layout.ContentPane" >

		<%
		viewHelper.setSectionTitle('Add Dependency')
		println(g.include(view:'/layouts/header_block.gsp', params:params))
		%>


            <g:if test="${flash.message}">
            <div class="message" style="">${flash.message}</div>
            </g:if>
           <g:hasErrors bean="${artifactTreeInstance}">
            <div class="errors" style="">
                <g:renderErrors bean="${artifactTreeInstance}" as="list" />
            </div>
            </g:hasErrors>
   

		<div class="nav" style="position:relative;">
			<% println(g.include(view:'/artifactTree/navigation.gsp', params:params)) %>
		</div>


        <div id="ArtifactTree" dojoType="dijit.layout.ContentPane" style="width:100%;background-color: #FFFFFF;"
        href="/${grailsApplication.metadata['app.name']}/artifact/menu_viewonly/${viewHelper.getProjectId()}">
        </div>

        <div id="ArtifactView" dojoType="dijit.layout.ContentPane" style=""
        	preventCache=true">
        </div>

		<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
	
</div>