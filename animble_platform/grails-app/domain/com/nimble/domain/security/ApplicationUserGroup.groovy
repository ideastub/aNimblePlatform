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
import com.nimble.domain.reference.*
import com.nimble.domain.security.ApplicationUser

/*
missing attributes
   user_id                       int default 0 not null,
   user_group_ref_id             int default 0 not null,
   create_dt                     datetime default current_timestamp,
   create_user_id                int default 0 not null,
   update_dt                     datetime default current_timestamp,
   update_user_id                int default 0 not null,
   active_ind                    int default 1 not null,
   record_type_ref_id            int default 321 not null
);

   */

class ApplicationUserGroup extends NimbleDomain {

   ApplicationUser user
   UserGroupReference user_group_ref
   String email

   String toString(){
       return user_group_ref.display
   }

  static mapping = {
    
      table 'application_user_group'
      id column:'application_user_group_id'
      user column:'user_id'
      user_group_ref column:'user_group_ref_id'
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'
  }
}