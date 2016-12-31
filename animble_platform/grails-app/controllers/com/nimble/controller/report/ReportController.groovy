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

import com.nimble.domain.report.Report
import com.nimble.service.report.ReportService
import com.nimble.service.NimbleService

class ReportController extends NimbleService{

    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    def reportService
                             
    def index = {
        render(view: "index")
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reportInstanceList: Report.list(params), reportInstanceTotal: Report.count()]
    }

    def create = {
        def reportInstance = new Report()
        reportInstance.properties = params
        return [reportInstance: reportInstance]
    }

	def create_inc = {
		create()
	}

    def save = {
        def reportInstance = new Report(params)

        reportInstance = reportService.prepReportForSave(reportInstance)
        
        if (reportInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])}"
            redirect(action: "show", id: reportInstance.id)
        }
        else {
            render(view: "create", model: [reportInstance: reportInstance])
        }
    }

	def show_inc = {
		show()
	}

    def show = {
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
        else {
            [reportInstance: reportInstance]
        }
    }

	def edit_inc = {
		edit()
	}

    def edit = {
        def reportInstance = Report.get(params.id)
        if (!reportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [reportInstance: reportInstance]
        }
    }

    def update = {
        def reportInstance = Report.get(params.id)
        if (reportInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reportInstance.version > version) {
                    
                    reportInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'report.label', default: 'Report')] as Object[], "Another user has updated this Report while you were editing")
                    render(view: "edit", model: [reportInstance: reportInstance])
                    return
                }
            }
            reportInstance.properties = params

            reportInstance = reportService.prepReportForUpdate(reportInstance)            
            if (!reportInstance.hasErrors() && reportInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])}"
                redirect(action: "show", id: reportInstance.id)
            }
            else {
                render(view: "edit", model: [reportInstance: reportInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reportInstance = Report.get(params.id)
        if (reportInstance) {
            try {
                reportInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
                redirect(action: "index")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "list")
        }
    }
}
