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

package com.nimble.utils;

import javax.servlet.ServletContext
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
import com.nimble.domain.NimbleDomain

class NimbleHelper {

  def getClassName(String className, boolean isFullyQualified){
        if (className != null){
        	if (isFullyQualified){
    	    	className = className.substring(className.lastIndexOf('.')+1)
    	    }
	        className = className.substring(0,1).toLowerCase() + className.substring(1)
        }
   		return className
   }

  def getClassName(String className){
        return getClassName(className, true)
   }

  def getClassName(NimbleDomain domainObject){
        String className = ""
        if (domainObject != null){className = domainObject.class.name.substring(domainObject.class.name.lastIndexOf('.')+1)}
   		return className
   }

  def getControllerName(NimbleDomain domainObject){
        String controllerName = ""
        if (domainObject != null){
    	    controllerName = domainObject.class.name.substring(domainObject.class.name.lastIndexOf('.')+1)
	        controllerName = controllerName.substring(0,1).toLowerCase() + controllerName.substring(1)
        }
   		return controllerName
   }

  def getControllerName(String className){
        String controllerName = ""
        if (className != null){
	        controllerName = className.substring(0,1).toLowerCase() + className.substring(1)
        }
   		return controllerName
   }
}