<%@ page import="com.nimble.domain.security.ApplicationUser;" %>

<g:set var="applicationUserInstance" value="${request.applicationUserInstance}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="List" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/applicationUser/index';" class="buttonTitle" onMouseOver="selectButton('List');" onMouseOut="unselectButton('List');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Add" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/applicationUser/create';" class="buttonTitle" onMouseOver="selectButton('Add');" onMouseOut="unselectButton('Add');">Add</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>


<% if (actionName.equals('show') || actionName.equals('show_inc')){ %>

<%--
<button dojoType="dijit.form.Button" onclick="dijit.byId('Landing').setHref('/${grailsApplication.metadata['app.name']}/applicationUser/delete/${applicationUserInstance.id}');"><img src="/${grailsApplication.metadata['app.name']}/images/delete.png" alt="Delete"> Delete</button>
--%>

<td id="Update" class="buttonNotSelected" height="25px"><a href="#" onclick="location = '/${grailsApplication.metadata['app.name']}/applicationUser/edit/${applicationUserInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Update');" onMouseOut="unselectButton('Update');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

<% if (actionName.equals('create') || actionName.equals('create_inc') || actionName.equals('edit') || actionName.equals('edit_inc') || actionName.equals('save') || actionName.equals('update')){ %>

<td id="Save" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('Save');" onMouseOut="unselectButton('Save');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

</tr></table>