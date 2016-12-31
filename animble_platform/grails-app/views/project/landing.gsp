<%@ page import="com.nimble.domain.project.*;com.nimble.controller.project.ProjectController;com.nimble.controller.artifact.ArtifactController;com.nimble.controller.release.SprintController;com.nimble.utils.view.*;" %>
<g:set var="viewHelper" value="request.viewHelper" />

    <script type="text/javascript">


          function loadTab(event){
	          //alert(dijit.byId('mainTabContainer').widgetId);
	          //alert(' You clicked a TabContainer Button!');
           }

           dojo.addOnLoad(function() {  //Prevent problems with "IError"
	           allTabs = dijit.byId("mainTabContainer");
	           dojo.connect(allTabs.tablist, 'onButtonClick', loadTab);
           });
           

</script>


<div id="ProjectLanding" style="float:left;height:80%;width:95%;" class="landing">


	<%
	request.viewHelper.setSectionTitle('Project Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))
	%>


	<div id="ProjectLandingMessage" 
	
	<% if (flash.message) { %>
	class="message" style=""
	<% } else { %>
	class="dialog" style="border: solid 1px #FFFFFF;"
	<% } %>
	
	>
	
		${flash.message}
		<br>
	</div>

	<% if (flash.message) { %>
		<div style="background-color: #FFFFFF;">&nbsp;</div>
	<% } %>


	<div id="mainTabContainer" dojoType="dijit.layout.TabContainer" class="tabContainer"
			   style="width: 100%; height:100%;">

				      <div id="ProjectMaintain" dojoType="dijit.layout.ContentPane" title="Project Detail"
        					style="width: 100%; height: 80%;" 
							preventCache="true" selected="${request.viewHelper.isDefaultTabSelected()}"
		    				href="/${grailsApplication.metadata['app.name']}/project/show/${params.id}">
				      </div>

				      <div id="History" dojoType="dijit.layout.ContentPane"
				      style="width: 100%; height: 80%;"
				           preventCache="true" title="History">
				           <script language="JavaScript" someProperty="text/javascript">
                           document.write("Coming soon... History");
                           </script>
				      </div>				      

				      <div id="Baselines" dojoType="dijit.layout.ContentPane"
				      style="width: 100%; height: 80%;"
				           preventCache="true" title="Baselines">
				           <script language="JavaScript" someProperty="text/javascript">
                           document.write("Coming soon... Baselines");
                           </script>
				      </div>

				      <div id="Releases" dojoType="dijit.layout.ContentPane" style="width: 100%; height: 80%;"
				           preventCache="true" title="Releases"
				           href="/${grailsApplication.metadata['app.name']}/release/index/${params.id}?project_id=${params.id}"
				           selected="${request.viewHelper.isTabSelected(ViewTabs.PROJECT_RELEASES)}">
				      </div>

	<% if (projectInstance instanceof AgileProject) { %>
				      <div id="Sprints" dojoType="dijit.layout.ContentPane" style="width: 100%; height: 80%;"
				           preventCache="true" title="Sprints"
				           href="/${grailsApplication.metadata['app.name']}/sprint/index/${params.id}?projectType=agileProject&project_id=${params.id}"
				           selected="${request.viewHelper.isTabSelected(ViewTabs.PROJECT_SPRINTS)}">
				      </div>

				      <div id="ProductBacklog" dojoType="dijit.layout.ContentPane" style="width: 100%; height: 80%;"
				           preventCache="true" title="Product Backlog"
				           href="/${grailsApplication.metadata['app.name']}/productBacklogArtifact/list/${params.id}?projectType=agileProject&project_id=${params.id}"
				           selected="${request.viewHelper.isTabSelected(ViewTabs.PROJECT_PRODUCT_BACKLOG)}">
				      </div>

				      <div id="Impediments" dojoType="dijit.layout.ContentPane"
				      style="width: 100%; height: 80%;"
				           preventCache="true" title="Impediments">
				           <script language="JavaScript" someProperty="text/javascript">
                           document.write("Coming soon... Impediments");
                           </script>
				      </div>

	<% } %>
	<% if (projectInstance instanceof WaterfallProject) { %>
				      <div id="Artifacts" dojoType="dijit.layout.ContentPane" style="width: 100%; height: 80%;"
				           preventCache="true" title="Artifacts"
				           href="/${grailsApplication.metadata['app.name']}/artifact/list/${params.id}?projectType=waterfallProject&project_id=${params.id}"
				           selected="${request.viewHelper.isTabSelected(ViewTabs.PROJECT_ARTIFACTS)}">
				      </div>

				      <div id="Issues" dojoType="dijit.layout.ContentPane"
				      style="width: 100%; height: 80%;"
				           preventCache="true" title="Issues">
				           <script language="JavaScript" someProperty="text/javascript">
                           document.write("Coming soon... Issues");
                           </script>
				      </div>

				      <div id="RiskRegister" dojoType="dijit.layout.ContentPane"
				      style="width: 100%; height: 80%;"
				           preventCache="true" title="Risk Register">
				           <script language="JavaScript" someProperty="text/javascript">
                           document.write("Coming soon... Risk Register");
                           </script>
				      </div>

	<% } %>

				      <div id="Reports" dojoType="dijit.layout.ContentPane" style="width: 100%; height: 80%;"
				           preventCache="true" title="Reports"
				           href="/${grailsApplication.metadata['app.name']}/reports/list?location=PROJECTS"
				           selected="${request.viewHelper.isTabSelected(ViewTabs.PROJECT_REPORTS)}">
				      </div>
	</div>

	<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>

</div>