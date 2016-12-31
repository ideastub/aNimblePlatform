<%@ page import="com.nimble.domain.artifact.Artifact;com.nimble.utils.view.ViewHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<div id="artifact_menu" style="">
&nbsp;

		<div dojoType="dijit.Tree" model="prepViewOnlyArtifactStore('${viewHelper.getProjectId()}','${viewHelper.getArtifactsLabel()}')" id="thisTree"
		     persist="false" style="">

		     <script type="dojo/method" event="onClick" args="item">
				prepDependencySave(document.forms["artifact_menu"],item.id);
		    </script>
		
		</div>

</div>		