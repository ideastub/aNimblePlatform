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
import com.nimble.domain.reference.*
import com.nimble.domain.project.*
import com.nimble.domain.security.*
import com.nimble.domain.release.*

/*

   NOT IMPLEMENTING
   assigned_ref_id               int not null default 0,
   last_modified_version_ref_id  int not null default 0,
   report_sequence               int default 0,
   report_outline                varchar(255),

   */

class Artifact extends NimbleDomain {

	public static final String TREE_ROOT = 'TREE_ROOT'
	public static final String TREE_PARENT = 'TREE_PARENT'
	public static final String TREE_CHILD = 'TREE_CHILD'
	
   ArtifactLevelReference artifact_level_ref
   ComplexityReference complexity_ref
   ComponentTypeReference component_type_ref
   ApplicationUser author_ref
   ApplicationUser assigned_user
   ApplicationUserGroup assigned_user_group
   CategoryReference category_ref
   ModuleReference module_ref
   OriginCategoryReference origin_category_ref
   
   Project project
   Baseline last_updated_baseline
   Release release

   String artifact_name
   String description
   double effort
   String rationale
   String origin
   String goal
   String context
   String precondition
   String postcondition
   String summary
   String change_reason
   String change_made
   String external_references
   boolean removed_ind
   int artifact_seq
   String artifact_nbr

   String custom_text1
   String custom_text2
   String custom_text3
   String custom_text4
   CustomRef1Reference custom1_ref
   CustomRef2Reference custom2_ref
   CustomRef3Reference custom3_ref
   CustomRef4Reference custom4_ref
   Date custom_date1
   Date custom_date2
   String custom_memo1
   String custom_memo2
   int custom_int1
   int custom_int2
   double custom_double1

   String toString(){
       return artifact_name
   }

  static hasMany = [ artifactHistories : ArtifactHistory, artifactChildren : ArtifactTree, artifactParents : ArtifactTree  ]
  static fetchMode = [artifact_level_ref:'eager', complexity_ref:'eager', component_type_ref:'eager', author_ref:'eager', assigned_user:'eager', assigned_user_group:'eager', category_ref:'eager', module_ref:'eager', origin_category_ref:'eager', custom_ref1:'eager', custom_ref2:'eager', custom_ref3:'eager', custom_ref4:'eager']
  static mappedBy = [artifactChildren:'child',artifactParents:'parent']
  static belongsTo = [project:Project, last_updated_baseline:Baseline, release: Release]

  static mapping = {
    
      table 'artifact'
      id column:'artifact_id'
      //discriminator column:'artifact_ref_id'
      /*FIXME appears custom discriminator column not working per docs; therefore osrmt schema will require upgrade script to pull artifact_ref_id into class column;  http://jira.codehaus.org/browse/GRAILS-5168  */      
      artifact_level_ref column:'artifact_level_ref_id'
      //product_ref column:'product_ref_id'
      complexity_ref column:'complexity_ref_id'
      component_type_ref column:'component_type_ref_id'
      author_ref column:'author_ref_id'
      assigned_user column:'assigned_user_id'
      assigned_user_group column:'assigned_user_group_id'
      category_ref column:'category_ref_id'
      module_ref column:'module_ref_id'
      origin_category_ref column:'origin_category_ref_id'
      custom1_ref column:'custom1_ref_id'
      custom2_ref column:'custom2_ref_id'
      custom3_ref column:'custom3_ref_id'
      custom4_ref column:'custom4_ref_id'
    	  
      artifactHistories column:'artifact_history_id'
      artifactChildren column:'requirement_tree_id'
      artifactParents column:'requirement_tree_id'

      project column: 'product_ref_id'
      last_updated_baseline column:'last_updated_baseline_id'
      release column: 'release_id'

      id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]
      //version false /*FIXME turn version on*/

      autoTimestamp true
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'
      create_user column:'create_user_id'
      update_user column:'update_user_id'
      active_ind column:'active_ind'

  }
    
  static constraints = {
      artifact_name(validator: {
        	if (it==null || it.equals("")) return ['default.blank.message']
            if (it.contains("\'") || it.contains("\"")) return ['default.invalid.matches']
        })
      artifact_nbr(blank:false,unique:true)

      origin(nullable:true)
      change_made(nullable:true)
      assigned_user(nullable:true)
      assigned_user_group(nullable:true)
      custom_text1(nullable:true)
      custom_text2(nullable:true)
      custom_text3(nullable:true)
      custom_text4(nullable:true)
      custom_memo1(nullable:true)
      custom_memo2(nullable:true)
      custom_date1(nullable:true)
      custom_date2(nullable:true)
      custom1_ref(nullable:true)
      custom2_ref(nullable:true)
      custom3_ref(nullable:true)
      custom4_ref(nullable:true)
      summary(nullable:true)      
      rationale(nullable:true)      
      goal(nullable:true)
      context(nullable:true)
      postcondition(nullable:true)
      precondition(nullable:true)
      change_reason(nullable:true)
      external_references(nullable:true)
      component_type_ref(nullable:true)
      category_ref(nullable:true)
      origin_category_ref(nullable:true)
      module_ref(nullable:true)
      author_ref(nullable:true)
      complexity_ref(nullable:true)
      artifact_level_ref(nullable:true)
      release(nullable:true)
  }

  static searchable = {
      update_user component: true
      project component: true
      nullValue: ''
  } 
  
}