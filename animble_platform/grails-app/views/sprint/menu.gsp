<%@ page import="com.nimble.utils.view.ViewHelper;" %>
<g:set var="viewHelper" value="${request.viewHelper}" />

<div id="sprint_menu" style="background-color: #FFFFFF;">
&nbsp;


		<div dojoType="dojo.data.ItemFileReadStore"
		     url="/${grailsApplication.metadata['app.name']}/sprint/menu_tree/${request.viewHelper.getProjectId()}?${System.currentTimeMillis()}" jsid="sprintStore" preventCache="true"></div>
		<div dojoType="dijit.Tree" store="sprintStore" labelAttr="name"
		     label="Sprints" preventCache="true"" style="background-color: #FFFFFF;width:100%;">
		     <script type="dojo/method" event="onClick" args="item">
               //alert("/${grailsApplication.metadata['app.name']}/sprint/show_viewonly/"+  sprintStore.getIdentity(item) + "?viewOnly=true&project_id=${request.viewHelper.getProjectId()}");
    			dijit.byId("SprintView").setHref("/${grailsApplication.metadata['app.name']}/sprint/show_viewonly/"+  sprintStore.getIdentity(item) + "?viewOnly=true&project_id=${request.viewHelper.getProjectId()}");
	           
		    </script>
		</div>
	


</div>
		