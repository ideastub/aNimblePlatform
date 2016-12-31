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

class ApplicationPrivilege extends NimbleDomain {
   
   String toString(){
       return url + ' ' + configAttribute
   }

   String url
   String configAttribute

   static constraints = {
      url blank: false, unique: true
      configAttribute blank: false
   }
   
   static mapping = {
    
      table 'application_privilege'
      id column:'privilege_id'
      id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]

      autoTimestamp true
      configAttribute column:'config_attribute' 
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version 'system_assigned_version_nbr'
      create_user column:'create_user_id'
      update_user column:'update_user_id'
      active_ind column:'active_ind'      
    
      cache true
     
   }  

}
