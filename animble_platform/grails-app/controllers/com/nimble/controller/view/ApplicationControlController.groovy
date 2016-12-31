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

package com.nimble.controller.view

import com.nimble.domain.view.*
import com.nimble.domain.reference.*
import com.nimble.utils.view.ViewHelper
import javax.servlet.ServletContext
import com.nimble.service.view.ApplicationControlService

class ApplicationControlController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def applicationControlService                             
                             
    def index = {
        render(view: "index")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def results
        if (params.filter != null && params.filter != ''){
        	results = (java.util.ArrayList) ApplicationControlQuery.getApplicationControlsByDomain(params.filter)
        } else {
        	results = ApplicationControl.list(params)
        }
        [applicationControlInstanceList: results, applicationControlInstanceTotal: ApplicationControl.count()]
    }

    def create = {
        def applicationControlInstance = new ApplicationControl()
        applicationControlInstance.properties = params
        return [applicationControlInstance: applicationControlInstance]
    }

    def save = {
        def applicationControlInstance = new ApplicationControl(params)

        applicationControlInstance = applicationControlService.prepApplicationControlForSave(applicationControlInstance)

        if (applicationControlInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), applicationControlInstance.id])}"
            redirect(action: "show", id: applicationControlInstance.id)
        }
        else {
            render(view: "create", model: [applicationControlInstance: applicationControlInstance])
        }
    }

	def show_inc = {
		show()
	}

    def show = {
        def applicationControlInstance = ApplicationControl.get(params.id)
        if (!applicationControlInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), params.id])}"
            redirect(action: "list")
        }
        else {
            [applicationControlInstance: applicationControlInstance]
        }
    }

	def edit_inc = {
		edit()
	}

    def edit = {
        def applicationControlInstance = ApplicationControl.get(params.id)
        if (!applicationControlInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [applicationControlInstance: applicationControlInstance]
        }
    }

    def update = {
        def applicationControlInstance = ApplicationControl.get(params.id)

        if (applicationControlInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (applicationControlInstance.version > version) {
                    
                    applicationControlInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'applicationControl.label', default: 'ApplicationControl')] as Object[], "Another user has updated this ApplicationControl while you were editing")
                    render(view: "edit", model: [applicationControlInstance: applicationControlInstance])
                    return
                }
            }
            
            applicationControlInstance.properties = params
            applicationControlInstance = applicationControlService.prepApplicationControlForUpdate(applicationControlInstance)                        
            
            if (!applicationControlInstance.hasErrors() && applicationControlInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), applicationControlInstance.id])}"
                redirect(action: "show", id: applicationControlInstance.id)
            }
            else {
                render(view: "edit", model: [applicationControlInstance: applicationControlInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def applicationControlInstance = ApplicationControl.get(params.id)
        if (applicationControlInstance) {
            try {
                applicationControlInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControl'), params.id])}"
            redirect(action: "list")
        }
    }

    
    def loadCache = { servletContext ->
     	//load all active view controls
     	def appControls = ApplicationControl.findAll("from ApplicationControl as ac where ac.visible_ind=:visible_ind order by ac.control_ref.display, ac.display_sequence",[visible_ind:true])
		//println 'appControls = ' + appControls
		     	
     	def viewHelper = new ViewHelper(appControls,servletContext)

     	//load all active view controls into app cache     	
     	servletContext["applicationControls"] = viewHelper.prepViewControls()
     	//println 'applicationControls = ' + servletContext["applicationControls"]

		//load all active artifact view heights into app cache
     	servletContext["viewHeights"] = viewHelper.prepViewHeightTotals(ArtifactReference.list())
     	//println 'viewHeights = ' + servletContext["viewHeights"]

    }

    def refreshCache = {
    	//println '********************** refreshCache'
    	loadCache(servletContext)
    	//println '********************** refreshCache'
    	
		flash.message = "${message(code: 'default.refreshed.message', args: [message(code: 'applicationControl.label', default: 'ApplicationControls')])}"
    }
}
