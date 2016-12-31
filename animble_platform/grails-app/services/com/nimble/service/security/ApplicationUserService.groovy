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

package com.nimble.service.security

import com.nimble.service.NimbleService
import com.nimble.domain.reference.*
import com.nimble.domain.security.*

class ApplicationUserService extends NimbleService{

    boolean transactional = true

   def prepApplicationUserForSave(ApplicationUser appUser){
   
   		appUser.display_name = prepDisplayNameForSaveUpdate(appUser)
   		appUser.password = prepPasswordForSave(appUser)
        appUser = prepDomainObjectForSave(appUser)
   		appUser.enabled = true
        
		return appUser
   }

   def prepApplicationUserForUpdate(ApplicationUser appUser, String applicationUserEncryptedPassword){

   		appUser.display_name = prepDisplayNameForSaveUpdate(appUser)
   		appUser.password = prepPasswordForUpdate(appUser, applicationUserEncryptedPassword)
   		appUser = prepDomainObjectForUpdate(appUser)
		
		return appUser
   }
   
   def prepDisplayNameForSaveUpdate(ApplicationUser appUser){
   		return "${appUser.last_name},${appUser.first_name}"
   }
   
   def prepPasswordForSave(ApplicationUser appUser){
  		return  springSecurityService.encodePassword(appUser.password)
   }

   def prepPasswordForUpdate(ApplicationUser appUser, String applicationUserEncryptedPassword){
	   if (!applicationUserEncryptedPassword.equals(appUser?.password)){
		   return prepPasswordForSave(appUser)
	   } else {
		   return appUser.password
	   }
  }   
   
   def prepRolesForSave(ApplicationUser appUser,def appRoles){

	   appRoles?.each {
		   appUser = addRole(appUser,new Long(it))
	   }

	   return appUser
 }

   def prepRolesForUpdate(ApplicationUser appUser,def appRoles){

	   appRoles?.each {
	    	   def roleIdToBeSaved = it
	    	   boolean roleIdToBeSavedFound = false
	    	   appUser?.applicationRoles.each{
				   def currentRoleId = it?.applicationRole?.id?.toString()
				   if (roleIdToBeSaved.equals(currentRoleId)){
					   roleIdToBeSavedFound=true
					   //FIXME add in Break
				   }
			   }
			   
			   if (!roleIdToBeSavedFound){
				   appUser = addRole(appUser,new Long(it))
			   }
		}

	   def tmp = [] 
       tmp.addAll appUser?.applicationRoles
	   tmp.each{
			   def currentRole = it
			   def currentRoleId = it?.applicationRole?.id?.toString()
			   if (!appRoles.contains(currentRoleId)){
				   appUser = deleteRole(appUser, currentRole)
			   }
		   }
		
	   return appUser
 }   

   def deleteRole(ApplicationUser appUser,def appRole){
	   appUser.removeFromApplicationRoles(appRole)
	   appRole.delete()
	   return appUser
   }


   def addRole(ApplicationUser appUser,def appRoleId){
	   def appUserAppRole = new ApplicationUserApplicationRole()
	   appUserAppRole.applicationUser = appUser
	   appUserAppRole.applicationRole = ApplicationRole.get(appRoleId)
	   appUserAppRole = prepDomainObjectForSave(appUserAppRole)
	   appUser.addToApplicationRoles(appUserAppRole)
	   return appUser
   }
}