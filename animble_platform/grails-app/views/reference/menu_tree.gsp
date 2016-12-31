<%@ page import="com.nimble.domain.reference.*" %>

{ label: 'name',
  identifier: 'id',
  items: [

                    <g:each in="${referenceInstanceList}" status="i" var="referenceInstance">
                         
	<%
	int size = ((java.util.ArrayList)referenceInstanceList).size();
	int index = i;
	String comma = null;
	if (size > 1 && ((size-1) !=index)) {comma=",";} else {comma="";}
	%>

     { id:'${referenceInstance['0']}${referenceInstance['1']}',
       name:'${referenceInstance['2']}',
       type:'${referenceInstance['3']}',
       isRoot:'${referenceInstance['4']}'
     }
     <%=comma%>
 
                    </g:each>

  ]

}