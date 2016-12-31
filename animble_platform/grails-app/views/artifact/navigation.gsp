<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.*; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="artifactInstance" value="${request.artifactInstance}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

<%
//println actionName
%>

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% if (viewHelper.isAgileProject()) { %>
<td id="ListArtifact" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/${session.curProject.projectType}/index/${session.curProject.id}?tab=${ViewTabs.PROJECT_PRODUCT_BACKLOG}';" class="buttonTitle" onMouseOver="selectButton('ListArtifact');" onMouseOut="unselectButton('ListArtifact');">List</a></td>
<% } else { %>
<td id="ListArtifact" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/${session.curProject.projectType}/index/${session.curProject.id}?tab=${ViewTabs.PROJECT_ARTIFACTS}';" class="buttonTitle" onMouseOver="selectButton('ListArtifact');" onMouseOut="unselectButton('ListArtifact');">List</a></td>
<% } %>

<td class="buttonSeperator" width="1px" height="25px"></td>

<% if (viewHelper.isAgileProject()) { %>

<td id="AddArtifact" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/productBacklogArtifact/create?project_id=${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('AddArtifact');" onMouseOut="unselectButton('AddArtifact');">Add Backlog Artifact</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } else { %>

<td id="AddArtifact" class="buttonNotSelected" height="25px"><a href="#" onclick="showHideRow('artifact_buttons');" class="buttonTitle" onMouseOver="selectButton('AddArtifact');" onMouseOut="unselectButton('AddArtifact');">Add...</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% 		if (viewHelper.getArtifactParentId() != null && !viewHelper.isAgileProject() && !actionName.equals('create') && !actionName.equals('edit') && !actionName.equals('save') && !actionName.equals('update')) { %>

<td id="AddChildArtifact" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/${viewHelper.getArtifactControllerName()}/create?project_id=${session.curProject.id}&parent_id=${viewHelper?.artifactParentId}';" class="buttonTitle" onMouseOver="selectButton('AddChildArtifact');" onMouseOut="unselectButton('AddChildArtifact');">Add Child ${viewHelper.getArtifactDisplayName()}</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% 
		}
	}
 %>

<% 
if (artifactInstance != null){

		if (actionName.equals('show') || actionName.equals('show_viewonly')){
		%>

			<% if (viewHelper.isAgileProject() && artifactInstance instanceof ProductBacklogArtifact) { %>

<td id="AddTask" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/taskArtifact/create?project_id=${session.curProject.id}&parent_id=${viewHelper?.getArtifactParentId()}';" class="buttonTitle" onMouseOver="selectButton('AddTask');" onMouseOut="unselectButton('AddTask');">Add Task</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
			<% } %>

<td id="UpdateArtifact" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/${viewHelper.getArtifactControllerName()}/edit/${artifactInstance.id}';" class="buttonTitle" onMouseOver="selectButton('UpdateArtifact');" onMouseOut="unselectButton('UpdateArtifact');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

		<% } 

	if (!actionName.equals('show_viewonly')){
		if (actionName.equals('create') || actionName.equals('edit') || actionName.equals('save') ){ %>
<td id="SaveArtifact" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('SaveArtifact');" onMouseOut="unselectButton('SaveArtifact');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<%
    		} 

		   }
	   if (artifactInstance.id != null && !actionName.equals('show')) {
%>

<td id="WorkThis" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/${viewHelper.getArtifactControllerName()}/index/${artifactInstance.id}?parent_id=${artifactInstance.id}';" class="buttonTitle" onMouseOver="selectButton('WorkThis');" onMouseOut="unselectButton('WorkThis');">More Detail</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<%
       }
}


if (actionName.equals('show')){
%>	

<td id="Project" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/${session.curProject.projectType}/index/${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('Project');" onMouseOut="unselectButton('Project');">Show Project</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>            

</tr></table>  

<table border="0" cellspacing="0" cellpadding="0">
<tr colspan="5"><td class="buttonSeperator" width="1px" height="1px"></td></tr>
<tr id="artifact_buttons" style="display:none;">
<td id="DesignAdd" class="buttonNotSelected" height="25px" nowrap><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/designArtifact/create?project_id=${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('DesignAdd');" onMouseOut="unselectButton('DesignAdd');">Add Design</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="FeatureAdd" class="buttonNotSelected" height="25px" nowrap><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/featureArtifact/create?project_id=${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('FeatureAdd');" onMouseOut="unselectButton('FeatureAdd');">Add Feature</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="ImplementationAdd" class="buttonNotSelected" height="25px" nowrap><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/implementationArtifact/create?project_id=${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('ImplementationAdd');" onMouseOut="unselectButton('ImplementationAdd');">Add Implementation</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="RequirementAdd" class="buttonNotSelected" height="25px" nowrap><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/requirementArtifact/create?project_id=${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('RequirementAdd');" onMouseOut="unselectButton('RequirementAdd');">Add Requirement</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="TestCaseAdd" class="buttonNotSelected" height="25px" nowrap><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/testCaseArtifact/create?project_id=${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('TestCaseAdd');" onMouseOut="unselectButton('TestCaseAdd');">Add Test Case</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
</tr>
<tr><td colspan="5" class="buttonSeperator" height="1px"></td></tr>
</table>         