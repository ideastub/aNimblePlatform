<%@ page import="com.nimble.domain.project.Project;com.nimble.utils.view.ViewHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper()}" />

{ label: 'name',
  identifier: 'id',
  items: [

                    <g:each in="${projectInstanceList}" status="i" var="projectInstance">
                         
	<%
	int size = ((java.util.ArrayList)projectInstanceList).size();
	int index = i;
	String comma = null;
	if (size > 1 && ((size-1) !=index)) {comma=",";} else {comma="";}
	%>

     { id:'${projectInstance['0']}',
      name:'${projectInstance['1']}',
      type:'${viewHelper.getControllerName(projectInstance['2'])}'
     }
     <%=comma%>
 
                    </g:each>

  ]

}