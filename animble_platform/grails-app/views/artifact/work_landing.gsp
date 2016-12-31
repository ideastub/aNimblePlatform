<%@ page import="com.nimble.controller.artifact.*" %>
<div dojoType="dijit.layout.SplitContainer"
        orientation="horizontal"
        sizerWidth="7"
        activeSizing="true"
        style="border: 1px solid #bfbfbf;">

        <div dojoType="dijit.layout.ContentPane" sizeMin="20" sizeShare="20" preload="true"
         id="ArtifactTree" preventCache="true" href="/${grailsApplication.metadata['app.name']}/artifact/menu/${params.id}">
        </div>

        <div id="ArtifactView" dojoType="dijit.layout.ContentPane"
        	preventCache=true" sizeMin="50" sizeShare="50" href="/${grailsApplication.metadata['app.name']}/artifact/navigation/${params.id}">
        </div>

</div>
