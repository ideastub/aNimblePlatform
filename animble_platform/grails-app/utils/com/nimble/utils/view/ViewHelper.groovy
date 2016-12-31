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

package com.nimble.utils.view;

import com.nimble.domain.view.ApplicationControl
import com.nimble.domain.artifact.*
import com.nimble.domain.project.Project
import com.nimble.domain.NimbleDomain
import javax.servlet.ServletContext
import org.codehaus.groovy.grails.web.context.ServletContextHolder as SCH
import org.springframework.web.context.request.RequestContextHolder
import com.nimble.utils.NimbleHelper
import com.nimble.domain.reference.*
import java.text.SimpleDateFormat

class ViewHelper extends NimbleHelper{

   ViewTabs viewTabs = new ViewTabs()
   NimbleDomain nimbleDomain
   Artifact artifact
   Project project
   ServletContext servletContext = SCH.servletContext
   List appControls

	def includeViewTab
	def includeView
	def includeAction
	def includeController
	def includeId
	java.util.LinkedHashMap includeParams
	
	//FIXME Remove artifact, project and associated id variables from viewhelper and instead only pull from session.
	def artifactId
	def artifactParentId
	def artifactOverride
	def projectId
	def projectType
	

   ViewHelper(List appControls, ServletContext servletContext){
     this.appControls = appControls
     this.servletContext = servletContext
   }

   ViewHelper(Artifact artifact, ServletContext servletContext){
     this.artifact = artifact
     this.servletContext = servletContext
   }

   ViewHelper(Artifact artifact){
     this.artifact = artifact
   }

   ViewHelper(Project project){
     this.project = project
   }

   ViewHelper(){
   }

   def getAppControlKey(String control){
   		return getArtifactClassName() + '.' + control
   }

  def getArtifactClassName(){
   		return getClassName(artifact)
   }

  def getArtifactDisplayName(){
	  getArtifactDisplayName(getSession()?.curArtifact?.artifact_type)
  }
  
  def getArtifactDisplayName(Artifact artifact){
	  getArtifactDisplayName(getClassName(artifact))
  }
  
  def getArtifactDisplayName(String displayCode){
	    String displayName  
		if (displayCode != null){
        	displayCode = displayCode.substring(0,displayCode.lastIndexOf('Artifact'))
        	displayCode = displayCode.toUpperCase()
        	//FIXME look up artifact name from reference data
        	displayName = ArtifactReference.find("from ArtifactReference as ar where ar.display_code=?",[displayCode])
        } else {
            displayName = ""        	
        }
   		return displayName
  }

  def getArtifactControllerName(){
   		return getControllerName(artifact)
   }

  def getArtifactControllerName(String className){
   		return getControllerName(className)
   }

   def isViewControlActive(String control){
        boolean flag = false
		ApplicationControl appControl = servletContext.applicationControls.get(getAppControlKey(control))
		if (appControl != null) {flag=appControl.visible_ind}
		return flag
   }

   def getAppControlLabel(String control){
        String control_text = ''
		ApplicationControl appControl = servletContext.applicationControls.get(getAppControlKey(control))
		if (appControl != null) {control_text=appControl.control_text}
		return control_text
   }

   def getAppControlVertPos(String control){
        Integer vertical_position = servletContext.viewHeights.get(getAppControlKey(control))
		return vertical_position
   }

   def getAppControlHeight(String control){
        Integer height = getAppControlVertPos(control)-40
		return height
   }

   def getArtifactHeightTotal(String artifactName){
        return servletContext.viewHeights.get(artifactName)
   }

   def getApplicationSetting(String key){
       return servletContext.applicationSettings.get(key)
  }
   
   public String getTruncatedValue(String sourceValue){
        String truncValue
        if (sourceValue != null && sourceValue.length() > 200) {
        	truncValue = sourceValue.substring(0, 199) + "..."
        } else if (sourceValue != null && sourceValue.length() <= 200 ) {
        	truncValue = sourceValue
        } else {
        	truncValue = ""
        }
		return truncValue
   }

   String sectionTitle = ''

   def setSectionTitle = { title ->
   		sectionTitle = title
   }
   
   def getAndClearSectionTitle() {
   		String title = sectionTitle
   		sectionTitle = ''
   		return title
   }

   def prepViewControls(){
		//println '***************************** viewControlMap begin'
		  
        HashMap viewControls = new HashMap()
	    //println '***************************** appControls.size=' + appControls.size
		for ( i in appControls ) {
		  //println '***************************** i=' + i
		  //println '***************************** i.control=' + i.control
		  //println '***************************** i.visible_ind=' + i.visible_ind
		  
          viewControls.put(i.control, i)
        }
		  //println '***************************** viewControlMap end'
		return viewControls
   }

/*FIXME merge view height total map into the viewcontrols map using scaled down pojo to represent cached app controls as a single map */
   def prepViewHeightTotals(List artReferences){
		//println '***************************** viewHeightTotal begin'
		
		//println '***************************** artReferences=' + artReferences
		HashMap viewHeights = new HashMap()
		
		for ( x in artReferences ) {
			/*FIXME the following replaceAll does not allow for changing display text so need to refactor to use code instead */
			String view = x.display.replaceAll(" ", "") + 'Artifact'
    	    //println '***************************** view=' + view 		  
	        Integer heightTotal = 0
			for ( i in appControls ) {
				  //println '***************************** i.display_sequence=' + i.display_sequence
				  //println '***************************** i.unit_height=' + i.unit_height
				  //println '***************************** i.control=' + i.control
				  
			  if (x.display == i.control_ref.display){
			  	  //println '***************************** heightTotal=' + heightTotal
    	  	      viewHeights.put( i.control, heightTotal)
    	  	      heightTotal += i.unit_height
    	  	      viewHeights.put( view, heightTotal)
				  //println '***************************** ' + viewHeights.get(view)
			  }
	        }
        }
		  //println '***************************** viewHeights='+ viewHeights
		  //println '***************************** viewHeightTotal end'
		return viewHeights
   }

   def getSession(){
	   return RequestContextHolder?.currentRequestAttributes()?.getSession()
   }
   
   def getProjectId(){
	   return getSession()?.curProject?.id			   
   }
   
   def getArtifactId(){
	   return getSession()?.curArtifact?.id			   
   }
   
   def getArtifactParentId(){
       Long artifactParentId
       if (includeParams?.parent_id != null && !''.equals(includeParams.parent_id)){artifactParentId = Long.parseLong(includeParams?.parent_id)}
	   if (artifactParentId == null){artifactParentId = getSession()?.curArtifact?.parent_id}
       
	   return artifactParentId
   }
   
   def isTabSelected(String thisTab){
   		Boolean isSelected = false
   		if (thisTab?.equals(includeParams?.tab)){ isSelected = true }
   		return isSelected   
   }

   def isDefaultTabSelected(){
  		Boolean isSelected = false
  		if (includeParams == null || includeParams.tab == null){ isSelected = true }
  		return isSelected   
  }

   
   def getArtifactsLabel(){
   		String artifactsLabel = null
   		if (projectType != null && projectType.equalsIgnoreCase('agileProject')) { artifactsLabel='Product Backlog' }
   		else { artifactsLabel='Artifacts' }
   		return artifactsLabel
   }
   
   def isAgileProject(){
   		Boolean flag = false
   		if (getSession()?.curProject?.projectType?.equalsIgnoreCase('agileProject'))
   		{ flag=true }
		return flag
   }

   def isAgileProject(Artifact artifact){
   		this.artifact = artifact
   		return isAgileProject()
   }

   //FIXME look to always pull from session and remove all other logic to access project
   def getProjectType(){
   		String projectType
        if (getSession().curProject != null){
        	projectType = getSession().curProject.projectType
        } else {
        	projectType  = 'waterfallProject'
        }
   		if (isAgileProject()) { projectType = 'agileProject' }
   		return projectType
   }

   def formateDate(Date viewDate){
	   String formattedDate
	   if (viewDate != null){
		   formattedDate = new SimpleDateFormat("yyyy-MM-dd 00:00:00.0").format(viewDate)   
	   }
	   return formattedDate
   }
   
}