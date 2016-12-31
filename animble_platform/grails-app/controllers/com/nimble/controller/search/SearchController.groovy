/*

aNimble Platform: Application Lifecycle Management Tool
Copyright (C) 2010-2012 ideaStub, LLC

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

*/

package com.nimble.controller.search

import org.compass.core.engine.SearchEngineQueryParseException
import com.nimble.service.search.SearchService
import org.springframework.util.ClassUtils
import com.nimble.domain.project.*
import com.nimble.domain.artifact.*
import com.nimble.domain.reference.*

class SearchController {
    def searchService

    def index = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            String query = params.q
            Class qType
            String projectName
            String status
            def args = [:]
            args.put("max",10)
            args.put("suggestedQuery",false)
            
            if (params.offset != null && !params.offset.equals("")){
            	args.put("offset",params.offset)
            }
            if (params.fType != null && !params.fType.equals("")){ 
            	qType = ClassUtils.forName(params.fType)
            	args.put("class",qType)
            }
        	//FIXME add search.indexMin, search.resultsMax, search.facetsMax to application settings
            if (params.fProject != null && !params.fProject.equals("")){ 
            	projectName = params.fProject
            	query = query.concat(' projectName:"').concat(projectName).concat('" ')
            }
            if (params.fStatus != null && !params.fStatus.equals("")){ 
            	status = params.fStatus
            	query = query.concat(' display:"').concat(status).concat('" ')
            }
            
        	def searchResult = searchService.search( query, args )

        	args["max"] = 200
        	args["offset"] = null
        	def facetResult = searchService.search( query, args )

        	def typeFacetResult = fetchTypeFacetResult(facetResult, args)
        	def projectFacetResult = fetchProjectFacetResult(facetResult, projectName)
        	def statusFacetResult = fetchStatusFacetResult(facetResult, status)
        	
        	return [searchResult: searchResult, typeFacetResult:typeFacetResult,projectFacetResult:projectFacetResult,statusFacetResult:statusFacetResult]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
    
    def fetchTypeFacetResult = { facetResult, args ->
    	HashMap typeFacetResult = new HashMap()
    	if (args.get('class') == null){
	    	for ( x in facetResult.results ) {
				String shortClassName = ClassUtils.getShortName(x.getClass())
				if (!typeFacetResult.containsKey(shortClassName)){
					typeFacetResult.put(shortClassName,x.getClass().getName())
				}
			}
    	} else {
    		String fullClassName = args.get('class').getName()
			String shortClassName = ClassUtils.getShortName(fullClassName)
			typeFacetResult.put(shortClassName,fullClassName)
    	}
    	
    	return typeFacetResult.sort()
    }

    def fetchProjectFacetResult = { facetResult, projectName ->
		HashMap projectFacetResult = new HashMap()
		if (projectName == null){
			for ( x in facetResult.results ) {
			String resultProjectName
				if (x instanceof Project){
					resultProjectName = x.projectName 
				} else if (x instanceof Artifact) {
					resultProjectName = x.project.projectName
				}
				if (resultProjectName != null){
					projectFacetResult.put(resultProjectName,resultProjectName)
				}
			}
		} else {
			projectFacetResult.put(projectName,projectName)
		}
		return projectFacetResult.sort()
    }

    def fetchStatusFacetResult = { facetResult, status ->
	HashMap statusFacetResult = new HashMap()
	if (status == null){
		//println "*****************"
		for ( x in facetResult.results ) {
		//println x.status_ref.display
		//println x.status_ref.display_code
		String resultStatus

			if (x instanceof Project && x.project_status_ref != null){
				resultStatus = x.project_status_ref 
			}			
			if (x instanceof Artifact && x.status_ref != null){
				resultStatus = x.status_ref.display
			}
			if (resultStatus != null){
				statusFacetResult.put(resultStatus,resultStatus)
			}
		}
		//println "*****************"
	} else {
		statusFacetResult.put(status,status)
	}

	return statusFacetResult.sort()
}
    
    
    def admin = {
            render(view: "admin")
        }
    
    def indexAll = {
        Thread.start {
            searchService.index()
        }
        flash.message = "${message(code: 'default.index.started')}"
        admin()
    }

    def reindexAll = {
        Thread.start {
            searchService.reindex()
        }
        flash.message = "${message(code: 'default.reindex.started')}"
        admin()
    }

    
    def unindexAll = {
        searchService.unindex()
        flash.message = "${message(code: 'default.unindex.started')}"
        admin()
    }
}