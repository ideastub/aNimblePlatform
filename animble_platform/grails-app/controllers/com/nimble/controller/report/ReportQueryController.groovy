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

package com.nimble.controller.report

import com.nimble.domain.artifact.*
import org.hibernate.Hibernate

class ReportQueryController {

	def executeJasperReport = { reportResults ->
		chain(controller:'jasper',action:'index',model:[data:reportResults],params:params)	
	}

    def artifact_summary = {
		Long project_id = new Long(params.project_id)
        String reportQuery = "select a from Artifact a where a.project.id = :project_id order by a.artifact_name"

        ArrayList reportResults
		if (project_id != null && project_id != '') {
	        reportResults = Artifact.executeQuery(reportQuery,[project_id:project_id])
	        reportResults.each{
	  			Hibernate.initialize(it.project)
	  			Hibernate.initialize(it.version_ref)
	  			Hibernate.initialize(it.planned_version_ref)
	  			Hibernate.initialize(it.status_ref)
	  			Hibernate.initialize(it.priority_ref)
	
			}
		}
		
		
		
        
		executeJasperReport(reportResults)
    }

}
