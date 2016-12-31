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

import com.nimble.domain.view.ApplicationControl
import com.nimble.domain.reference.*
import com.nimble.utils.view.ViewHelper
import com.nimble.utils.domain.ReferenceHelper
import com.nimble.utils.file.FileHelper
import com.nimble.controller.view.ApplicationControlController
import com.nimble.controller.reference.ReferenceController
import com.nimble.controller.security.ApplicationSettingController

class BootStrap {

     def init = { servletContext ->
     	//println '****************** Bootstap begin'

		// cache app control data
		def appController = new ApplicationControlController()
		appController.loadCache(servletContext)

		// cache ref data
		def refController = new ReferenceController()
		refController.loadCache(servletContext)

		// cache settings data
		def settingController = new ApplicationSettingController()
		settingController.loadCache(servletContext)
		
     	//println '****************** Bootstap end'
     }
     def destroy = {
     }
} 