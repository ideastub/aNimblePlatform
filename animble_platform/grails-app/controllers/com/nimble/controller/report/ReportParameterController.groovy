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

package com.nimble.controller.report

import com.nimble.domain.report.ReportParameter
import com.nimble.service.report.ReportParameterService
import com.nimble.service.NimbleService

class ReportParameterController extends NimbleService{

    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    def reportParameterService
                             
    def index = {
        render(view: "index")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reportParameterInstanceList: ReportParameter.list(params), reportParameterInstanceTotal: ReportParameter.count()]
    }

	def create_inc = {
		create()
	}

    def create = {
        def reportParameterInstance = new ReportParameter()
        reportParameterInstance.properties = params
        return [reportParameterInstance: reportParameterInstance]
    }

    def save = {
        def reportParameterInstance = new ReportParameter(params)

        reportParameterInstance = reportParameterService.prepReportParameterForSave(reportParameterInstance)

        if (!reportParameterInstance.hasErrors() && reportParameterInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reportParameter.label', default: 'ReportParameter'), reportParameterInstance.id])}"
            redirect(action: "show", id: reportParameterInstance.id)
        }
        else {
            render(view: "create", model: [reportParameterInstance: reportParameterInstance])
        }
    }

	def show_inc = {
		show()
	}

    def show = {
        def reportParameterInstance = ReportParameter.get(params.id)
        if (!reportParameterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportParameter.label', default: 'ReportParameter'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reportParameterInstance: reportParameterInstance]
        }
    }

	def edit_inc = {
		edit()
	}

    def edit = {
        def reportParameterInstance = ReportParameter.get(params.id)
        if (!reportParameterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportParameter.label', default: 'ReportParameter'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reportParameterInstance: reportParameterInstance]
        }
    }

    def update = {
        def reportParameterInstance = ReportParameter.get(params.id)
        if (reportParameterInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reportParameterInstance.version > version) {
                    
                    reportParameterInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reportParameter.label', default: 'ReportParameter')] as Object[], "Another user has updated this ReportParameter while you were editing")
                    render(view: "edit", model: [reportParameterInstance: reportParameterInstance])
                    return
                }
            }
            reportParameterInstance.properties = params

            reportParameterInstance = reportParameterService.prepReportParameterForUpdate(reportParameterInstance)                        
            if (!reportParameterInstance.hasErrors() && reportParameterInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reportParameter.label', default: 'ReportParameter'), reportParameterInstance.id])}"
                redirect(action: "show", id: reportParameterInstance.id)
            }
            else {
                render(view: "edit", model: [reportParameterInstance: reportParameterInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportParameter.label', default: 'ReportParameter'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reportParameterInstance = ReportParameter.get(params.id)
        if (reportParameterInstance) {
            try {
                reportParameterInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reportParameter.label', default: 'ReportParameter'), params.id])}"
                redirect(action: "index")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reportParameter.label', default: 'ReportParameter'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reportParameter.label', default: 'ReportParameter'), params.id])}"
            redirect(action: "list")
        }
    }
}
