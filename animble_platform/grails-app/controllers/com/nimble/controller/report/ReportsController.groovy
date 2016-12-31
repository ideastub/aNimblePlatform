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

class ReportsController {

    def index = {
        render(view: "index")
    }

    def landing = {
        render(view: "landing")
    }

    def list = {
        render(view: "list")
    }
    
    def menu_tree = {
    	def location = params.location
        String menuQuery = "select new map(r.id,r.display) from Report r where r.report_location_ref.display_code=?"
        ArrayList menuTree = Report.executeQuery(menuQuery,[location])
        [reportInstanceList: menuTree]        
        
    }

    def menu = {
        render(view: "menu")
    }

    def show = {
        def reportInstance = Report.get(params.id)
        def viewOnly = false
        if (!reportInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), params.id])}"
            redirect(action: "landing")
        }
        else {
            [reportInstance: reportInstance]
        }
    }
}
