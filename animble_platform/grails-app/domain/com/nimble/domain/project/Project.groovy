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

package com.nimble.domain.project

import com.nimble.domain.NimbleDomain
import com.nimble.domain.artifact.Artifact
import com.nimble.domain.project.Baseline
import com.nimble.domain.release.Release
import com.nimble.domain.reference.*

class Project extends NimbleDomain {

      /* FUTURE FIELDS
      Client client
      ApplicationUser projectManager
      ProjectTeam projectTeam
      */
      
      String projectName
      String projectCode
      Date projectStartDate
      Date projectEndDate
      ProjectStatusReference project_status_ref

   String toString(){
       return projectName
   }

  static hasMany = [ baseLines : Baseline, artifacts : Artifact, releases: Release ]

  static fetchMode = [project_status_ref:'eager']                     
                     
  static mapping = {
      table 'project'
      id column:'project_id'
      artifacts column:'product_ref_id'
      baseLines column:'product_ref_id'
      releases column:'product_ref_id'
   	  project_status_ref column:'project_status_ref_id'
    	  
      autoTimestamp true
      id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'
      create_user column:'create_user_id'
      update_user column:'update_user_id'
      active_ind column:'active_ind'
      
  }
  
      static constraints = {
        projectName(validator: {
        	if (it==null || it.equals("")) return ['default.blank.message']
            if (it.contains("\'") || it.contains("\"")) return ['default.invalid.matches']
        })
        projectCode(blank:false,unique:true)
        projectEndDate(nullable:true)
  }

  static searchable = {
      update_user component: true
      project_status_ref component: true
      nullValue: ''
  }
  
}