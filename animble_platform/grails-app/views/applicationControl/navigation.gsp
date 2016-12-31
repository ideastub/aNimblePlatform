<%@ page import="com.nimble.domain.view.ApplicationControl;com.nimble.domain.reference.ArtifactReference;" %>

<g:set var="applicationControlInstance" value="${request.applicationControlInstance}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Refresh" class="buttonNotSelected" height="25px"><a href="#" onclick="dijit.byId('Landing').setHref('/${grailsApplication.metadata['app.name']}/applicationControl/refreshCache');" class="buttonTitle" onMouseOver="selectButton('Refresh');" onMouseOut="unselectButton('Refresh');">Refresh Cache</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="List" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/applicationControl/index';" class="buttonTitle" onMouseOver="selectButton('List');" onMouseOut="unselectButton('List');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Filter" class="buttonNotSelected" height="25px"><g:select name="Filter" noSelection="${['null':'Filter by...']}" from="${(ArtifactReference.list())}" optionKey="id" onchange="location.href = '/${grailsApplication.metadata['app.name']}/applicationControl/index?filter='+this.options[this.selectedIndex].text;" class="menuDropdown"/></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% if (actionName.equals('show') || actionName.equals('show_inc')){ %>
<td id="Update" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/applicationControl/edit/${applicationControlInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Update');" onMouseOut="unselectButton('Update');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>


<% if (actionName.equals('create') || actionName.equals('edit') || actionName.equals('edit_inc') ){ %>
<td id="Save" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('Save');" onMouseOut="unselectButton('Save');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

</tr></table>