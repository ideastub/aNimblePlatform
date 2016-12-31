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

package com.nimble.domain.reference

import com.nimble.domain.NimbleDomain
import com.nimble.domain.reference.ReferenceModificationReference

/*
   category_ref_id               int default 0 not null,
   unique_display_code_ind       int default 1 not null,
   framework_ind                 int default 0 not null,

   */

class ReferenceGroup extends NimbleDomain {

   String toString(){
       return display
   }

   ReferenceModificationReference modification_ref

   String reference_group
   String display
   String description
   //String display_code
   //Integer display_sequence

  static hasMany = [ references : Reference ]

  static constraints = {
      display(blank:false)
      reference_group(blank:false,unique:true)
  }   
                     
  static mapping = {
    
      table 'reference_group'
      id column:'reference_group_id'
      references column:'reference_group'
      modification_ref column:'modification_ref_id'

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
}