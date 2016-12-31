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

package com.nimble.domain.report

import com.nimble.domain.NimbleDomain
import com.nimble.domain.reference.*

/*

   NOT IMPLEMENTING
   system_assigned_version_nbr   int default 5 not null,
   record_type_ref_id            int default 321 not null
   */

class ReportParameter extends NimbleDomain {

	String display
	String description
	ReportParamTypeReference param_type_ref
	String reportParamName
	Integer x_display_sequence
	Integer y_display_sequence
 
   String toString(){
       return display
   }

   String xy_display_sequence(){
   		String xy_display_sequence
   		if (x_display_sequence != null && y_display_sequence != null) {
   			xy_display_sequence = "${x_display_sequence}_${y_display_sequence}"
   		}
		return xy_display_sequence
   }

  static belongsTo = [report:Report]

  static mapping = {
    
      table 'report_parameter'
      id column:'report_param_id'
      report column: 'report_id'
      param_type_ref column:'param_type_ref_id'

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
      display(blank:false)
      reportParamName(blank:false)
	  x_display_sequence(range:1..2)
	  y_display_sequence(range:1..3)
  }
}