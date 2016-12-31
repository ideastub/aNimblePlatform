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

package com.nimble.controller.reference

import com.nimble.domain.reference.*
import com.nimble.utils.domain.ReferenceHelper
import com.nimble.service.reference.ReferenceService

class ReferenceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def referenceService
                             
    def index = {
        //redirect(action: "list", params: params)
        landing()
    }

    def menu_tree = {
        String menuQuery
        String ref_group = params.reference_group 
        String ref_prefix
         
        if (ref_group == null || ref_group ==''){
        	ref_prefix='g'
        	menuQuery = "select new map('" + ref_prefix + "',rg.id,rg.display,rg.reference_group,'true') from ReferenceGroup rg where rg.reference_group != 'Null' and rg.modification_ref.display_code != 'NOACCESS' and rg.reference_group not in ( 'ApplicationSetting', 'Role', 'ReferenceModification', 'Report', 'Priority', 'Status', 'Version', 'Assigned' ) order by rg.display"
		} else {
			ref_prefix='r'
        	menuQuery = "select new map('" + ref_prefix + "',r.id,r.display,'" + ref_group + "','false') from " + ref_group + "Reference r where r.display_code != '- SELECT -' order by r.display"
		}        
        
        ArrayList menuTree = ReferenceGroup.executeQuery(menuQuery)
	        
        [referenceInstanceList: menuTree]        
        
    }

    def landing = {
        render(view: "landing")
        //show()
    }

    def menu = {
        render(view: "menu")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 100, 100)
        [referenceInstanceList: Reference.list(params), referenceInstanceTotal: Reference.count()]
    }

    def create = {
        def referenceGroup = params?.referenceGroup
        def referenceInstance
        if (referenceGroup != null) {
	        def referenceClass = grailsApplication.classLoader.loadClass('com.nimble.domain.reference.' + referenceGroup + 'Reference')
	        referenceInstance = referenceClass.newInstance();
	        referenceInstance.properties = params
        }
        return [referenceInstance: referenceInstance, referenceGroup: referenceGroup]
    }

    def save = {
        def referenceGroup = params?.referenceGroup
        def referenceInstance
        if (referenceGroup != null) {
	        def referenceClass = grailsApplication.classLoader.loadClass('com.nimble.domain.reference.' + referenceGroup + 'Reference')
	        referenceInstance = referenceClass.newInstance();
	        referenceInstance.properties = params

	        referenceInstance = referenceService.prepReferenceForSave(referenceInstance)
        }

        if (referenceInstance?.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reference.label', default: 'Reference'), referenceInstance.id])}"
            redirect(action: "show", id: referenceInstance.id)
        }
        else {
            render(view: "create", model: [referenceInstance: referenceInstance, referenceGroup: referenceGroup])
        }
    }

    def show = {
        def referenceInstance = Reference.get(params.id)
        def referenceGroup = params?.reference_group

        if (!referenceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reference.label', default: 'Reference'), params.id])}"
            redirect(action: "list")
        }
        else {
            [referenceInstance: referenceInstance, referenceGroup: referenceGroup]
        }
    }

    def edit = {
        def referenceInstance = Reference.get(params.id)
        if (!referenceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reference.label', default: 'Reference'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [referenceInstance: referenceInstance]
        }
    }

    def update = {
        def referenceInstance = Reference.get(params.id)
        if (referenceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (referenceInstance.version > version) {
                    
                    referenceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reference.label', default: 'Reference')] as Object[], "Another user has updated this Reference while you were editing")
                    render(view: "edit", model: [referenceInstance: referenceInstance])
                    return
                }
            }
            referenceInstance.properties = params

            referenceInstance = referenceService.prepReferenceForUpdate(referenceInstance)
            if (!referenceInstance.hasErrors() && referenceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reference.label', default: 'Reference'), referenceInstance.id])}"
                redirect(action: "show", id: referenceInstance.id)
            }
            else {
                render(view: "edit", model: [referenceInstance: referenceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reference.label', default: 'Reference'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def referenceInstance = Reference.get(params.id)
        if (referenceInstance) {
            try {
                referenceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reference.label', default: 'Reference'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reference.label', default: 'Reference'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reference.label', default: 'Reference'), params.id])}"
            redirect(action: "list")
        }
    }

    def loadCache = { servletContext ->
     	//load all active reference data defaults
     	def refDataResults = Reference.findAll("from Reference as ref where ref.display_code=:display_code",[display_code:'- SELECT -'])

        def refHelper = new ReferenceHelper(refDataResults,servletContext)
        //println '**************************************** refDataDefaults=' + refHelper.prepRefDataDefaults()  
       	servletContext["refDataDefaults"] = refHelper.prepRefDataDefaults()

    }

    def refreshCache = {
    	loadCache(servletContext)
    	
		flash.message = "${message(code: 'default.refreshed.message', args: [message(code: 'reference.label', default: 'Reference Data')])}"
    }
}
