<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.project.Project; com.nimble.controller.release.ReleaseController;" %>
<g:set var="viewHelper" value="request.viewHelper" />
<g:set var="projectId" value="request.viewHelper.projectId" />

<div dojoType="dijit.layout.SplitContainer"
        orientation="horizontal"
        sizerWidth="7"
        activeSizing="true"
        style="height:100%;width:100%;background-color: #FFFFFF;">

        <div dojoType="dijit.layout.ContentPane" sizeMin="30" sizeShare="20" preload="true" 
            id="ProjectTree" dojoType="dijit.layout.ContentPane" style="background-color: #FFFFFF;width:25%;height:100%;border:0px;"
			preventCache="true" >
			<% println(g.include(action:'menu',controller:'release',params:params)) %>
        </div>

        <div id="ReleaseView" dojoType="dijit.layout.ContentPane" style="width:70%;height:100%;background-color:#FFFFFF;border:0px;"
        	preventCache=true" sizeMin="70" sizeShare="40">



			<div class="body" style="width:100%;">

			
			        <div class="nav">
			
					<% println(g.include(view:'/release/navigation.gsp', params:params)) %>
			
			        </div>
			        

			</div>        
        
        
        </div>

</div>