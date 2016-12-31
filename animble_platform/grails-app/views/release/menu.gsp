<%@ page import="com.nimble.utils.view.ViewHelper;" %>
<g:set var="viewHelper" value="${request.viewHelper}" />

<div id="release_menu" style="background-color: #FFFFFF;">
&nbsp;


		<div dojoType="dojo.data.ItemFileReadStore"
		     url="/${grailsApplication.metadata['app.name']}/release/menu_tree/${request.viewHelper.getProjectId()}?${System.currentTimeMillis()}" jsid="releaseStore" preventCache="true"></div>
		<div dojoType="dijit.Tree" store="releaseStore" labelAttr="name"
		     label="Releases" preventCache="true"" style="background-color: #FFFFFF;width:100%;">
		     <script type="dojo/method" event="onClick" args="item">
               //alert("/${grailsApplication.metadata['app.name']}/release/show_viewonly/"+  releaseStore.getIdentity(item) + "?viewOnly=true&project_id=${request.viewHelper.getProjectId()}");
    			dijit.byId("ReleaseView").setHref("/${grailsApplication.metadata['app.name']}/release/show_viewonly/"+  releaseStore.getIdentity(item) + "?viewOnly=true&project_id=${request.viewHelper.getProjectId()}");
	           
		    </script>
		</div>
	


</div>
		