<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<%@ page import="com.nimble.utils.view.ViewHelper;com.nimble.domain.project.*;com.nimble.domain.artifact.*;com.nimble.domain.security.ApplicationUser;com.nimble.utils.view.ViewHelper;" %>

<g:set var="viewHelper" value="${request.viewHelper}" scope="request"/>


    <script type="text/javascript">
        //var focusQueryInput = function() {
          //  document.getElementById("q").focus();
        //}
        
		function prepFacetSelections(fTypeSelection,fProjectSelection,fStatus,offsetOverride){
			var offset = "${params.offset}";
			if (offsetOverride == '') {	offset = offsetOverride	};
			var newURL = serverURL + "/search?q=${params.q}&fType=" + fTypeSelection + "&fProject=" + fProjectSelection + "&fStatus=" + fStatus + "&offset=" + offset;
			location.href = newURL;
		}
		
		function prepTypeFacetSelection(facetSelection){
			if (facetSelection == undefined) { facetSelection = '' };
			prepFacetSelections(facetSelection,'${params.fProject}','${params.fStatus}', '');
		}		

		function prepProjectFacetSelection(facetSelection){
			if (facetSelection == undefined) { facetSelection = '' };
			prepFacetSelections('${params.fType}',facetSelection,'${params.fStatus}', '');
		}

		function prepStatusFacetSelection(facetSelection){
			if (facetSelection == undefined) { facetSelection = '' };
			prepFacetSelections('${params.fType}','${params.fProject}', facetSelection, '');
		}

		<g:set var="indexMin" value="${3}" scope="request"/>
		<g:set var="indexSize" value="${request.indexMin + 1}" scope="request"/>

		var indexMin=${request.indexMin};
		function showMoreFacets(facetType,indexMax){
			showHideRow(facetType + "PlusSign");
			indexMax = indexMax++;
			for (i=indexMin+1; i<=indexMax; i++){
				showHideRow(facetType + i);
			}
		}	
    </script>


<div id="1" style="width:17%;float:left;">  

   			<% request.viewHelper.setSectionTitle("Filter By:")	%>
			<% println(g.include(view:'/layouts/header_block.gsp', params:params)) %>
			<div class="dialog">

				<g:set var="facetParam" value="${params.fProject}" scope="request"/>
				<g:set var="facetResult" value="${projectFacetResult}" scope="request"/>
				<g:set var="facetTitle" value="Project" scope="request"/>
				<% println(g.include(view:'/search/facet_index_inc.gsp')) %>

				<br><br>

				<g:set var="facetParam" value="${params.fType}" scope="request"/>
				<g:set var="facetResult" value="${typeFacetResult}" scope="request"/>
				<g:set var="facetTitle" value="Type" scope="request"/>
				<% println(g.include(view:'/search/facet_index_inc.gsp')) %>

				<br><br>

				<g:set var="facetParam" value="${params.fStatus}" scope="request"/>
				<g:set var="facetResult" value="${statusFacetResult}" scope="request"/>
				<g:set var="facetTitle" value="Status" scope="request"/>
				<% println(g.include(view:'/search/facet_index_inc.gsp')) %>
			
			</div>  
			<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
</div>


<div id="spacer" style="width:1%;float:left;">
&nbsp;
</div>



<div id="2" style="width:80%;float:left;">   
   
  
		    <g:set var="haveQuery" value="${params.q?.trim()}" />
		    <g:set var="haveResults" value="${searchResult?.results}" />

		
			<g:if test="${haveQuery && haveResults}">
				<% request.viewHelper.setSectionTitle("Search Results: <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong> results for <strong>${params.q}</strong>")	%>
			</g:if>
			<g:else>
				<% request.viewHelper.setSectionTitle('Search Results') %>  
			</g:else>

			<% println(g.include(view:'/layouts/header_block.gsp', params:params)) %>
      <div class="dialog">		
		    <g:if test="${haveQuery && !haveResults && !parseException}">

		      <br>
		      Nothing matched your query - <strong>${params.q}</strong>
		      <br><br>
<%--
		      <g:if test="${!searchResult?.suggestedQuery}">
		        <p>Suggestions:</p>
		        <ul>
		          <li>Try a suggested query: <g:link controller="searchable" action="index" params="[q: params.q, suggestQuery: true]">Search again with the <strong>suggestQuery</strong> option</g:link><br />
		            <em>Note: Suggestions are only available when classes are mapped with <strong>spellCheck</strong> options, either at the class or property level.<br />
				The simplest way to do this is add <strong>spellCheck "include"</strong> to the domain class searchable mapping closure.<br />
		                See documentation for details.</em>
		          </li>
		        </ul>
		      </g:if>
--%>

		    </g:if>
		
		    <g:if test="${searchResult?.suggestedQuery}">
		      Did you mean <g:link controller="searchable" action="index" class="oddLink" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?<br>
		    </g:if>
		
		    <g:if test="${parseException}">
		      Your query - <strong>${params.q}</strong> - is not valid.<br>
		      Suggestions:
		      <ul style="background-color:#FFFFFF;margin-bottom: 0px;">
		        <li>Fix the query</li>
		        <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
		          <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong></em><br />
		              <em><g:link controller="searchable" action="index" class="oddLink" params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
		          </li>
		          <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong></em><br />
		              <em><g:link controller="searchable" action="index" class="oddLink" params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
		              <em><g:link controller="searchable" action="index" class="oddLink" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
		          </li>
		        </g:if>
		      </ul>
		    </g:if>
		
		    <g:if test="${haveResults}">
		
			        <table>
			            <thead>
			                <tr>
			                    <th>Id</th>
			                    <th>Type</th>
			                    <th>Project</th>
			                    <th>Name</th>
			                    <th>Description</th>
			                    <th>Last Updated</th>
			                    <th>Updated By</th>                                                                           
			                </tr>
			            </thead>
			            <tbody>
					        <g:each var="result" in="${searchResult.results}" status="index">
					            <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
					            <g:set var="link" value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'index', id: result.id)}" />
					            
						        <tr class="${(index % 2) == 0 ? 'oddSearchResult' : 'evenSearchResult'}">
						            <td>&nbsp;<a id="link_result${index}" ${(index % 2) == 0 ? "class='oddLink'" : ""} href="${link}">${result.id}</a></td>
						            <td>&nbsp;${className}</td>
						            <td>&nbsp;
							            <g:if test="${result instanceof Project}">
								            ${viewHelper.getTruncatedValue(result?.projectName)}
								        </g:if>
							            <g:if test="${result instanceof Artifact}">
								            ${viewHelper.getTruncatedValue(result?.project?.projectName)}
								        </g:if>
						            </td>
						            <td>&nbsp;
						            ${viewHelper.getTruncatedValue(result.toString()).encodeAsHTML()}
						            </td>
						            <td>&nbsp;
							            <g:if test="${result instanceof Artifact}">
								            ${viewHelper.getTruncatedValue(result?.description.toString())}
							            </g:if>
						            </td>
						            <td><g:formatDate date="${result?.lastUpdate}" /></td>
						            <td>${result?.update_user}</td>
						            
					            </tr>
					        </g:each>
			            </tbody>
			        </table>
			
			        <div class="paginateButtons">
			          <g:if test="${haveResults}">
			              <br>
			              <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
			              <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
			              <g:else><g:paginate controller="search" action="index" 
			              params="[q: params.q,fType:params.fType, fProject:params.fProject, fStatus:params.fStatus]"
			              total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/></g:else>
			          </g:if>
			        </div>


		  
			</g:if>
		</div>			
			<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
  
</div>