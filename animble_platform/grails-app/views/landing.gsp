<div dojoType="dijit.layout.SplitContainer"
        orientation="horizontal"
        sizerWidth="7"
        activeSizing="true"
        style="">

        <div dojoType="dijit.layout.ContentPane" sizeMin="20" sizeShare="20" preload="true" 
            id="ProjectTree" dojoType="dijit.layout.ContentPane" style="width:300px;"
			preventCache="true" href="/${grailsApplication.metadata['app.name']}/project/menu">
        </div>

        <div id="ProjectView" dojoType="dijit.layout.ContentPane"
        	preventCache=true" sizeMin="50" sizeShare="50">
            &nbsp;
        </div>

</div>
