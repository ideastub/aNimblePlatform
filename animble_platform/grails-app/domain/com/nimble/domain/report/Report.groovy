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

package com.nimble.domain.report

import com.nimble.domain.NimbleDomain
import com.nimble.domain.reference.*

/*

   NOT IMPLEMENTING
   report_ref_id                 int default 0 not null,
   report_sql                    text,
   parameter_view_ref_id         int default 0,
   sql_parameter_script          text,
   xml_report_ind                int default 0,
   xml_select_script             text,
   xml_sort_script               text,
   xml_field_script              text,
   xml_image_qual                varchar(255),
   xml_xpath                     varchar(255),
   report_outline_script         text,
   report_outline_sql            text,
   outline_last_run_dt           datetime,
   system_assigned_version_nbr   int default 5 not null,
   record_type_ref_id            int default 321 not null
   */

class Report extends NimbleDomain {

   ReportLanguageReference report_language_ref
   ReportLocationReference report_location_ref

String display
String description
String file_name
String query_name

   String toString(){
       return display
   }

  static hasMany = [ reportParameters : ReportParameter ]

  static mapping = {
    
      table 'report'
      id column:'report_id'
      reportParameters column:'report_id'
      report_language_ref column:'report_language_ref_id'
   	  report_location_ref column:'report_location_ref_id'

      id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]
      //version false /*FIXME turn version on*/

      autoTimestamp true
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'
      create_user column:'create_user_id'
      update_user column:'update_user_id'
      active_ind column:'active_ind'

  }
    
  static constraints = {
      display(blank:false,unique:true)
      file_name(blank:false)
  }
}