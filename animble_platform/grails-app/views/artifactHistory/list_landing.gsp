<%@ page import="com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="padding-left:10px;">
                <table>
                    <thead>
                        <tr>

							<th style="background-color:white;"></th>
                            
                            <th><g:message code="artHistoryInstanceList.version.label" default="Version" /></th>
                   	    
                            <th><g:message code="artHistoryInstanceList.lastUpdate.label" default="Last Updated" /></th>

                            <th><g:message code="artHistoryInstanceList.update_user.label" default="Updated By" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${artHistoryInstanceList}" status="i" var="artHistoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>
                            
                            	<table border="0" cellspacing="0" cellpadding="0"><tr>
								<td class="buttonSeperator" width="1px" height="25px"></td>
								<td id="ShowArtHist${artHistoryInstance.id}" class="buttonNotSelected" height="25px"><a href="#" href="#" onclick="showModal('modal_window','/${grailsApplication.metadata['app.name']}/artifactHistory/show/${artHistoryInstance.id}');" class="buttonTitle" onMouseOver="selectButton('ShowArtHist${artHistoryInstance.id}');" onMouseOut="unselectButton('ShowArtHist${artHistoryInstance.id}');">Show</a></td>
								<td class="buttonSeperator" width="1px" height="25px"></td>
								<td id="CompareArtHist${artHistoryInstance.id}" class="buttonNotSelected" height="25px"><a href="#" onclick="showModal('modal_window','/${grailsApplication.metadata['app.name']}/artifactHistory/compare/${artHistoryInstance.id}');" class="buttonTitle" onMouseOver="selectButton('CompareArtHist${artHistoryInstance.id}');" onMouseOut="unselectButton('CompareArtHist${artHistoryInstance.id}');">Compare</a></td>
								<td class="buttonSeperator" width="1px" height="25px"></td>
								<td id="RollbackArtHist${artHistoryInstance.id}" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/${viewHelper.getControllerName(viewHelper.getSession()?.curArtifact?.artifact_type)}/rollback/${artHistoryInstance.id}';" class="buttonTitle" onMouseOver="selectButton('RollbackArtHist${artHistoryInstance.id}');" onMouseOut="unselectButton('RollbackArtHist${artHistoryInstance.id}');">Rollback</a></td>
								<td class="buttonSeperator" width="1px" height="25px"></td>
								</tr></table>  
                            
                             </td>
                            
                            <td>&nbsp;${fieldValue(bean: artHistoryInstance, field: "version")}</td>

                            <td>&nbsp;${fieldValue(bean: artHistoryInstance, field: "lastUpdate")}</td>
                        
                            <td>&nbsp;${fieldValue(bean: artHistoryInstance, field: "update_user")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            
            