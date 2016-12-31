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

import com.nimble.domain.security.ApplicationUser
//import com.nimble.domain.NimbleDomain

/*
 (
   create_user_id                int default 0 not null,
   update_user_id                int default 0 not null,
   update_count                  int default 0 not null,
   active_ind                    int default 1 not null,
   record_type_ref_id            int default 321 not null
   reference_group               varchar(50),
   app_type_ref_id               int default 0 not null,
   */

//class Reference extends NimbleDomain {
class Reference {

   public Reference(){}
   
   public Reference(Integer id){
     this.id = id
   }
   
   public Reference(String display, String display_code, Integer id){
     this.display = display
     this.display_code = display_code
     this.id = id
   }

   String toString(){
       return display
   }

   Date dateCreated
   Date lastUpdate
   ApplicationUser create_user
   ApplicationUser update_user 
   boolean active_ind      

   String display
   String description
   String display_code
   Integer display_sequence
   
   static constraints = {
       display(validator: {
        	if (it==null || it.equals("")) return ['default.blank.message']
            if (it.contains("\'") || it.contains("\"")) return ['default.invalid.matches']
        })
        display_code(blank:false,unique:true)
   }   
  
  static mapping = {
    
      table 'reference'
      id column:'ref_id'
      id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]

      autoTimestamp true
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version 'system_assigned_version_nbr'
      create_user column:'create_user_id'
      update_user column:'update_user_id'
      active_ind column:'active_ind'      
      discriminator column:'reference_group'
      
  }

}