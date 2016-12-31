<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.project.*;com.nimble.domain.artifact.*" %>
        <g:set var="viewHelper" value="${request.viewHelper}" />

<div class="body" style="float:left;">

<%
request.viewHelper.setSectionTitle('My Active Assignments')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog" style="padding:5px;">
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>

                            <th>Artifact Type</th>

                            <th>Artifact</th>

                            <th>Artifact Number</th> 

                            <th>Project</th>
                            
                            <th>Project Code</th>

                            <th>Updated</th>
                            
                            <th>Updated By</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${myActiveArtifactInstanceList}" status="i" var="artifactInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td align="center">&nbsp;<a ${(i % 2) == 0 ? "class='oddLink'" : ""} href="#" onClick="location='/${grailsApplication.metadata['app.name']}/${request.viewHelper.getControllerName(artifactInstance)}/index/${artifactInstance.id}'">${artifactInstance.id}</a></td>

                            <td>&nbsp;${viewHelper.getArtifactDisplayName(artifactInstance)}</td>

                            <td>&nbsp;${artifactInstance.artifact_name}</td>

                            <td>&nbsp;${artifactInstance.artifact_nbr}</td>
                        
                            <td>&nbsp;${artifactInstance.project.projectName}</td>

                            <td>&nbsp;${artifactInstance.project.projectCode}</td>

                            <td>&nbsp;${artifactInstance.lastUpdate}</td>

                            <td>&nbsp;${artifactInstance.update_user}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
	        <div class="paginateButtons">
		            <%--
	    	           <g:paginate total="${artifactInstanceTotal}" action="index"/>
		             --%>
            </div>
            
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>             


<br><br>
<%
request.viewHelper.setSectionTitle('Recently Modified')
println(g.include(view:'/layouts/header_block.gsp', params:params))
%>
            <div class="dialog" style="padding:5px;">
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>

                            <th>Artifact Type</th>

                            <th>Artifact</th>

                            <th>Artifact Number</th> 

                            <th>Project</th>
                            
                            <th>Project Code</th>
                            
                            <th>Updated</th>
                            
                            <th>Updated By</th>

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${recentlyUpdatedArtifactInstanceList}" status="i" var="artifactInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td align="center">&nbsp;<a ${(i % 2) == 0 ? "class='oddLink'" : ""} href="#" onClick="location='/${grailsApplication.metadata['app.name']}/${request.viewHelper.getControllerName(artifactInstance)}/index/${artifactInstance.id}'">${artifactInstance.id}</a></td>

                            <td>&nbsp;${viewHelper.getArtifactDisplayName(artifactInstance)}</td>

                            <td>&nbsp;${artifactInstance.artifact_name}</td>

                            <td>&nbsp;${artifactInstance.artifact_nbr}</td>
                        
                            <td>&nbsp;${artifactInstance.project.projectName}</td>

                            <td>&nbsp;${artifactInstance.project.projectCode}</td>

                            <td>&nbsp;${artifactInstance.lastUpdate}</td>

                            <td>&nbsp;${artifactInstance.update_user}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
	        <div class="paginateButtons">
		            <%--
	    	           <g:paginate total="${artifactInstanceTotal}" action="index"/>
		             --%>
            </div>
<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>             

</div>