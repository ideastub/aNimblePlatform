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

import com.nimble.domain.security.ApplicationSetting
import com.nimble.service.security.ApplicationSettingService
import com.nimble.controller.NimbleController
import javax.servlet.ServletContext

class ApplicationSettingController {	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def applicationSettingService                             
                             
    def index = {
        render(view: "index")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [applicationSettingInstanceList: ApplicationSetting.list(params), applicationSettingInstanceTotal: ApplicationSetting.count()]
    }

    def create = {
        def applicationSettingInstance = new ApplicationSetting()
        applicationSettingInstance.properties = params
        return [applicationSettingInstance: applicationSettingInstance]
    }

    def save = {
        def applicationSettingInstance = new ApplicationSetting(params)

        applicationSettingInstance = applicationSettingService.prepApplicationSettingForSave(applicationSettingInstance)

        if (!applicationSettingInstance.hasErrors() && applicationSettingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'applicationSetting.label', default: 'ApplicationSetting'), applicationSettingInstance.id])}"
            redirect(action: "show", id: applicationSettingInstance.id)
        }
        else {
            render(view: "create", model: [applicationSettingInstance: applicationSettingInstance])
        }
    }

	def show_inc = {
		show()
	}

    def show = {
        def applicationSettingInstance = ApplicationSetting.get(params.id)
        if (!applicationSettingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationSetting.label', default: 'ApplicationSetting'), params.id])}"
            redirect(action: "list")
        }
        else {
            [applicationSettingInstance: applicationSettingInstance]
        }
    }

	def edit_inc = {
		edit()
	}

    def edit = {
        def applicationSettingInstance = ApplicationSetting.get(params.id)
        if (!applicationSettingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationSetting.label', default: 'ApplicationSetting'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [applicationSettingInstance: applicationSettingInstance]
        }
    }

    def update = {
        def applicationSettingInstance = ApplicationSetting.get(params.id)

        if (applicationSettingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (applicationSettingInstance.version > version) {
                    
                    applicationSettingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'applicationSetting.label', default: 'ApplicationSetting')] as Object[], "Another user has updated this ApplicationSetting while you were editing")
                    render(view: "edit", model: [applicationSettingInstance: applicationSettingInstance])
                    return
                }
            }
            
            applicationSettingInstance.properties = params

            applicationSettingInstance = applicationSettingService.prepApplicationSettingForUpdate(applicationSettingInstance)                        
            
            //FIXME update of value_string produces error. appears to be related to a constraint?
            //FIXME update of value_date produces error.  appears to be invalid date format
            if (!applicationSettingInstance.hasErrors() && applicationSettingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.needs.restart.message', args: [message(code: 'applicationSetting.label', default: 'ApplicationSetting'), applicationSettingInstance.id])}"
                redirect(action: "show", id: applicationSettingInstance.id)
            }
            else {
                render(view: "edit", model: [applicationSettingInstance: applicationSettingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationSetting.label', default: 'ApplicationSetting'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def applicationSettingInstance = ApplicationSetting.get(params.id)
        if (applicationSettingInstance) {
            try {
                applicationSettingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'applicationSetting.label', default: 'ApplicationSetting'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'applicationSetting.label', default: 'ApplicationSetting'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationSetting.label', default: 'ApplicationSetting'), params.id])}"
            redirect(action: "list")
        }
    }

    def loadCache = { servletContext ->
    	def appSettings = ApplicationSetting.findAll()
        HashMap appSettingsMap = new HashMap()

    	appSettings.each {
			appSettingsMap.put(it.setting_ref.display_code, it.displayValue())    	                       
    	}
    	
    	servletContext["applicationSettings"] = appSettingsMap

    }    
}