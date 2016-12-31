<%@ page import="com.nimble.controller.artifact.ArtifactController;com.nimble.utils.view.*;" %>

    <script type="text/javascript">


          function makesomething(event){
	          //alert(' You clicked a TabContainer Button!'+dijit.byId("mainTabContainer").widgetId);
	          //alert(' You clicked a TabContainer Button!');
           }

           dojo.addOnLoad(function() {  //Prevent problems with "IError"
	           test = dijit.byId("mainTabContainer");
	           dojo.connect(test.tablist, 'onButtonClick', makesomething);
           });
           

	</script>

<div id="ArtifactLanding" style="width: 95%; height: 80%;" class="landing">

	<%
	request.viewHelper.setSectionTitle(viewHelper.getAppControlLabel('section_title') + ' Detail')
	println(g.include(view:'/layouts/header_block.gsp', params:params))
	%>

	<g:if test="${flash.message}">
	<div class="message">${flash.message}<br></div>
	<div style="background-color: #FFFFFF;">&nbsp;</div>
	</g:if>

			<div id="mainTabContainer" dojoType="dijit.layout.TabContainer"
			   style="border: 0px; width: 100%; height: 100%;" class="tabContainer">

				      <div id="ArtifactMaintain" dojoType="dijit.layout.ContentPane" title="Artifact Detail"
				      style="width: 100%; height: 80%;"
				       preventCache="true" selected="${request.viewHelper.isDefaultTabSelected()}"
				       href="/${grailsApplication.metadata['app.name']}/artifact/show/${params.id}?parent_id=${viewHelper.getArtifactParentId()}">
				      </div>

				      <div id="History" dojoType="dijit.layout.ContentPane" style="width: 100%; height: 80%;"
				           preventCache="true" title="History"
				           href="/${grailsApplication.metadata['app.name']}/artifactHistory/list?artifact_id=${viewHelper.getArtifactId()}"
				           selected="${request.viewHelper.isTabSelected(ViewTabs.ARTIFACT_HISTORY)}">
				      </div>

				      <div id="Baselines" dojoType="dijit.layout.ContentPane"
				      style="width: 100%; height: 80%;"
				           preventCache="true" title="Baselines" preventCache="true">
				           <script language="JavaScript" someProperty="text/javascript">
                           document.write("Coming soon... Baselines");
                           </script>
				      </div>

				      <div id="Dependencies" dojoType="dijit.layout.ContentPane" style="width: 100%; height: 80%;"
				           preventCache="true" title="Dependencies"
				           href="/${grailsApplication.metadata['app.name']}/artifactTree/list?artifact_id=${viewHelper.getArtifactId()}"
				           selected="${request.viewHelper.isTabSelected(ViewTabs.ARTIFACT_DEPENDENCIES)}">
				      </div>

				      <div id="Reports" dojoType="dijit.layout.ContentPane" style="width: 100%; height: 80%;"
				           preventCache="true" title="Reports"
				           href="/${grailsApplication.metadata['app.name']}/reports/list?location=ARTIFACTS"
				           selected="${request.viewHelper.isTabSelected(ViewTabs.ARTIFACT_REPORTS)}">
				      </div>
				      
	        </div>
        
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
 </div>