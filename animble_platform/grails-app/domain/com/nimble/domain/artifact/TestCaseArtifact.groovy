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

package com.nimble.domain.artifact

import com.nimble.domain.artifact.Artifact
import com.nimble.domain.reference.*

class TestCaseArtifact extends Artifact {

  TestCaseVersionReference version_ref
  TestCaseVersionReference planned_version_ref
  TestCasePriorityReference priority_ref
  TestCaseStatusReference status_ref

  static mapping = {
      version_ref column:'version_ref_id'
      planned_version_ref column:'planned_version_ref_id'
      priority_ref column:'priority_ref_id'
      status_ref column:'status_ref_id'
      discriminator value: "TestCaseArtifact"     

  }

  static fetchMode = [version_ref:'eager', planned_version_ref:'eager', priority_ref:'eager', status_ref:'eager']

  static constraints = {
      version_ref (nullable:true)
      planned_version_ref (nullable:true)
      priority_ref (nullable:true)
      status_ref (nullable:true)
      
  }
  
  static searchable = {
      status_ref component: true
  }  
}