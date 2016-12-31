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

package com.nimble.controller.security

import java.util.HashSet;

import com.nimble.domain.security.ApplicationUser
import com.nimble.service.security.ApplicationUserService
import com.nimble.controller.NimbleController

class ApplicationUserController extends NimbleController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def applicationUserService                             
                             
    def index = {
        render(view: "index")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [applicationUserInstanceList: ApplicationUser.list(params), applicationUserInstanceTotal: ApplicationUser.count()]
    }

	def create_inc = {
		create()
	}

    def create = {
    	def applicationUserInstance = new ApplicationUser()
        applicationUserInstance.properties = params
        HashSet applicationRolesInstance = params.applicationRoles

        return [applicationUserInstance: applicationUserInstance, applicationRolesInstance: applicationRolesInstance]
    }

    def save = {
    	def applicationUserInstance = new ApplicationUser(params)
        HashSet applicationRolesInstance
        
        if (params.applicationRoles != null){
        	if (params.applicationRoles instanceof String){
        		applicationRolesInstance = [params.applicationRoles]
        	} else {
        		applicationRolesInstance = params.applicationRoles
        	}
        }
        applicationUserInstance = applicationUserService.prepApplicationUserForSave(applicationUserInstance)
        applicationUserInstance = applicationUserService.prepRolesForSave(applicationUserInstance,applicationRolesInstance)

        if (!applicationUserInstance.hasErrors() && applicationUserInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'applicationUser.label', default: 'ApplicationUser'), applicationUserInstance.id])}"
            redirect(action: "show", id: applicationUserInstance.id)
        }
        else {
            render(view: "create", model: [applicationUserInstance: applicationUserInstance, applicationRolesInstance: applicationRolesInstance])
        }
    }

	def show_inc = {
		show()
	}

    def show = {
        def applicationUserInstance = ApplicationUser.get(params.id)
        if (!applicationUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationUser.label', default: 'ApplicationUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            [applicationUserInstance: applicationUserInstance]
        }
    }

	def edit_inc = {
		edit()
	}

    def edit = {
        def applicationUserInstance = ApplicationUser.get(params.id)
        HashSet applicationRolesInstance = new HashSet()
        applicationUserInstance.applicationRoles.each{
        	applicationRolesInstance.add(it.applicationRole.id)
        }

        if (!applicationUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationUser.label', default: 'ApplicationUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [applicationUserInstance: applicationUserInstance, applicationRolesInstance: applicationRolesInstance]
        }
    }

    def update = {
        def applicationUserInstance = ApplicationUser.get(params.id)
        String applicationUserEncryptedPassword = new String(applicationUserInstance.password)
        
        HashSet applicationRolesInstance
        
        if (applicationUserInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (applicationUserInstance.version > version) {
                    
                    applicationUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'applicationUser.label', default: 'ApplicationUser')] as Object[], "Another user has updated this ApplicationUser while you were editing")
                    render(view: "edit", model: [applicationUserInstance: applicationUserInstance])
                    return
                }
            }

            applicationUserInstance.properties = params

            if (params.appRoles != null){
            	if (params.appRoles instanceof String){
            		applicationRolesInstance = [params.appRoles]
            	} else {
            		applicationRolesInstance = params.appRoles
            	}
            }
            applicationUserInstance = applicationUserService.prepApplicationUserForUpdate(applicationUserInstance, applicationUserEncryptedPassword )
            applicationUserInstance = applicationUserService.prepRolesForUpdate(applicationUserInstance,applicationRolesInstance)
            
            if (!applicationUserInstance.hasErrors() && applicationUserInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'applicationUser.label', default: 'ApplicationUser'), applicationUserInstance.id])}"
                redirect(action: "show", id: applicationUserInstance.id)
            }
            else {
                render(view: "edit", model: [applicationUserInstance: applicationUserInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationUser.label', default: 'ApplicationUser'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def applicationUserInstance = ApplicationUser.get(params.id)
        if (applicationUserInstance) {
            try {
                applicationUserInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'applicationUser.label', default: 'ApplicationUser'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'applicationUser.label', default: 'ApplicationUser'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationUser.label', default: 'ApplicationUser'), params.id])}"
            redirect(action: "list")
        }
    }
}
