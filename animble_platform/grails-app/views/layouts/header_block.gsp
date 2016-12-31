<%@ page import="com.nimble.utils.view.ViewHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />


	<table border="0" cellspacing="0" cellpadding="0" style="width:100%;">
	
	<tr>
	<td style="background-image:url(/${grailsApplication.metadata['app.name']}/images/top_left_corner_white_background.png)" width="6px" height="3px"></td>
	<td style="background-color:white;" style=""></td>
	<td style="background-image:url(/${grailsApplication.metadata['app.name']}/images/top_right_corner_white_background.png)" width="6px" height="3px"></td>
	</tr>
	
	<tr>
	<td style="background-image:url(/${grailsApplication.metadata['app.name']}/images/left_side_background.png)" width="6px" height="35px"></td>
	<td style="background-image:url(/${grailsApplication.metadata['app.name']}/images/center_tile_background.png)" height="35px"><span class="sectionTitle">${viewHelper.getAndClearSectionTitle()}</span></td>
	<td style="background-image:url(/${grailsApplication.metadata['app.name']}/images/right_side_background.png)" width="6px" height="35px"></td>
	</tr>

	<tr><td colspan="3" style="background-color:white;" height="10px"></td></tr>

	</table>		