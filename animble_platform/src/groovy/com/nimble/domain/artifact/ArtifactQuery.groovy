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

import com.nimble.utils.NimbleHelper
import com.nimble.domain.reference.*

class ArtifactQuery {

	public static ArrayList getArtifactCategoriesForMenuTree(){
	   	ArrayList menuTree = new ArrayList()
        String rootQuery = "select new map(a.id,a.display,a.display_code,'" + Artifact.TREE_ROOT + "','') from ArtifactReference a where a.display_code not in ('PRODUCTBACKLOG', 'TASK') order by a.display"
        menuTree = ArtifactReference.executeQuery(rootQuery)
        menuTree.each{
        	//println "it['2']=" + it['2']
            it['2'] = ArtifactReference.replaceDisplayCodeWithClass(it['2'])
            //println "it['2']=" + it['2']
        }

        return menuTree
	}

	public static ArrayList getTopLevelArtifactsForMenuTree(Long project_id, String artifactType){
	   	ArrayList menuTree = new ArrayList()
	   	NimbleHelper nh = new NimbleHelper()

		//Find all artifacts which are parents
		String artifactTypeQuery = "select distinct new Map(art.id,art.artifact_name,art.class,'" + Artifact.TREE_PARENT + "',art.id) from Artifact as art left join art.artifactParents as artifactTree where art.project.id = " + project_id + " and art.class = '" + nh.getClassName(artifactType) + "' and artifactTree.parent.id = art.id and artifactTree.parent.id not in ( select at.child.id from Artifact as a left join a.artifactParents as at where a.project.id = " + project_id + " and a.class = '" + nh.getClassName(artifactType) + "' and at.child.id != null and at.relation_ref.display_code = 'RELATED' ) and art.component_type_ref.display_code = '- SELECT -' and artifactTree.relation_ref.display_code = 'RELATED' order by art.artifact_name"
		ArrayList moreMenuTree = Artifact.executeQuery(artifactTypeQuery)
		//println '*************** Find all artifacts which are parents'
		//println moreMenuTree
        
        TreeMap menuMap = new TreeMap()
        moreMenuTree.each{
        	menuMap.put(it['1'].toLowerCase()+it['0'],it)
        }
    	
    	//Then find all artifacts which are not a parent or a child
    	artifactTypeQuery = "select distinct new Map(art.id,art.artifact_name,art.class,'" + Artifact.TREE_PARENT + "',art.id) from Artifact as art left join art.artifactChildren as artifactTree where art.project.id = " + project_id + " and art.class = '" + nh.getClassName(artifactType) + "' and artifactTree.id is null and art.component_type_ref.display_code = '- SELECT -' order by art.artifact_name"
    	moreMenuTree = Artifact.executeQuery(artifactTypeQuery)

		//println '*************** Then find all artifacts which are not a parent or a child'
		//println moreMenuTree

		
		//combine both results together	            
        moreMenuTree.each{
           	menuMap.put(it['1'].toLowerCase()+it['0'],it)
        }
        
        menuMap.values().each{
        	menuTree.add(it)
        }
        
        return menuTree
	}
	
	public static ArrayList getArtifactChildrenForMenuTree(Long project_id, Long currentArtifactId, String artifactType){
	   	ArrayList menuTree = new ArrayList()
	   	NimbleHelper nh = new NimbleHelper()
	   	def parentId
	   	if (currentArtifactId != null) { parentId = currentArtifactId.toString() } else { parentId = '' }
       	String artifactTypeQuery = "select distinct new Map(art.id,art.artifact_name,art.class,'" + Artifact.TREE_CHILD + "',art.id) from Artifact as art left join art.artifactChildren as artifactTree where art.project.id = " + project_id + " and art.class = '" + nh.getClassName(artifactType) + "' and artifactTree.parent.id = " + currentArtifactId + " and art.component_type_ref.display_code = '- SELECT -' and artifactTree.relation_ref.display_code = 'RELATED' order by art.artifact_name"
       	menuTree = Artifact.executeQuery(artifactTypeQuery)
        
        //println '*************** getArtifactChildrenForMenuTree'
		//println menuTree
        

        return menuTree
	}
	
	public static ArrayList getArtifactsSelectList(Long project_id){
		return getArtifactsSelectList(project_id, "Artifact")
	}

	public static ArrayList getArtifactsSelectList(Long project_id, String artifactType){
        String selectListQuery = "select new com.nimble.utils.view.SelectListTransport(s.id,s.artifact_name) from " + artifactType + " s where s.project.id = " + project_id + " order by s.artifact_name"
        ArrayList selectList = Artifact.executeQuery(selectListQuery)
        return selectList
	}

	public static ArrayList getMyActiveArtifactAssignments(Long currentUserId){
    	return Artifact.executeQuery( "select a from Artifact a where a.assigned_user.id = :assigned_user_id and (a.class = 'DesignArtifact' or a.class = 'FeatureArtifact' or a.class = 'ImplementationArtifact' or a.class = 'RequirementArtifact' or a.class = 'TestCaseArtifact' or a.class = 'ProductBacklogArtifact' or a.class = 'TaskArtifact' )and a.status_ref.display_code != 'COMPLETE' order by a.project.projectName ASC, a.class ASC, a.artifact_name ASC", [assigned_user_id:currentUserId] )
	}

	public static ArrayList getRecentlyUpdatedArtifacts(def resultMax){
		def c = Artifact.createCriteria()
		return c {
		    maxResults(resultMax)
		    order("lastUpdate", "desc")
		}
	}
	
}