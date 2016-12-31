<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.*; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<table border="0" cellspacing="0" cellpadding="0"><tr>
<td class="buttonSeperator" width="1px" height="25px"></td>

<td id="RunIndex" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/search/indexAll';" class="buttonTitle" onMouseOver="selectButton('RunIndex');" onMouseOut="unselectButton('RunIndex');">Run Index</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

<td id="RunReIndex" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/search/reindexAll';" class="buttonTitle" onMouseOver="selectButton('RunReIndex');" onMouseOut="unselectButton('RunReIndex');">Run Re-Index</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>

</tr></table>  