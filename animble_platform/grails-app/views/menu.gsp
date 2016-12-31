<%@ page import="com.nimble.utils.view.ViewHelper;" %>
<%
ViewHelper vh = null;
if (request.viewHelper == null){
	vh = new ViewHelper();
} else {
	vh = request.viewHelper;
}

%>


<table border="0" cellspacing="0" cellpadding="0" width="100%">

<tr>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<td class="menubuttonSelected" width="3px" height="40px"></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<td id="Dashboard" class="menubuttonNotSelected" width="40px" height="40px" style="white-space:nowrap;"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/dashboard';" class="buttonTitle" onMouseOver="selectMenuButton('Dashboard');" onMouseOut="unselectMenuButton('Dashboard');"><image src="/${grailsApplication.metadata['app.name']}/images/dashboard.png" border="0">&nbsp;Dashboard</a></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<td id="Projects" class="menubuttonNotSelected" width="40px" height="40px" style="white-space:nowrap;"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/project';" class="buttonTitle" onMouseOver="selectMenuButton('Projects');" onMouseOut="unselectMenuButton('Projects');"><image src="/${grailsApplication.metadata['app.name']}/images/projects.png" border="0">&nbsp;Projects</a></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<td id="Reports" class="menubuttonNotSelected" width="40px" height="40px" style="white-space:nowrap;"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/reports?location=REPORTS';" class="buttonTitle" onMouseOver="selectMenuButton('Reports');" onMouseOut="unselectMenuButton('Reports');"><image src="/${grailsApplication.metadata['app.name']}/images/reports.png" border="0">&nbsp;Reports</a></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<sec:access expression="hasRole('ROLE_ADMIN')">
<td id="Administration" class="menubuttonNotSelected" width="40px" height="40px" style="white-space:nowrap;"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}/administration';" class="buttonTitle" onMouseOver="selectMenuButton('Administration');" onMouseOut="unselectMenuButton('Administration');"><image src="/${grailsApplication.metadata['app.name']}/images/administration.png" border="0">&nbsp;Administration</a></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
</sec:access>
<td id="Preferences" class="menubuttonNotSelected" width="40px" height="40px" style="white-space:nowrap;"><a href="#" onclick="location.href='/${grailsApplication.metadata['app.name']}';" class="buttonTitle" onMouseOver="selectMenuButton('Preferences');" onMouseOut="unselectMenuButton('Preferences');"><image src="/${grailsApplication.metadata['app.name']}/images/preferences.png" border="0">&nbsp;Preferences</a></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<td id="Help" class="menubuttonNotSelected" width="40px" height="40px" style="white-space:nowrap;"><a href="http://animbleplatform.ideastub.com?helpKey=${vh.getApplicationSetting('HELPKEY')}" target="_blank" class="buttonTitle" onMouseOver="selectMenuButton('Help');" onMouseOut="unselectMenuButton('Help');"><image src="/${grailsApplication.metadata['app.name']}/images/help.png" border="0">&nbsp;Help</a></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<td class="menubuttonSelected" width="3px" height="40px"></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<td class="menubarTile" height="40px"></td>
<td class="menubarTile" height="40px" valign="middle" align="center">
    <g:form url='[controller: "search", action: "index"]' id="searchForm" name="searchForm" method="get">
        <table cellpadding="0" cellspacing="0" border="0">
        <tr valign="middle" style="vertical-align:middle;" height="20px">
        <td valign="middle" nowrap>
	        <g:textField name="q" value="${vh?.includeParams?.q}" size="40"  style="vertical-align:middle;" />
        	<a href="#" id="Search" onclick="document.forms['searchForm'].submit();" onMouseOver="selectSearchButton('Search');" onMouseOut="unselectSearchButton('Search');" class="buttonTitle">
        	<image style="vertical-align:middle;" height="28px" src="/${grailsApplication.metadata['app.name']}/images/search_button_selected.png" onMouseOver="this.src='/${grailsApplication.metadata['app.name']}/images/search_button_not_selected.png';" onMouseOut="this.src='/${grailsApplication.metadata['app.name']}/images/search_button_selected.png';">
        	</a>
        </td>
        </tr>
        </table>
    </g:form>
</td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
<td class="menubuttonSelected" width="3px" height="40px"></td>
<td class="menubuttonSeperator" width="3px" height="40px"></td>
</tr>

<tr>
<td class="blueline" colspan="22" height="3"></td>
</tr>

</table>
