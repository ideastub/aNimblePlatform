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

package com.nimble.domain.artifact

import com.nimble.domain.NimbleDomain
import com.nimble.domain.reference.RelationReference
import com.nimble.domain.artifact.*
import com.nimble.domain.project.Baseline
import com.nimble.domain.security.ApplicationUser


/*
      ,[child_artifact_ref_id]
      ,[parent_artifact_ref_id]
   */

class ArtifactTreeHistory extends NimbleDomain {

   RelationReference relation_ref
   Artifact child
   Artifact parent
   ArtifactTree requirement_tree
   Baseline baseline
   Date history_dt
   ApplicationUser history_user

  static mapping = {
    
      table 'requirement_tree_history'
      id column:'requirement_tree_history_id'
      relation_ref column:'relation_ref_id'
      child column:'child_id'
      parent column:'parent_id'
      requirementTree column:'requirement_tree_id'
      baseline column:'baseline_id'
      history_dt column:'history_dt'
      history_user column:'history_user_id'

      autoTimestamp true
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'

  }
    
 


}