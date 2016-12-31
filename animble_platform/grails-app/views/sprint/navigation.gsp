<%@ page import="com.nimble.domain.release.Sprint;com.nimble.utils.view.ViewHelper;com.nimble.utils.view.ViewTabs;" %>

<g:set var="sprintInstance" value="${request.sprintInstance}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="ListSprint" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/${session.curProject.projectType}/index/${session.curProject.id}?tab=${ViewTabs.PROJECT_SPRINTS}';" class="buttonTitle" onMouseOver="selectButton('ListSprint');" onMouseOut="unselectButton('ListSprint');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="AddSprint" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/sprint/create?project_id=${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('AddSprint');" onMouseOut="unselectButton('AddSprint');">Add</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>


<% 
if (sprintInstance != null){
	if (actionName.equals('show_viewonly') || actionName.equals('show')){ 

%>

<td id="UpdateSprint" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/${viewHelper.getControllerName(sprintInstance)}/edit/${sprintInstance.id}';" class="buttonTitle" onMouseOver="selectButton('UpdateSprint');" onMouseOut="unselectButton('UpdateSprint');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

	<% } %>

	<% if (actionName.equals('create') || actionName.equals('edit') || actionName.equals('save') || actionName.equals('update') ){ %>
<td id="SaveSprint" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('SaveSprint');" onMouseOut="unselectButton('SaveSprint');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<%
	} 
} 
%>
            
</tr></table>