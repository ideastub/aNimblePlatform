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

package com.nimble.service.artifact

import com.nimble.domain.artifact.*
import com.nimble.domain.security.ApplicationUser
import com.nimble.service.NimbleService
import com.nimble.domain.project.Baseline
import com.nimble.domain.reference.*
//import org.springframework.context.MessageSource; 
//import org.codehaus.groovy.grails.commons.ApplicationHolder;

class ArtifactService extends NimbleService{

    boolean transactional = true
    
	//def messageSource = ApplicationHolder.application.mainContext.getBean('messageSource')

    def prepArtifactForSave(Artifact artifact) {
        artifact = prepDomainObjectForSave(artifact)
        artifact = checkForNullRefData(artifact)
        artifact = prepBaselineForSave(artifact)
        
        return artifact
    }

    def prepArtifactForUpdate(Artifact artifact) {
        artifact = prepDomainObjectForUpdate(artifact)
        artifact = checkForNullRefData(artifact)
        
        return artifact
    }
    
    def checkForNullRefData(Artifact artifact) {

        if (artifact.component_type_ref == null){ artifact.component_type_ref = refHelper.getRefDataDefault("ComponentTypeReference")}
        if (artifact.origin_category_ref == null){ artifact.origin_category_ref = refHelper.getRefDataDefault("OriginCategoryReference")}
        if (artifact.category_ref == null){ artifact.category_ref = refHelper.getRefDataDefault("CategoryReference")}
        if (artifact.module_ref == null){ artifact.module_ref = refHelper.getRefDataDefault("ModuleReference")}
        if (artifact.complexity_ref == null){ artifact.complexity_ref = refHelper.getRefDataDefault("ComplexityReference")}
        if (artifact.artifact_level_ref == null){ artifact.artifact_level_ref = refHelper.getRefDataDefault("ArtifactLevelReference")}
        if (artifact.author_ref == null){ artifact.author_ref = ApplicationUser.get(0)}  //FIXME replace this logic with actual user in context
        if (artifact.custom1_ref == null){ artifact.custom1_ref = refHelper.getRefDataDefault("CustomRef1Reference")}
        if (artifact.custom2_ref == null){ artifact.custom2_ref = refHelper.getRefDataDefault("CustomRef2Reference")}
        if (artifact.custom3_ref == null){ artifact.custom3_ref = refHelper.getRefDataDefault("CustomRef3Reference")}
        if (artifact.custom4_ref == null){ artifact.custom4_ref = refHelper.getRefDataDefault("CustomRef4Reference")}

    	String artifactType = artifact.class.name.substring(artifact.class.name.lastIndexOf('.')+1,artifact.class.name.indexOf('Artifact'))
        
        if (artifact.planned_version_ref == null){ artifact.planned_version_ref = refHelper.getRefDataDefault(artifactType + "VersionReference")}
        if (artifact.version_ref == null){ artifact.version_ref = refHelper.getRefDataDefault(artifactType + "VersionReference")}
        if (artifact.priority_ref == null){ artifact.priority_ref = refHelper.getRefDataDefault(artifactType + "PriorityReference")}
        if (artifact.status_ref == null){ artifact.status_ref = refHelper.getRefDataDefault(artifactType + "StatusReference")}

        return artifact
    }

	def prepBaselineForSave(Artifact artifact){
        artifact.last_updated_baseline = Baseline.find("from Baseline as b where b.baseline_name=?",['- Select -'])
        return artifact
    }

	def prepArtifactHistoryForUpdate(Artifact artifact){
		ArtifactHistory artHistory = new ArtifactHistory()
		artHistory.properties = artifact.properties
		artHistory.version = artifact.version
		artHistory.artifact = artifact
		Baseline baseline = Baseline.find("from Baseline as b where b.baseline_name=?",['- Select -'])
        artHistory.last_updated_baseline = baseline
        artHistory.baseline = baseline
        return artHistory
    }
}
