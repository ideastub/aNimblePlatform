<%@ page import="com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<div dojoType="dijit.layout.SplitContainer"
        orientation="horizontal"
        sizerWidth="7"
        activeSizing="true"
        style="height:100%;width:100%;background-color: #FFFFFF;">

        <div dojoType="dijit.layout.ContentPane" sizeMin="30" sizeShare="20" preload="true" 
            id="ArtifactTree" style="width:25%;height:100%;border:0px;"
			preventCache="true" >
<% println(g.include(view:'/artifact/menu.gsp', params:params)) %>

        </div>

        <div id="ArtifactView" dojoType="dijit.layout.ContentPane" style="width:70%;height:100%;border:0px;"
        	preventCache=true" sizeMin="70" sizeShare="40">
            
			<div class="body" style="width:100%;">
			
			        <div class="nav">
			
					<% println(g.include(view:'/artifact/navigation.gsp', params:params)) %>
			
			        </div>
			        
			</div>              
            
        </div>

</div>