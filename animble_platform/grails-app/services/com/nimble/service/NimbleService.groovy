package com.nimble.service

import com.nimble.utils.domain.ReferenceHelper
import javax.servlet.ServletContext
import com.nimble.domain.security.ApplicationUser
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
import com.nimble.domain.NimbleDomain
import org.codehaus.groovy.grails.plugins.springsecurity.*

class NimbleService {

    boolean transactional = true

    public NimbleService(){
		servletContext = SCH.servletContext
		refHelper = new ReferenceHelper(servletContext)
    }

    def messageSource
    def servletContext
	def refHelper
    def springSecurityService  
	
    def prepDomainObjectForSave(NimbleDomain nimbleDomain){
        nimbleDomain.dateCreated = new Date()
   		nimbleDomain.lastUpdate =  new Date()
   		def currentUser = ApplicationUser.get(springSecurityService.principal.id)
		nimbleDomain.create_user = currentUser
		nimbleDomain.update_user = currentUser
		nimbleDomain.active_ind = true
		
		return nimbleDomain
    }

    def prepDomainObjectForUpdate(NimbleDomain nimbleDomain){
   		nimbleDomain.lastUpdate =  new Date()
   		def currentUser = ApplicationUser.get(springSecurityService.principal.id)
		nimbleDomain.update_user = currentUser
		
		return nimbleDomain
    }
}
