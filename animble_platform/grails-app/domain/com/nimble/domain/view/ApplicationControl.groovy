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

package com.nimble.domain.view

import com.nimble.domain.NimbleDomain
import com.nimble.domain.reference.*

/*
missing attributes
   application_view_id           int default 0 not null,
   control_type_ref_id           int default 0 not null,
   model_column_ref_id           int default 0 not null,
   application_custom_control_id int default 0 not null,
   app_control_user_defined_id   int default 0 not null,
   control_format                varchar(50),
   source_ref_id                 int default 0 not null,
   locked_ind                    int default 0 not null,
   disabled_ind                  int default 0 not null,
   required_ind                  int default 0 not null,
   focus_lost_script             text,
   focus_gained_script           text,
   image_path                    varchar(255),
   scrollpane_ind                int default 0 not null,
   grow_height                   decimal default 0 not null,
   grow_width                    int default 1 not null,
);
   */

class ApplicationControl extends NimbleDomain {

   Integer display_sequence
   String control_text
   String control_description
   String default_value
   Boolean visible_ind
   Integer unit_width
   Integer unit_height
   String control
   ArtifactReference control_ref

   String toString(){
       return control + " - " + control_text
   }

   static constraints = {
	   control blank: false, unique: true
	   control_text blank: false
  }   
   
  static mapping = {
    
      table 'application_control'
      id column:'application_control_id'
      control column:'init_script'
      control_ref column:'control_ref_id'

      autoTimestamp true
      id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'
      create_user column:'create_user_id'
      update_user column:'update_user_id'
      active_ind column:'active_ind'
  }
}