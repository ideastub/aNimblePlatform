<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.*; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="artifactInstance" value="${request.artifactInstance}" />
<g:set var="viewHelper" value="${request.viewHelper}" />

<%
//println actionName
%>

<script type="text/javascript">
        
        function prepDependencySave(inboundForm,artifactId) {
        inboundForm.elements['child_id'].value=artifactId;
        }
        
</script>
<g:form method="post" name="artifact_menu" action="save"> 


<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>

<% if (!actionName.equals('create') && !actionName.equals('save') ){ %>
<td id="AddArtifactTree" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/artifactTree/create?artifactView=false';" class="buttonTitle" onMouseOver="selectButton('AddArtifactTree');" onMouseOut="unselectButton('AddArtifactTree');">Add</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<% } %>

<% if (actionName.equals('create') || actionName.equals('save')){ %>
<td id="SaveArtifactTree" class="buttonNotSelected" height="25px"><a href="#" onclick="document.artifact_menu.submit();" class="buttonTitle" onMouseOver="selectButton('SaveArtifactTree');" onMouseOut="unselectButton('SaveArtifactTree');">Save</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<% } %>

<% if (actionName.equals('create') || actionName.equals('save')){ %>
<td id="CancelArtifactTree" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/${viewHelper.getControllerName(viewHelper.getSession()?.curArtifact?.artifact_type)}/index/${viewHelper.getSession()?.curArtifact?.id}?tab=ARTIFACT_DEPENDENCIES';" class="buttonTitle" onMouseOver="selectButton('CancelArtifactTree');" onMouseOut="unselectButton('CancelArtifactTree');">Cancel</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<% } %>

</tr></table>
<input type='hidden' name='child_id' value='' />
  </g:form>