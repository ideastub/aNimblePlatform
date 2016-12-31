<%@ page import="com.nimble.domain.release.Release;com.nimble.utils.view.ViewHelper;" %>
<g:set var="viewHelper" value="${new ViewHelper()}"/>


{ label: 'name',
  identifier: 'id',
  items: [

                    <g:each in="${releaseInstanceList}" status="i" var="releaseInstance">
                         
	<%
	int size = ((java.util.ArrayList)releaseInstanceList).size();
	int index = i;
	String comma = null;
	if (size > 1 && ((size-1) !=index)) {comma=",";} else {comma="";}
	%>

     { id:'${releaseInstance['0']}',
      name:'${releaseInstance['1']}',
      projectId:'${viewHelper.getProjectId()}'
     }
     <%=comma%>
 
                    </g:each>

  ]

}