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

package com.nimble.domain;

import com.nimble.domain.security.ApplicationUser
import com.nimble.domain.NimbleDomain

class DomainHelper {

   def prepDomainObjectForSave(NimbleDomain nimbleDomain){
        nimbleDomain.dateCreated = new Date()
   		nimbleDomain.lastUpdate =  new Date()
   		def currentUser = ApplicationUser.get(0) //FIXME replace this logic with actual user in context
		nimbleDomain.create_user = currentUser
		nimbleDomain.update_user = currentUser
		
		return nimbleDomain
   }

   def prepDomainObjectForUpdate(NimbleDomain nimbleDomain){
   		nimbleDomain.lastUpdate =  new Date()
   		def currentUser = ApplicationUser.get(0) //FIXME replace this logic with actual user in context
		nimbleDomain.update_user = currentUser
		
		return nimbleDomain
   }
}
