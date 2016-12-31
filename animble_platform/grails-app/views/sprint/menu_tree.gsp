<%@ page import="com.nimble.domain.release.Sprint;com.nimble.utils.view.ViewHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper()}"/>
<%	viewHelper.projectId = params.id %>

{ label: 'name',
  identifier: 'id',
  items: [

                    <g:each in="${sprintInstanceList}" status="i" var="sprintInstance">
                         
	<%
	int size = ((java.util.ArrayList)sprintInstanceList).size();
	int index = i;
	String comma = null;
	if (size > 1 && ((size-1) !=index)) {comma=",";} else {comma="";}
	%>

     { id:'${sprintInstance['0']}',
      name:'${sprintInstance['1']}',
      projectId:'${viewHelper.projectId}'
     }
     <%=comma%>
 
                    </g:each>

  ]

}