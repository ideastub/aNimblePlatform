<%@ page import="com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<div dojoType="dijit.layout.SplitContainer"
        orientation="horizontal"
        sizerWidth="7"
        activeSizing="true"
        style="height:100%;width:100%;background-color: #808080;">

        <div dojoType="dijit.layout.ContentPane" sizeMin="30" sizeShare="20" preload="true" 
            id="ProjectTree" dojoType="dijit.layout.ContentPane"  style="background-color: #808080;float:left;width:25%;height:100%;border:0px;"
			preventCache="true" >
<% println(g.include(action:'menu',controller:'reference',params:params)) %>		
	
        </div>

        <div id="ProjectView" dojoType="dijit.layout.ContentPane"  style="background-color: #808080;float:left;width:70%;height:100%;border:0px;"
        	preventCache=true" sizeMin="70" sizeShare="40" >

					<% println(g.include(view:'/reference/landing.gsp', params:params)) %>

        </div>

</div>