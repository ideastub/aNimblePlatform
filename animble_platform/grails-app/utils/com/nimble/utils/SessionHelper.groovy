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

import com.nimble.domain.project.Project
import com.nimble.domain.project.ProjectVO
import com.nimble.domain.artifact.ArtifactVO
import com.nimble.domain.artifact.Artifact
import org.springframework.web.context.request.RequestContextHolder


class SessionHelper extends NimbleHelper{

	def session = RequestContextHolder.currentRequestAttributes().getSession()

    public void pushCurProject(Project project){
		setCurProject(project)
		clearCurArtifact()
     }
	
	private void setCurProject(Project project){
		ProjectVO curProject = new ProjectVO()
      	curProject.projectType = getClassName(project.class.name)
      	curProject.projectName = project.projectName
      	curProject.projectCode = project.projectCode
      	curProject.id = project.id
		session.curProject = curProject
	}

	public void clearCurArtifact(){
		session.curArtifact = null
	}
	
    public void pushCurArtifact(Artifact artifact, Long parent_id, String tree_role){
    	ArtifactVO curArtifact = new ArtifactVO()
      	curArtifact.artifact_type = getClassName(artifact.class.name)
      	curArtifact.artifact_name = artifact.artifact_name
      	curArtifact.artifact_nbr = artifact.artifact_nbr
      	curArtifact.id = artifact.id
      	curArtifact.parent_id = parent_id
      	curArtifact.tree_role = tree_role
		session.curArtifact = curArtifact
		if (!session.curProject || !session.curProject.id.equals(artifact.project.id)){
			setCurProject(Project.get(artifact.project.id))
		}
     }
    
    public void pushCurArtifact(Artifact artifact, String tree_role){
    	pushCurArtifact(artifact, null, tree_role)
     }
    
    public void pushCurArtifactParent(Long parent_id){
    	session?.curArtifact?.parent_id = parent_id
     }

    def getProjectId(){
 	   return session?.curProject?.id			   
    }

    def getProject(){
 	   return session?.curProject			   
    }   
    
    def getArtifactId(){
 	   return session?.curArtifact?.id			   
    }

    def getArtifact(){
 	   return session?.curArtifact			   
    }   

    
}