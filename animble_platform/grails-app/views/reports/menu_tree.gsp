<%@ page import="com.nimble.domain.report.Report" %>

{ label: 'name',
  identifier: 'id',
  items: [

                    <g:each in="${reportInstanceList}" status="i" var="reportInstance">
                         
	<%
	int size = ((java.util.ArrayList)reportInstanceList).size();
	int index = i;
	String comma = null;
	if (size > 1 && ((size-1) !=index)) {comma=",";} else {comma="";}
	%>

     { id:'${reportInstance['0']}',
      name:'${reportInstance['1']}'
     }
     <%=comma%>
 
                    </g:each>

  ]

}