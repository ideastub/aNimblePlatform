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

import org.apache.commons.lang.builder.HashCodeBuilder
import com.nimble.domain.NimbleDomain

class ApplicationUserApplicationRole extends NimbleDomain implements Serializable {

	ApplicationUser applicationUser
	ApplicationRole applicationRole

	String toString(){
		return 'User=' + applicationUser?.id + '; Role=' + applicationRole?.id
	}
	
	boolean equals(other) {
		if (!(other instanceof ApplicationUserApplicationRole)) {
			return false
		}

		other.applicationUser?.id == applicationUser?.id &&
			other.applicationRole?.id == applicationRole?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (applicationUser) builder.append(applicationUser.id)
		if (applicationRole) builder.append(applicationRole.id)
		builder.toHashCode()
	}

	static ApplicationUserApplicationRole get(long applicationUserId, long applicationRoleId) {
		find 'from ApplicationUserApplicationRole where applicationUser.id=:applicationUserId and applicationRole.id=:applicationRoleId',
			[applicationUserId: applicationUserId, applicationRoleId: applicationRoleId]
	}

	static ApplicationUserApplicationRole create(ApplicationUser applicationUser, ApplicationRole applicationRole, boolean flush = false) {
		new ApplicationUserApplicationRole(applicationUser: applicationUser, applicationRole: applicationRole).save(flush: flush, insert: true)
	}

	static boolean remove(ApplicationUser applicationUser, ApplicationRole applicationRole, boolean flush = false) {
		ApplicationUserApplicationRole instance = ApplicationUserApplicationRole.findByApplicationUserAndApplicationRole(applicationUser, applicationRole)
		if (!instance) { return false }
		instance.delete(flush: flush)
		true
	}

	static void removeAll(ApplicationUser applicationUser) {
		executeUpdate 'DELETE FROM ApplicationUserApplicationRole WHERE applicationUser=:applicationUser', [applicationUser: applicationUser]
	}

	static void removeAll(ApplicationRole applicationRole) {
		executeUpdate 'DELETE FROM ApplicationUserApplicationRole WHERE applicationRole=:applicationRole', [applicationRole: applicationRole]
	}

//	static belongsTo = [applicationUser:ApplicationUser]

	
	static mapping = {
	     table 'app_user_app_role'
         id column:'user_role_id'
       	 //id composite: ['applicationRole', 'applicationUser']
         id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]
        	 
       	 applicationUser column:'user_id'
    	 applicationRole column:'role_id'
         dateCreated column:'create_dt' 
         lastUpdate column:'update_dt'
         version column:'system_assigned_version_nbr'
         create_user column:'create_user_id'
         update_user column:'update_user_id'
	
	}
}