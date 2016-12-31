<%@ page import="com.nimble.domain.artifact.Artifact;com.nimble.utils.view.ViewHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

  		<div id="project_menu"  style="background-color: #808080;width:230px;">
<%
request.viewHelper.setSectionTitle('List Reference Data')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>  		

		<div dojoType="dojo.data.ItemFileWriteStore"
		     url="/${grailsApplication.metadata['app.name']}/reference/menu_tree/${params.id}?${System.currentTimeMillis()}" jsid="popStore"></div>
		<div dojoType="dijit.Tree" store="popStore" labelAttr="name" id="artifactTree"
		     label="Reference Data"  childrenAttr="children"  style="background-color: #FFFFFF;">
		<script type="dojo/method" event="onClick" args="item">

		    //dojo.byId("project_menu").innerHTML = "Loading Artifact for <a target='_blank' href='/${grailsApplication.metadata['app.name']}/reference/show/"+  popStore.getIdentity(item) + "?reference_group=" + popStore.getValue(item, "type") + "'>link</a>";
    		if (popStore.getValue(item, "isRoot") == 'false'){
					var ref_id = popStore.getIdentity(item);
					ref_id = ref_id.substring(1,ref_id.length);
	    			dijit.byId("ProjectView").setHref("/${grailsApplication.metadata['app.name']}/reference/show/"+  ref_id + "?reference_group=" + popStore.getValue(item, "type"));
    		} else {
    				dijit.byId("ProjectView").setHref("/${grailsApplication.metadata['app.name']}/reference/landing?reference_group=" + popStore.getValue(item, "type"));
    		}
	        
	        if (popStore.getValue(item, "isRoot") == 'true'){
	   			lastSelected=selected["artifactTree"]=item;					
				var pInfo = { parent: lastSelected,		attribute: "children"};
   				var paramsid= '${params.id}';
				var fetchURL = "/${grailsApplication.metadata['app.name']}/reference/menu_tree/${params.id}?${System.currentTimeMillis()}&reference_group=" + popStore.getValue(item, "type");

			var childrenValues = popStore.getValues(item,"children");
			if (childrenValues.length == 0){
					treeItemFetch(
						fetchURL,
						popStore,
						lastSelected,
						pInfo
					);
				}
			}
	           
		</script>
		</div>

<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>		
</div>		