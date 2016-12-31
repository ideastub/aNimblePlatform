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

package com.nimble.service.reference

import com.nimble.domain.security.ApplicationUser
import com.nimble.service.NimbleService
import com.nimble.domain.reference.*

class ReferenceService extends NimbleService{

    boolean transactional = true

   def prepReferenceForSave(Reference reference){
        reference.dateCreated = new Date()
   		reference.lastUpdate =  new Date()
   		def currentUser = ApplicationUser.get(springSecurityService.principal.id)
		reference.create_user = currentUser
		reference.update_user = currentUser
		
		return reference
   }

   def prepReferenceForUpdate(Reference reference){
   		reference.lastUpdate =  new Date()
   		def currentUser = ApplicationUser.get(springSecurityService.principal.id)
		reference.update_user = currentUser
		
		return reference
   }
}