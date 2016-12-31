<%@ page import="com.nimble.domain.reference.Reference;" %>

<g:set var="referenceInstance" value="${request.referenceInstance}" />
<%
if (request.referenceGroup == null) { request.referenceGroup = params.reference_group }
%>
<g:set var="referenceGroup" value="${request.referenceGroup}" scope="request"/>

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Refresh" class="buttonNotSelected" height="25px"><a href="#" onclick="dijit.byId('ProjectView').setHref('/${grailsApplication.metadata['app.name']}/reference/refreshCache');" class="buttonTitle" onMouseOver="selectButton('Refresh');" onMouseOut="unselectButton('Refresh');">Refresh Cache</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="List" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/reference/list';" class="buttonTitle" onMouseOver="selectButton('List');" onMouseOut="unselectButton('List');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% if (referenceGroup != null && !referenceGroup.equals('')){ %>
<td id="Add" class="buttonNotSelected" height="25px"><a href="#" onclick="dijit.byId('ProjectView').setHref('/${grailsApplication.metadata['app.name']}/reference/create?referenceGroup=${referenceGroup}');" class="buttonTitle" onMouseOver="selectButton('Add');" onMouseOut="unselectButton('Add');">Add</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<% } %>


<% if (actionName.equals('show')){ %>
<td id="Update" class="buttonNotSelected" height="25px"><a href="#" onclick="dijit.byId('ProjectView').setHref('/${grailsApplication.metadata['app.name']}/reference/edit/${referenceInstance.id}');" class="buttonTitle" onMouseOver="selectButton('Update');" onMouseOut="unselectButton('Update');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

<% if (actionName.equals('create') || actionName.equals('edit') || actionName.equals('save') || actionName.equals('update')){ %>
<td id="Save" class="buttonNotSelected" height="25px"><a href="#" onclick="sendForm(document.myform, 'ProjectView');" class="buttonTitle" onMouseOver="selectButton('Save');" onMouseOut="unselectButton('Save');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

</tr></table>