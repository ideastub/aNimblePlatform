<%@ page import="com.nimble.domain.release.Release;com.nimble.utils.view.ViewHelper;com.nimble.utils.view.ViewTabs;" %>

<g:set var="releaseInstance" value="${request.releaseInstance}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="ListRelease" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/${session.curProject.projectType}/index/${session.curProject.id}?tab=${ViewTabs.PROJECT_RELEASES}';" class="buttonTitle" onMouseOver="selectButton('ListRelease');" onMouseOut="unselectButton('ListRelease');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="AddRelease" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/release/create?project_id=${session.curProject.id}';" class="buttonTitle" onMouseOver="selectButton('AddRelease');" onMouseOut="unselectButton('AddRelease');">Add</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>


<% 
if (releaseInstance != null){
	if (actionName.equals('show_viewonly') || actionName.equals('show')){ 

%>

<td id="UpdateRelease" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/${viewHelper.getControllerName(releaseInstance)}/edit/${releaseInstance.id}';" class="buttonTitle" onMouseOver="selectButton('UpdateRelease');" onMouseOut="unselectButton('UpdateRelease');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

	<% } %>

	<% if (actionName.equals('create') || actionName.equals('edit') || actionName.equals('save') || actionName.equals('update') ){ %>
<td id="SaveRelease" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('SaveRelease');" onMouseOut="unselectButton('SaveRelease');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<%
	} 
} 
%>
            
</tr></table>