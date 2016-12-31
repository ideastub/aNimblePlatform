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

package com.nimble.service.report

import com.nimble.domain.report.ReportParameter
import com.nimble.service.NimbleService
import com.nimble.domain.reference.*

class ReportParameterService extends NimbleService{

    boolean transactional = true

   def prepReportParameterForSave(ReportParameter reportParam){
   
        reportParam = prepDomainObjectForSave(reportParam)
		reportParam = validateXandY_display_sequences(reportParam, false)
		return reportParam
   }

   def prepReportParameterForUpdate(ReportParameter reportParam){

        reportParam = prepDomainObjectForUpdate(reportParam)
		reportParam = validateXandY_display_sequences(reportParam, true)		
		return reportParam
   }


   def validateXandY_display_sequences(ReportParameter reportParam, boolean isUpdate){
       def rp = ReportParameter.find("from ReportParameter as rp where rp.x_display_sequence =? and rp.y_display_sequence =? and rp.report.id =?",  [reportParam.x_display_sequence,reportParam.y_display_sequence,reportParam.report.id])
  	   if (rp != null){
  		   if ((isUpdate && rp.id != reportParam.id) || (!isUpdate)){
		  		 reportParam.errors.reject('default.not.unique.combo.message', ['x_display_sequence',reportParam.classToString()].toArray() as Object[], '') 
  				 reportParam.errors.reject('default.not.unique.combo.message', ['y_display_sequence',reportParam.classToString()].toArray() as Object[], '') 
  		   }
  	   }
       return reportParam
  }
   
}