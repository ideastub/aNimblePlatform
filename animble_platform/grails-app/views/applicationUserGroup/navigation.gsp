<%@ page import="com.nimble.domain.security.ApplicationUserGroup;" %>

<g:set var="applicationUserGroupInstance" value="${request.applicationUserGroupInstance}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="List" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/applicationUserGroup/index';" class="buttonTitle" onMouseOver="selectButton('List');" onMouseOut="unselectButton('List');">List</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="Add" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/applicationUserGroup/create';" class="buttonTitle" onMouseOver="selectButton('Add');" onMouseOut="unselectButton('Add');">Add</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>


<% if (actionName.equals('show') || actionName.equals('show_inc')){ %>

<%--
<button dojoType="dijit.form.Button" onclick="dijit.byId('Landing').setHref('/${grailsApplication.metadata['app.name']}/applicationUserGroup/delete/${applicationUserGroupInstance.id}');"><img src="/${grailsApplication.metadata['app.name']}/images/delete.png" alt="Delete"> Delete</button>
--%>

<td id="Update" class="buttonNotSelected" height="25px"><a href="#" onclick="location = '/${grailsApplication.metadata['app.name']}/applicationUserGroup/edit/${applicationUserGroupInstance.id}';" class="buttonTitle" onMouseOver="selectButton('Update');" onMouseOut="unselectButton('Update');">Update</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

<% if (actionName.equals('create') || actionName.equals('create_inc') || actionName.equals('edit') || actionName.equals('edit_inc')){ %>

<td id="Save" class="buttonNotSelected" height="25px"><a href="#" onclick="document.myform.submit();" class="buttonTitle" onMouseOver="selectButton('Save');" onMouseOut="unselectButton('Save');"> Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% } %>

</tr></table>