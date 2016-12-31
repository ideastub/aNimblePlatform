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
import com.nimble.domain.project.Project

class Baseline extends NimbleDomain {

      Project project
      
      String baseline_name
      String description
      Date baseline_dt

   String toString(){
       return baseline_name
   }

  static belongsTo = [project:Project]

  static mapping = {
      table 'baseline'
      id column:'baseline_id'
      project column: 'product_ref_id'
      baseline_dt column: 'baseline_dt'
      
      autoTimestamp true
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'
      
  }
}