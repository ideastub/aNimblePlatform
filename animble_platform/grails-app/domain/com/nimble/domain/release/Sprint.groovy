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

package com.nimble.domain.release

import com.nimble.domain.reference.*
import com.nimble.domain.project.*

class Sprint extends ReleaseDomain {

      String sprintName
      String sprintNumber
      Date sprintStartDate
      Date sprintEndDate

      AgileProject agileProject
      SprintStatusReference sprint_status_ref

   String toString(){
       return sprintName
   }

  //static hasMany = [ artifacts : Artifact ]
    static belongsTo = [agileProject:AgileProject]

  static mapping = {
      //artifacts column:'product_ref_id'
      sprint_status_ref column:'release_status_ref_id'
      agileProject column: 'project_id'
      sprintName column:'release_name'
      sprintNumber column:'release_number'
   	  sprintStartDate column:'start_date'
      sprintEndDate column:'end_date'    	  
   	  discriminator value: 'Sprint'
  }
  
      static constraints = {
        sprintName(validator: {
        	if (it==null || it.equals("")) return ['default.blank.message']
            if (it.contains("\'") || it.contains("\"")) return ['default.invalid.matches']
        })
        sprintNumber(blank:false,unique:true)
        sprintStartDate(blank:false)
        sprintEndDate(blank:false)
    }
  
}