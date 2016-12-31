<%@ page import="com.nimble.domain.report.Report;com.nimble.utils.view.ViewHelper;com.nimble.utils.domain.report.ReportHelper;com.nimble.utils.domain.view.*;com.nimble.utils.view.SelectListTransport;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" scope="request" />
<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
<g:set var="reportHelper" value="${new ReportHelper()}" scope="request"/>
<% request.viewHelper.includeParams=params %>


<div class="body" style="overflow-y: hidden;vertical-align:top;width:98%;">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>

<% 
if(params?.location?.equals("REPORTS")){
	request.viewHelper.setSectionTitle('Show Report')
	println(g.include(view:'/layouts/header_block.gsp', params:params))
}
%>

<div class="report_params" style="vertical-align:top;">
<form class="jasperReport" name="jasperReport" id="jasperReport" action="/${grailsApplication.metadata['app.name']}/jasper/">

<% if(params?.location?.equals("PROJECTS") || params?.location?.equals("ARTIFACTS")){ %>
<input type="hidden" name="project_id" value="${request.viewHelper.getProjectId()}"/>
<% } %>

<% if(params?.location?.equals("ARTIFACTS")){ %>
<input type="hidden" name="artifact_id" value="${request.viewHelper.getArtifactId()}"/>
<% } %>

<input type="hidden" name="logo" value="/${grailsApplication.metadata['app.name']}/images/logo_magneto.png"/>

<table border="0" width="100%">
<tr>
<td valign="top">
						<table width="100%" border="0">
							<tr>
						        <td valign="top" class="name" colspan="3">
						          <b>${fieldValue(bean: reportInstance, field: "display")}</b> ${fieldValue(bean: reportInstance, field: "description")}
						        </td>
						    </tr>
							<tr>
						        <td colspan="3">
						          &nbsp;
						        </td>
						    </tr>

<%
							def rows = 0
							for ( x in 1..2 ) {
%>
							<tr>
<%
							def columns = 0
								for ( y in 1..3 ) {
								def x_y = x + '_' + y
%>
							<td id="${x}_${y}">

                    <g:each in="${reportInstance.reportParameters}" status="i" var="reportParam">							
						<g:if test="${x_y == reportParam.xy_display_sequence()}">
						
								<table>
								<tr>
								    <td valign="top" class="name">
								      <label for="reportParam.display">${reportParam.display}</label>
								    </td>
								    <td valign="top" class="value">
										<g:include view="/reports/parameters/${reportParam.param_type_ref.display_code}.gsp" params="[reportParamName:reportParam.reportParamName]" />
								    </td>
								</tr>
								</table>						

						</g:if>
                    </g:each>													          

							</td>
<%
								}
%>
							</tr>
<%								
							}
%>

						</table>

<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td id="HTML" class="buttonNotSelected" height="25px"><a href="#" onclick="runJasperReport('HTML','${reportInstance.report_language_ref.display_code}','${reportInstance.file_name}','${reportInstance.query_name}',document.getElementById('jasperReport'));" class="buttonTitle" onMouseOver="selectButton('HTML');" onMouseOut="unselectButton('HTML');">Run Report</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="XLS" class="buttonNotSelected" height="25px"><a href="#" onclick="runJasperReport('XLS','${reportInstance.report_language_ref.display_code}','${reportInstance.file_name}','${reportInstance.query_name}',document.getElementById('jasperReport'));" class="buttonTitle" onMouseOver="selectButton('XLS');" onMouseOut="unselectButton('XLS');">Export Spreadsheet</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
<td id="PDF" class="buttonNotSelected" height="25px"><a href="#" onclick="runJasperReport('PDF','${reportInstance.report_language_ref.display_code}','${reportInstance.file_name}','${reportInstance.query_name}',document.getElementById('jasperReport'));" class="buttonTitle" onMouseOver="selectButton('PDF');" onMouseOut="unselectButton('PDF');">Export PDF</a></td>
<td class="buttonSeperator" width="1px" height="25px"></td>
</tr>
</table>

</td>
</tr>
</table>
</form>

           </div>
            <div class="report_body">
                <table width="100%" height="100%">           
                    
                        <tr class="prop">
                            
                            <td valign="top" class="value">
								
								<iframe id="reportFrame" width="100%" height="100%" src="/${grailsApplication.metadata['app.name']}/images/clear.gif"></iframe>

                            </td>
                            
                        </tr>
                </table>
            </div>

<%
if(params?.location?.equals("REPORTS")){
	println(g.include(view:'/layouts/footer_block.gsp', params:params))
}
 %>          
        </div>