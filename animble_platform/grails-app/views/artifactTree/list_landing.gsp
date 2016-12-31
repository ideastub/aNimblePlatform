<%@ page import="com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

	<div class="messages">
            <g:if test="${flash.message}">
            <span class="message">${flash.message}</span>
            </g:if>
           <g:hasErrors bean="${artifactInstance}">
            <div class="errors">
                <g:renderErrors bean="${artifactInstance}" as="list" />
            </div>
            </g:hasErrors>
	</div>   

	<div class="nav" style="position:relative;width:100%;">
		<% println(g.include(view:'/artifactTree/navigation.gsp', params:params)) %>
	</div>

            <div class="dialog" style="padding-left:10px;">
                <table>
                    <thead>
                        <tr>
							<th style="visibility:hidden"/>

                            <th><g:message code="artTreeInstanceList.type.label" default="Artifact Type" /></th>
                            
                            <th><g:message code="artTreeInstanceList.version.label" default="Artifact Number" /></th>
                   	    
                            <th><g:message code="artTreeInstanceList.lastUpdate.label" default="Artifact Name" /></th>

                            <th><g:message code="artTreeInstanceList.update_user.label" default="Updated By" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${artTreeInstanceList}" status="i" var="artTreeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>
                            
                               	<table border="0" cellspacing="0" cellpadding="0"><tr>
								<td class="buttonSeperator" width="1px" height="25px"></td>
								<td id="DeleteArtTree${artTreeInstance.id}" class="buttonNotSelected" height="25px"><a href="#" onclick="location.href = '/${grailsApplication.metadata['app.name']}/artifactTree/delete/${artTreeInstance.id}';" class="buttonTitle" onMouseOver="selectButton('DeleteArtTree${artTreeInstance.id}');" onMouseOut="unselectButton('DeleteArtTree${artTreeInstance.id}');">Delete</a></td>
								<td class="buttonSeperator" width="1px" height="25px"></td>
								</tr></table>  
                            
                            </td>
                            
                            <td>&nbsp;${viewHelper.getArtifactDisplayName(artTreeInstance.child)}</td>
                            
                            <td>&nbsp;${fieldValue(bean: artTreeInstance, field: "child.artifact_nbr")}</td>

                            <td>&nbsp;${fieldValue(bean: artTreeInstance, field: "child.artifact_name")}</td>
                        
                            <td>&nbsp;${fieldValue(bean: artTreeInstance, field: "update_user")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            
            