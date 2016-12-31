<%@ page import="com.nimble.domain.report.Report;" %>

<g:set var="reportInstance" value="${request.reportInstance}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="List" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/report/index';" class="buttonTitle" onMouseOver="selectButton('List');" onMouseOut="unselectButton('List');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Add" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/report/create';" class="buttonTitle" onMouseOver="selectButton('Add');" onMouseOut="unselectButton('Add');">Add</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>



<% if (actionName.equals('show') || actionName.equals('show_inc')){ %>

<td id="Update" class="buttonNotSelected" height="25px"><a href="#" onclick="location = '/${grailsApplication.metadata['app.name']}/report/edit/${reportInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Update');" onMouseOut="unselectButton('Update');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Delete" class="buttonNotSelected" height="25px"><a href="#" onclick="location = '/${grailsApplication.metadata['app.name']}/report/delete/${reportInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Delete');" onMouseOut="unselectButton('Delete');">Delete</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% }

if (actionName.equals('create') || actionName.equals('save') || actionName.equals('update') || actionName.equals('edit')){

%>

<td id="Save" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('Save');" onMouseOut="unselectButton('Save');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

</tr></table>