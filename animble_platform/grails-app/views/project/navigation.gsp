<%@ page import="com.nimble.domain.project.Project;com.nimble.utils.view.ViewHelper;" %>

<g:set var="projectInstance" value="${request.projectInstance}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="List" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/project/list';" class="buttonTitle" onMouseOver="selectButton('List');" onMouseOut="unselectButton('List');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Add" class="buttonNotSelected" height="25px"><a href="#" onclick="showHideRow('project_buttons');" class="buttonTitle" onMouseOver="selectButton('Add');" onMouseOut="unselectButton('Add');">Add..</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>


<% 
if (projectInstance != null){
	if (!actionName.equals('show_viewonly') ){ 

		if (actionName.equals('show')){
    	%>

<td id="Update" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/${viewHelper.getControllerName(projectInstance)}/edit/${projectInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Update');" onMouseOut="unselectButton('Update');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

		<% } %>

		<% if (actionName.equals('create') || actionName.equals('edit') || actionName.equals('save') || actionName.equals('update') ){ %>
<td id="Save" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('Save');" onMouseOut="unselectButton('Save');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

		<% } %>

<%      } else {  %>

<td id="WorkThis" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/${viewHelper.getControllerName(projectInstance)}/index/${projectInstance.id}';" class="buttonTitle" onMouseOver="selectButton('WorkThis');" onMouseOut="unselectButton('WorkThis');">More Detail</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% 	} %>


<%	if (!actionName.equals('add')){ %>
<!--
<td id="Artifacts" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/artifact/list?project_id=${projectInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Artifacts');" onMouseOut="unselectButton('Artifacts');">Show Artifacts</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
-->
<%
	}
} 
%>
            
</tr></table>

<table border="0" cellspacing="0" cellpadding="0">
<tr colspan="5">
<td class="buttonSeperator" width="1px" height="1px"></td></tr>
<tr id="project_buttons" style="display:none;">
<td id="WaterfallAdd" class="buttonNotSelected" height="25px" nowrap><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/waterfallProject/create';" class="buttonTitle" onMouseOver="selectButton('WaterfallAdd');" onMouseOut="unselectButton('WaterfallAdd');">Add Waterfall Project</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="AgileAdd" class="buttonNotSelected" height="25px" nowrap><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/agileProject/create';" class="buttonTitle" onMouseOver="selectButton('AgileAdd');" onMouseOut="unselectButton('AgileAdd');">Add Agile Project</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
</tr>
<tr><td colspan="5" class="buttonSeperator" height="1px"></td></tr>
</table> 