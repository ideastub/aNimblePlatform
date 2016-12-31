<%@ page import="com.nimble.domain.artifact.Artifact;com.nimble.utils.view.ViewHelper;" %>
        <g:set var="viewHelper" value="${new ViewHelper()}" />

{ label: 'name',
  identifier: 'id',


  id:'${params?.artifact_id}',
  name:'${params?.artifact_name}',
  children:
  
   [

                    <g:each in="${artifactInstanceList}" status="i" var="artifactInstance">

                         
	<%
	int size = ((java.util.ArrayList)artifactInstanceList).size();
	int index = i;
	String comma = null;
	if (size > 1 && ((size-1) !=index)) {comma=",";} else {comma="";}
	%>

     { id:'${artifactInstance['0']}',
      name:'${artifactInstance['1']}',
       type:'${viewHelper.getArtifactControllerName(artifactInstance['2'])}',
       treeRole:'${artifactInstance['3']}',
       parentId:'${artifactInstance['4']}',
       children: true

     }
     <%=comma%>

                        
 
                    </g:each>


  ]

}