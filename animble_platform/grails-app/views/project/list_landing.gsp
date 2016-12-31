<div dojoType="dijit.layout.SplitContainer"
        orientation="horizontal"
        sizerWidth="7"
        activeSizing="true"
        style="height:100%;width:100%;background-color: #808080;">

        <div dojoType="dijit.layout.ContentPane" sizeMin="30" sizeShare="10" preload="true" 
            id="ProjectTree" dojoType="dijit.layout.ContentPane" style="background-color: #808080;width:20%;height:100%;border:0px;"
			preventCache="true" >
			<% println(g.include(action:'menu',controller:'project',params:params)) %>
        </div>

        <div id="ProjectView" dojoType="dijit.layout.ContentPane" style="width:75%;height:100%;background-color:#808080;border:0px;"
        	preventCache=true" sizeMin="70" sizeShare="40">



			<div class="body" style="float:left;">
					<%
					request.viewHelper.setSectionTitle('Project Detail')
					println(g.include(view:'/layouts/header_block.gsp', params:params))
					%>
			
			        <div class="nav">
			
					<% println(g.include(view:'/project/navigation.gsp', params:params)) %>
			
			        </div>
			        
			        <% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
			</div>        
        
        
        </div>

</div>