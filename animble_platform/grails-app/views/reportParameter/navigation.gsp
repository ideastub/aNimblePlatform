<%@ page import="com.nimble.domain.report.ReportParameter;" %>

<g:set var="reportParameterInstance" value="${request.reportParameterInstance}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="List" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/reportParameter/index';" class="buttonTitle" onMouseOver="selectButton('List');" onMouseOut="unselectButton('List');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Add" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/reportParameter/create';" class="buttonTitle" onMouseOver="selectButton('Add');" onMouseOut="unselectButton('Add');">Add</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>


<% if (actionName.equals('show') || actionName.equals('show_inc')){ %>

<td id="Update" class="buttonNotSelected" height="25px"><a href="#" onclick="location = '/${grailsApplication.metadata['app.name']}/reportParameter/edit/${reportParameterInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Update');" onMouseOut="unselectButton('Update');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Delete" class="buttonNotSelected" height="25px"><a href="#" onclick="location = '/${grailsApplication.metadata['app.name']}/reportParameter/delete/${reportParameterInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Delete');" onMouseOut="unselectButton('Delete');">Delete</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>


<% if (actionName.equals('create') || actionName.equals('create_inc') || actionName.equals('edit') || actionName.equals('edit_inc') || actionName.equals('save') || actionName.equals('update')){ %>

<td id="Save" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('Save');" onMouseOut="unselectButton('Save');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

</tr></table>