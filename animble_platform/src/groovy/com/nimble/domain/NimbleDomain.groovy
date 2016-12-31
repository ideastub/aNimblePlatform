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

package com.nimble.domain

import com.nimble.domain.security.ApplicationUser

/*
missing attributes
   update_count                  int default 0 not null,
   record_type_ref_id            int default 321 not null
   */

abstract class NimbleDomain {

      Date dateCreated
      Date lastUpdate
      ApplicationUser create_user
      ApplicationUser update_user 
      boolean active_ind      

   String classToString(){
       return this.class.name.substring(0,1).toLowerCase() + this.class.name.substring(1)
   }

}