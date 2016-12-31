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

package com.nimble.domain.security

import com.nimble.domain.NimbleDomain

/*
missing attributes
   position_ref_id               int default 0 not null,
   active_ind                    int default 1 not null,
   record_type_ref_id            int default 321 not null
   */

class ApplicationUser extends NimbleDomain {

	String first_name
	String last_name
	String display_name
	//String user_login
	String password
	String email
	boolean password_reset_ind

	String username
	boolean enabled     //FIXME active_ind still exits for parent but is not mapped
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

   String toString(){
       return display_name
   }

   Set<ApplicationRole> getAuthorities() {
		ApplicationUserApplicationRole.findAllByApplicationUser(this).collect { it.applicationRole } as Set
   }
   
   static hasMany = [ applicationRoles : ApplicationUserApplicationRole ]

   static constraints = {
		username blank: false, unique: true
		password blank: false
		first_name blank: false
		last_name blank: false
		email blank: false
		applicationRoles( validator: {
		   if (it == null || it.isEmpty()) return ['default.null.message', ['applicationRoles','applicationUser'].toArray() as Object[], '']
		})
   }

   static mapping = {
    
      table 'application_user'
      id column:'user_id'
      applicationRoles column:'user_id'
            
      id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]      
      
      username column:'user_login'
      enabled column:'active_ind' 
      enabled insertable: false, updateable: false
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'
      create_user column:'create_user_id'
      update_user column:'update_user_id'
      accountExpired: 'account_expired'
	  accountLocked: 'account_locked'
	  passwordExpired: 'password_expired'
      
   }

  static searchable = {
  	  root false
  }
  
}