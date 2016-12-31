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

package com.nimble.controller.artifact

import com.nimble.domain.artifact.*

class ArtifactHistoryController {

    def list = {
    		//params.max = Math.min(params.max ? params.int('max') : 10, 100)
    		//def results = ArtifactHistory.findAll("from ArtifactHistory as ah where ah.artifact.id=? order by ah.lastUpdate desc",[new Long(params?.artifact_id)],params)
    		def results = ArtifactHistory.findAll("from ArtifactHistory as ah where ah.artifact.id=? order by ah.lastUpdate desc",[new Long(params?.artifact_id)])

            [artHistoryInstanceList: results]
        }

    def show = {
            def viewOnly = true
            def artifactHistoryInstance = ArtifactHistory.get(new Long(params?.id))
            def artifactClass = grailsApplication.classLoader.loadClass(artifactHistoryInstance.artifact.class.name)
	        def artifactInstance = artifactClass.newInstance();
            artifactInstance.properties = artifactHistoryInstance.properties
            artifactInstance.version = artifactHistoryInstance.version

            if (!artifactInstance) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"

                redirect(action: "list")
            }
            else {
    	    	[artifactInstance: artifactInstance, viewOnly: viewOnly]
            }
    }

    def compare = {
            def viewOnly = true
            def artifactHistory = ArtifactHistory.get(new Long(params?.id))
            def artifactClass = grailsApplication.classLoader.loadClass(artifactHistory.artifact.class.name)
	        def artifactHistoryInstance = artifactClass.newInstance();
            artifactHistoryInstance.properties = artifactHistory.properties
            artifactHistoryInstance.version = artifactHistory.version
            
            def artifactInstance = artifactHistory.artifact
            
            if (!artifactInstance) {
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'designArtifact.label', default: 'Artifact'), params.id])}"

                redirect(action: "list")
            }
            else {
    	    	[artifactInstance: artifactInstance, artifactHistoryInstance: artifactHistoryInstance, viewOnly: viewOnly]
            }
    }
    
}