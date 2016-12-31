<%@ page import="com.nimble.domain.artifact.Artifact;com.nimble.utils.view.ViewHelper;" %>
<g:set var="viewHelper" value="${request.viewHelper}" />

<div id="artifact_menu" style="background-color: #FFFFFF;width:300px;">
&nbsp;

		<div dojoType="dijit.Tree" model="prepArtifactStore('${viewHelper.getProjectId()}','${viewHelper.getArtifactsLabel()}')" id="thisTree"
		     persist="${viewHelper?.getApplicationSetting('ARTIFACTTREEPERSIST')}" style="background-color: #FFFFFF;"
		     
<% if (!viewHelper.isAgileProject()) { %>
		     dndController="dijit.tree.dndSource"
			 checkItemAcceptance="dropAccept"
<% } %>
		     
		     >

		     <script type="dojo/method" event="onClick" args="item">
    			if (item.type.indexOf('com.nimble.domain.artifact.')!=0){
					var artifactView = "${artifactView}";    				
    				if (artifactView != "false"){
	    				var artifactViewURL = serverURL + "/" + item.type + "/show_viewonly/"+  item.id + "?project.id=${viewHelper.getProjectId()}&tree_role=" + item.treeRole;
						if (item.treeRole != 'TREE_ROOT'){
						 	artifactViewURL = artifactViewURL + "&parent_id="+ item.parentId;
						}
	    				dijit.byId("ArtifactView").setHref(artifactViewURL);
					} else {
					document.forms['artifact_menu'].elements['child_id'].value=item.id;
					}
				}
		    </script>
		
		</div>
</div>		