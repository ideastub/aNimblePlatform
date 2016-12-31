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

import com.nimble.domain.NimbleDomain
import com.nimble.domain.reference.*

/*
missing attributes
   table_key_id                  int default 0 not null,
   table_ref_id                  int default 0 not null,
   application_view_id           int default 0 not null,
   */

class ApplicationSetting extends NimbleDomain {

	static final String DATE = 'DATE'
	static final String DOUBLE = 'DOUBLE'
	static final String INTEGER = 'INTEGER'
	static final String STRING = 'STRING'

   ApplicationSettingReference setting_ref
   DatabaseDataTypeReference data_type_ref
   String value_string
   Boolean value_int
   Double value_double
   Date value_date

   String displayValue(){
   		String value
   		if (data_type_ref != null) {
	   		if (data_type_ref.display_code.equals(STRING)) { value = value_string }
	   		else if (data_type_ref.display_code.equals(INTEGER)) { value = value_int }
	   		else if (data_type_ref.display_code.equals(DOUBLE)) { value = value_double }
	   		else if (data_type_ref.display_code.equals(DATE)) { value = value_date }
	   	} else { value = '' }
   }
	
   Boolean isTrue(){
	   if (data_type_ref.display_code.equals(INTEGER)){
		   return value_int
       } else {
		   throw new Exception("Data type exception.  Boolean expected.")
	   }
   }

   String toString(){
       return displayValue()
   }

  static mapping = {
    
      table 'application_setting'
      id column:'application_setting_id'
      setting_ref column:'setting_ref_id'
      data_type_ref column:'data_type_ref_id'

      id generator:'hilo', params:[table:'hi_value',column:'next_value',max_lo:100]

      autoTimestamp true
      dateCreated column:'create_dt' 
      lastUpdate column:'update_dt'
      version column:'system_assigned_version_nbr'
      create_user column:'create_user_id'
      update_user column:'update_user_id'
      active_ind column:'active_ind'      
      
  }
  
    static constraints = {
      value_string(nullable:true)
      value_int(nullable:true)
      value_double(nullable:true)
      value_date(nullable:true)
  }
  
  
}