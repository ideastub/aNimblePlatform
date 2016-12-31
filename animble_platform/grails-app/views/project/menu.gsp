<%@ page import="com.nimble.utils.view.ViewHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<div id="project_menu" style="background-color: #808080;float:left;">

<%
viewHelper.setSectionTitle('List Projects')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>

		<div dojoType="dojo.data.ItemFileReadStore"
		     url="/${grailsApplication.metadata['app.name']}/project/menu_tree?${System.currentTimeMillis()}" jsid="popStore" preventCache="true"></div>
		<div dojoType="dijit.Tree" store="popStore" labelAttr="name"
		     label="Projects" preventCache="true"" style="background-color: #FFFFFF;">
		     <script type="dojo/method" event="onClick" args="item">

		       //dojo.byId("project_menu").innerHTML = "Loading Jons Artifacts for <a target='_blank' href='ArtifactTree.do?productrefid=" + popStore.getIdentity(item)+ "&label=" + popStore.getLabel(item)  + "&display=tree" + "'>link</a><br>"+ "Loading Jons Artifacts for <a target='_blank' href='artifact_menu.jsp?productrefid=" + popStore.getIdentity(item) + "&label=" + popStore.getLabel(item) + "&display=tree'>link</a>";
               //http://localhost:8080/${grailsApplication.metadata['app.name']}/project/show/101
               //alert("/${grailsApplication.metadata['app.name']}/" + popStore.getValue(item, "type") + "/show_viewonly/"+  popStore.getIdentity(item) + "?viewOnly=true");
    			dijit.byId("ProjectView").setHref("/${grailsApplication.metadata['app.name']}/" + popStore.getValue(item, "type") + "/show_viewonly/"+  popStore.getIdentity(item) + "?viewOnly=true");
	           //dijit.byId("ArtifactTree").setHref("artifact_menu.jsp?productrefid=" + popStore.getIdentity(item) + "&label=" + popStore.getLabel(item) + "&display=treeRoot");
	           
		    </script>
		</div>
		
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>

</div>
		