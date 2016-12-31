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

package com.nimble.utils.domain;

import com.nimble.domain.view.ApplicationControl
import com.nimble.domain.artifact.Artifact
import com.nimble.domain.project.Project
import javax.servlet.ServletContext
import com.nimble.domain.reference.*
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH

class ReferenceHelper {

   //Artifact artifact
   //Project project
   ServletContext servletContext = SCH.servletContext
   List refDataResults

   ReferenceHelper(){
   }

   ReferenceHelper(ServletContext servletContext){
     this.servletContext = servletContext
   }

   ReferenceHelper(List refDataResults, ServletContext servletContext){
     this.refDataResults = refDataResults
     this.servletContext = servletContext
   }

   /*
   ReferenceHelper(Artifact artifact, ServletContext servletContext){
     this.artifact = artifact
     this.servletContext = servletContext
   }

   ReferenceHelper(Project project, ServletContext servletContext){
     this.project = project
     this.servletContext = servletContext
   }
   */

   def getRefDataForCreateSelect(Class refDataType){
		//FIXME Change to pull values from refDataResults cache
		def refData = []
		def refDataList = refDataType.listOrderBydisplay_sequence()
		for ( i in refDataList ) {
		  refData.add(i)
		}
		return refData
   }

   def prepRefDataDefaults(){
		//println '***************************** RefDataDefaults begin'
		  
        HashMap refDataDefaults = new HashMap()

		for ( i in refDataResults ) {
		  //println '***************************** i=' + 1
		  //println '***************************** i.getReferenceClassName=' + getReferenceClassName(i)
		  //println '***************************** i.display_code=' + i.display_code
		  
          refDataDefaults.put(getReferenceClassName(i), i)
        }
		  //println '***************************** RefDataDefaults end'
		return refDataDefaults
   }

  def getReferenceClassName(Reference ref){
        return ref.class.name.substring(ref.class.name.lastIndexOf('.')+1)
   }

  def getReferenceGroupFromClassName(Reference ref){
        String className = getReferenceClassName(ref)
        //println 'className='+className
        //println className.substring(0,className.lastIndexOf('Reference')) 
        return className.substring(0,className.lastIndexOf('Reference'))
   }


   def getRefDataDefault(String referenceClassName){
        return servletContext.refDataDefaults.get(referenceClassName)
   }


}