<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<%@ page import="com.nimble.utils.view.ViewHelper;com.nimble.domain.project.*;com.nimble.domain.artifact.*;com.nimble.domain.security.ApplicationUser;com.nimble.utils.view.ViewHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" scope="request"/>
<g:set var="indexMin" value="${request.indexMin}" />
<g:set var="indexSize" value="${request.indexSize}" />

					        <table width="100%"><thead><tr>
					        <th colspan="2">${facetTitle}</th>
					        </tr></thead>
					        <tbody>


							<g:set var="facetSelected" value="${(facetParam != null && !facetParam.equals('')) ? true : false }" />
							<g:set var="indexMax" value="" />

					        <g:each var="fresult" in="${facetResult}" status="index">
					        <g:set var="indexMax" value="${index}" />
					        <g:set var="styleHidden" value="${(index > indexMin) ? 'display:none;' : '' }" />

						    <g:if test="${!facetSelected || (facetSelected && facetParam.equals(fresult.getValue()))}">					            
					            <tr id="f${facetTitle}${index}" class="${(index % 2) == 0 ? 'oddSearchResult' : 'evenSearchResult'}" style="${styleHidden}">
					            <td>&nbsp;${fresult.getKey()}</td>
					            <td style="background-color:white;">
					            
					            <g:if test="${!facetSelected}">
					            <a id="link_f${facetTitle}${index}" title="Click to filter by ${facetTitle}" onclick="prep${facetTitle}FacetSelection('${fresult.getValue()}');" href="#">
					            <img src="/${grailsApplication.metadata['app.name']}/images/apply.png"/>
					            </a>
					            </g:if>
					            
					            <g:if test="${facetSelected}">
								<a id="link_f${facetTitle}${index}" title="Click to remove filter by ${facetTitle}" onclick="prep${facetTitle}FacetSelection();" href="#">
					            <img src="/${grailsApplication.metadata['app.name']}/images/cancel.png"/>
					            </a>
					            </g:if>		            
					            
					            </td>
					            </tr>
					        </g:if>
					        </g:each>
					        <g:if test="${facetResult!= null && !facetSelected && (facetResult.size() > indexSize)}">
					        <tr id="f${facetTitle}PlusSign">
					        <td align="center">
					        <a id="link_f${facetTitle}PlusSign" style="color:#000000;" title="Click to display all possible ${facetTitle}s" onclick="showMoreFacets('f${facetTitle}','${indexMax}');" href="#">
					        <img src="/${grailsApplication.metadata['app.name']}/images/plus_sign.png" />
					        </a>
					        </td>
					        <td></td>
					        </tr>
					        </g:if>
					        </tbody></table>
